﻿package away3dlite.loaders{    import away3dlite.arcane;    import away3dlite.containers.*;    import away3dlite.core.base.*;    import away3dlite.events.*;    import away3dlite.loaders.data.*;    import away3dlite.loaders.utils.*;        import flash.events.*;    import flash.net.*;    import flash.utils.ByteArray;    			    use namespace arcane;    	 /**	 * Dispatched when the 3d object loader completes a file load successfully.	 * 	 * @eventType away3dlite.events.Loader3DEvent	 */	[Event(name="loadSuccess",type="away3dlite.events.Loader3DEvent")]    				 /**	 * Dispatched when the 3d object loader fails to load a file.	 * 	 * @eventType away3dlite.events.Loader3DEvent	 */	[Event(name="loadError",type="away3dlite.events.Loader3DEvent")]					 /**	 * Dispatched when the 3d object loader progresses in the laoding of a file.	 * 	 * @eventType away3dlite.events.Loader3DEvent	 */	[Event(name="loadProgress",type="away3dlite.events.Loader3DEvent")]		/**	 * Abstract loader class used as a placeholder for loading 3d content	 */    public class Loader3D extends ObjectContainer3D    {           public var parser:AbstractParser;        public var data:Object;                   private var _object:Object3D;        private var _result:Object3D;        private var _bytesLoaded:int;        private var _bytesTotal:int;        private var _IOErrorText:String;        private var _urlloader:URLLoader;        private var _accessByteArrayTextureFromName:Function;        private var _loadQueue:TextureLoadQueue;        private var _loadsuccess:Loader3DEvent;        private var _loaderror:Loader3DEvent;		private var _loadprogress:Loader3DEvent;		        private function registerURL(object:Object3D):void        {        	if (object is ObjectContainer3D) {        		for each (var _child:Object3D in (object as ObjectContainer3D).children)        			registerURL(_child);        	} else if (object is Mesh) {        		(object as Mesh).url = url;        	}        }                private function initTexturePath():void        {            //set texturePath to default if no texturePath detected            if (texturePath == "" && url) {            	var pathArray:Array = url.split("/");				pathArray.pop();				texturePath = (pathArray.length > 0)? pathArray.join("/") + "/" : pathArray.join("/");            }        }                protected function notifySuccess():void        {        	mode = COMPLETE;        				_result = _object;			            _result.transform.matrix3D = transform.matrix3D.clone();            _result.name = name;            //_result.ownCanvas = ownCanvas;            //_result.renderer = renderer;            _result.filters = filters.concat();            _result.blendMode = blendMode;            _result.alpha = alpha;            _result.visible = visible;            _result.mouseEnabled = mouseEnabled;            _result.useHandCursor = useHandCursor;            //_result.pushback = pushback;            //_result.pushfront = pushfront;            //_result.screenZOffset = screenZOffset;            //_result.pivotPoint = pivotPoint;            //_result.extra = (extra is IClonable) ? (extra as IClonable).clone() : extra;			            if (parent != null) {            	parent.addChild(_result);            	parent.removeChild(this);            }						//register url with hierarchy			registerURL(_result);						//dispatch event			if (!_loadsuccess)				_loadsuccess = new Loader3DEvent(Loader3DEvent.LOAD_SUCCESS, this);							dispatchEvent(_loadsuccess);        }                protected function notifyError():void        {			//dispatch event			if (!_loaderror)				_loaderror = new Loader3DEvent(Loader3DEvent.LOAD_ERROR, this);						dispatchEvent(_loaderror);        }                protected function notifyProgress():void        {        	//dispatch event			if (!_loadprogress)				_loadprogress = new Loader3DEvent(Loader3DEvent.LOAD_PROGRESS, this);						dispatchEvent(_loadprogress);        }                /**        * Automatically fired on an geometry error event.        *         * @see away3dlite.loaders.utils.TextureLoadQueue        */        protected function onGeometryError(event:IOErrorEvent):void        {        	_IOErrorText = event.text;        	notifyError();        }                /**        * Automatically fired on a geometry progress event        */        protected function onGeometryProgress(event:ProgressEvent):void        {        	_bytesLoaded = event.bytesLoaded;        	_bytesTotal = event.bytesTotal;        	notifyProgress();        }                /**        * Automatically fired on a geometry complete event        */        protected function onGeometryComplete(event:Event):void        {        	data = _urlloader.data;         	loadTextures(_urlloader.data, parser);        }                /**        * Automatically fired on an parser error event.        *         * @see away3dlite.loaders.utils.TextureLoadQueue        */        protected function onParserError(event:ParserEvent):void        {        	notifyError();        }                /**        * Automatically fired on a parser progress event        */        protected function onParserProgress(event:ParserEvent):void        {        	notifyProgress();        }                /**        * Automatically fired on a parser complete event        */        protected function onParserComplete(event:ParserEvent):void        {        	_object = event.result;        	materialLibrary = _object.materialLibrary;        	        	if (materialLibrary && autoLoadTextures && materialLibrary.loadRequired) {	        	materialLibrary.texturePath = texturePath;	        	mode = LOADING_TEXTURES;	        		        	_loadQueue = new TextureLoadQueue();				for each (var _materialData:MaterialData in materialLibrary)				{					if (_materialData.materialType == MaterialData.TEXTURE_MATERIAL && !_materialData.material)					{						var req:URLRequest = new URLRequest(texturePath + _materialData.textureFileName);						var loader:TextureLoader = new TextureLoader();												_loadQueue.addItem(loader, req, _accessByteArrayTextureFromName);					}				}				_loadQueue.addEventListener(IOErrorEvent.IO_ERROR, onTextureError);				_loadQueue.addEventListener(ProgressEvent.PROGRESS, onTextureProgress);				_loadQueue.addEventListener(Event.COMPLETE, onTextureComplete);				_loadQueue.start();	        } else {	        	notifySuccess();	        }        }                /**        * Automatically fired on an texture error event.        *         * @see away3dlite.loaders.utils.TextureLoadQueue        */        protected function onTextureError(event:IOErrorEvent):void        {        	_IOErrorText = event.text;        	notifyError();        	        	// appear wire material instead        	materialLibrary.texturesLoaded(_loadQueue);        	        	// it success anyway but without material        	notifySuccess();        }                /**        * Automatically fired on a texture progress event        */        protected function onTextureProgress(event:ProgressEvent):void        {        	_bytesLoaded = event.bytesLoaded;        	_bytesTotal = event.bytesTotal;        	notifyProgress();        	dispatchEvent(event);        }                /**        * Automatically fired on a texture complete event        */        protected function onTextureComplete(event:Event):void        {        	materialLibrary.texturesLoaded(_loadQueue);			            notifySuccess();        }                /**        * Constant value string representing the geometry loading mode of the 3d object loader.        */		public const LOADING_GEOMETRY:String = "loading_geometry";                /**        * Constant value string representing the geometry parsing mode of the 3d object loader.        */		public const PARSING_GEOMETRY:String = "parsing_geometry";		        /**        * Constant value string representing the texture loading mode of the 3d object loader.        */		public const LOADING_TEXTURES:String = "loading_textures";		        /**        * Constant value string representing a completed loader mode.        */		public const COMPLETE:String = "complete";		        /**        * Returns the current loading mode of the 3d object loader.        */		public var mode:String;                /**        * Returns the the data container being used by the loaded file.        */        public var containerData:ContainerData;            	/**    	 * Defines a different path for the location of image files used as textures in the model. Defaults to the location of the loaded model file.    	 */        public var texturePath:String = "";            	/**    	 * Controls the automatic loading of image files used as textures in the model. Defaults to true.    	 */        public var autoLoadTextures:Boolean = true;				/**		 * Returns a 3d object relating to the currently visible model.		 * While a file is being loaded, this takes the form of the 3d object loader placeholder.		 * The default placeholder is <code>LoaderCube</code>		 * 		 * Once the file has been loaded and is ready to view, the <code>handle</code> returns the 		 * parsed 3d object file and the placeholder object is swapped in the scenegraph tree.		 * 		 * @see	away3dlite.loaders.LoaderCube		 */        public function get handle():Object3D        {            return _result || this;        }                public function get bytesLoaded():int        {        	return _bytesLoaded;        }                public function get bytesTotal():int        {        	return _bytesTotal;        }                public function get IOErrorText():String        {        	return _IOErrorText;        }        		/**		 * Creates a new <code>Loader3D</code> object.		 * 		 * @param	init	[optional]	An initialisation object for specifying default instance properties.		 */        public function Loader3D()         {        	super();        }                /**         * Parses a 3d file format from XML definition.         *          * @param	xml									The <code>XML</code> object be parsed.         * @param	parser								The parser class to be used on the provided data.         * @param	texturePath							The path for the location of image files used as textures in the model.         * @param	accessByteArrayTextureFromName		The callback function that will be automatically called if we want to provide texture bitmaps from ByteArrays instead of from urls. The callback takes as input an indentifying <code>String</code> and must return the ByteArray of the non-decoded texture. Decoding will be done by the parser.         */         public function parseXML(xml:XML, parser:AbstractParser, texturePath:String="", accessByteArrayTextureFromName:Function=null):void        {        	data = xml;        	mode = LOADING_GEOMETRY;                        this.texturePath = texturePath;            this.parser = parser;                        _accessByteArrayTextureFromName = accessByteArrayTextureFromName;                        loadTextures(xml, parser);        }        		/**         * Loads and parses a 3d file format.         * 		 * @param	url			The url location of the file to be loaded.		 * @param	parser		The parser class to be used on the file data once loaded.         */        public function loadGeometry(url:String, parser:AbstractParser):void        {        	mode = LOADING_GEOMETRY;                        initTexturePath();        	            this.url = url;            this.parser = parser;                        _urlloader = new URLLoader();            _urlloader.dataFormat = parser.binary ? URLLoaderDataFormat.BINARY : URLLoaderDataFormat.TEXT;            _urlloader.addEventListener(IOErrorEvent.IO_ERROR, onGeometryError);            _urlloader.addEventListener(ProgressEvent.PROGRESS, onGeometryProgress);            _urlloader.addEventListener(Event.COMPLETE, onGeometryComplete);            _urlloader.load(new URLRequest(url));        }        		/**         * Parses 3d file data and loads any subsequent textures if required.         * 		 * @param	data		The file data to be parsed. Can be in text or binary form.		 * @param	parser		The parser class to be used on the file data.         */        public function loadTextures(data:*, parser:AbstractParser):void        {        	mode = PARSING_GEOMETRY;                        initTexturePath();        	        	//prepare data        	this.parser = parser;        	        	parser.addOnSuccess(onParserComplete);        	parser.addOnError(onParserError);        	parser.addOnProgress(onParserProgress);        	parser.parseGeometry(data);        }    }}