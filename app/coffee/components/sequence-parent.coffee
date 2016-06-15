module.exports = class SequenceParent

  # Ok, to avoid crazy circular dependencies, I'm passing
  # in the `Sequence` constructor to SequenceParent because
  # Sequence extends SequenceParent
  constructor: (@Sequence) ->
    @children = {}

  update : () ->
    @markAllChildrenForDeletion()
    @createAndUpdateChildren()
    @deleteCompleteChildren()

  createAndUpdateChildren : () ->
    return if !@packet.children?
    for sequenceData in @packet.children
      # If it doesn't exist, create it
      if !@children[sequenceData.id]?
        @children[sequenceData.id] = new @Sequence @$children, sequenceData
      # Update
      @children[sequenceData.id].update sequenceData
      delete @doomedChildren[sequenceData.id]

  markAllChildrenForDeletion : () ->
    @doomedChildren = {}
    for key, child of @children
      @doomedChildren[key] = child

  deleteCompleteChildren : () ->
    for key, child of @doomedChildren
      child.delete()
      delete @children[key]
    @doomedChildren = null
