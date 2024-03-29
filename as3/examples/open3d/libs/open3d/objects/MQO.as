﻿/**
 * Metasequoia
 *
 * @see http://snippets.libspark.org/
 * @see http://snippets.libspark.org/trac/wiki/rch850/Metasequoia
 *
 * Copyright (c) 2007-2008 rch850
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package open3d.objects
{
	import flash.events.Event;
	import flash.geom.Vector3D;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	import open3d.data.FaceData;
	import open3d.geom.UV;
	import open3d.geom.Vertex;
	import open3d.materials.BitmapFileMaterial;
	import open3d.materials.ColorMaterial;
	import open3d.materials.LineMaterial;
	import open3d.materials.Material;
	import open3d.utils.LoaderUtil;

	/**
	 * Metasequoia
	 * @author katopz@sleepydesign.com
	 */
	public class MQO extends Mesh
	{
		public var charset:String = "shift_jis";

		private var materials:Dictionary;
		private var _materialNames:Array;

		private var _scale:Number;

		private var path:String = ".";

		public function MQO(data:* = null, material:Material = null, scale:Number = 1)
		{
			this.material = material;
			_scale = scale;

			if (data)
			{
				if (data is ByteArray)
				{
					parse(data, material);
				}
				else
				{
					load(data);
				}
			}
		}

		public function load(uri:String):Object
		{
			if (uri.indexOf("/") > -1)
				path = uri.split("/")[0]+"/";
			if (uri.indexOf("\\") > -1)
				path = uri.split("\\")[0]+"/";
			return LoaderUtil.load(uri, onLoad);
		}

		private function onLoad(event:Event):void
		{
			if (event.type == Event.COMPLETE)
				parse(ByteArray(event.target.data), material);
		}

		private function parse(data:ByteArray, material:Material):void
		{
			this.material = material;

			var byteArray:ByteArray = ByteArray(data);
			var plainText:String = byteArray.readMultiByte(byteArray.length, charset);

			var lines:Array = plainText.split("\r\n");
			var l:int = 0;

			l = parseMaterialChunk(lines, 0);

			while (l != -1)
			{
				l = parseObjectChunk(lines, l);
			}

			buildFaces(this.material);
		}

		private function getMaterialChunkLine(lines:Array, startLine:int = 0):int
		{
			for (var i:uint = startLine; i < lines.length; ++i)
			{
				if (lines[i].indexOf("Material") == 0)
				{
					return int(i);
				}
			}
			return -1;
		}

		private function parseMaterialChunk(lines:Array, startLine:int):int
		{
			//TODO : MaterialLibrary?
			materials = new Dictionary();
			var l:int = getMaterialChunkLine(lines, startLine);
			if (l == -1)
			{
				return -1;
			}

			var line:String = lines[l];

			var num:Number = parseInt(line.substr(9));
			if (isNaN(num))
			{
				return -1;
			}
			++l;
			_materialNames = [];

			var endLine:int = l + int(num);
			var _filename:String;

			for (; l < endLine; ++l)
			{
				var _material:Material;
				line = lines[l];

				var nameBeginIndex:int = line.indexOf("\"");
				var nameEndIndex:int = line.indexOf("\"", nameBeginIndex + 1);
				var name:String = line.substring(nameBeginIndex + 1, nameEndIndex);
				_materialNames.push(name);

				var tex:String = getParam(line, "tex");

				if (tex)
				{
					tex = tex.substr(1, tex.length - 2);
					if (tex.toLowerCase().search(/\.tga$/) != -1 || tex.toLowerCase().search(/\.bmp$/) != -1)
					{
						//TODO : someone really need TGA, BMP on web?
						//_material = loadTGAMaterial(path + tex);

						trace(" ! Error : TGA, BMP not support.");
						trace(" < Try : .png with same name...");

						tex = tex.replace(/\.tga$/, ".png");
						tex = tex.replace(/\.bmp$/, ".png");

						_material = new BitmapFileMaterial(path + "/" + tex);
					}
					else
					{
						_material = new BitmapFileMaterial(path + "/" + tex);
					}
				}
				else
				{
					var colorstr:String = getParam(line, "col");
					if (colorstr != null)
					{
						var color:Array = colorstr.match(/\d+\.\d+/g);
						var r:int = parseFloat(color[0]) * 255;
						var g:int = parseFloat(color[1]) * 255;
						var b:int = parseFloat(color[2]) * 255;
						var a:Number = parseFloat(color[3]);
						_material = new ColorMaterial((r << 16) | (g << 8) | b, a);
					}
					else
					{
						_material = new LineMaterial();
					}
				}

				materials[name] = _material;

			}

			return endLine;
		}

		private function getObjectChunkLine(lines:Array, startLine:int = 0):int
		{
			for (var i:uint = startLine; i < lines.length; ++i)
			{
				if (lines[i].indexOf("Object") == 0)
				{
					return int(i);
				}
			}
			return -1;
		}

		private function parseObjectChunk(lines:Array, startLine:int):int
		{

			var vertices:Array = [];
			var faces:Array = [];

			var l:int = getObjectChunkLine(lines, startLine);
			if (l == -1)
			{
				return -1;
			}

			var line:String = lines[l];

			var objectName:String = line.substring(8, line.indexOf("\"", 8));
			++l;

			var vline:int = getChunkLine(lines, "vertex", l);
			if (vline == -1)
			{
				return -1;
			}

			var properties:Dictionary = new Dictionary();
			for (; l < vline; ++l)
			{
				line = lines[l];
				var props:Array = RegExp(/^\s*([\w]+)\s+(.*)$/).exec(line);
				properties[props[1]] = props[2];
			}

			line = lines[l];
			l = vline + 1;

			var numVertices:int = parseInt(line.substring(line.indexOf("vertex") + 7));
			var vertexEndLine:int = l + numVertices;
			var firstVertexIndex:int = vertices.length;

			for (; l < vertexEndLine; ++l)
			{
				line = lines[l];
				var coords:Array = line.match(/(-?\d+\.\d+)/g);
				var x:Number = parseFloat(coords[0]) * _scale;
				var y:Number = parseFloat(coords[1]) * _scale;
				var z:Number = -parseFloat(coords[2]) * _scale;
				vertices.push(new Vertex(x, y, z));
			}

			l = getChunkLine(lines, "face", l);
			if (l == -1)
			{
				return -1;
			}
			line = lines[l++];

			var numFaces:int = parseInt(line.substring(line.indexOf("face") + 5));
			var faceEndLine:int = l + numFaces;

			for (; l < faceEndLine; ++l)
			{
				if (properties["visible"] == "15")
				{
					parseFace(faces, lines[l], vertices, firstVertexIndex, properties);
				}
			}

			//TODO : do we need this?
			/*
			   // Resolve parent-child relationship.
			   var depth:int;
			   try {
			   depth = parseInt(properties["depth"]);
			   } catch (e:Error) {
			   depth = 0;
			   }
			   var parentMesh:ObjectContainer3D = _prevMesh;
			   if (depth <= 0) {
			   parentMesh = this;
			   depth = 0;
			   } else {
			   while (depth <= _prevDepth) {
			   parentMesh = ObjectContainer3D(parentMesh).parent;
			   --_prevDepth;
			   }
			   }
			   parentMesh.addChild(mesh);
			   _prevMesh = mesh;
			   _prevDepth = depth;
			 */
			return faceEndLine;
		}

		private function parseFace(faces:Array, line:String, vertices:Array, vertexOffset:int, properties:Dictionary):void
		{
			var vstr:String = getParam(line, "V");
			var mstr:String = getParam(line, "M");
			var uvstr:String = getParam(line, "UV");

			var v:Array = (vstr != null) ? vstr.match(/\d+/g) : [];
			var uv:Array = (uvstr != null) ? uvstr.match(/-?\d+\.\d+/g) : [];
			var a:Vertex;
			var b:Vertex;
			var c:Vertex;
			var d:Vertex;
			var _material:Material;
			var uvA:UV;
			var uvB:UV;
			var uvC:UV;
			var uvD:UV;
			var face:FaceData;
			var mirrorAxis:int;
			if (v.length == 3)
			{
				c = vertices[parseInt(v[0]) + vertexOffset];
				b = vertices[parseInt(v[1]) + vertexOffset];
				a = vertices[parseInt(v[2]) + vertexOffset];

				if (mstr != null)
				{
					_material = materials[_materialNames[parseInt(mstr)]];
				}

				if (uv.length != 0)
				{
					uvC = new UV(parseFloat(uv[0]),  parseFloat(uv[1]));
					uvB = new UV(parseFloat(uv[2]),  parseFloat(uv[3]));
					uvA = new UV(parseFloat(uv[4]),  parseFloat(uv[5]));
					addFace(a, b, c, uvA, uvB, uvC);
				}
				else
				{
					addFace(a, b, c, new UV(0, 0), new UV(1, 0), new UV(0, 1));
				}


				if (properties["mirror"] == "1")
				{
					mirrorAxis = parseInt(properties["mirror_axis"]);
					a = mirrorVertex(a, mirrorAxis);
					b = mirrorVertex(b, mirrorAxis);
					c = mirrorVertex(c, mirrorAxis);
					vertices.push(a);
					vertices.push(b);
					vertices.push(c);
					addFace(c, b, a, uvC, uvB, uvA);
				}
			}
			else if (v.length == 4)
			{
				d = vertices[parseInt(v[0]) + vertexOffset];
				c = vertices[parseInt(v[1]) + vertexOffset];
				b = vertices[parseInt(v[2]) + vertexOffset];
				a = vertices[parseInt(v[3]) + vertexOffset];

				if (mstr != null)
				{
					_material = materials[_materialNames[parseInt(mstr)]];
				}

				if (uv.length != 0)
				{
					uvD = new UV(parseFloat(uv[0]),  parseFloat(uv[1]));
					uvC = new UV(parseFloat(uv[2]),  parseFloat(uv[3]));
					uvB = new UV(parseFloat(uv[4]),  parseFloat(uv[5]));
					uvA = new UV(parseFloat(uv[6]),  parseFloat(uv[7]));
				}
				else
				{
					uvD = new UV(1, 1);
					uvC = new UV(0, 1);
					uvB = new UV(1, 0);
					uvA = new UV(0, 0);
				}
				addFace(a, b, c, uvA, uvB, uvC);
				addFace(c, d, a, uvC, uvD, uvA);

				if (properties["mirror"] == "1")
				{
					mirrorAxis = parseInt(properties["mirror_axis"]);
					a = mirrorVertex(a, mirrorAxis);
					b = mirrorVertex(b, mirrorAxis);
					c = mirrorVertex(c, mirrorAxis);
					d = mirrorVertex(d, mirrorAxis);
					vertices.push(a);
					vertices.push(b);
					vertices.push(c);
					vertices.push(d);
					addFace(c, b, a, uvC, uvB, uvA);
					addFace(a, d, c, uvA, uvD, uvC);
				}
			}
		}

		private static function mirrorVertex(v:Vertex, axis:int):Vertex
		{
			return new Vertex(((axis & 1) != 0) ? -v.x : v.x, ((axis & 2) != 0) ? -v.y : v.y, ((axis & 4) != 0) ? -v.z : v.z);
		}

		private static function getChunkLine(lines:Array, chunkName:String, startLine:int = 0):int
		{
			for (var i:uint = startLine; i < lines.length; ++i)
			{
				if (lines[i].indexOf(chunkName) != -1)
				{
					return int(i);
				}
			}
			return -1;
		}

		private static function getParam(line:String, paramName:String):String
		{
			var prefix:String = paramName + "(";
			var prefixLen:int = prefix.length;

			var begin:int = line.indexOf(prefix, 0);
			if (begin == -1)
			{
				return null;
			}
			var end:int = line.indexOf(")", begin + prefixLen);
			if (end == -1)
			{
				return null;
			}
			return line.substring(begin + prefixLen, end);
		}

		private var i:int = 0;
		private var n:int = -1;

		private function addFace(v0:Vector3D, v1:Vector3D, v2:Vector3D, uv0:UV, uv1:UV, uv2:UV):void
		{
			_vin[i++] = v0.x;
			_vin[i++] = v0.y;
			_vin[i++] = v0.z;

			_vin[i++] = v1.x;
			_vin[i++] = v1.y;
			_vin[i++] = v1.z;

			_vin[i++] = v2.x;
			_vin[i++] = v2.y;
			_vin[i++] = v2.z;

			_triangles.uvtData.push(uv0.u, uv0.v, 1);
			_triangles.uvtData.push(uv1.u, uv1.v, 1);
			_triangles.uvtData.push(uv2.u, uv2.v, 1);

			n += 3;

			_triangles.indices.push(n, n - 1, n - 2);
		}
	}
}
