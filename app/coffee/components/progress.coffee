module.exports = class Progress

  constructor : (@$progressBar, estimate) ->
    @$progressBar.css opacity:1, width:0
    time  = estimate*3
    time *= 1.5
    if time <  6000
      time = 6000
    else if time >= 86400000
      @longRunner = true
    @blockSize = 110000 / time
    @perc      = 0
    @move()

  move : () ->
    if @perc < 65
      @perc += Math.random() * @blockSize
    else if @perc < 90
      @perc += (100 - @perc) * 0.03
    else
      @perc += (100 - @perc) * 0.01

    if @perc < 100
      @$progressBar.delay(Math.random()*300).animate {width:"#{@perc}%"},
        duration:800*Math.random() + 100
        complete:()=> @move()
    else
      @perc = 0
      @setMessageHtml "#{@currentMessage} - progression #{++@tries}"
      @stop()
      @$progressBar.css width:"0"
      @move()

  stop  : ()-> @$progressBar.stop true
  start : ()-> @move()

  complete : (message, estimate) ->
    @stop()
    # @setMessageHtml @currentMessage + " - Complete!"
    # @$holder.addClass "complete"
    @$progressBar.animate {width:"100%"}, {duration:700}
    # @$progressBar.delay(500).animate {opacity:0},
    #   duration:300
    #   complete: ()=>
    #     if !message?
    #       @remove()
    #     else
    #       @initializeNewMessage message, estimate
