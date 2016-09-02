module.exports = class DataNormalizer

  normalize : (ar)->
    newAr = []
    for item in ar
      newAr.push @normalizeSequence(item)

    return newAr

  normalizeSequence : (sequence)->
    # Root sequence
    data =
      id          : sequence.id
      title       : sequence.title
      message     : sequence.description
      status      : sequence.status
      viewClass   : 'root'
      children    : []

    @dictionary = {root:data}

    # Create heirarchally accurately placed sub sequences
    for key, sequenceData of sequence.summaries
      @createSequenceItem "root/#{key}", sequenceData, data.children

    @adoptAnyOrphans data, {}
    @removeWidows data

    @dictionary = null

    return data

  createSequenceItem : (keyString, data, children)->
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
        @dictionary[keyString] = targetObj
        targetObj.id = keyString
        for key, val of data
          targetObj[key] = val

      # else, keep digging. Set the children of this targetObj as the next target in the loop
      else
        currentChildrenAr = targetObj.children

      currentId += "/"

  # If a parent doesn't really exist, move its children to their grandparent
  adoptAnyOrphans : (item, parent) ->
    # If this is an empty node, move all children to my parent
    if !item.id?
      # Pull all children out of this node
      while item.children.length > 0
        child = item.children.pop()
        # If this is a legitimate child, place it with the nearest ancestor
        if child.id?
          @placeChildWithNearestAncestor child
        @adoptAnyOrphans child, parent
    else
      for child in item.children
        @adoptAnyOrphans child, item

  # Remove all dud parents
  removeWidows : (data) ->
    if data.children.length > 0
      for i in [data.children.length-1..0]
        if !data.children[i].id?
          data.children.splice i, 1
        else
          @removeWidows data.children[i]
    else
      delete data.children

  ###
  Look at the child's id and walk backwards through its heirarch looking for
  the existing item closest to its id and add it to its children array

  For example if the child id was : 'one/two/three/four/five' and the nearest living ancestor was 'one/two'

  Our loop would look like:
  does 'one/two/three/four/five' exist? - no
  does 'one/two/three/four' exist?      - no
  does 'one/two/three' exist?           - no
  does 'one/two' exist?                 - yes, add this child to 'one/two'

  ###
  placeChildWithNearestAncestor : (child) ->
    ar = child.id.split "/"
    for i in [ar.length-1..1]
      key = ar.slice(0, i).join('/')
      if @dictionary[key]?
        @dictionary[key].children.push child
        return child
