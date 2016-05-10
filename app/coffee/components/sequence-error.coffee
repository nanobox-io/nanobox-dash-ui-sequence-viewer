sequenceError = require 'jade/sequence-error'

module.exports = class SequenceError

  constructor: ($el) ->
    $node = $ sequenceError( {} )
    $el.append $node
    castShadows $node
