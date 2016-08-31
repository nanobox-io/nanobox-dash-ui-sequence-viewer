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
      # If it doesn't exist, note that we should create it
      if !@children[sequenceData.id]?
        doCreateNewSequence = true

      # If it does exist, but there is a new update. Complete and
      # delete the old one, note that we should create a new one
      else if @children[sequenceData.id].data.message != sequenceData.message
        @children[sequenceData.id].delete()
        doCreateNewSequence = true

      # Create a new sequence
      if doCreateNewSequence
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
