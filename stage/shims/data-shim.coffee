module.exports = class Tester

  ###
  View Classes:
    - root
       + Root level of a sequence
       + No progress bar
    - default
       +
    - component
    - componentInstance
  ###

  constructor : () ->
    @blobs =
      "217" : require './sim/217.json'
      "218" : require './sim/218.json'
      "219" : require './sim/219.json'
      "220" : require './sim/220.json'
      "221" : require './sim/221.json'
      "222" : require './sim/222.json'
      "223" : require './sim/223.json'
      "224" : require './sim/224.json'
      "225" : require './sim/225.json'
      "226" : require './sim/226.json'
      "227" : require './sim/227.json'
      "228" : require './sim/228.json'
      "229" : require './sim/229.json'
      "230" : require './sim/230.json'
      "231" : require './sim/231.json'
      "232" : require './sim/232.json'
      "233" : require './sim/233.json'
      "234" : require './sim/234.json'
      "235" : require './sim/235.json'
      "236" : require './sim/236.json'
      "237" : require './sim/237.json'
      "238" : require './sim/238.json'
      "239" : require './sim/239.json'
      "240" : require './sim/240.json'
      "241" : require './sim/241.json'
      "242" : require './sim/242.json'
      "243" : require './sim/243.json'
      "244" : require './sim/244.json'
      "245" : require './sim/245.json'
      "246" : require './sim/246.json'
      "247" : require './sim/247.json'
      "248" : require './sim/248.json'
      "249" : require './sim/249.json'
      "250" : require './sim/250.json'
      "251" : require './sim/251.json'
      "252" : require './sim/252.json'
      "253" : require './sim/253.json'
      "254" : require './sim/254.json'
      "255" : require './sim/255.json'
      "256" : require './sim/256.json'
      "257" : require './sim/257.json'
      "258" : require './sim/258.json'
      "259" : require './sim/259.json'
      "260" : require './sim/260.json'
      "261" : require './sim/261.json'
      "262" : require './sim/262.json'
      "263" : require './sim/263.json'
      "264" : require './sim/264.json'

  initUI : (initialVal) ->
    for key, blob of @blobs
      $option = $ "<option value='#{key}'>#{key}</option>"
      $('select').append $option

    $('select').on 'change', (e)=>
      val   = $(e.currentTarget).val()
      clone = JSON.parse JSON.stringify( @blobs[val]  )
      simulateStormpackUpdate clone.data

    if !initialVal?
      # Load the first blob
      for key, blob of @blobs
        initialVal = key
        break

    $('select').val(initialVal).change()
