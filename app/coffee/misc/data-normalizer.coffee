module.exports = class DataNormalizer

  @normalize : (ar)->
    newAr = []
    for item in ar
      newAr.push @normalizeSequence(item)

    return newAr

  @normalizeSequence : (sequence)->
    # Root sequence
    data =
      id          : sequence.id
      title       : sequence.title
      message     : sequence.description
      status      : sequence.status
      viewClass   : 'root'
      children    : []

    @emptySequences = {}

    # Create heirarchally accurately placed sub sequences
    for key, sequenceData of sequence.summaries
      @createSequenceItem key, sequenceData, data.children

    @adoptAnyOrphans data, {}
    @removeWidows data
    return data

  @createSequenceItem : (keyString, data, children)->
    keyAr     = keyString.split '/'
    len       = keyAr.length-1

    # Used to set the id, becomes something like "platform/component/etc"
    currentId = ""
    currentChildrenAr = children

    for key, i in keyAr
      currentId += key
      # find any object with this id existing at this level
      targetObj = currentChildrenAr.find (item)-> return item.id == currentId
      # create it if it doesn't exist
      if !targetObj?
        targetObj = {children:[]}
        currentChildrenAr.push targetObj

      # If this is the last key in the list (for instance `d` in `a/b/c/d`) then
      # we have arrived at the target depth and should copy all the values into the new obj
      if i == len
        targetObj.id = keyString
        for key, val of data
          targetObj[key] = val

      # else, keep digging. Set the children of this targetObj as the next target in the loop
      else
        currentChildrenAr = targetObj.children

      currentId += "/"

  # If a parent doesn't really exist, move its children to their grandparent
  @adoptAnyOrphans : (item, parent) ->
    # If this is an empty node, move all children to my parent
    if !item.id?
      while item.children.length > 0
        child = item.children.pop()
        parent.children.push child
        @adoptAnyOrphans child, parent
    else
      for child in item.children
        @adoptAnyOrphans child, item

  # Remove all dud parents
  @removeWidows : (data) ->
    if data.children.length > 0
      for i in [data.children.length-1..0]
        if !data.children[i].id?
          data.children.splice i, 1
        else
          @removeWidows data.children[i]
    else
      delete data.children
