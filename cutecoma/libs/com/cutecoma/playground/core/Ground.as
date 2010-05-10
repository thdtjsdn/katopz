﻿package com.cutecoma.playground.core
{
	import away3dlite.core.IDestroyable;
	import away3dlite.materials.BitmapMaterial;
	import away3dlite.primitives.Plane;
	import away3dlite.primitives.Sphere;
	
	import com.cutecoma.game.core.IEngine3D;
	import com.cutecoma.playground.data.MapData;
	
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;

	public class Ground implements IDestroyable
	{
		/** @private */
		protected var _isDestroyed:Boolean;
		
		private var _engine3D:IEngine3D;
		
		private var _plane:Plane;

		// tile
		private var _debug:Boolean = false;

		public function Ground(engine3D:IEngine3D)
		{
			_engine3D = engine3D;
			
		/*
		   
		   plane3D = new Plane3D(new Number3D(0, 1, 0), Number3D.ZERO);

		   if(mouseEnable)
		   engine3D.viewport.stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseIsDown);

		   this.debug = debug;
		 */
		}

		//____________________________________________________________ CLICK

		private function onMouseIsDown(event:MouseEvent):void
		{
		/*
		   //if(!(event.target is Stage))return;
		   var camera:Camera3D = engine3D.camera;
		   var ray:Number3D = Number3D.add(camera.unproject(engine3D.viewport.containerSprite.mouseX, engine3D.viewport.containerSprite.mouseY), camera.position);

		   var cameraVertex3D	:Vertex3D = new Vertex3D(camera.x, camera.y, camera.z);
		   var rayVertex3D		:Vertex3D = new Vertex3D(ray.x, ray.y, ray.z);
		   var intersectPoint	:Vertex3D = plane3D.getIntersectionLine(cameraVertex3D, rayVertex3D);

		   dispatchEvent(new SDMouseEvent(SDMouseEvent.MOUSE_DOWN, {position:Position.parse(intersectPoint)}, event));
		 */
		}

		public function update(mapData:MapData):void
		{
			var w:uint = mapData.bitmapData.width;
			var h:uint = mapData.bitmapData.height;

			//_tileMaterials = new MaterialsList();
			var _getPixel:Function = mapData.bitmapData.getPixel;
			for (var k:uint = 0; k < w * h; k++)
			{
				var i:int = int(k % w);
				var j:int = int(k / w);
				var color:Number = _getPixel(i, j);

					//if(color!=0x000000)
					//var _wireColorMaterial:WireColorMaterial = new WireColorMaterial(color, .5, true);
					//_wireColorMaterial.name = i + "_" + j;
					//_tileMaterials.addMaterial(_wireColorMaterial);
			}
			
			_engine3D.scene3D.addChild(_plane = new Plane(new BitmapMaterial(mapData.bitmapData), w*Map.factorX, h*Map.factorZ));
			_plane.bothsides = true;
			_plane.rotationX = 45;
			
		/*
		   if(_tileInstance)
		   _tileInstance.destroy();

		   _tileInstance = new TilePlane(_tileMaterials, w*Map.factorX, h*Map.factorZ, w,h);
		   //_tileInstance.useOwnContainer = true;
		   //_tileInstance.blendMode = BlendMode.MULTIPLY;
		   engine3D.addChild(_tileInstance);

		   _tileInstance.removeEventListener(InteractiveScene3DEvent.OBJECT_CLICK, onClick);
		   _tileInstance.addEventListener(InteractiveScene3DEvent.OBJECT_CLICK, onClick);

		   _tileInstance.removeEventListener(InteractiveScene3DEvent.OBJECT_MOVE, onMouseMove);
		   _tileInstance.addEventListener(InteractiveScene3DEvent.OBJECT_MOVE, onMouseMove);
		 */
		}

		/*
		   public function onClick(event:InteractiveScene3DEvent):void
		   {
		   var _x_y:Array = event.renderHitData.material.name.split("_");
		   dispatchEvent(new GroundEvent(GroundEvent.MOUSE_DOWN, _x_y[0], _x_y[1], event.renderHitData.material.fillColor));
		   }

		   public function onMouseMove(event:InteractiveScene3DEvent):void
		   {
		   var _x_y:Array = event.renderHitData.material.name.split("_");
		   dispatchEvent(new GroundEvent(GroundEvent.MOUSE_MOVE, _x_y[0], _x_y[1], event.renderHitData.material.fillColor));
		   }
		 */
		
		public function get destroyed():Boolean
		{
			return _isDestroyed;
		}
		
		public function destroy():void
		{
			_engine3D = null;
			
			// event
		/*
		   if(_tileInstance)
		   {
		   _tileInstance.removeEventListener(InteractiveScene3DEvent.OBJECT_CLICK, onClick);
		   _tileInstance.removeEventListener(InteractiveScene3DEvent.OBJECT_MOVE, onMouseMove);
		   }

		   // self
		   if(_tileMaterials)
		   {
		   _tileMaterials.destroy();
		   _tileMaterials = null;
		   }

		   // parent
		   if(_tileInstance)
		   engine3D.removeChild(_tileInstance);
		   _tileInstance = null;
		 */
		}
	}
}