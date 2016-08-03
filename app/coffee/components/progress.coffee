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

  move : () =>
    if @perc < 65
      @perc += Math.random() * @blockSize
    else if @perc < 90
      @perc += (100 - @perc) * 0.03
    else
      @perc += (100 - @perc) * 0.01

    if @perc < 100
      @$timeout = setTimeout ()=>
        duration = 800*Math.random() + 100
        @$progressBar.css {width: "#{@perc}%", "transition-duration":"#{duration}ms"}
        @$timeout2 = setTimeout @move, duration
      ,
        Math.random() * 300
    else
      @perc = 0
      @setMessageHtml "#{@currentMessage} - progression #{++@tries}"
      @stop()
      @$progressBar.css width:"0"
      @move()

  stop  : ()->
    clearTimeout @$timeout
    clearTimeout @$timeout2
  start : ()-> @move()

  complete : (message, estimate) ->
    @stop()
    @$progressBar.css {width: "100%", 'transition-duration':'700ms', 'transition-timing-function':'cubic-bezier(0.86, 0, 0.07, 1)'}
