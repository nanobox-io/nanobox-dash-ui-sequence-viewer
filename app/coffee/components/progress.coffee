module.exports = class Progress
  @count = 0
  constructor : (@$progressBar, estimate) ->
    @init estimate
    @move()

  init : (estimate) ->
    # @$progressBar.removeClass 'complete'
    @stop()
    @$progressBar.css opacity:1, width:"100%", transform:"scaleX(0)", "transition-duration":"0s"
    time  = estimate*3
    time *= 1.5
    if time <  6000
      time = 6000
    else if time >= 86400000
      @longRunner = true
    @blockSize = 110000 / time
    @perc      = 0

  move : () =>
    @stop()
    if @perc < 65
      @perc += Math.random() * @blockSize
    else if @perc < 90
      @perc += (100 - @perc) * 0.03
    else
      @perc += (100 - @perc) * 0.01

    if @perc < 100

      @timeout = setTimeout ()=>
        Progress.count++
        duration = (800*Math.random() + 100)
        @$progressBar.css {transform: "scaleX(#{@perc*0.01})", "transition-duration":"#{duration}ms"}
        clearTimeout @timeout2
        @timeout2 = setTimeout @move, duration
      ,
        Math.random() * 80
    else
      @perc = 0
      @setMessageHtml "#{@currentMessage} - progression #{++@tries}"
      @stop()
      @move()

  stop  : ()=>
    clearTimeout @timeout
    clearTimeout @timeout2
  start : ()-> @move()

  reset : (newEstimate) ->
    @init newEstimate
    @move()
  complete : (message, estimate) ->
    @stop()
    @$progressBar.css {transform: "scaleX(1)"}
