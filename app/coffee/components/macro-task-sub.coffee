MacroTask = require 'components/macro-task'

module.exports = class MacroTaskSub extends MacroTask

  constructor: (data, @parentTask, instanceNumber) ->
    data.displayName = "instance #{instanceNumber}"
    super @parentTask.$node, data
    @$node.addClass "instance"

  initShow : () ->
    @$node.css opacity:0
    @$node.velocity {opacity:1}, {duration:600, easing:"easeInOutQuint"}
    @grow()

  grow : (duration) ->
    @parentTask.grow 300
    super duration

  # addError : ()->
    # @parentTask.addError()
    # super()
