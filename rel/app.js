!function e(t,r,i){function n(o,a){if(!r[o]){if(!t[o]){var c="function"==typeof require&&require;if(!a&&c)return c(o,!0);if(s)return s(o,!0);var d=new Error("Cannot find module '"+o+"'");throw d.code="MODULE_NOT_FOUND",d}var u=r[o]={exports:{}};t[o][0].call(u.exports,function(e){var r=t[o][1][e];return n(r?r:e)},u,u.exports,e,t,r,i)}return r[o].exports}for(var s="function"==typeof require&&require,o=0;o<i.length;o++)n(i[o]);return n}({1:[function(e,t,r){var i,n=function(e,t){return function(){return e.apply(t,arguments)}};t.exports=i=function(){function e(e,t){this.$progressBar=e,this.stop=n(this.stop,this),this.move=n(this.move,this),this.init(t),this.move()}return e.prototype.init=function(e){var t;return this.stop(),this.$progressBar.css({opacity:1,width:0,"transition-duration":"0s"}),t=3*e,t*=1.5,6e3>t?t=6e3:t>=864e5&&(this.longRunner=!0),this.blockSize=11e4/t,this.perc=0},e.prototype.move=function(){return this.stop(),this.perc<65?this.perc+=Math.random()*this.blockSize:this.perc<90?this.perc+=.03*(100-this.perc):this.perc+=.01*(100-this.perc),this.perc<100?this.timeout=setTimeout(function(e){return function(){var t;return t=800*Math.random()+100,e.$progressBar.css({width:e.perc+"%","transition-duration":t+"ms"}),clearTimeout(e.timeout2),e.timeout2=setTimeout(e.move,t)}}(this),300*Math.random()):(this.perc=0,this.setMessageHtml(this.currentMessage+" - progression "+ ++this.tries),this.stop(),this.move())},e.prototype.stop=function(){return clearTimeout(this.timeout),clearTimeout(this.timeout2)},e.prototype.start=function(){return this.move()},e.prototype.reset=function(e){return this.init(e),this.move()},e.prototype.complete=function(e,t){return this.stop(),this.$progressBar.css({width:"100%"})},e}()},{}],2:[function(e,t,r){var i,n;n=e("jade/sequence-error"),t.exports=i=function(){function e(e,t,r){this.data=t,this.retryCb=r,this.isFullScreen=!1,this.convertMetaHashToString(this.data),this.$node=$(n(this.data)),e.append(this.$node),castShadows(this.$node),$(".stack-trace-btn",this.$node).on("click",function(e){return function(){return e.toggleFullScreen()}}(this)),$(".retry-btn",this.$node).on("click",function(e){return function(){return e.retryCb()}}(this)),setTimeout(function(e){return function(){return e.$node.removeClass("hidden")}}(this),50)}return e.prototype.toggleFullScreen=function(){return this.isFullScreen?this.minimize():this.goFullScreen(),this.isFullScreen=!this.isFullScreen},e.prototype.minimize=function(){return this.$node.addClass("faded"),setTimeout(function(e){return function(){return e.$node.removeClass("faded"),e.$node.removeClass("full-screen")}}(this),400)},e.prototype.goFullScreen=function(){return this.$node.addClass("faded"),setTimeout(function(e){return function(){return e.$node.addClass("full-screen"),e.$node.removeClass("faded")}}(this),400)},e.prototype.hide=function(e){return null==e&&(e=!1),this.$node.addClass("hidden"),e?setTimeout(function(e){return function(){return e.destroy()}}(this),650):void 0},e.prototype.destroy=function(){return $(".retry-btn",this.$node).off(),$(".stack-trace-btn",this.$node).off(),this.$node.remove()},e.prototype.convertMetaHashToString=function(e){var t,r,i,n,s,o,a,c,d,u;i=0,n=e.meta;for(r in n)u=n[r],r.length>i&&(i=r.length);c="",s=e.meta;for(r in s){for(u=s[r],a="",d=i-r.length,t=0,o=d;o>=0?o>=t:t>=o;o>=0?t++:t--)a+=" ";c+=""+r+a+": "+u+"\n"}return e.metaString=c},e}()},{"jade/sequence-error":8}],3:[function(e,t,r){var i;t.exports=i=function(){function e(e){this.Sequence=e,this.children={}}return e.prototype.update=function(){return this.markAllChildrenForDeletion(),this.createAndUpdateChildren(),this.deleteCompleteChildren()},e.prototype.createAndUpdateChildren=function(){var e,t,r,i,n,s,o;if(null!=this.packet.children){for(n=this.packet.children,s=[],r=0,i=n.length;i>r;r++)o=n[r],e=!1,null==this.children[o.id]?e=!0:this.children[o.id].data.message!==o.message&&(this.children[o.id].finishAndShowNew(o),t=!0),e&&(this.children[o.id]=new this.Sequence(this.$children,o)),t||this.children[o.id].update(o),s.push(delete this.doomedChildren[o.id]);return s}},e.prototype.markAllChildrenForDeletion=function(){var e,t,r,i;this.doomedChildren={},r=this.children,i=[];for(t in r)e=r[t],i.push(this.doomedChildren[t]=e);return i},e.prototype.deleteCompleteChildren=function(){var e,t,r;r=this.doomedChildren;for(t in r)e=r[t],e["delete"](),delete this.children[t];return this.doomedChildren=null},e}()},{}],4:[function(e,t,r){var i,n,s,o,a,c=function(e,t){return function(){return e.apply(t,arguments)}},d=function(e,t){function r(){this.constructor=e}for(var i in t)u.call(t,i)&&(e[i]=t[i]);return r.prototype=t.prototype,e.prototype=new r,e.__super__=t.prototype,e},u={}.hasOwnProperty;i=e("components/progress"),s=e("components/sequence-error"),a=e("jade/sequence"),o=e("components/sequence-parent"),t.exports=n=function(e){function t(e,r){this.data=r,this.onErrorRetry=c(this.onErrorRetry,this),this.scrubData(this.data),this.build(e,this.data),t.__super__.constructor.call(this,t)}return d(t,e),t.prototype.build=function(e,t){return this.data=t,this.$node=$(a(this.data)),this.$children=$(".children",this.$node),this.$content=$(".content",this.$node),this.$metaMessage=$(".meta-message",this.$node),e.append(this.$node),"root"!==this.data.viewClass&&(this.progressBar=new i($(".progress",this.$node),this.data.estimate)),setTimeout(function(e){return function(){return e.$content.addClass("open")}}(this),50)},t.prototype.update=function(e){return this.packet=e,this.updateContent(),t.__super__.update.call(this),this.addOrRemoveError()},t.prototype.updateContent=function(){return $(".state",this.$content).text(this.formatStatus(this.packet.status))},t.prototype.addOrRemoveError=function(){var e,t,r,i,n,o;return e=!1,t=!1,null!=this.packet.error&&null==this.error?(t=!0,this.error=new s($(">.error",this.$node),this.packet.error,this.onErrorRetry),this.$node.addClass("errored"),null!=(r=this.progressBar)&&r.stop()):null==this.packet.error&&null!=this.error&&(this.$node.removeClass("errored"),this.error.hide(!0),this.error=null,null!=(i=this.progressBar)&&i.start()),this.packet.internal_error?(e=!0,this.$node.addClass("internal-error")):this.$node.removeClass("internal-error"),e||t?null!=(n=this.progressBar)?n.stop():void 0:null!=(o=this.progressBar)?o.start():void 0},t.prototype.complete=function(){return this.completeStylesAndText(),null!=this.progressBar&&this.progressBar.complete(),setTimeout(function(e){return function(){return e.$content.addClass("hidden"),setTimeout(function(){return e.$content.removeClass("open"),setTimeout(function(){return e.remove()},600)},200)}}(this),600)},t.prototype["delete"]=function(){return this.markAllChildrenForDeletion(),this.deleteCompleteChildren(),this.complete()},t.prototype.completeStylesAndText=function(){var e;return null!=(e=this.error)&&e.hide(!0),this.$metaMessage.text(" - Complete!"),this.$node.addClass("complete")},t.prototype.finishAndShowNew=function(e){return this.packet=this.data=e,this.completeStylesAndText(),null!=this.progressBar&&this.progressBar.complete(!0),setTimeout(function(e){return function(){return e.progressBar.reset(e.data.estimate),e.$node.removeClass("complete"),e.$metaMessage.text(""),$(".message",e.$node).text(e.data.message),e.addOrRemoveError()}}(this),1e3)},t.prototype.deleteImmediately=function(){return this["delete"](),this.remove()},t.prototype.remove=function(){return this.$node.remove()},t.prototype.onErrorRetry=function(){return PubSub.publish("sequence.retry",this.packet.error.retry_path),this.error.hide(!0),this.error=null},t.prototype.scrubData=function(e){return e.viewClass||(e.viewClass="")},t.prototype.formatStatus=function(e){switch(e){case"queued":case"errored":return e;default:return"Running"}},t}(o)},{"components/progress":1,"components/sequence-error":2,"components/sequence-parent":3,"jade/sequence":10}],5:[function(e,t,r){var i,n,s,o,a,c,d=function(e,t){return function(){return e.apply(t,arguments)}},u=function(e,t){function r(){this.constructor=e}for(var i in t)l.call(t,i)&&(e[i]=t[i]);return r.prototype=t.prototype,e.prototype=new r,e.__super__=t.prototype,e},l={}.hasOwnProperty;c=e("jade/sequence-wrapper"),a=e("jade/abbreviated"),n=e("components/sequence"),s=e("components/sequence-parent"),i=e("misc/data-normalizer"),o=function(e){function t(e,r){this.$el=e,this.ultraMinimize=d(this.ultraMinimize,this),this.minimize=d(this.minimize,this),this.maximize=d(this.maximize,this),this.sequences={},this.$node=$(c({})),r.isAbbrev&&(this.isAbbrev=!0,this.$abbr=$(a({url:r.dashUrl})),this.$abbrCount=$(".count",this.$abbr),this.$node.addClass("abbreviated"),this.$node.prepend(this.$abbr)),this.$el.append(this.$node),castShadows(this.$node),this.$children=$(".sequences",this.$node),this.$el.append(this.$node),$(".btn.close",this.$node).click(this.minimize),$(".btn.open",this.$node).click(this.maximize),$(".btn.hide",this.$node).click(this.ultraMinimize),PubSub.subscribe("sequence.retry",function(e,t){return r.retryCb(t)}),t.__super__.constructor.call(this,n),this.$sequenceWrapper=$(".sequence-wrapper",this.$el),this.$sequenceWrapper.length}return u(t,e),t.prototype.update=function(e){var r;return this.arrayOfPackets=e,r=new i,this.arrayOfPackets=r.normalize(this.arrayOfPackets),this.arrayOfPackets.length>0?(this.checkForErrors(),this.show()):this.hide(),this.packet={children:this.arrayOfPackets},this.isAbbrev&&this.$abbrCount.text(this.countTasks(this.arrayOfPackets,0)),t.__super__.update.call(this)},t.prototype.hideIfNosequences=function(){return 0===Object.keys(this.sequences).length?this.hide():void 0},t.prototype.hide=function(){return setTimeout(function(e){return function(){return e.$sequenceWrapper.addClass("empty")}}(this),1500)},t.prototype.show=function(){return this.$sequenceWrapper.removeClass("empty")},t.prototype.maximize=function(){return this.isMinimized?(this.isMinimized=!1,this.isUltraMinimized=!1,this.$node.removeClass("minimized"),this.$node.removeClass("hidden")):void 0},t.prototype.minimize=function(e){return this.isMinimized?void 0:(this.$node.addClass("minimized"),e.stopPropagation(),this.isMinimized=!0)},t.prototype.ultraMinimize=function(){return this.isUltraMinimized?void 0:(this.isUltraMinimized=!0,this.$node.addClass("hidden"))},t.prototype.countTasks=function(e){var t,r,i,n;if(null==e)return 0;for(n=e.length,t=0,r=e.length;r>t;t++)i=e[t],n+=this.countTasks(i.children);return n},t.prototype.checkForErrors=function(){return this.containsErrors(this.arrayOfPackets)?this.$sequenceWrapper.addClass("has-errors"):this.$sequenceWrapper.removeClass("has-errors")},t.prototype.containsErrors=function(e){var t,r,i;for(t=0,r=e.length;r>t;t++){if(i=e[t],null!=i.error||i.internal_error)return!0;if(null!=i.children&&this.containsErrors(i.children))return!0}return!1},t}(s),window.nanobox||(window.nanobox={}),nanobox.SequenceViewer=o},{"components/sequence":4,"components/sequence-parent":3,"jade/abbreviated":7,"jade/sequence-wrapper":9,"misc/data-normalizer":6}],6:[function(e,t,r){var i;t.exports=i=function(){function e(){}return e.prototype.normalize=function(e){var t,r,i,n;for(n=[],r=0,i=e.length;i>r;r++)t=e[r],n.push(this.normalizeSequence(t));return n},e.prototype.normalizeSequence=function(e){var t,r,i,n;t={id:e.id,title:e.title,message:e.description,status:e.status,viewClass:"root",children:[]},this.dictionary={root:t},i=e.summaries;for(r in i)n=i[r],this.createSequenceItem("root/"+r,n,t.children);return this.adoptAnyOrphans(t,{}),this.removeWidows(t),this.dictionary=null,t},e.prototype.createSequenceItem=function(e,t,r){var i,n,s,o,a,c,d,u,l,h,p;for(c=e.split("/"),d=c.length-1,n="",i=r,l=[],s=o=0,u=c.length;u>o;s=++o){if(a=c[s],n+=a,h=i.find(function(e){return e.id===n}),null==h&&(h={children:[]},i.push(h)),s===d){this.dictionary[e]=h,h.id=e;for(a in t)p=t[a],h[a]=p}else i=h.children;l.push(n+="/")}return l},e.prototype.adoptAnyOrphans=function(e,t){var r,i,n,s,o,a;if(null==e.id){for(o=[];e.children.length>0;)r=e.children.pop(),null!=r.id&&this.placeChildWithNearestAncestor(r),o.push(this.adoptAnyOrphans(r,t));return o}for(s=e.children,a=[],i=0,n=s.length;n>i;i++)r=s[i],a.push(this.adoptAnyOrphans(r,e));return a},e.prototype.removeWidows=function(e){var t,r,i,n;if(e.children.length>0){for(n=[],t=r=i=e.children.length-1;0>=i?0>=r:r>=0;t=0>=i?++r:--r)null==e.children[t].id?n.push(e.children.splice(t,1)):n.push(this.removeWidows(e.children[t]));return n}return delete e.children},e.prototype.placeChildWithNearestAncestor=function(e){var t,r,i,n,s;for(t=e.id.split("/"),r=i=s=t.length-1;1>=s?1>=i:i>=1;r=1>=s?++i:--i)if(n=t.slice(0,r).join("/"),null!=this.dictionary[n])return this.dictionary[n].children.push(e),e},e}()},{}],7:[function(e,t,r){t.exports=function(e){var t=[],r=e||{};return function(e){t.push('<div class="abbr"><div class="spinner"><img data-src="sequence-spinner" class="shadow-icon"/></div><div class="count">7</div><div class="txt">Running tasks</div><a'+jade.attr("href",""+e,!0,!1)+">View Detailed Dashboard</a></div>")}.call(this,"url"in r?r.url:"undefined"!=typeof url?url:void 0),t.join("")}},{}],8:[function(e,t,r){t.exports=function(e){var t,r=[],i=e||{};return function(e,i,n,s,o,a){r.push('<div class="sequence-error hidden"><div class="all-content"><div class="info"><div class="error-code"><div class="txt">Error</div><div class="code">'+jade.escape(null==(t=e)?"":t)+'</div></div><div class="error-content summary"><div class="label">Summary:</div><div class="txt">'+jade.escape(null==(t=o)?"":t)+'</div></div><div class="error-content guide"><div class="label">Guide: </div><a'+jade.attr("href",""+i,!0,!1)+' target="_blank"> <div class="txt">Understanding and Resolving a '+jade.escape(null==(t=e)?"":t)+' Error</div><img data-src="external-link" class="shadow-icon"/></a></div><div class="retry-btn">Retry</div><div class="stack-trace-btn"> <img data-src="stack-trace" class="shadow-icon"/><div class="txt"></div></div></div><div class="output">'),n&&r.push('<pre class="meta">'+jade.escape(null==(t=s)?"":t)+"</pre>"),r.push('<pre class="stack-trace">'+jade.escape(null==(t=a)?"":t)+"</pre></div></div></div>")}.call(this,"code"in i?i.code:"undefined"!=typeof code?code:void 0,"doc"in i?i.doc:"undefined"!=typeof doc?doc:void 0,"meta"in i?i.meta:"undefined"!=typeof meta?meta:void 0,"metaString"in i?i.metaString:"undefined"!=typeof metaString?metaString:void 0,"summary"in i?i.summary:"undefined"!=typeof summary?summary:void 0,"trace"in i?i.trace:"undefined"!=typeof trace?trace:void 0),r.join("")}},{}],9:[function(e,t,r){t.exports=function(e){var t=[];return t.push('<div class="sequence-wrapper fixed empty"><div class="sequences"></div><div class="trans-close-btns"><div class="btn hide"><img data-src="sequence-close" class="shadow-icon"/></div><div class="btn open"><img data-src="sequence-open" class="shadow-icon"/></div><div class="btn close"><img data-src="sequence-open" class="shadow-icon"/></div></div></div>'),t.join("")}},{}],10:[function(e,t,r){t.exports=function(e){var t,r=[],i=e||{};return function(e,i,n,s){r.push("<div"+jade.attr("title",""+e,!0,!1)+jade.cls(["sequence",""+s],[null,!0])+'><div class="content"><div class="title"> <div class="main">'+jade.escape(null==(t=n)?"":t)+"</div><div"+jade.cls([null==n?"main":"message"],[!0])+">"+jade.escape(null==(t=i)?"":t)+'</div><div class="meta-message"></div><div class="state"> </div></div><div class="progress"></div></div><div class="error"></div><div class="children"> </div></div>')}.call(this,"hoverToolTip"in i?i.hoverToolTip:"undefined"!=typeof hoverToolTip?hoverToolTip:void 0,"message"in i?i.message:"undefined"!=typeof message?message:void 0,"title"in i?i.title:"undefined"!=typeof title?title:void 0,"viewClass"in i?i.viewClass:"undefined"!=typeof viewClass?viewClass:void 0),r.join("")}},{}]},{},[5]);var pxSvgIconString=pxSvgIconString||"";pxSvgIconString+='<g id="sequence-close" data-size="10x10" class="sequence-viewew-svg-svg ">	<line class="st0" x1="0.707" y1="0.707" x2="8.546" y2="8.546"/><line class="st0" x1="8.546" y1="0.707" x2="0.707" y2="8.546"/></g><g id="sequence-open" data-size="14x10" class="sequence-viewew-svg-svg ">	<polyline class="st0" points="3.4,4.9 6.7,8.2 6.7,8.3 10.1,4.9 	"/><line class="st0" x1="0" y1="1" x2="14" y2="1"/></g><g id="sequence-spinner" data-size="25x25" class="sequence-viewew-svg-svg ">			<linearGradient id="SVGID_1_" gradientUnits="userSpaceOnUse" x1="6.0135" y1="199.3328" x2="22.3827" y2="193.3718" gradientTransform="matrix(1 0 0 -1 0 202)">		<stop  offset="0" style="stop-color:#FFFFFF;stop-opacity:0"/><stop  offset="1" style="stop-color:#FFFFFF"/></linearGradient>	<path class="st1" d="M24.3,12.101h-2c0-5.6-4.6-10.2-10.2-10.2c-3.8,0-7.2,2.1-9,5.4l-1.8-0.9c2.1-4,6.2-6.4,10.7-6.4		C18.8-0.099,24.3,5.401,24.3,12.101z"/><linearGradient id="SVGID_2_" gradientUnits="userSpaceOnUse" x1="-270.2016" y1="-23.9059" x2="-253.8324" y2="-29.867" gradientTransform="matrix(-1 0 0 1 -251.9482 45.4453)">		<stop  offset="0" style="stop-color:#FFFFFF;stop-opacity:0"/><stop  offset="1" style="stop-color:#FFFFFF"/></linearGradient>	<path class="st2" d="M0,12.101h2c0,5.6,4.6,10.2,10.2,10.2c3.8,0,7.2-2.1,9-5.4l1.7,0.9c-2.1,4-6.2,6.4-10.7,6.4		C5.4,24.301,0,18.801,0,12.101z"/></g>';var pxSvgIconString=pxSvgIconString||"";pxSvgIconString+="";