package
{
	import away3dlite.templates.BasicTemplate;
	
	import com.greensock.TweenLite;
	import com.sleepydesign.utils.FileUtil;
	import com.sleepydesign.utils.LoaderUtil;
	import com.sleepydesign.utils.ObjectUtil;
	import com.sleepydesign.utils.SystemUtil;
	
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.media.Camera;
	import flash.media.Video;
	import flash.net.URLVariables;
	import flash.utils.*;
	
	import org.libspark.flartoolkit.core.FLARCode;
	import org.libspark.flartoolkit.core.param.FLARParam;
	import org.libspark.flartoolkit.core.raster.rgb.FLARRgbRaster_BitmapData;
	import org.libspark.flartoolkit.core.transmat.FLARTransMatResult;
	import org.libspark.flartoolkit.detector.FLARMultiMarkerDetector;
	import org.libspark.flartoolkit.support.sandy.FLARBaseNode;
	import org.libspark.flartoolkit.support.sandy.FLARCamera3D;
	
	import sandy.core.Scene3D;
	import sandy.core.data.Point3D;
	import sandy.core.data.Polygon;
	import sandy.core.scenegraph.Group;
	import sandy.materials.attributes.LineAttributes;
	import sandy.primitive.Plane3D;


	/**
	 * QRCodeReader + FLARToolKit PoC (libspark rev. 3199, sandy rev. 1138)
	 * @license GPLv2
	 * @author makc
	 *
	 * @see http://www.openqrcode.com/
	 *
	 * [Step #1]
	 * 1.1 Loading Effect
	 * 1.2 Server 	--> Session[UserID] --> Flash
	 * 1.3 User 	--> Image[QR, AR] 	--> Model ID, Projection Matrix
	 * 1.4 Wait for User playing/proceed to next step
	 *
	 * [Step #2]
	 * 2.1 Loading Effect
	 * 2.2 Flash 	--> Encypt[Time, UserID, ModelID]	--> Server
	 * 2.3 Flash 	<-- Model[Mesh, Texture, Animation]	<-- Server
	 * 2.4 Spawn Effect
	 *
	 * [Step #3]
	 * 3.1 Wait for user input for next step
	 * 3.2 Flip Effect to next ingradient
	 * 3.3 Repeat step 1.2 --> 3.2 until finish condition?
	 *
	 * [Step #4]
	 * 4.1 Loading Effect
	 * 4.2 Flash 	--> Encypt[Time, UserID, ModelID, ModelID]	--> Server
	 * 4.3 Flash 	<-- Model[Mesh, Texture, Animation]			<-- Server
	 * 4.4 Spawn Effect
	 *
	 */
	[SWF(backgroundColor="0x333333", frameRate="30", width="640", height="480")]
	public class main extends BasicTemplate
	{
		// screen
		private const SCREEN_WIDTH:int = 640;
		private const SCREEN_HEIGHT:int = 480;

		// capture size
		private const CANVAS_WIDTH:int = 320;
		private const CANVAS_HEIGHT:int = 240;

		// 3.2cm = 90px
		private const QR_SIZE:int = 90;

		// root
		private var base:Sprite;
		private var cameraContainer:Sprite;

		// fake
		private var container:Sprite;
		private var paper:Sprite;
		private var _paperBitmap:Bitmap;
		
		[Embed(source='../bin/assets/A2A916.png')]
		private var ImageData:Class;
		
		// FLAR
		private var A:FLARResult;
		private var B:FLARResult;
		private var C:FLARResult;

		// Camera
		private var _webcam:Camera;
		private var _video:Video;
		private var _cameraBitmap:Bitmap;
		private var isCam:Boolean = false;
		
		// FLAR
		[Embed(source='flar.dat',mimeType='application/octet-stream')]
		private var CameraData:Class;

		[Embed(source='flar.pat',mimeType='application/octet-stream')]
		private var MarkerData:Class;
		
		private var aggregate:FLARTransMatResult
		private const size:int = 100;
		private var canvas:BitmapData;
		private var param:FLARParam;
		private var code:FLARCode;
		private var raster:FLARRgbRaster_BitmapData;
		private var detector:FLARMultiMarkerDetector;
		
		// sandy
		private var sandyScene:Scene3D;
		private var stuff:Vector.<FLARBaseNode>;
		
		// effect
		private var _modelViewer:ModelViewer;
		
		// state
		private var _isQRDecoded:Boolean = false;

		public function main()
		{
			base = new Sprite();
			addChild(base);
			base.x = 160;
			base.y = 120;

			// no cam test
			container = new Sprite();
			base.addChild(container);

			// fake code
			paper = new Sprite();
			container.addChild(paper);

			paper.x = CANVAS_WIDTH / 2 - QR_SIZE / 2;
			paper.y = CANVAS_HEIGHT / 2 - QR_SIZE / 2;

			// cam test
			cameraContainer = new Sprite();
			base.addChild(cameraContainer);
		}

		override protected function onInit():void
		{
			view.x = SCREEN_WIDTH/2;
			view.y = SCREEN_HEIGHT/2;
			view.setSize(SCREEN_WIDTH, SCREEN_HEIGHT);
			
			view.buttonMode = false;
			view.mouseEnabled = false;
			view.mouseEnabled3D = false;

			camera.zoom = 6;
			camera.focus = 100;

			_modelViewer = new ModelViewer(scene);

			initUser();

			initARQR();
		}

		private function initUser():void
		{
			// get user data
			LoaderUtil.loadVars("serverside/userData.php", onGetUserData);
		}

		private function onGetUserData(event:Event):void
		{
			// wait for complete
			if(event.type!="complete")return;

			var _userData:URLVariables = URLVariables(event.target["data"]);
			ObjectUtil.print(_userData);
		}

		private var _QRReader:QRReader;
		private var _stuff:FLARBaseNode;
		private var _FLARCamera3D:FLARCamera3D;

		private function initARQR():void
		{
			// set up FLARToolKit
			canvas = new BitmapData(CANVAS_WIDTH, CANVAS_HEIGHT, false, 0);
			param = new FLARParam;
			param.loadARParam(new CameraData);
			param.changeScreenSize(CANVAS_WIDTH, CANVAS_HEIGHT);
			code = new FLARCode(16, 16, 70, 70);
			code.loadARPatt(new MarkerData);
			raster = new FLARRgbRaster_BitmapData(canvas);
			detector = new FLARMultiMarkerDetector(param, [code], [size], 1);
			detector.setContinueMode(false);

			// set up sandy
			_FLARCamera3D = new FLARCamera3D(param, 0.001);
			sandyScene = new Scene3D("scene", Sprite(addChild(new Sprite)), _FLARCamera3D, new Group("root"));
			sandyScene.container.visible = false;

			stuff = new Vector.<FLARBaseNode>;
			for (var i:int = 0; i < 4; i++)
			{
				stuff[i] = new FLARBaseNode;
				var p:Plane3D = new Plane3D("plane" + i);
				LineAttributes(p.appearance.frontMaterial.attributes.attributes[0]).color = (i < 3) ? 0xFF00 : 0xFFFF00;
				p.rotateX = 180;
				stuff[i].addChild(p);
				sandyScene.root.addChild(stuff[i]);
			}

			_stuff = stuff[3];

			// set up lite
			camera.projection.fieldOfView = _FLARCamera3D.fov;
			camera.projection.focalLength = _FLARCamera3D.focalLength;

			// set up QRCodeReader
			_QRReader = new QRReader(new BitmapData(CANVAS_HEIGHT, CANVAS_HEIGHT, false, 0));
			_QRReader.addEventListener(Event.COMPLETE, onQRCodeComplete);

			// add test image in the background
			setBitmap(Bitmap(new ImageData));

			// browse
			SystemUtil.addContext(this, "Open QRCode", function ():void{FileUtil.openImage(onImageReady)});
			SystemUtil.addContext(this, "Toggle Camera", onToggleSource);
			SystemUtil.addContext(this, "Reset Code", function ():void{reset()});
			SystemUtil.addContext(this, "Open Model", function ():void{FileUtil.openXML(onOpenModel)});
			SystemUtil.addContext(this, "Open Texture", function ():void{FileUtil.openImage(onTextureReady)});

			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);

			//addEventListener(Event.ENTER_FRAME, onRun);
		}
		
		private function onTextureReady(event:Event):void
		{
			trace(" ^ onTextureReady : " + event);
			if(event.type == Event.COMPLETE)
				_modelViewer.setTexture(event.target.content);
		}
		
		private function onOpenModel(event:Event):void
		{
			trace(" ^ onOpenModel");
			if(event.type == Event.COMPLETE)
				_modelViewer.parse(event["data"]);
		}
		
		// got code
		private function onQRCodeComplete(event:Event):void
		{
			trace(" ^ onQRCodeComplete");
			
			if(QRReader.result=="A2A916")
			{
				_modelViewer.load("assets/J7.dae");
			}else{
				_modelViewer.load("assets/G2.dae");
			}
			
			_isQRDecoded = true;
			// debug
			//title = "QR : " + QRReader.result + " | ";
		}

		private function onToggleSource(event:ContextMenuEvent):void
		{
			isCam = !isCam;

			if(!isCam)
			{
				container.visible = true;
				cameraContainer.visible = false;
			}else{
				container.visible = false;
				cameraContainer.visible = true;

				if(!_webcam)
					_webcam = Camera.getCamera();

				if (_webcam) 
				{
					_webcam.setMode(CANVAS_WIDTH, CANVAS_HEIGHT, 30);
					_video = new Video(CANVAS_WIDTH, CANVAS_HEIGHT);
					_video.attachCamera(_webcam);
					_cameraBitmap = new Bitmap(new BitmapData(CANVAS_WIDTH, CANVAS_HEIGHT, false, 0), PixelSnapping.AUTO, true);
					cameraContainer.addChild(_cameraBitmap);
				}
			}

			reset();
		}
		
		private var onDraging:Boolean;
		private var _oldMousePoint:Point;
		
		private function onMouseDown(event:MouseEvent):void
		{
			//onDraging = true;
			//_oldMousePoint = new Point(view.mouseX, view.mouseX);
			
			TweenLite.to(paper, .5, {
					rotationX:60*Math.random()-60*Math.random(),
					rotationY:60*Math.random()-60*Math.random(),
					rotationZ:60*Math.random()-60*Math.random()
			});
		}

		private function onMouseMove(e:MouseEvent):void
		{
			/*
			if (onDraging)
			{
				paper.rotationY += (_oldMousePoint.x - view.mouseX)/100;
				paper.rotationX += (_oldMousePoint.y - view.mouseY)/100;
			}
			*/
		}
		
		private function onMouseUp(e:MouseEvent):void
		{
			//onDraging = false;
		}

		override protected function onPreRender():void
		{
			if(isCam && _cameraBitmap && _video)
				_cameraBitmap.bitmapData.draw(_video);

			//sandyScene.render();

			process();

			if(_isQRDecoded)
			{
				view.visible = true;
				_modelViewer.updateAnchor();
				_modelViewer.draw();
				stage.quality = "medium";
			}else{
				view.visible = false;
				stage.quality = "low";
			}
		}

		private function onImageReady(event:Event):void
		{
			trace(" ^ onImageReady : " + event);

			if(event.type == Event.COMPLETE)
			{
				if(_paperBitmap)
					paper.removeChild(_paperBitmap);

				setBitmap(event.target.content);
			}
		}

		private function reset():void
		{
			_isQRDecoded = false;
			_QRReader.reset();
			_modelViewer.reset();
		}
		
		private function setBitmap(bitmap:Bitmap):void
		{
			trace(" ! setBitmap");
			
			reset();
			
			title = "reset";

			_paperBitmap = bitmap;
			_paperBitmap.width = _paperBitmap.height = QR_SIZE;

			paper.addChild(_paperBitmap);

			// show time
			process();
		}

		private function process():void
		{
			// get image into canvas
			canvas.fillRect(canvas.rect, 0);

			if(!isCam)
			{
				canvas.draw(container);
			}else{
				canvas.draw(cameraContainer);
			}

			// flarkit pass
			var n:int = detector.detectMarkerLite(raster, 128);
			if (n > 2)
			{
				// we want 3 best matches
				var k:int, results:Array = [];
				for (k = 0; k < n; k++)
				{
					var r:FLARResult = new FLARResult;
					r.confidence = detector.getConfidence(k);
					detector.getTransmationMatrix(k, r.result);
					r.square = detector.getResult(k).square;
					results.push(r);
				}

				results.sortOn("confidence", Array.DESCENDING | Array.NUMERIC);
				results.splice(3, n - 3);

				// sort them into right triangle
				for (k = 0; k < 3; k++)
				{
					A = FLARResult(results[(2 + k) % 3]);
					B = FLARResult(results[(3 + k) % 3]);
					C = FLARResult(results[(4 + k) % 3]);

					// I will use sandy math but not coordinates here (feel free to inline)
					var BA:Point3D = new Point3D((B.result.m03 - A.result.m03), (B.result.m13 - A.result.m13), (B.result.m23 - A.result.m23));
					var BC:Point3D = new Point3D((B.result.m03 - C.result.m03), (B.result.m13 - C.result.m13), (B.result.m23 - C.result.m23));
					// average distance is only meaningful for 1 vertex (you can compute it later)
					B.distance = 0.5 * (BA.getNorm() + BC.getNorm());
					BA.normalize();
					BC.normalize();
					B.cosine = Math.abs(BA.dot(BC));
				}

				results.sortOn("cosine", Array.NUMERIC);

				_modelViewer.setAxis(results[0]);

				// display intermediate results
				for (k = 0; k < 3; k++)
					stuff[k].setTransformMatrix(FLARResult(results[k]).result);

				// aggregate 3D results (this assumes all markers are oriented same way)
				A = FLARResult(results[2]);
				B = FLARResult(results[0]);
				C = FLARResult(results[1]);

				var scale3:Number = (1 + B.distance / size) / 3;
				aggregate = new FLARTransMatResult;
				aggregate.m03 = (A.result.m03 + C.result.m03) * 0.5;
				aggregate.m13 = (A.result.m13 + C.result.m13) * 0.5;
				aggregate.m23 = (A.result.m23 + C.result.m23) * 0.5;
				aggregate.m00 = (A.result.m00 + B.result.m00 + C.result.m00) * scale3;
				aggregate.m10 = (A.result.m10 + B.result.m10 + C.result.m10) * scale3;
				aggregate.m20 = (A.result.m20 + B.result.m20 + C.result.m20) * scale3;
				aggregate.m01 = (A.result.m01 + B.result.m01 + C.result.m01) * scale3;
				aggregate.m11 = (A.result.m11 + B.result.m11 + C.result.m11) * scale3;
				aggregate.m21 = (A.result.m21 + B.result.m21 + C.result.m21) * scale3;
				aggregate.m02 = (A.result.m02 + B.result.m02 + C.result.m02) * scale3;
				aggregate.m12 = (A.result.m12 + B.result.m12 + C.result.m12) * scale3;
				aggregate.m22 = (A.result.m22 + B.result.m22 + C.result.m22) * scale3;

				// debug plane 
				stuff[3].setTransformMatrix(aggregate);

				if(!_isQRDecoded)
				{
					//trace(" * QR");
					
					// homography (I shall use 3D engine math - you can mess with FLARParam if you want to)
					var plane3D:Plane3D = Plane3D(stuff[3].children[0]);

					// since 3D fit is not perfect, we shall grab some extra area
					plane3D.scaleX = plane3D.scaleY = plane3D.scaleZ = 0.05;

					// I call render() to init sandy matrices - you can do matrix math by hand and
					// not render a thing, or use better engine :-p~
					sandyScene.render();

					var face1:Polygon = Polygon(plane3D.aPolygons[0]);
					sandyScene.camera.projectArray(face1.vertices);
					var face2:Polygon = Polygon(plane3D.aPolygons[1]);
					sandyScene.camera.projectArray(face2.vertices);

					var p0:Point = new Point(face1.b.sx, face1.b.sy);
					var p1:Point = new Point(face1.a.sx, face1.a.sy);
					var p2:Point = new Point(face1.c.sx, face1.c.sy);
					var p3:Point = new Point(face2.b.sx, face2.b.sy);

					plane3D.scaleX = plane3D.scaleY = plane3D.scaleZ = 1.0;

					_QRReader.homography.fillRect(_QRReader.homography.rect, 0);
					_QRReader.homography.applyFilter(canvas, canvas.rect, canvas.rect.topLeft, new HomographyTransformFilter(CANVAS_HEIGHT, CANVAS_HEIGHT, p0, p1, p2, p3));

					// now read QR code
					_QRReader.run();
					
					title = "QR : processing...  | Marker : "+n+" | ";
				}else{
					title = "QR : " + QRReader.result + " | Marker : "+n+" | ";
				}
			}else{
				//trace("new one?")
				if(QRReader.result!="")
				{
					title = "QR : " + QRReader.result + " | Marker : "+n+" | ";
				}else{
					title = "QR : losting...     | Marker : "+n+" | ";
				}
			}

			_modelViewer.setRefererPoint
			(
				new Vector3D(stuff[0].x, stuff[0].y, stuff[0].z),
				new Vector3D(stuff[1].x, stuff[1].y, stuff[1].z),
				new Vector3D(stuff[2].x, stuff[2].y, stuff[2].z)
			);
		}
	}
}