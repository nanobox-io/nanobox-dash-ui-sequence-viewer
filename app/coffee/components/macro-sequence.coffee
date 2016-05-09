sequence     = require 'jade/sequence'
MacroTask    = require 'components/macro-task'
MacroTaskSub = require 'components/macro-task-sub'

module.exports = class MacroSequence

  constructor: ( $el, @packet ) ->
    @tasks       = {}
    @doomedTasks = {}
    @scrubPacketData()

    @id = @packetid
    # Create HTML

    @$node = $ sequence( { sequenceName : @packet.title, hoverToolTip:@packet.description, summary:@packet.description } )
    $el.append @$node


  ###########
  ### API ###
  ###########

  update : (@packet) ->
    @scrubPacketData()

    if @getStatus() == 'complete'
      @delete()
      return true
    else
      @markAllTasksForDeletion()
      @createAndUpdateTasks @packet
      @finishAndDeleteCompleteTasks()
      @setStatus()

      return false

  delete : () ->
    @markAllTasksForDeletion()
    @finishAndDeleteCompleteTasks()
    @remove()

  deleteImmediately : () ->
    @markAllTasksForDeletion()
    @finishAndDeleteCompleteTasks()
    @$node.remove()



  ###   //     // //////// //       ////////  //////// ////////   //////
        //     // //       //       //     // //       //     // //    //
        //     // //       //       //     // //       //     // //
        ///////// //////   //       ////////  //////   ////////   //////
        //     // //       //       //        //       //   //         //
        //     // //       //       //        //       //    //  //    //
        //     // //////// //////// //        //////// //     //  //////   ###


  markAllTasksForDeletion : () ->
    @doomedTasks = {}
    for taskKey, task of @tasks
      @doomedTasks[taskKey] = task

  createAndUpdateTasks : (packet) ->
    for taskKey, task of packet.summary
      # Remove this task from the list of doomed tasks
      if @doomedTasks[taskKey]?
        delete @doomedTasks[taskKey]

      # Create task if it doesn't exist
      if !@tasks[taskKey]?

        # Check to see if this is a sub task:
        nameAr = taskKey.split('.')
        if nameAr.length > 1
          parentTask = @tasks[nameAr[0]]
          @tasks[taskKey] = new MacroTaskSub  {name : taskKey}, parentTask, nameAr[1]
          parentTask.grow(300)
        else
          @tasks[taskKey] = new MacroTask( $('.tasks', @$node), {name : taskKey} )


      @tasks[taskKey].update( task.message, task.estimate )

  finishAndDeleteCompleteTasks : () ->
    for taskKey, task of @doomedTasks
      @tasks[taskKey].finishAndDelete()
      @tasks[taskKey].parentTask?.shrink()
      delete @tasks[taskKey]

  remove : () ->
    @$node.delay( 1000 ).animate {opacity:0},
      duration:400
      complete: ()=>
        @$node.remove()

  # DEFUNCT METHOD - Not really used anymore, leaving it in just in case though...
  removeIfTasksComplete : () ->
    if Object.keys( @tasks ).length == 0 && @getStatus() != "queued" && @getStatus() != "running"
      @$node.delay( 1000 ).animate {opacity:0},
        duration:400
        complete: ()=>
          @$node.remove()

  setStatus : () ->
    readableStatus = @getStatus()

    $('.state', @$node).text readableStatus
    $('.state', @$node).attr 'class', "state #{readableStatus}"

  getStatus : () ->
    switch @packet.state
      when 'aborted'  then 'aborted'
      when 'complete' then 'complete'
      when 'incomplete'
        switch @packet.status
          when 'ready'        then 'queued'
          when 'error'        then 'errored'
          when 'malfunction'  then 'malfunctioned'
          when 'malformed'    then 'malformed'
          else                     'running'
      else
        'malformed'

  scrubPacketData : () ->
    if !@packet.state?       then @packet.state        =  "malformed"
    if !@packet.status?      then @packet.status       =  "malformed"
    if !@packet.description? then @packet.description  =  "No Description Provided"
    if !@packet.title?       then @packet.title        =  "No Title Provided"
    if !@packet.errored?     then @packet.errored      =  false
    if !@packet.summary?     then @packet.summary      =  {}
