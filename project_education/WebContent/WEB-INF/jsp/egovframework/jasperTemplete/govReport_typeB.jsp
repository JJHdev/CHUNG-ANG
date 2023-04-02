<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>REPORT</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="user-scalable=yes, maximum-scale=1, minimum-scale=0, width=1900">

	<script src="${pageContext.request.contextPath}/js/jquery.1.12.0.min.js"></script>
	
	<!-- html2canvas : html5 이미지저장 라이브러리 -->
	<script src="${pageContext.request.contextPath}/js/html2canvas.js"></script>
	<!-- CONVERTOR PDF -->
	<script src="${pageContext.request.contextPath}/js/jsPdf.js"></script>
	
	<script src="${pageContext.request.contextPath}/js/commonJs.js"></script>
	<script src="${pageContext.request.contextPath}/js/common-bizUtil.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/report/ol/ol.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/report/ol/tools.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/report/ol/ol-ext.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/report/ol/proj4.js"></script>
	
	<link type="text/css" href="${pageContext.request.contextPath}/css/jasperTemplete/design.css" rel="stylesheet">

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jasperTemplete/govReport_typeB.js"></script>
	
	<script>
	/*! FileSaver.js
	 *  A saveAs() FileSaver implementation.
	 *  2014-01-24
	 *
	 *  By Eli Grey, http://eligrey.com
	 *  License: X11/MIT
	 *    See LICENSE.md
	 */

	/*global self */
	/*jslint bitwise: true, indent: 4, laxbreak: true, laxcomma: true, smarttabs: true, plusplus: true */

	/*! @source http://purl.eligrey.com/github/FileSaver.js/blob/master/FileSaver.js */

	var saveAs = saveAs
	  // IE 10+ (native saveAs)
	  || (typeof navigator !== "undefined" &&
	      navigator.msSaveOrOpenBlob && navigator.msSaveOrOpenBlob.bind(navigator))
	  // Everyone else
	  || (function(view) {
		"use strict";
		// IE <10 is explicitly unsupported
		if (typeof navigator !== "undefined" &&
		    /MSIE [1-9]\./.test(navigator.userAgent)) {
			return;
		}
		var
			  doc = view.document
			  // only get URL when necessary in case BlobBuilder.js hasn't overridden it yet
			, get_URL = function() {
				return view.URL || view.webkitURL || view;
			}
			, URL = view.URL || view.webkitURL || view
			, save_link = doc.createElementNS("http://www.w3.org/1999/xhtml", "a")
			, can_use_save_link = !view.externalHost && "download" in save_link
			, click = function(node) {
				var event = doc.createEvent("MouseEvents");
				event.initMouseEvent(
					"click", true, false, view, 0, 0, 0, 0, 0
					, false, false, false, false, 0, null
				);
				node.dispatchEvent(event);
			}
			, webkit_req_fs = view.webkitRequestFileSystem
			, req_fs = view.requestFileSystem || webkit_req_fs || view.mozRequestFileSystem
			, throw_outside = function(ex) {
				(view.setImmediate || view.setTimeout)(function() {
					throw ex;
				}, 0);
			}
			, force_saveable_type = "application/octet-stream"
			, fs_min_size = 0
			, deletion_queue = []
			, process_deletion_queue = function() {
				var i = deletion_queue.length;
				while (i--) {
					var file = deletion_queue[i];
					if (typeof file === "string") { // file is an object URL
						URL.revokeObjectURL(file);
					} else { // file is a File
						file.remove();
					}
				}
				deletion_queue.length = 0; // clear queue
			}
			, dispatch = function(filesaver, event_types, event) {
				event_types = [].concat(event_types);
				var i = event_types.length;
				while (i--) {
					var listener = filesaver["on" + event_types[i]];
					if (typeof listener === "function") {
						try {
							listener.call(filesaver, event || filesaver);
						} catch (ex) {
							throw_outside(ex);
						}
					}
				}
			}
			, FileSaver = function(blob, name) {
				// First try a.download, then web filesystem, then object URLs
				var
					  filesaver = this
					, type = blob.type
					, blob_changed = false
					, object_url
					, target_view
					, get_object_url = function() {
						var object_url = get_URL().createObjectURL(blob);
						deletion_queue.push(object_url);
						return object_url;
					}
					, dispatch_all = function() {
						dispatch(filesaver, "writestart progress write writeend".split(" "));
					}
					// on any filesys errors revert to saving with object URLs
					, fs_error = function() {
						// don't create more object URLs than needed
						if (blob_changed || !object_url) {
							object_url = get_object_url(blob);
						}
						if (target_view) {
							target_view.location.href = object_url;
						} else {
							window.open(object_url, "_blank");
						}
						filesaver.readyState = filesaver.DONE;
						dispatch_all();
					}
					, abortable = function(func) {
						return function() {
							if (filesaver.readyState !== filesaver.DONE) {
								return func.apply(this, arguments);
							}
						};
					}
					, create_if_not_found = {create: true, exclusive: false}
					, slice
				;
				filesaver.readyState = filesaver.INIT;
				if (!name) {
					name = "download";
				}
				if (can_use_save_link) {
					object_url = get_object_url(blob);
					// FF for Android has a nasty garbage collection mechanism
					// that turns all objects that are not pure javascript into 'deadObject'
					// this means `doc` and `save_link` are unusable and need to be recreated
					// `view` is usable though:
					doc = view.document;
					save_link = doc.createElementNS("http://www.w3.org/1999/xhtml", "a");
					save_link.href = object_url;
					save_link.download = name;
					var event = doc.createEvent("MouseEvents");
					event.initMouseEvent(
						"click", true, false, view, 0, 0, 0, 0, 0
						, false, false, false, false, 0, null
					);
					save_link.dispatchEvent(event);
					filesaver.readyState = filesaver.DONE;
					dispatch_all();
					return;
				}
				// Object and web filesystem URLs have a problem saving in Google Chrome when
				// viewed in a tab, so I force save with application/octet-stream
				// http://code.google.com/p/chromium/issues/detail?id=91158
				if (view.chrome && type && type !== force_saveable_type) {
					slice = blob.slice || blob.webkitSlice;
					blob = slice.call(blob, 0, blob.size, force_saveable_type);
					blob_changed = true;
				}
				// Since I can't be sure that the guessed media type will trigger a download
				// in WebKit, I append .download to the filename.
				// https://bugs.webkit.org/show_bug.cgi?id=65440
				if (webkit_req_fs && name !== "download") {
					name += ".download";
				}
				if (type === force_saveable_type || webkit_req_fs) {
					target_view = view;
				}
				if (!req_fs) {
					fs_error();
					return;
				}
				fs_min_size += blob.size;
				req_fs(view.TEMPORARY, fs_min_size, abortable(function(fs) {
					fs.root.getDirectory("saved", create_if_not_found, abortable(function(dir) {
						var save = function() {
							dir.getFile(name, create_if_not_found, abortable(function(file) {
								file.createWriter(abortable(function(writer) {
									writer.onwriteend = function(event) {
										target_view.location.href = file.toURL();
										deletion_queue.push(file);
										filesaver.readyState = filesaver.DONE;
										dispatch(filesaver, "writeend", event);
									};
									writer.onerror = function() {
										var error = writer.error;
										if (error.code !== error.ABORT_ERR) {
											fs_error();
										}
									};
									"writestart progress write abort".split(" ").forEach(function(event) {
										writer["on" + event] = filesaver["on" + event];
									});
									writer.write(blob);
									filesaver.abort = function() {
										writer.abort();
										filesaver.readyState = filesaver.DONE;
									};
									filesaver.readyState = filesaver.WRITING;
								}), fs_error);
							}), fs_error);
						};
						dir.getFile(name, {create: false}, abortable(function(file) {
							// delete file if it already exists
							file.remove();
							save();
						}), abortable(function(ex) {
							if (ex.code === ex.NOT_FOUND_ERR) {
								save();
							} else {
								fs_error();
							}
						}));
					}), fs_error);
				}), fs_error);
			}
			, FS_proto = FileSaver.prototype
			, saveAs = function(blob, name) {
				return new FileSaver(blob, name);
			}
		;
		FS_proto.abort = function() {
			var filesaver = this;
			filesaver.readyState = filesaver.DONE;
			dispatch(filesaver, "abort");
		};
		FS_proto.readyState = FS_proto.INIT = 0;
		FS_proto.WRITING = 1;
		FS_proto.DONE = 2;

		FS_proto.error =
		FS_proto.onwritestart =
		FS_proto.onprogress =
		FS_proto.onwrite =
		FS_proto.onabort =
		FS_proto.onerror =
		FS_proto.onwriteend =
			null;

		view.addEventListener("unload", process_deletion_queue, false);
		saveAs.unload = function() {
			process_deletion_queue();
			view.removeEventListener("unload", process_deletion_queue, false);
		};
		return saveAs;
	}(
		   typeof self !== "undefined" && self
		|| typeof window !== "undefined" && window
		|| this.content
	));
	// `self` is undefined in Firefox for Android content script context
	// while `this` is nsIContentFrameMessageManager
	// with an attribute `content` that corresponds to the window

	if (typeof module !== "undefined" && module !== null) {
	  module.exports = saveAs;
	} else if ((typeof define !== "undefined" && define !== null) && (define.amd != null)) {
	  define([], function() {
	    return saveAs;
	  });
	}

	</script>
	<script>

	if (typeof jQuery !== "undefined" && typeof saveAs !== "undefined") {
	    (function($) {
	        $.fn.wordExport = function(fileName) {

	            fileName = typeof fileName !== 'undefined' ? fileName : "jQuery-Word-Export";
	            var static = {
	                mhtml: {
	                    top: "Mime-Version: 1.0\nContent-Base: " + location.href + "\nContent-Type: Multipart/related; boundary=\"NEXT.ITEM-BOUNDARY\";type=\"text/html\"\n\n--NEXT.ITEM-BOUNDARY\nContent-Type: text/html; charset=\"utf-8\"\nContent-Location: " + location.href + "\n\n<!DOCTYPE html>\n<html>\n_html_</html>",
	                    head: "<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<style>\n_styles_\n</style>\n</head>\n",
	                    body: "<body>_body_</body>"
	                }
	            };
	            var options = {
	                maxWidth: 624
	            };
	            // Clone selected element before manipulating it
	            var markup = $(this).clone();

	            // Remove hidden elements from the output
	            markup.each(function() {
	                var self = $(this);
	                if (self.is(':hidden'))
	                    self.remove();
	            });

	            // Embed all images using Data URLs
	            var images = Array();
	            // var img = markup.find('img');
	            var img = document.getElementsByTagName('img');
	            console.log(img);
	            for (var i = 0; i < img.length; i++) {
	                // Calculate dimensions of output image
	                if(i === 0) continue;
	                var w = Math.min(img[i].width, options.maxWidth);
	                var h = img[i].height * (w / img[i].width);
	                console.log(w);
	                console.log(h);

	                // Create canvas for converting image to data URL
	                $('<canvas>').attr("id", "jQuery-Word-export_img_" + i).width(w).height(h).insertAfter(img[i]);

	                var canvas = document.getElementById("jQuery-Word-export_img_" + i);
	                canvas.width = w;
	                canvas.height = h;
	                // Draw image to canvas
	                var context = canvas.getContext('2d');
	                context.drawImage(img[i], 0, 0, w, h);
	                // Get data URL encoding of image
	                var uri = canvas.toDataURL();
	                $(img[i]).attr("src", img[i].src);
	                img[i].width = w;
	                img[i].height = h;
	                // Save encoded image to array
	                images[i] = {
	                    type: uri.substring(uri.indexOf(":") + 1, uri.indexOf(";")),
	                    encoding: uri.substring(uri.indexOf(";") + 1, uri.indexOf(",")),
	                    location: $(img[i]).attr("src"),
	                    data: uri.substring(uri.indexOf(",") + 1)
	                };
	                // Remove canvas now that we no longer need it
	                canvas.parentNode.removeChild(canvas);
	            }

	            // Prepare bottom of mhtml file with image data
	            var mhtmlBottom = "\n";
	            console.log(images);
	            for (var i = 0; i < images.length; i++) {
	                if(i === 0) continue;
	                mhtmlBottom += "--NEXT.ITEM-BOUNDARY\n";
	                mhtmlBottom += "Content-Location: " + images[i].contentLocation + "\n";
	                mhtmlBottom += "Content-Type: " + images[i].contentType + "\n";
	                mhtmlBottom += "Content-Transfer-Encoding: " + images[i].contentEncoding + "\n\n";
	                mhtmlBottom += images[i].contentData + "\n\n";
	            }
	            mhtmlBottom += "--NEXT.ITEM-BOUNDARY--";

	            //TODO: load css from included stylesheet
	            var styles = 'section{display:inline-block;width:584px;height:100%;overflow:hidden}section>div{margin:10px}*{box-sizing:border-box}body{font-family:NotoSansKR,AppleSDGothicNeo-Light,DroidSans,HelveticaNeue,"돋움",sans-serif;font-size:16px;line-height:1.8;color:#5b6689;letter-spacing:-.2px;font-weight:300;overflow-x:hidden}ul{margin:0;padding:0}li{list-style:none}textarea{width:100%;resize:none;padding:7px;color:#666}textarea:focus{outline:0}button:focus{outline:0}button:hover{border:1px solid #000}button:active{border:1px solid red}button{cursor:pointer;font-family:NotoSansKR,AppleSDGothicNeo-Light,DroidSans,HelveticaNeue,"돋움",sans-serif;background:#fff;border:1px solid #ccc;border-radius:3px}.rx-pdf-contr{font-family:NotoSansKR,AppleSDGothicNeo-Light,DroidSans,HelveticaNeue,"돋움",sans-serif;font-size:16px;line-height:1.8;display:inline-block;position:absolute;top:0;left:0;width:100%;z-index:999}.rx-pdf-contr-wrapper{width:100%;background:rgba(0,0,0,.5);padding:10px}.rx-pdf-contr button{width:100%;height:100%}.rx-pdf-contr *{box-sizing:border-box}.rx-page-nation{display:flex}.rx-page-nation>div{flex:1;text-align:center;border-radius:3px}.rx-page-nation>div:nth-child(2){flex:2;color:#fff}.rx-pdf-left-move-btn{background:#fff;margin-left:3px}.rx-pdf-left-move-btn>button{background:url(../../images/sRadarResources/adminImg/icon-prev.png) no-repeat 50% center;background-blend-mode:difference}.rx-pdf-right-move-btn{background:#fff;margin-right:3px}.rx-pdf-right-move-btn>button{background:url(../../images/sRadarResources/adminImg/icon-next.png) no-repeat 50% center;background-blend-mode:difference}.rx-pdf-btns{display:flex;padding:3px}.rx-pdf-btns>*{flex:1;color:#333}.rx-pdf-btns :focus{outline:0}.rx-pdf-btns ul{margin:0;padding:0;display:flex}.rx-pdf-btns ul li{flex:1;margin-left:3px}.rx-pdf-cont-show-hide{height:0}.rx-pdf-cont-show-hide>div{position:absolute;left:50%;transform:translateX(-50%)}.rx-pdf-show>button{background:url(../../images/sRadarResources/report/report-arrow-down.png) no-repeat 50% center}.rx-pdf-hide>button{background:url(../../images/sRadarResources/report/report-arrow-up.png) no-repeat 50% center}.rx-pdf-cont-show-hide>div>button{padding:5px 15px;width:70px;text-indent:-9999px;overflow:hidden}.rx-modifable>li{cursor:cell}#loadingPage{width:100%;height:100%;top:0;left:0;position:fixed;display:block;opacity:.8;background:#fff;text-align:center;z-index:9999999}#loadingPage>div{position:absolute;top:50%;left:50%;z-index:100;transform:translate(-50%,-50%)}#loadingPage>div>p{margin-top:30px;font-size:18px;letter-spacing:-1px;line-height:1;color:#2e3856}#loadingPage>div>p>span{font-size:24px;font-weight:700;display:block;margin-bottom:20px}.inner .tit-fix-part{height:50px;background:#f4f5f9;text-align:center;border-bottom:1px solid #e2e6ef;border-top:1px solid #fff}.inner .tit-fix-part h2{color:#3d57a5;font-size:16px;font-weight:500;line-height:30px}.inner .half-wrap{display:table;width:100%}.inner .half-wrap .half{display:table-cell;width:50%}.inner .half-wrap .half:first-child{padding-right:15px}.inner .half-wrap .half:last-child{padding-left:15px}.inner article .con-part h3{font-size:14px;font-weight:500;color:#434867;margin:0}.inner>article .con-part article[class*=graph]{border:1px solid #e2e6ef;margin-top:10px;height:190px;overflow:hidden}.inner>article .con-part article.graph.type-model{height:auto!important}.layout-1>.inner>article[class*=Wrap]{padding:30px}.layout-1 .inner>article{float:left;display:inline-block;height:calc(100vh - 120px);overflow-y:auto}.layout-1 .inner>article.conWrap{width:calc(100% - 410px)}.layout-2 .inner>article{float:left;display:inline-block}.layout-2 .inner>article.graphWrap{width:100%}.layout-2 .inner>article.majorWrap{width:100%;border-left:1px solid #e2e6ef}.layout-2 .inner>article.majorWrap .con-part{padding:20px}.layout-2 .inner>article>.con-part{padding:20px 30px}.layout-2 .inner>article>.con-part .row+.row{margin-top:20px}.layout-2 .inner>article>.con-part article.graph2{height:210px}.layout-2 .inner>article>.con-part article.graph3{height:180px}.layout-3 .inner .part-1{display:table;width:100%}.layout-3 .inner .part-1>div{display:table-cell;vertical-align:top}.layout-3 .inner .part-1>div.impact{width:20%}.layout-3 .inner .part-1>div.analysis{width:80%;border-left:1px solid #e2e6ef;text-align:left!important}.layout-3 .inner .part-1>div.analysis .tit-fix-part{padding:0 30px}.layout-3 .inner .part-1>div.analysis .tit-fix-part>*{float:left}.layout-3 .inner .part-1>div.analysis .tit-fix-part ul.subject-next{font-size:0;text-align:left;margin-left:30px;margin-top:10px}.layout-3 .inner .part-1>div.analysis .tit-fix-part ul.subject-next li{display:inline-block}.layout-3 .inner .part-1>div.analysis .tit-fix-part ul.subject-next li+li{margin-left:3px}.layout-3 .inner .part-1>div.analysis .tit-fix-part ul.subject-next li a{display:block;font-size:13px;color:#fff;border-radius:5px;background-position:10px center;background-repeat:no-repeat;padding:8px 10px 8px 23px;line-height:1}.layout-3 .inner .part-1>div.analysis .tit-fix-part ul.subject-next li a.do{background-color:#00aae6;background-image:url(../../images/sRadarResources/model/i-do.png)}.layout-3 .inner .part-1>div.analysis .tit-fix-part ul.subject-next li a.reset{background-color:#1f2f65;background-image:url(../../images/sRadarResources/model/i-reset.png)}.layout-3 .inner .part-1>div.analysis .tit-fix-part ul.type{float:right;font-size:0;text-align:right;margin-top:15px}.layout-3 .inner .part-1>div.analysis .tit-fix-part ul.type li{display:inline-block}.layout-3 .inner .part-1>div.analysis .tit-fix-part ul.type li+li{position:relative}.layout-3 .inner .part-1>div.analysis .tit-fix-part ul.type li+li:before{position:absolute;top:-2px;left:-50%;z-index:0;content:"";display:block;width:60px;height:22px;background-repeat:no-repeat;background-position:10px center}.layout-3 .inner .part-1>div.analysis .tit-fix-part ul.type li.on+li:before{background-image:url(../../images/sRadarResources/model/type-network.png)}.layout-3 .inner .part-1>div.analysis .tit-fix-part ul.type li+li.on:before{background-image:url(../../images/sRadarResources/model/type-step.png)}.layout-3 .inner .part-1>div.analysis .tit-fix-part ul.type li a{display:block;font-size:13px;font-weight:500;color:#5b6689;line-height:1.4;position:relative;z-index:1}.layout-3 .inner .part-1>div.analysis .tit-fix-part ul.type li:first-child a{padding-right:30px}.layout-3 .inner .part-1>div.analysis .tit-fix-part ul.type li:last-child a{padding-left:30px}.layout-3 .inner .part-1>div.analysis .tit-fix-part ul.type li.on a{color:#4a6dd3}.layout-2 .inner .graphWrap .row article.graph3{display:flex}.layout-2 .inner .graphWrap .row article.graph3>div{flex:1;padding:10px}.layout-2 .inner .graphWrap .row article.graph3>div:nth-child(1){height:160px;flex:.7}.layout-2 .inner .graphWrap .row article.graph3>div.grade .conBox{font-size:12px;text-align:center;font-weight:400;margin-top:-5px}.layout-2 .inner .graphWrap .row article.graph3>div.grade .conBox>p{margin:2px}.layout-2 .inner .graphWrap .row article.graph3>div.grade .conBox>span{color:red}.inner.report .majorWrap .con-part{padding:0!important}.inner.report .majorWrap .con-part .boxWrap .inner-tit{background:#f4f5f9;border-right:1px solid #e2e6ef;border-bottom:1px solid #e2e6ef;position:relative;cursor:pointer;width:100%;height:53px;box-sizing:border-box}.inner.report .majorWrap .con-part .boxWrap .inner-tit:before{position:absolute;top:1px;left:0;width:100%;height:1px;background:#fff;display:block;content:""}.inner.report .majorWrap .con-part .boxWrap .inner-tit h3{z-index:1!important;width:100%;position:absolute;top:0;left:0;font-size:14px;font-weight:400;padding:17px 80px 17px 50px;background:url(../../images/sRadarResources/report/report-arrow-down.png) no-repeat 30px center;line-height:1.4;margin:0}.inner.report .majorWrap .con-part .boxWrap .inner-tit a{z-index:2!important;position:absolute;top:50%;right:10px;margin-top:-18px;display:inline-block;padding:10px 10px 10px 25px;background:#fff url(../../images/sRadarResources/report/plus.png) no-repeat 10px center;background-size:11px 12px;text-decoration:none;color:#666;border:1px solid #e2e6ef;line-height:1;font-size:14px;font-weight:400}.inner.report .majorWrap .con-part .boxWrap .inner-tit a:hover{border:1px solid #c5cdde}.inner.report .majorWrap .con-part .boxWrap .inner-con{display:none}.inner.report .majorWrap .con-part .boxWrap.on .inner-tit h3{background:url(../../images/sRadarResources/report/report-arrow-up.png) no-repeat 30px center}.inner.report .majorWrap .con-part .boxWrap.on .inner-con{display:block;padding:20px 30px;border-right:1px solid #e2e6ef;border-bottom:1px solid #e2e6ef}.inner.report .majorWrap .con-part .boxWrap.on .inner-con ul li{padding-left:15px;position:relative;font-size:14px}.inner.report .majorWrap .con-part .boxWrap.on .inner-con ul li:before{position:absolute;top:11px;left:0;width:3px;height:3px;background:#5b6689;display:block;content:""}';
	            // Aggregate parts of the file together 
	            var fileContent = static.mhtml.top.replace("_html_", static.mhtml.head.replace("_styles_", styles) + static.mhtml.body.replace("_body_", markup.html())) + mhtmlBottom;

	            // Create a Blob with the file contents
	            var blob = new Blob([fileContent], {
	                type: "application/msword;charset=utf-8"
	            });


	            console.log(images);

	            saveAs(blob, fileName + ".doc");
	        };
	    })(jQuery);
	} else {
	    if (typeof jQuery === "undefined") {
	        console.error("jQuery Word Export: missing dependency (jQuery)");
	    }
	    if (typeof saveAs === "undefined") {
	        console.error("jQuery Word Export: missing dependency (FileSaver.js)");
	    };
	}

	</script>
	

</head>
<body>
	
	<!-- 로딩화면 -->	
	<div id="mask" style="position:absolute; z-index:9000; background-color:#000000; left:0; top:0; width:920px; height:950px; opacity:0.3;">
		<div id="loadingImg">
			<img src="${pageContext.request.contextPath}/css/images/common/loading.gif" style="position: absolute; z-index:8000; left: 36.5%; top:40%; margin: 0px auto;"/>
		</div>
	</div>
	
	
<section class="wrap">

	<div class="grayLayout">
	
		<!-- 버튼 리스트 -->
		<article class="btnListing">
			<a href="javascript:mspReport.zoomIn();">확대</a>
			<a href="javascript:mspReport.zoomOut();">축소</a>
			<a href="javascript:mspReport.doConvert();" class="blue">PDF로 저장하기</a>
		</article>
		
		
		
		
		<article class="conFrame" id="frame3">
		
			<!-- 제목 -->
			<header>
				<div>
					<span>폭염 한파 분야 재해영향모델 고도화, 연구 시범 서비스</span>
					<h2 class="report_title">폭염 영향예보 (제 #-##호) <b class="sggNm">[양주시]</b></h2>
				</div>
				<div>
					<p class="report_date">2021년 #월 #일 ##시 ##분 발표</p>
				</div>
			</header>
			
			
			<!-- 내용 -->
			<div class="conPart">
			
				<!-- 종합 -->
				<div class="conInner">
					<div class="title">
						<h3>종합</h3>
						<div>
							<p>범례</p>
							<ul>
								<li class="bg-gre">관심</li>
								<li class="bg-ora">주의</li>
								<li class="bg-red">경고</li>
								<li class="bg-redup">위험</li>
							</ul>
						</div>
					</div> <!-- //title -->
					
					<div class="con total">
						<div class="map" style="height:192px">
							<div id="total_map" style="width:125%; height:125%; -webkit-transform:scale(0.8); -webkit-transform-origin:0% 0%; background:white; display:block; pointer-events: none;"></div>
						</div>
						<div class="table">
							<table id="levelTable">
								<colgroup>
									<col style="width:10%;">
									<col style="width:10%;">
									<col style="width:10%;">
								</colgroup>
								<thead>
									<tr>
										<th></th>
										<th>8월 19일 (목)</th>
										<th>8월 20일 (금)</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>보건</th>
										<td><span class="bg-gre"></span></td>
										<td><span class="bg-red"></span></td>
									</tr>
									<tr>
										<th>산업</th>
										<td><span class="bg-gray"></span></td>
										<td><span class="bg-redup"></span></td>
									</tr>
									<tr>
										<th>농업</th>
										<td><span class="bg-red"></span></td>
										<td><span class="bg-ora"></span></td>
									</tr>
									<tr>
										<th>축산업</th>
										<td><span class="bg-gre"></span></td>
										<td><span class="bg-red"></span></td>
									</tr>
									<tr>
										<th>수산양식</th>
										<td><span class="bg-gre"></span></td>
										<td><span class="bg-red"></span></td>
									</tr>
									<tr>
										<th>교통</th>
										<td><span class="bg-gre"></span></td>
										<td><span class="bg-red"></span></td>
									</tr>
									<tr>
										<th>전력</th>
										<td><span class="bg-gre"></span></td>
										<td><span class="bg-red"></span></td>
									</tr>
									<tr>
										<th>일 최고기온</th>
										<td>33℃</td>
										<td>33℃</td>
									</tr>
								</tbody>
							</table>
						</div> <!-- //table -->
					</div> <!-- 제목 아래 내용 -->
				</div> <!-- //종합 -->
				
				
				
				
				<!-- 보건 -->
				<div class="conInner">
					<div class="title">
						<h3>보건</h3>
					</div> <!-- //title -->
					
					<div class="con health">
					
						<!-- 보건 부문 상세노출 -->
						<div class="table">
							<table>
								<thead>
									<tr>
										<th>보건 부문 상세노출</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="height">		
											<div style="height:130px; position:relative;">
												<div id="health_map" style="width:125%; height:125%; -webkit-transform:scale(0.8); -webkit-transform-origin:0% 0%; background:white; display:block; pointer-events: none;"></div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						
						<div>
							<!-- 보건 위험지역 행정구역 -->
	<!-- 						<div class="table area2">
								<table>
									<thead>
										<tr>
											<th>보건 위험지역 행정구역</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="height">
												<ul class="dot-list">
													<li>위험에 해당하는 읍면동 단위의 행정구역</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div> -->
							
							<!-- 유사피해사례 -->
							<div class="table ex">
								<table class="height" id="damageTable">
									<thead>
										<tr>
											<th colspan="4">유사피해사례</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>일자</th>
											<td>2016.08.12</td>
											<td>2016.08.06</td>
											<td>2016.08.05</td>
										</tr>
										<tr>
											<th>온열질환<br>사망자</th>
											<td>0 (명)</td>
											<td>0 (명)</td>
											<td>0 (명)</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
					</div> <!-- 제목 아래 내용 -->
				</div> <!-- //보건 -->
			
				
				<!-- 보건종합 -->
				<div class="conInner healthTotal">
					
					
					<table id="health_nTable">
						<colgroup>
							<col style="width:18%;">
							<col style="width:41%;">
							<col style="width:41%;">
						</colgroup>
						<thead>
							<tr>
								<th class="bg-none"></th>
								<th>영향정보</th>
								<th>대응방안</th>
							</tr>
						</thead>
						<tbody>
							<!-- 일반인 -->
							<tr class="response ordinary">
								<th>
									<i><img src="../images/icon/R2-person1.svg"></i>
									<p>일반인</p>
								</th>
								<td>
									<ul class="dot-list">
										<li>경증 온열질환이 발생할 위험이 있음(열부종, 열발진, 다한(땀이 많이 남), 체온 증가)</li>
									</ul>
								</td>
								<td>
									<ul class="dot-list">
										<li>주변 고령자에게 수시로 연락한다.</li>
										<li>건강상태에 주의를 기울이며, 충분한 휴식을 취한다.</li>
									</ul>
								</td>
							</tr>
							
							<!-- 고령자 -->
							<tr class="response age65">
								<th>
									<i><img src="../images/icon/R2-person2.svg"></i>
									<p>고령자</p>
								</th>
								<td>
									<ul class="dot-list">
										<li>경증 온열질환이 발생할 위험이 있음(열부종, 열발진, 다한(땀이 많이 남), 체온 증가)</li>
									</ul>
								</td>
								<td>
									<ul class="dot-list">
										<li>건강상태에 주의를 기울이며, 충분한 휴식을 취한다.</li>
										<li>실내에 머물 경우 냉방장치를 가동하여 적정 온습도를 유지한다.</li>
									</ul>
								</td>
							</tr>
							
							<!-- 야외노동자 -->
							<tr class="response outdoor">
								<th>
									<i><img src="../images/icon/R2-person3.svg"></i>
									<p>야외노동자</p>
								</th>
								<td>
									<ul class="dot-list">
										<li>경증 온열질환이 발생할 위험이 있음(열부종, 열발진, 일과성 열피로, 다한(땀이 많이 남), 체온 증가, 근육통, 열상화상)</li>
									</ul>
								</td>
								<td>
									-
								</td>
							</tr>
							
							<!-- 1인가구 -->
							<tr class="response single">
								<th>
									<i><img src="../images/icon/R2-person4.svg"></i>
									<p>1인가구</p>
								</th>
								<td>
									<ul class="dot-list">
										<li>경증 온열질환이 발생할 위험이 있음(열부종, 열발진, 다한(땀이 많이 남), 체온 증가)</li>
									</ul>
								</td>
								<td>
									<ul class="dot-list">
										<li>땀이 많이 나는 경우, 충분한 물과 적당량의 염분을 섭취한다.</li>
										<li>실외 활동을 자제한다.</li>
									</ul>
								</td>
							</tr>
							
							<!-- 만성질환자 -->
							<tr class="response chdb">
								<th>
									<i><img src="../images/icon/R2-person5.svg"></i>
									<p>만성질환자</p>
								</th>
								<td>
									<ul class="dot-list">
										<li>경증 온열질환이 발생할 위험이 있음(열부종, 열발진, 다한(땀이 많이 남), 체온 증가)</li>
									</ul>
								</td>
								<td>
									<ul class="dot-list">
										<li>땀이 많이 나는 경우, 충분한 물과 적당량의 염분을 섭취한다.</li>
										<li>실외 활동을 자제한다.</li>
									</ul>
								</td>
							</tr>
							
							<!-- 저소득층 -->
							<tr class="response lowincome">
								<th>
									<i><img src="../images/icon/R2-person6.svg"></i>
									<p>저소득층</p>
								</th>
								<td>
									<ul class="dot-list">
										<li>경증 온열질환이 발생할 위험이 있음(열부종, 열발진, 다한(땀이 많이 남), 체온 증가)</li>
									</ul>
								</td>
								<td>
									<ul class="dot-list">
										<li>땀이 많이 나는 경우, 충분한 물과 적당량의 염분을 섭취한다.</li>
										<li>실내에 머물 경우 냉방장치를 가동하여 적정 온습도를 유지한다.</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
						
				</div> <!-- //conInner -->
				
				
				
			</div> <!-- //conPart -->
			
		</article> <!-- //conFrame **페이퍼끝 -->
		
		
				
		<article class="conFrame layoutTopTable" id="frame4">
		
			<!-- 제목 -->
			<header>
				<div>
					<span>폭염 한파 분야 재해영향모델 고도화, 연구 시범 서비스</span>
					<h2 class="report_title">폭염 영향예보 (제 #-##호) <b class="sggNm">[양주시]</b></h2>
				</div>
				<div>
					<p class="report_date">2021년 #월 #일 ##시 ##분 발표</p>
				</div>
			</header>
			
			
			<!-- 내용 -->
			<div class="conPart">
			
				<!-- 부문별상세예보현황,유사피해사례 -->
				<div class="conInner">
				
					<div class="con top">
					
						<!-- 부문별상세예보현황 -->
						<div class="table">
							<table>
								<thead>
									<tr>
										<th>부문별상세예보현황</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="fix">
										 
										 
											<table class="innerTable part-detail-state" id="categoryTable">
												<colgroup>
													<col style="width:20%;">
													<col style="width:20%;">
													<col style="width:20%;">
													<col style="width:20%;">
													<col style="width:20%;">
													<col style="width:20%;">
												</colgroup>
												
												<thead>
													<tr>
														<th class="bg-none"></th>
														<th class="bg-gre">관심</th>
														<th class="bg-ora">주의</th>
														<th class="bg-red">경고</th>
														<th class="bg-redup">위험</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>산업</th>
														<td>-</td>
														<td>-</td>
														<td>-</td>
														<td>제조업, 건설업</td>
													</tr>
													<tr>
														<th>농업</th>
														<td>인삼</td>
														<td>사과</td>
														<td>복숭아, 고추</td>
														<td>배, 포도, 수박</td>
													</tr>
													<tr>
														<th>축산업</th>
														<td>-</td>
														<td>-</td>
														<td>소, 돼지, 닭</td>
														<td>-</td>
													</tr>
													<tr>
														<th>수산양식</th>
														<td>-</td>
														<td>-</td>
														<td>종합</td>
														<td>-</td>
													</tr>
													<tr>
														<th>전력</th>
														<td>-</td>
														<td>-</td>
														<td>-</td>
														<td>종합</td>
													</tr>
												</tbody>
												
											</table>
										 
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<!-- 유사피해사례 -->
						<div class="table">
							<table>
								<thead>
									<tr>
										<th>유사피해사례</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="fix">
										
											<table class="innerTable ex" id="damageTable2">
												<colgroup>
													<col style="width:20%;">
													<col style="width:20%;">
													<col style="width:20%;">
													<col style="width:20%;">
													<col style="width:20%;">
												</colgroup>
												
												<thead>
													<tr>
														<th>일자</th>
														<th>가금류</th>
														<th>돼지</th>
														<th>양식어류</th>
														<th>화재</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>2016.08.12</th>
														<td>0 (마리)</td>
														<td>0 (마리)</td>
														<td>-</td>
														<td>0 (건)</td>
													</tr>
													<tr>
														<th>2016.08.12</th>
														<td>0 (마리)</td>
														<td>0 (마리)</td>
														<td>-</td>
														<td>0 (건)</td>
													</tr>
													<tr>
														<th>2016.08.12</th>
														<td>0 (마리)</td>
														<td>0 (마리)</td>
														<td>-</td>
														<td>0 (건)</td>
													</tr>
												</tbody>
											</table>
											
											<!-- 기상조건 -->
											<table class="innerTable weather">
												<colgroup>
													<col style="width:16.6666%;">
													<col style="width:16.6666%;">
													<col style="width:16.6666%;">
													<col style="width:16.6666%;">
													<col style="width:16.6666%;">
													<col style="width:16.6666%;">
												</colgroup>
												
												<thead>
													<tr>
														<th colspan="6"><span class="icon">기상조건</span></th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>일<br>최고기온</td>
														<td>풍속</td>
														<td>폭염<br>지속일수</td>
														<td>평균<br>습도</td>
														<td>강수량</td>
														<td>열대야<br>지속일수</td>
													</tr>
													<tr>
														<td>34.1</td>
														<td>0.9</td>
														<td>1</td>
														<td>79.6</td>
														<td>2.3</td>
														<td>0</td>
													</tr>
												</tbody>
											</table>
											
										</td>
									</tr>
								</tbody>
							</table>
						</div> <!-- //유사피해사례 -->
						
						
					</div> <!-- //제목 아래 내용 -->
					
				</div> <!-- //conInner -->
				
				<!-- 상세 항목별 영향 정보 -->
				<div class="conInner healthTotal">
					
					<div class="title">
						<h3 class="type2">상세 항목별 영향 정보</h3>
					</div> <!-- //title -->
						
					
					<div class="con">
						<table id="cateDetailTable1">
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
							<tbody>
								<!-- 인삼 -->
								<tr>
									<th>
										<i><img src="../images/icon/i-food1.svg"></i>
										<p>인삼</p>
									</th>
									<td>
										<ul class="dot-list">
											<li>생육장애가 발생할 위험이 있음(과실 비대 불량, 병해충(진딧물, 응애)으로 인한 영양분 결핍 발생)</li>
										</ul>
									</td>
								</tr>
								
								<!-- 사과 -->
								<tr>
									<th>
										<i><img src="../images/icon/i-food2.svg"></i>
										<p>사과</p>
									</th>
									<td>
										<ul class="dot-list">
											<li>생육장애가 발생할 위험이 있음(과실 비대 불량, 병해충(진딧물, 응애)으로 인한 영양분 결핍 발생)</li>
										</ul>
									</td>
								</tr>
								
								<!-- 복숭아 -->
								<tr>
									<th>
										<i><img src="../images/icon/i-food3.svg"></i>
										<p>복숭아</p>
									</th>
									<td>
										<ul class="dot-list">
											<li>생육장애가 발생할 위험이 있음(과실 비대 불량, 병해충(진딧물, 응애)으로 인한 영양분 결핍 발생)</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
						
						<table id="cateDetailTable2">
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
							<tbody>
								<!-- 소 -->
								<tr>
									<th>
										<i><img src="../images/icon/i-ani1.svg"></i>
										<p>소</p>
									</th>
									<td>
										<ul class="dot-list">
											<li>고온 스트레스가 발생할 위험이 있음(면역력 저하, 식중독 발생 위험 증가, 가축 전염병 위험 증가)</li>
										</ul>
									</td>
								</tr>
								
								<!-- 돼지 -->
								<tr>
									<th>
										<i><img src="../images/icon/i-ani2.svg"></i>
										<p>돼지</p>
									</th>
									<td>
										<ul class="dot-list">
											<li>고온 스트레스가 발생할 위험이 있음(면역력 저하, 식중독 발생 위험 증가, 가축 전염병 위험 증가)</li>
										</ul>
									</td>
								</tr>
								
								<!-- 닭 -->
								<tr>
									<th>
										<i><img src="../images/icon/i-ani3.svg"></i>
										<p>닭</p>
									</th>
									<td>
										<ul class="dot-list">
											<li>고온 스트레스가 발생할 위험이 높음(대사성 질병, 난각질 저하)</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div> <!-- //con -->
				</div> <!-- //conInner -->
				
				
				
				
				<!-- 부분별 상세 노출정보 -->
				<div class="conInner exposure-infor">
				
					<div class="title">
						<h3 class="type2">부문별 상세 노출정보</h3>
					</div> <!-- //title -->
				
					<div class="con top">
					
						<!-- 농업 -->
					 	<div class="table">
							<table>
								<thead>
									<tr>
										<th>농업</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="fix">
										 
											<div class="map" style="background:beige;">
												<div id="agriculture_map" style="width:125%; height:125%; -webkit-transform:scale(0.8); -webkit-transform-origin:0% 0%; background:white; display:block; pointer-events: none;"></div>
											</div>
										<!--	<article>
												<ul class="dot-list">
													<li>위험에 해당하는 읍면동 단위의 행정구역</li>
												</ul>
											</article>  -->
										</td>
									</tr>
								</tbody>
							</table>
						</div> <!-- //.table -->
						
						<!-- 축산 -->
						<div class="table">
							<table>
								<thead>
									<tr>
										<th>축산</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="fix">
										 
											<div class="map" style="background:beige;">
												<div id="livestock_map" style="width:125%; height:125%; -webkit-transform:scale(0.8); -webkit-transform-origin:0% 0%; background:white; display:block; pointer-events: none;"></div>
											</div>
										<!--	<article>
												<ul class="dot-list">
													<li>위험에 해당하는 읍면동 단위의 행정구역</li>
												</ul>
											</article>  -->
											
										</td>
									</tr>
								</tbody>
							</table>
						</div> <!-- //.table -->
						
						<!-- 전력 -->
						<div class="table">
							<table>
								<thead>
									<tr>
										<th>전력</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="fix">
										 
											<div class="map" style="background:beige;">
												<div id="elect_map" style="width:125%; height:125%; -webkit-transform:scale(0.8); -webkit-transform-origin:0% 0%; background:white; display:block; pointer-events: none;"></div>
											</div>
										<!-- 	<article>
												<ul class="dot-list">
													<li>위험에 해당하는 읍면동 단위의 행정구역</li>
												</ul>
											</article>  -->
											
										</td>
									</tr>
								</tbody>
							</table>
						</div> <!-- //.table -->
						
						
						
					</div> <!-- //제목 아래 내용 -->
					
				</div> <!-- //conInner -->
				
				
				
				
			</div> <!-- //conPart -->
			
		</article> <!-- //conFrame **페이퍼끝 -->
		
	</div> <!-- //grayLayout -->


	

</section><!-- //contents-wrap -->
	
	
</body>
</html>