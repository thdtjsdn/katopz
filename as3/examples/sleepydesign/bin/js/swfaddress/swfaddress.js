/*
 * SWFAddress 2.5: Deep linking for Flash and Ajax <http://www.asual.com/swfaddress/>
 *
 * SWFAddress is (c) 2006-2010 Rostislav Hristov and contributors
 * This software is released under the MIT License <http://www.opensource.org/licenses/mit-license.php>
 *
 */
if(typeof asual=="undefined")var asual={};if(typeof asual.util=="undefined")asual.util={};asual.util.Browser=new (function(){var g=navigator.userAgent.toLowerCase(),m=/webkit/.test(g),q=/opera/.test(g),n=/msie/.test(g)&&!/opera/.test(g),o=/mozilla/.test(g)&&!/(compatible|webkit)/.test(g),y=parseFloat(n?g.substr(g.indexOf("msie")+4):(g.match(/.+(?:rv|it|ra|ie)[\/: ]([\d.]+)/)||[0,"0"])[1]);this.toString=function(){return"[class Browser]"};this.getVersion=function(){return y};this.isMSIE=function(){return n};this.isSafari=function(){return m};this.isOpera=function(){return q};this.isMozilla=function(){return o}});asual.util.Events=new (function(){var g=window,m=document,q=[],n=asual.util,o=n.Browser,y=o.isMSIE(),F=o.isSafari();this.toString=function(){return"[class Events]"};this.addListener=function(l,j,u){q.push({o:l,t:j,l:u});if(!(j=="DOMContentLoaded"&&(y||F)))if(l.addEventListener)l.addEventListener(j,u,false);else l.attachEvent&&l.attachEvent("on"+j,u)};this.removeListener=function(l,j,u){for(var D=0,E;E=q[D];D++)if(E.o==l&&E.t==j&&E.l==u){q.splice(D,1);break}if(!(j=="DOMContentLoaded"&&(y||F)))if(l.removeEventListener)l.removeEventListener(j,u,false);else l.detachEvent&&l.detachEvent("on"+j,u)};var K=function(){for(var l=0,j;j=q[l];l++)j.t!="DOMContentLoaded"&&n.Events.removeListener(j.o,j.t,j.l)};o=function(){if(m.readyState=="interactive"){function l(){m.detachEvent("onstop",l);K()}m.attachEvent("onstop",l);g.setTimeout(function(){m.detachEvent("onstop",l)},0)}};if(y||F)(function(){try{if(y&&m.body||!/loaded|complete/.test(m.readyState))m.documentElement.doScroll("left")}catch(l){return setTimeout(arguments.callee,0)}for(var j=0,u;u=q[j];j++)u.t=="DOMContentLoaded"&&u.l.call(null)})();y&&g.attachEvent("onbeforeunload",o);this.addListener(g,"unload",K)});asual.util.Functions=new (function(){this.toString=function(){return"[class Functions]"};this.bind=function(g,m){for(var q=2,n,o=[];n=arguments[q];q++)o.push(n);return function(){return g.apply(m,o)}}});var SWFAddressEvent=function(g){this.toString=function(){return"[object SWFAddressEvent]"};this.type=g;this.target=[SWFAddress][0];this.value=SWFAddress.getValue();this.path=SWFAddress.getPath();this.pathNames=SWFAddress.getPathNames();this.parameters={};g=SWFAddress.getParameterNames();for(var m=0,q=g.length;m<q;m++)this.parameters[g[m]]=SWFAddress.getParameter(g[m]);this.parameterNames=g};SWFAddressEvent.INIT="init";SWFAddressEvent.CHANGE="change";SWFAddressEvent.INTERNAL_CHANGE="internalChange";SWFAddressEvent.EXTERNAL_CHANGE="externalChange";var SWFAddress=new (function(){var g=function(){var a=f.href.indexOf("#");return a!=-1?U(L(n(f.href.substr(a+1),r))):""},m=function(a,b){if(k.strict)a=b?a.substr(0,1)!="/"?"/"+a:a:a==""?"/":a;return a},q=function(a,b){return z&&f.protocol=="file:"?b?_value.replace(/\?/,"%3F"):_value.replace(/%253F/,"?"):a},n=function(a,b){if(k.crawlable&&b)return(a!=""?"!":"")+a;return a.replace(/^\!/,"")},o=function(a,b){var c,d=a.ownerDocument;if(d&&d.defaultView&&d.defaultView.getComputedStyle)c=d.defaultView.getComputedStyle(a,"")[b];else if(a.currentStyle)c=a.currentStyle[b];return parseInt(c,10)},y=function(a){for(var b=0,c=a.childNodes.length,d,s;b<c;b++){if(a.childNodes[b].src)d=String(a.childNodes[b].src);if(s=y(a.childNodes[b]))d=s}return d},F=function(a,b){for(var c=0;c<b.length;c++)if(a===b[c])return c;return-1},K=function(){if(!_silent){var a=g(),b=_value!=a;if(A&&v<523){if(_length!=B.length){_length=B.length;if(typeof _stack[_length-1]!=h)_value=_stack[_length-1];u.call(this,r)}}else if(z&&v<7&&b)f.reload();else if(b){_value=a;u.call(this,r)}}},l=function(){if(_popup.length>0){window.popup=window.open(_popup[0],_popup[1],eval(_popup[2]));typeof _popup[3]!=h&&eval(_popup[3])}_popup=[]},j=function(a){this.dispatchEvent(new SWFAddressEvent(a));a=a.substr(0,1).toUpperCase()+a.substr(1);typeof this["on"+a]==M&&this["on"+a]()},u=function(a){for(var b=0,c,d,s=SWFAddress.getValue();c=_ids[b];b++)if(d=document.getElementById(c))if(d.parentNode&&typeof d.parentNode.so!=h)d.parentNode.so.call("setSWFAddressValue",s,a);else{if(!(d&&typeof d.setSWFAddressValue!=h)){c=d.getElementsByTagName("object");d=d.getElementsByTagName("embed");d=c[0]&&typeof c[0].setSWFAddressValue!=h?c[0]:d[0]&&typeof d[0].setSWFAddressValue!=h?d[0]:null}d&&d.setSWFAddressValue(s,a)}else if(d=document[c])typeof d.setSWFAddressValue!=h&&d.setSWFAddressValue(s,a);j.call(this,SWFAddressEvent.CHANGE);j.call(this,a?SWFAddressEvent.INTERNAL_CHANGE:SWFAddressEvent.EXTERNAL_CHANGE);G(H.bind(D,this),10)},D=function(){if(k.tracker!=="null"&&k.tracker!==null){var a=x[k.tracker],b=(f.pathname+(SWFAddress?SWFAddress.getValue():"")).replace(/\/\//,"/").replace(/^\/$/,"");if(typeof a==M)a(b);else if(typeof urchinTracker==M)urchinTracker(b);else if(typeof pageTracker!=h&&typeof pageTracker._trackPageview==M)pageTracker._trackPageview(b);else typeof _gaq!=h&&typeof _gaq.push==M&&_gaq.push(["_trackPageview",b])}},E=function(){var a=t.contentWindow.document;a.open();a.write("<html><head><title>"+e.title+"</title><script>var "+w+' = "'+g()+'";<\/script></head></html>');a.close()},X=function(){var a=t.contentWindow;_value=typeof a[w]!=h?a[w]:"";if(_value!=g()){u.call(SWFAddress,r);f.hash=q(n(_value,i),i)}},T=function(){if(!_loaded){_loaded=i;if(Q&&_qi!=-1){var a,b=Q.substr(_qi+1).split("&");for(c=0;c<b.length;c++){a=b[c].split("=");if(/^(autoUpdate|crawlable|history|strict|wrap)$/.test(a[0]))k[a[0]]=isNaN(a[1])?/^(true|yes)$/i.test(a[1]):parseInt(a[1],10)!==0;if(/^tracker$/.test(a[0]))k[a[0]]=a[1]}}if(k.wrap){c=e.createElement("div");for(c.style.padding=o(e.body,"marginTop")+o(e.body,"paddingTop")+"px "+(o(e.body,"marginRight")+o(e.body,"paddingRight"))+"px "+(o(e.body,"marginBottom")+o(e.body,"paddingBottom"))+"px "+(o(e.body,"marginLeft")+o(e.body,"paddingLeft"))+"px";e.body.firstChild;)c.appendChild(e.body.firstChild);e.body.appendChild(c);c=e.createElement("div");c.id=w;c.style.height="100%";c.style.overflow="auto";if(A&&x.statusbar.visible&&!/chrome/i.test(navigator.userAgent))c.style.resize="both";c.appendChild(e.body.firstChild);e.body.appendChild(c);a=[e.getElementsByTagName("html")[0],e.body];for(var c=0;c<a.length;c++){a[c].style.height="100%";a[c].style.margin=0;a[c].style.padding=0;a[c].style.overflow="hidden"}if(A){c=e.createElement("style");c.type="text/css";a=e.createTextNode("#"+w+"::-webkit-resizer { background-color: #fff; }");c.appendChild(a);e.getElementsByTagName("head")[0].appendChild(c)}}if(z&&v<8){c=e.getElementsByTagName("frameset")[0];t=e.createElement((c?"":"i")+"frame");if(c){c.insertAdjacentElement("beforeEnd",t);c[c.cols?"cols":"rows"]+=",0";t.src="javascript:false";t.noResize=i;t.frameBorder=t.frameSpacing=0}else{t.src="javascript:false";t.style.display="none";e.body.insertAdjacentElement("afterBegin",t)}G(function(){I.addListener(t,"load",X);typeof t.contentWindow[w]==h&&E()},50)}else if(A){if(v<418){e.body.innerHTML+='<form id="'+w+'" style="position:absolute;top:-9999px;" method="get"></form>';S=e.getElementById(w)}if(typeof f[w]==h)f[w]={};if(typeof f[w][f.pathname]!=h)_stack=f[w][f.pathname].split(",")}G(H.bind(function(){R.Browser.isSafari()&&I.addListener(e.body,"click",l);j.call(this,SWFAddressEvent.INIT);j.call(this,SWFAddressEvent.CHANGE);j.call(this,SWFAddressEvent.EXTERNAL_CHANGE);D.call(this)},this),1);z&&v>7||!z&&"onhashchange"in x?I.addListener(x,"hashchange",H.bind(K,this)):Y(H.bind(K,this),50)}},w="swfaddress",M="function",h="undefined",i=true,r=false,k={autoUpdate:i,crawlable:r,history:i,strict:i,wrap:r},R=asual.util,C=R.Browser,I=R.Events,H=R.Functions,v=C.getVersion(),z=C.isMSIE(),V=C.isMozilla(),W=C.isOpera(),A=C.isSafari(),J=r,x=function(){try{return top.document!==undefined?top:window}catch(a){return window}}(),e=x.document,B=x.history,f=x.location,Y=setInterval,G=setTimeout,L=decodeURI,U=encodeURI,t,S,Q=y(document);_qi=Q?Q.indexOf("?"):-1;_title=e.title;_length=B.length;_loaded=_silent=r;_juststart=_justset=i;_updating=r;_ref=this;_stack=[];_ids=[];_popup=[];_listeners={};_value=g();if(z&&e.documentMode&&e.documentMode!=v)v=e.documentMode!=8?7:8;if(J=V&&v>=1||z&&v>=6||W&&v>=9.5||A&&v>=312){for(C=1;C<_length;C++)_stack.push("");_stack.push(_value);if(z){I.addListener(document,"propertychange",function(){if(e.title!=_title&&e.title.indexOf("#"+g())!=-1)e.title=_title});if(f.hash!=_value)f.hash="#"+q(n(_value,i),i)}if(W)history.navigationMode="compatible";if(document.readyState=="complete")var Z=setInterval(function(){if(SWFAddress){T.call(SWFAddress);clearInterval(Z)}},50);else{I.addListener(document,"DOMContentLoaded",H.bind(T,this));I.addListener(window,"load",H.bind(T,this))}}else if(!J&&f.href.indexOf("#")!=-1||A&&v<418&&f.href.indexOf("#")!=-1&&f.search!=""){e.open();e.write('<html><head><meta http-equiv="refresh" content="0;url='+encodeURI(f.href.substr(0,f.href.indexOf("#")))+'" /></head></html>');e.close()}else D();this.toString=function(){return"[class SWFAddress]"};this.back=function(){B.back()};this.forward=function(){B.forward()};this.up=function(){var a=this.getPath();this.setValue(a.substr(0,a.lastIndexOf("/",a.length-2)+(a.substr(a.length-1)=="/"?1:0)))};this.go=function(a){B.go(a)};this.href=function(a,b){b=typeof b!=h?b:"_self";if(b=="_self")self.location.href=a;else if(b=="_top")f.href=a;else if(b=="_blank")window.open(a);else x.frames[b].location.href=a};this.popup=function(a,b,c,d){try{window.popup=window.open(a,b,eval(c));typeof d!=h&&eval(d)}catch(s){}_popup=arguments};this.getIds=function(){return _ids};this.getId=function(){return _ids[0]};this.setId=function(a){_ids[0]=a};this.addId=function(a){this.removeId(a);_ids.push(a)};this.removeId=function(a){for(var b=0;b<_ids.length;b++)if(a==_ids[b]){_ids.splice(b,1);break}};this.addEventListener=function(a,b){if(typeof _listeners[a]==h)_listeners[a]=[];_listeners[a].push(b)};this.removeEventListener=function(a,b){if(typeof _listeners[a]!=h){for(var c=0,d;d=_listeners[a][c];c++)if(d==b)break;_listeners[a].splice(c,1)}};this.dispatchEvent=function(a){if(this.hasEventListener(a.type)){a.target=this;for(var b=0,c;c=_listeners[a.type][b];b++)c(a);return i}return r};this.hasEventListener=function(a){return typeof _listeners[a]!=h&&_listeners[a].length>0};this.getBaseURL=function(){var a=f.href;if(a.indexOf("#")!=-1)a=a.substr(0,a.indexOf("#"));if(/\/$/.test(a))a=a.substr(0,a.length-1);return a};this.getStrict=function(){return k.strict};this.setStrict=function(a){k.strict=a};this.getAutoUpdate=function(){return k.autoUpdate};this.setAutoUpdate=function(a){k.autoUpdate=a};this.update=function(){_updating=i;this.setValue(_value);_updating=r};this.getHistory=function(){return k.history};this.setHistory=function(a){k.history=a};this.getTracker=function(){return k.tracker};this.setTracker=function(a){k.tracker=a};this.getCrawlable=function(){return k.crawlable};this.setCrawlable=function(a){k.crawlable=a};this.getWrap=function(){return k.wrap};this.setWrap=function(a){k.wrap=a};this.getTitle=function(){return e.title};this.setTitle=function(a){if(!J)return null;if(typeof a!=h){if(a=="null")a="";a=L(a);G(function(){_title=e.title=a;if(_juststart&&t&&t.contentWindow&&t.contentWindow.document){t.contentWindow.document.title=a;_juststart=r}if(!_justset&&V)f.replace(f.href.indexOf("#")!=-1?f.href:f.href+"#");_justset=r},10)}};this.getStatus=function(){return x.status};this.setStatus=function(a){if(!J)return null;if(typeof a!=h){if(a=="null")a="";a=L(a);if(!A){a=m(a!="null"?a:"",i);if(a=="/")a="";if(!/http(s)?:\/\//.test(a)){var b=f.href.indexOf("#");a=(b==-1?f.href:f.href.substr(0,b))+"#"+a}x.status=a}}};this.resetStatus=function(){x.status=""};this.getValue=function(){if(!J)return null;return L(m(q(_value,r),r))};this.setValue=function(a){if(!J)return null;if(typeof a!=h){if(a=="null")a="";a=U(L(m(a,i)));if(a=="/")a="";if(!(_value==a&&!_updating)){_justset=i;_value=a;if(k.autoUpdate||_updating){_silent=i;u.call(SWFAddress,i);_stack[B.length]=_value;if(A)if(k.history){f[w][f.pathname]=_stack.toString();_length=B.length+1;if(v<418){if(f.search==""){S.action="#"+n(_value,i);S.submit()}}else if(v<523||_value==""){a=e.createEvent("MouseEvents");a.initEvent("click",i,i);var b=e.createElement("a");b.href="#"+n(_value,i);b.dispatchEvent(a)}else f.hash="#"+n(_value,i)}else f.replace("#"+n(_value,i));else if(_value!=g())if(k.history)f.hash="#"+q(n(_value,i),i);else f.replace("#"+n(_value,i));z&&v<8&&k.history&&G(E,50);if(A)G(function(){_silent=r},1);else _silent=r}}}};this.getPath=function(){var a=this.getValue();return a.indexOf("?")!=-1?a.split("?")[0]:a.indexOf("#")!=-1?a.split("#")[0]:a};this.setPath=function(a){var b=this.getQueryString();this.value(a+(b?"?"+b:""))};this.getPathNames=function(){var a=this.getPath(),b=a.split("/");if(a.substr(0,1)=="/"||a.length==0)b.splice(0,1);a.substr(a.length-1,1)=="/"&&b.splice(b.length-1,1);return b};this.getQueryString=function(){var a=this.getValue(),b=a.indexOf("?");if(b!=-1&&b<a.length)return a.substr(b+1)};this.setQueryString=function(a){this.setValue(this.getPath()+(a?"?"+a:""))};this.getParameter=function(a){var b=this.getValue(),c=b.indexOf("?");if(c!=-1){b=b.substr(c+1);c=b.split("&");for(var d=[],s=0;s<c.length;s++){b=c[s].split("=");b[0]==a&&d.push(b[1])}if(d.length!=0)return d.length!=1?d:d[0]}};this.setParameter=function(a,b,c){for(var d=this.getParameterNames(),s=[],N=0;N<d.length;N++){var O=d[N],p=this.getParameter(O);if(typeof p=="string")p=[p];if(O==a)p=b===null||b==""?[]:c?p.concat([b]):[b];for(var P=0;P<p.length;P++)s.push(O+"="+p[P])}F(a,d)==-1&&s.push(a+"="+b);this.setQueryString(s.join("&"))};this.getParameterNames=function(){var a=this.getValue(),b=a.indexOf("?"),c=[];if(b!=-1){a=a.substr(b+1);if(a!=""&&a.indexOf("=")!=-1){a=a.split("&");for(b=b=0;b<a.length;b++){var d=a[b].split("=")[0];F(d,c)==-1&&c.push(d)}}}return c};this.onExternalChange=this.onInternalChange=this.onChange=this.onInit=null;(function(){var a;if(typeof FlashObject!=h)SWFObject=FlashObject;if(typeof SWFObject!=h&&SWFObject.prototype&&SWFObject.prototype.write){var b=SWFObject.prototype.write;SWFObject.prototype.write=function(){a=arguments;if(this.getAttribute("version").major<8){this.addVariable("$swfaddress",SWFAddress.getValue());(typeof a[0]=="string"?document.getElementById(a[0]):a[0]).so=this}var p;if(p=b.apply(this,a))_ref.addId(this.getAttribute("id"));return p}}if(typeof swfobject!=h){var c=swfobject.registerObject;swfobject.registerObject=function(){a=arguments;c.apply(this,a);_ref.addId(a[0])};var d=swfobject.createSWF;swfobject.createSWF=function(){a=arguments;var p=d.apply(this,a);p&&_ref.addId(a[0].id);return p};var s=swfobject.embedSWF;swfobject.embedSWF=function(){a=arguments;if(typeof a[8]==h)a[8]={};if(typeof a[8].id==h)a[8].id=a[1];s.apply(this,a);_ref.addId(a[8].id)}}if(typeof UFO!=h){var N=UFO.create;UFO.create=function(){a=arguments;N.apply(this,a);_ref.addId(a[0].id)}}if(typeof AC_FL_RunContent!=h){var O=AC_FL_RunContent;AC_FL_RunContent=function(){a=arguments;O.apply(this,a);for(var p=0,P=a.length;p<P;p++)a[p]=="id"&&_ref.addId(a[p+1])}}})()});