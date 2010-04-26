package com.sleepydesign.components
{
	import com.sleepydesign.display.SDSprite;
	import com.sleepydesign.events.TransformEvent;
	
	import flash.display.StageAlign;
	import flash.events.Event;
	
	public class SDComponent extends SDSprite
	{
		protected var _width:Number = SDStyle.SIZE;
		protected var _height:Number = SDStyle.SIZE;
		
		public function SDComponent():void
		{
			
		}
		
		public function draw():void
		{
			/*
			if(stage)
			switch (_align)
			{
				/*case "center":
					var _parent:DisplayObjectContainer = parent;
					_parent.removeChild(this);
					x = (_container.width == 0 ? _container.stage.stageWidth : _container.width) / 2 - width / 2;
					y = (_container.height == 0 ? _container.stage.stageHeight : _container.height) / 2 - height / 2;
					_parent.addChild(this);
					break;*/
				/*case "center-stage":
					x = stage.stageWidth / 2 - width / 2;
					y = stage.stageHeight / 2 - height / 2;
					break;
			}
			*/
			
			// align
			if(stage)
				switch (_align)
				{
					case StageAlign.TOP_LEFT:
						setPosition(0, 0);
						break;
					case StageAlign.TOP_RIGHT:
						setPosition(stage.stageWidth - width, 0);
						break;
					default:
						setPosition(stage.stageWidth / 2 - width / 2, stage.stageHeight / 2 - height / 2);
						break;
				}
		}
		
		protected var _align:String;
		public function get align():String
		{
			return _align;
		}
		
		public function set align(value:String):void
		{
			_align = value;
			
			if(!stage)
			{
				removeEventListener(Event.ADDED_TO_STAGE, onStage);
				addEventListener(Event.ADDED_TO_STAGE, onStage);
				return;
			}else{
				draw();
			}
		}
		
		public function setPosition(x:int, y:int):void
		{
			
		}
		
		private function onStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onStage);
			draw();
		}
	
		public function setSize(w:Number, h:Number):void
		{
			if(_width != w || _height != h)
			{
				_width = w;
				_height = h;
				draw();
				dispatchEvent(new TransformEvent(TransformEvent.RESIZE));
			}
		}

		override public function set width(w:Number):void
		{
			if(_width == int(w))
				return; 
			
			_width = int(w);
			draw();
			dispatchEvent(new TransformEvent(TransformEvent.RESIZE));
		}
		
		override public function get width():Number
		{
			return _width;
		}
		
		override public function set height(h:Number):void
		{
			if(_height == int(h))
				return;
			
			_height = int(h);
			draw();
			dispatchEvent(new TransformEvent(TransformEvent.RESIZE));
		}
		
		override public function get height():Number
		{
			return _height;
		}

		override public function set x(value:Number):void
		{
			if(x == int(value))
				return;
				
			super.x = int(value);
		}

		override public function set y(value:Number):void
		{
			if(y == int(value))
				return;
				
			super.y = int(value);
		}
	}
}