MacroTask = require 'components/macro-task'

module.exports = class MacroTaskSub extends MacroTask

  constructor: (data, @parentTask, instanceNumber) ->
    data.name = "instance #{instanceNumber}"
    super @parentTask.$node, data
    @$node.addClass "instance"

  initShow : () ->
    @$holder.css opacity:0
    @$holder.animate {opacity:1}, {duration:600, easing:"easeInOutQuint"}
    @grow()

  grow : (duration) ->
    @parentTask.grow 300
    super duration

  addError : ()->
    @parentTask.addError()
    super()
