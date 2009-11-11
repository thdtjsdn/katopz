<?xml version="1.0" encoding="utf-8"?>
<COLLADA xmlns="http://www.collada.org/2005/11/COLLADASchema" version="1.4.1">
  <asset>
    <contributor>
      <authoring_tool>FBX COLLADA exporter</authoring_tool>
    </contributor>
    <contributor>
      <author>katopz</author>
      <authoring_tool>Maya8.5 | ColladaMaya v3.05B</authoring_tool>
      <comments>ColladaMaya export options: bakeTransforms=1;exportPolygonMeshes=1;bakeLighting=0;isSampling=0;
curveConstrainSampling=0;removeStaticCurves=1;exportCameraAsLookat=0;
exportLights=0;exportCameras=0;exportJointsAndSkin=1;
exportAnimations=1;exportTriangles=1;exportInvisibleNodes=0;
exportNormals=0;exportTexCoords=1;
exportVertexColors=0;exportVertexColorsAnimation=0;exportTangents=0;
exportTexTangents=1;exportConstraints=0;exportPhysics=0;exportXRefs=1;
dereferenceXRefs=0;cameraXFov=0;cameraYFov=1</comments>
      <source_data>file:///C:/Inetpub/wwwroot/Classes/katopz/branches/as3/ARQRCode/res/J7/J7.mb</source_data>
    </contributor>
    <created>2009-11-09T00:49:46Z</created>
    <modified>2009-11-09T19:17:09Z</modified>
    <unit meter="0.01" name="centimeter"/>
    <up_axis>Y_UP</up_axis>
  </asset>
  <library_animations>
    <animation id="J7_Joint1.matrix">
      <source id="J7_Joint1.matrix_J7_Joint1_transform-input">
        <float_array id="J7_Joint1.matrix_J7_Joint1_transform-input-array" count="48">0.041666 0.083333 0.125 0.166667 0.208333 0.25 0.291667 0.333333 0.375 0.416667 0.458333 0.5 0.541667 0.583333 0.625 0.666667 0.708333 0.75 0.791667 0.833333 0.875 0.916667 0.958333 1 1.04167 1.08333 1.125 1.16667 1.20833 1.25 1.29167 1.33333 1.375 1.41667 1.45833 1.5 1.54167 1.58333 1.625 1.66667 1.70833 1.75 1.79167 1.83333 1.875 1.91667 1.95833 2</float_array>
        <technique_common>
          <accessor source="#J7_Joint1.matrix_J7_Joint1_transform-input-array" count="48" stride="1">
            <param name="TIME" type="float"/>
          </accessor>
        </technique_common>
        <technique profile="MAYA">
          <pre_infinity>CONSTANT</pre_infinity>
          <post_infinity>CONSTANT</post_infinity>
        </technique>
      </source>
      <source id="J7_Joint1.matrix_J7_Joint1_transform-output">
        <float_array id="J7_Joint1.matrix_J7_Joint1_transform-output-array" count="768">0.695769 0 0 0 0 0.872378 0 0 0 0 0.695769 -21.747 0 0 0 1 0.701727 0 0 0 0 0.792651 0 0 0 0 0.702711 -21.747 0 0 0 1 0.715398 0 0 0 0 0.791125 0 0 0 0 0.71907 -21.747 0 0 0 1 0.733988 0 0.003109 0 0 1.00381 0 0 -0.00309 0 0.73846 -21.747 0 0 0 1 0.7576 0 0.012271 0 0 1.286 0 0 -0.012217 0 0.760958 -21.747 0 0 0 1 0.78419 0 0.027377 0 0 1.45126 0 0 -0.027194 0 0.789473 -21.747 0 0 0 1 0.811622 0 0.048468 0 0 1.47287 0 0.593253 -0.047741 0 0.823979 -21.2622 0 0 0 1 0.839697 0 0.075433 0 0 1.45516 0 2.07639 -0.073507 0 0.861708 -19.9424 0 0 0 1 0.86921 0 0.108026 0 0 1.40822 0 4.00446 -0.10417 0 0.901381 -17.9894 0 0 0 1 0.90098 0 0.145758 0 0 1.34212 0 5.93254 -0.139446 0 0.941758 -15.6051 0 0 0 1 0.935877 0 0.187856 0 0 1.26696 0 7.41567 -0.179089 0 0.981695 -12.9913 0 0 0 1 0.974848 0 0.23324 0 0 1.19282 0 8.00892 -0.222871 0 1.0202 -10.35 0 0 0 1 1.02014 0 0.287597 0 0 1.12018 0 7.81818 -0.273095 0 1.07431 -7.92278 0 0 0 1 1.05755 0 0.350594 0 0 1.04722 0 7.16318 -0.328053 0 1.13022 -5.7688 0 0 0 1 1.0643 0 0.406434 0 0 0.980637 0 5.91971 -0.378663 0 1.14235 -3.816 0 0 0 1 1.0164 0 0.431828 0 0 0.911651 0 3.68315 -0.410153 0 1.07012 -1.99278 0 0 0 1 0.941609 0 0.434447 0 0 0.849029 0 1.18383 -0.426299 0 0.959606 -0.572392 0 0 0 1 0.893208 0 0.449643 0 0 0.825736 0 0 -0.449643 0 0.893208 0 0 0 0 1 0.874166 0 0.485628 0 0 0.852678 0 0 -0.485628 0 0.874166 0 0 0 0 1 0.854044 0 0.5202 0 0 0.906283 0 0 -0.5202 0 0.854044 0 0 0 0 1 0.833053 0 0.553192 0 0 0.967793 0 0 -0.553192 0 0.833053 0 0 0 0 1 0.811423 0 0.584459 0 0 1.01845 0 0 -0.584459 0 0.811423 0 0 0 0 1 0.789401 0 0.613878 0 0 1.03951 0 0 -0.613878 0 0.789401 0 0 0 0 1 0.767249 0 0.641349 0 0 1.03928 0 0 -0.641349 0 0.767249 0 0 0 0 1 0.745239 0 0.666797 0 0 1.03869 0 0 -0.666797 0 0.745239 0 0 0 0 1 0.723651 0 0.690166 0 0 1.03789 0 0 -0.690166 0 0.723651 0 0 0 0 1 0.702768 0 0.711419 0 0 1.03702 0 0 -0.711419 0 0.702768 0 0 0 0 1 0.682874 0 0.730536 0 0 1.03621 0 0 -0.730536 0 0.682874 0 0 0 0 1 0.66425 0 0.74751 0 0 1.03563 0 0 -0.74751 0 0.66425 0 0 0 0 1 0.647173 0 0.762344 0 0 1.0354 0 0 -0.762344 0 0.647173 0 0 0 0 1 0.631373 0 0.775479 0 0 1.0354 0 0 -0.775479 0 0.631373 0 0 0 0 1 0.616427 0 0.787412 0 0 1.0354 0 0 -0.787412 0 0.616427 0 0 0 0 1 0.602368 0 0.798218 0 0 1.0354 0 0 -0.798218 0 0.602368 0 0 0 0 1 0.589222 0 0.807971 0 0 1.0354 0 0 -0.807971 0 0.589222 0 0 0 0 1 0.577006 0 0.81674 0 0 1.0354 0 0 -0.81674 0 0.577006 0 0 0 0 1 0.565733 0 0.824588 0 0 1.0354 0 0 -0.824588 0 0.565733 0 0 0 0 1 0.555413 0 0.831575 0 0 1.0354 0 0 -0.831575 0 0.555413 0 0 0 0 1 0.546047 0 0.837755 0 0 1.0354 0 0 -0.837755 0 0.546047 0 0 0 0 1 0.537634 0 0.843178 0 0 1.0354 0 0 -0.843178 0 0.537634 0 0 0 0 1 0.530169 0 0.847892 0 0 1.0354 0 0 -0.847892 0 0.530169 0 0 0 0 1 0.523645 0 0.851937 0 0 1.0354 0 0 -0.851937 0 0.523645 0 0 0 0 1 0.518049 0 0.855351 0 0 1.0354 0 0 -0.855351 0 0.518049 0 0 0 0 1 0.513368 0 0.858169 0 0 1.0354 0 0 -0.858169 0 0.513368 0 0 0 0 1 0.509585 0 0.860421 0 0 1.0354 0 0 -0.860421 0 0.509585 0 0 0 0 1 0.50668 0 0.862134 0 0 1.0354 0 0 -0.862134 0 0.50668 0 0 0 0 1 0.504635 0 0.863333 0 0 1.0354 0 0 -0.863333 0 0.504635 0 0 0 0 1 0.503425 0 0.864039 0 0 1.0354 0 0 -0.864039 0 0.503425 0 0 0 0 1 0.503027 0 0.864271 0 0 1.0354 0 0 -0.864271 0 0.503027 0 0 0 0 1</float_array>
        <technique_common>
          <accessor source="#J7_Joint1.matrix_J7_Joint1_transform-output-array" count="48" stride="16">
            <param name="TRANSFORM" type="float4x4"/>
          </accessor>
        </technique_common>
      </source>
      <source id="J7_Joint1.matrix_J7_Joint1_transform-interpolations">
        <Name_array id="J7_Joint1.matrix_J7_Joint1_transform-interpolations-array" count="48">LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR</Name_array>
        <technique_common>
          <accessor source="#J7_Joint1.matrix_J7_Joint1_transform-interpolations-array" count="48" stride="1">
            <param name="INTERPOLATION" type="Name"/>
          </accessor>
        </technique_common>
      </source>
      <sampler id="J7_Joint1.matrix_J7_Joint1_transform-sampler">
        <input semantic="INPUT" source="#J7_Joint1.matrix_J7_Joint1_transform-input"/>
        <input semantic="OUTPUT" source="#J7_Joint1.matrix_J7_Joint1_transform-output"/>
        <input semantic="INTERPOLATION" source="#J7_Joint1.matrix_J7_Joint1_transform-interpolations"/>
      </sampler>
      <channel source="#J7_Joint1.matrix_J7_Joint1_transform-sampler" target="J7_Joint1/transform"/>
    </animation>
    <animation id="J7_Joint2.matrix">
      <source id="J7_Joint2.matrix_J7_Joint2_transform-input">
        <float_array id="J7_Joint2.matrix_J7_Joint2_transform-input-array" count="48">0.041666 0.083333 0.125 0.166667 0.208333 0.25 0.291667 0.333333 0.375 0.416667 0.458333 0.5 0.541667 0.583333 0.625 0.666667 0.708333 0.75 0.791667 0.833333 0.875 0.916667 0.958333 1 1.04167 1.08333 1.125 1.16667 1.20833 1.25 1.29167 1.33333 1.375 1.41667 1.45833 1.5 1.54167 1.58333 1.625 1.66667 1.70833 1.75 1.79167 1.83333 1.875 1.91667 1.95833 2</float_array>
        <technique_common>
          <accessor source="#J7_Joint2.matrix_J7_Joint2_transform-input-array" count="48" stride="1">
            <param name="TIME" type="float"/>
          </accessor>
        </technique_common>
        <technique profile="MAYA">
          <pre_infinity>CONSTANT</pre_infinity>
          <post_infinity>CONSTANT</post_infinity>
        </technique>
      </source>
      <source id="J7_Joint2.matrix_J7_Joint2_transform-output">
        <float_array id="J7_Joint2.matrix_J7_Joint2_transform-output-array" count="768">0.669986 0 0 0 0 1 0 3.42497 0 0 0.669986 0 0 0 0 1 0.697706 0 0 0 0 1 0 3.42497 0 0 0.697706 0 0 0 0 1 0.743833 0 0 0 0 1 0 3.42497 0 0 0.743833 0 0 0 0 1 0.801476 0 0 0 0 1 0 3.42497 0 0 0.801476 0 0 0 0 1 0.900779 0 0 0 0 0.863161 0 3.52546 0 0 0.902433 0 0 0 0 1 0.975507 0 0 0 0 0.791125 0 3.63938 0 0 0.975507 0 0 0 0 1 0.940671 0 0 0 0 1.06573 0 3.44708 0 0 0.924843 0 0 0 0 1 0.872475 0 0 0 0 1.44435 0 3.21908 0 0 0.837879 0 0 0 0 1 0.861251 0 0 0 0 1.64802 0 3.55933 0 0 0.828176 0 0 0 0 1 0.935108 0 0 0 0 1.61614 0 4.69062 0 0 0.929908 0 0 0 0 1 1.04644 0 0 0 0 1.50065 0 6.24545 0 0 1.08131 0 0 0 0 1 1.17202 0 0 0 0 1.34142 0 7.94234 0 0 1.25202 0 0 0 0 1 1.28861 0 0 0 0 1.17832 0 9.49983 0 0 1.4117 0 0 0 0 1 1.37296 0 0 0 0 1.05123 0 10.6364 0 0 1.52999 0 0 0 0 1 1.40186 0 0 0 0 1 0 11.0707 0 0 1.57653 0 0 0 0 1 1.3588 0 0 0 0 1 0 10.4973 0 0 1.52762 0 0 0 0 1 1.25907 0 0 0 0 1 0 9.08044 0 0 1.40279 0 0 0 0 1 1.12712 0 0 0 0 1 0 7.24266 0 0 1.23656 0 0 0 0 1 0.987376 0 0 0 0 1 0 5.40666 0 0 1.06348 0 0 0 0 1 0.864283 0 0 0 0 1 0 3.99512 0 0 0.918084 0 0 0 0 1 0.782279 0 0 0 0 1 0 3.43068 0 0 0.8349 0 0 0 0 1 0.754082 0 0 0 0 1.04436 0 3.43068 0 0 0.810062 0 0 0 0 1 0.767605 0 0 0 0 1.142 0 3.43068 0 0 0.813295 0 0 0 0 1 0.810075 0 0 0 0 1.23978 0 3.43068 0 0 0.839529 0 0 0 0 1 0.868721 0 0 0 0 1.28458 0 3.43068 0 0 0.88369 0 0 0 0 1 0.930524 0 0 0 0 1.24117 0 3.43068 0 0 0.936704 0 0 0 0 1 0.979848 0 0 0 0 1.14492 0 3.43068 0 0 0.981275 0 0 0 0 1 1 0 0 0 0 1.04852 0 3.43068 0 0 1 0 0 0 0 1 1 0 0 0 0 1.00467 0 3.43068 0 0 1 0 0 0 0 1 1 0 0 0 0 1.02293 0 3.43068 0 0 1 0 0 0 0 1 1 0 0 0 0 1.05685 0 3.43068 0 0 1 0 0 0 0 1 1 0 0 0 0 1.07511 0 3.43068 0 0 1 0 0 0 0 1 1 0 0 0 0 1.06427 0 3.43068 0 0 1 0 0 0 0 1 1 0 0 0 0 1.03841 0 3.43068 0 0 1 0 0 0 0 1 1 0 0 0 0 1.00755 0 3.43068 0 0 1 0 0 0 0 1 1 0 0 0 0 0.981692 0 3.43068 0 0 1 0 0 0 0 1 1 0 0 0 0 0.970849 0 3.43068 0 0 1 0 0 0 0 1 1 0 0 0 0 0.974806 0 3.43068 0 0 1 0 0 0 0 1 1 0 0 0 0 0.982156 0 3.43068 0 0 1 0 0 0 0 1 1 0 0 0 0 0.986113 0 3.43068 0 0 1 0 0 0 0 1 1 0 0 0 0 0.983698 0 3.43068 0 0 1 0 0 0 0 1 1 0 0 0 0 0.97794 0 3.43068 0 0 1 0 0 0 0 1 1 0 0 0 0 0.971067 0 3.43068 0 0 1 0 0 0 0 1 1 0 0 0 0 0.965309 0 3.43068 0 0 1 0 0 0 0 1 1 0 0 0 0 0.962894 0 3.43068 0 0 1 0 0 0 0 1 1 0 0 0 0 0.962894 0 3.43068 0 0 1 0 0 0 0 1 1 0 0 0 0 0.962894 0 3.43068 0 0 1 0 0 0 0 1 1 0 0 0 0 0.962894 0 3.43068 0 0 1 0 0 0 0 1</float_array>
        <technique_common>
          <accessor source="#J7_Joint2.matrix_J7_Joint2_transform-output-array" count="48" stride="16">
            <param name="TRANSFORM" type="float4x4"/>
          </accessor>
        </technique_common>
      </source>
      <source id="J7_Joint2.matrix_J7_Joint2_transform-interpolations">
        <Name_array id="J7_Joint2.matrix_J7_Joint2_transform-interpolations-array" count="48">LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR LINEAR</Name_array>
        <technique_common>
          <accessor source="#J7_Joint2.matrix_J7_Joint2_transform-interpolations-array" count="48" stride="1">
            <param name="INTERPOLATION" type="Name"/>
          </accessor>
        </technique_common>
      </source>
      <sampler id="J7_Joint2.matrix_J7_Joint2_transform-sampler">
        <input semantic="INPUT" source="#J7_Joint2.matrix_J7_Joint2_transform-input"/>
        <input semantic="OUTPUT" source="#J7_Joint2.matrix_J7_Joint2_transform-output"/>
        <input semantic="INTERPOLATION" source="#J7_Joint2.matrix_J7_Joint2_transform-interpolations"/>
      </sampler>
      <channel source="#J7_Joint2.matrix_J7_Joint2_transform-sampler" target="J7_Joint2/transform"/>
    </animation>
  </library_animations>
  <library_images>
    <image id="file1" name="file1">
      <init_from>J7.png</init_from>
      <extra>
        <technique profile="MAYA">
          <dgnode_type>kFile</dgnode_type>
          <image_sequence>0</image_sequence>
        </technique>
      </extra>
    </image>
  </library_images>
  <library_materials>
    <material id="M_J7" name="M_J7">
      <instance_effect url="#M_J7-fx"/>
    </material>
  </library_materials>
  <library_effects>
    <effect id="M_J7-fx">
      <profile_COMMON>
        <newparam sid="file1-surface">
          <surface type="2D">
            <init_from>file1</init_from>
            <format>A8R8G8B8</format>
          </surface>
        </newparam>
        <newparam sid="file1-sampler">
          <sampler2D>
            <source>file1-surface</source>
            <wrap_s>WRAP</wrap_s>
            <wrap_t>WRAP</wrap_t>
            <minfilter>NONE</minfilter>
            <magfilter>NONE</magfilter>
            <mipfilter>NONE</mipfilter>
          </sampler2D>
        </newparam>
        <technique sid="common">
          <lambert>
            <emission>
              <color>0 0 0 1</color>
            </emission>
            <ambient>
              <color>0 0 0 1</color>
            </ambient>
            <diffuse>
              <texture texture="file1-sampler" texcoord="TEX0">
                <extra>
                  <technique profile="MAYA">
                    <wrapU>1</wrapU>
                    <wrapV>1</wrapV>
                    <mirrorU>0</mirrorU>
                    <mirrorV>0</mirrorV>
                    <coverageU>1</coverageU>
                    <coverageV>1</coverageV>
                    <translateFrameU>0</translateFrameU>
                    <translateFrameV>0</translateFrameV>
                    <rotateFrame>0</rotateFrame>
                    <stagger>0</stagger>
                    <fast>0</fast>
                    <repeatU>1</repeatU>
                    <repeatV>1</repeatV>
                    <offsetU>0</offsetU>
                    <offsetV>0</offsetV>
                    <rotateUV>0</rotateUV>
                    <noiseU>0</noiseU>
                    <noiseV>0</noiseV>
                    <blend_mode>NONE</blend_mode>
                  </technique>
                </extra>
              </texture>
            </diffuse>
            <transparent opaque="RGB_ZERO">
              <color>0 0 0 1</color>
            </transparent>
            <transparency>
              <float>1</float>
            </transparency>
          </lambert>
          <extra>
            <technique profile="FCOLLADA"/>
          </extra>
        </technique>
      </profile_COMMON>
    </effect>
  </library_effects>
  <library_geometries>
    <geometry id="S_J7Mesh" name="S_J7Mesh">
      <mesh>
        <source id="S_J7Mesh-positions" name="position">
          <float_array id="S_J7Mesh-positions-array" count="312">1.68751 0 8.50077 1.1142 0 8.60559 8.30243 0 -2.52336 8.444 0 -1.95974 7.41817 3.66541 -2.34597 3.25577 3.66541 -5.03449 -3.25007 3.66541 5.03796 0.912338 3.66541 7.72648 8.44341 4.14059 -1.95268 1.69245 4.14059 8.49927 3.59412 0 -5.56447 3.59696 4.14059 -5.56274 8.29473 4.14059 -2.52843 -1.68617 0 -8.50285 -8.44265 0 1.95766 -8.43773 4.14059 1.95614 -1.68677 4.14059 -8.4958 -3.59412 0 5.56447 -3.59127 4.14059 5.56621 -8.28905 4.14059 2.53189 -8.28977 0 2.53153 7.55631 4.14059 -1.77703 1.48775 4.14059 7.61842 3.25577 4.14059 -5.03449 7.40763 4.14059 -2.35278 -7.55063 4.14059 1.7805 -1.48207 4.14059 -7.61496 -3.25007 4.14059 5.03796 -7.40195 4.14059 2.35624 7.55652 3.66541 -1.77736 1.48728 3.66541 7.61914 -7.55109 3.66541 1.78121 -1.48186 3.66541 -7.61528 -7.41249 3.66541 2.34944 1.1065 4.14059 8.60052 -1.10082 4.14059 -8.59705 -1.10154 0 -8.59742 0.901797 4.14059 7.71967 -0.896116 4.14059 -7.71621 -0.906657 3.66541 -7.72301 0.051254 7.5816 -0.032024 -1.4819 7.38123 -0.439473 -0.699999 7.33091 1.50864 1.91723 6.99661 0.63224 0.802782 7.22997 -1.48293 -2.63318 6.65802 -0.722623 -2.71703 6.66837 1.52844 -1.04694 6.66854 2.6021 1.57205 6.72598 2.24768 1.79335 6.64208 -2.35446 -1.08518 6.67229 -2.79331 -3.55235 5.55949 -1.47587 -3.58951 5.55949 0.073706 3.60426 5.55948 1.14273 3.42128 5.55948 0.07743 2.58801 6.66599 -0.653432 -3.90019 5.55949 1.11739 -4.12122 4.14478 0.098551 -3.48629 5.55949 2.76929 -2.38521 5.55949 3.76905 -0.614174 5.55948 3.73155 0.727097 5.55949 4.02226 2.05877 5.55949 3.48774 3.12067 5.55948 2.52541 4.04067 4.14455 1.37966 4.01628 5.55949 -1.14468 3.91218 4.14334 0.145288 3.48542 5.55949 -2.61552 2.43335 5.55949 -3.69113 0.683634 5.55949 -3.68667 -0.644881 5.55949 -3.9663 -2.03424 5.57209 -3.47383 -4.02727 4.14539 -1.69243 -3.82601 3.52083 -1.61158 -4.41159 4.14553 1.25148 -3.91118 3.52083 0.115188 -4.1784 3.52083 1.18297 -3.91649 4.14602 3.07836 -3.66874 3.52083 2.85152 -2.67679 4.14608 4.21869 -2.49152 3.52083 3.92791 -0.729667 4.14614 4.26379 -0.674119 3.52083 4.01312 0.741378 4.14618 4.58018 0.629053 3.52083 4.34005 2.38856 4.14612 3.89295 2.26425 3.52083 3.69349 3.51471 4.14538 2.8153 3.30935 3.52083 2.70333 3.82561 3.52083 1.28559 3.71914 3.52083 0.137923 4.53478 4.14488 -1.29399 4.29926 3.52083 -1.22913 3.93506 4.14606 -2.95824 3.73022 3.52083 -2.80574 2.74479 4.146 -4.1751 2.60249 3.52083 -3.95873 0.806265 4.14594 -4.23347 0.747918 3.52083 -3.98643 -0.72377 4.1459 -4.50219 -0.689508 3.52083 -4.26235 -2.30585 4.164 -3.91255 -2.1844 3.52266 -3.71665 -2.1844 3.51899 -3.71665</float_array>
          <technique_common>
            <accessor source="#S_J7Mesh-positions-array" count="104" stride="3">
              <param name="X" type="float"/>
              <param name="Y" type="float"/>
              <param name="Z" type="float"/>
            </accessor>
          </technique_common>
        </source>
        <source id="S_J7Mesh-map1" name="map1">
          <float_array id="S_J7Mesh-map1-array" count="324">0.9828 0.4383 0.9864 0.4347 0.853 0.435 0.8567 0.4386 0.0303 0.3863 0.2438 0.3863 0.2438 0.9841 0.0303 0.9841 0.019 0.0101 0.9443 0.0101 0.9443 0.2636 0.019 0.2636 0.478 0.0101 0.478 0.2636 0.0194 0.2635 0.0194 0.01 0.4779 0.0101 0.4779 0.2637 0.0194 0.2636 0.0194 0.0101 0.9443 0.3298 0.019 0.3298 0.478 0.3298 0.0194 0.3299 0.478 0.3299 0.9443 0.367 0.019 0.367 0.478 0.3671 0.0194 0.3671 0.9443 0.3671 0.019 0.3671 0.986 0.0101 0.986 0.2636 0.9439 0.2637 0.9439 0.0101 0.986 0.2637 0.9861 0.0101 0.9861 0.2637 0.986 0.3299 0.9439 0.3299 0.986 0.3298 0.9861 0.3298 0.9439 0.3298 0.986 0.367 0.9439 0.3671 0.9861 0.3671 0.986 0.3671 0.853 0.3974 0.9864 0.3971 0.0135 0.9673 0.0135 0.4032 0.019 0.0101 0.9443 0.0101 0.9443 0.2636 0.019 0.2636 0.019 0.2636 0.9443 0.2636 0.9443 0.3298 0.019 0.3298 0.0194 0.3299 0.019 0.3298 0.9443 0.3298 0.0194 0.3299 0.478 0.3671 0.0194 0.3671 0.986 0.0101 0.9439 0.2637 0.9439 0.0101 0.986 0.0101 0.986 0.2636 0.9443 0.2636 0.9443 0.0101 0.9439 0.2637 0.9443 0.2636 0.986 0.2636 0.986 0.3298 0.9443 0.3298 0.986 0.367 0.9439 0.3671 0.986 0.3298 0.9443 0.3298 0.9864 0.4347 0.853 0.435 0.0303 0.3863 0.0303 0.9841 0.9439 0.0101 0.9439 0.2637 0.9439 0.2637 0.9439 0.3671 0.478 0.3671 0.9864 0.4347 0.9828 0.4383 0.8567 0.4386 0.853 0.435 0.0303 0.3863 0.0135 0.4032 0.0135 0.9673 0.0303 0.9841 0.6179 0.6868 0.6463 0.63105 0.6941 0.6999 0.592675 0.764175 0.545 0.67685 0.6674 0.58395 0.7531 0.63535 0.74645 0.715 0.66225 0.79055 0.48955 0.69925 0.5259 0.7549 0.5469 0.58345 0.7356 0.55135 0.78445 0.5733 0.8358 0.6358 0.845 0.70195 0.76385 0.81945 0.70335 0.85385 0.5607 0.8522 0.518075 0.821975 0.4536 0.799 0.44725 0.6067 0.4794 0.55445 0.5411 0.519 0.6679 0.51705 0.847 0.5259 0.7872 0.48285 0.9072 0.6147 0.91845 0.7048 0.86995 0.8012 0.79295 0.7652 0.82105 0.86915 0.73085 0.922 0.6377 0.9387 0.6329 0.86595 0.4748 0.892375 0.5458 0.9248 0.3909 0.8401 0.338 0.7559 0.41335 0.73785 0.32555 0.66455 0.3997 0.6718 0.37355 0.56785 0.42675 0.49915 0.513 0.45045 0.683375 0.4428 0.8197 0.436 0.8867 0.4897 0.9573 0.5946 0.9706 0.7103 0.9206 0.8285 0.8565 0.905 0.7503 0.9682 0.6423 0.988 0.5307 0.9727 0.44765 0.93885 0.3531 0.8719 0.2882 0.7707 0.2769 0.6566 0.3255 0.5371 0.3929 0.4597 0.4956 0.4024 0.69345 0.39205 0.4956 0.4024</float_array>
          <technique_common>
            <accessor source="#S_J7Mesh-map1-array" count="162" stride="2">
              <param name="S" type="float"/>
              <param name="T" type="float"/>
            </accessor>
          </technique_common>
        </source>
        <vertices id="S_J7Mesh-vertices">
          <input semantic="POSITION" source="#S_J7Mesh-positions"/>
        </vertices>
        <triangles material="M_J7SG" count="198">
          <input semantic="VERTEX" source="#S_J7Mesh-vertices" offset="0"/>
          <input semantic="TEXCOORD" source="#S_J7Mesh-map1" offset="1" set="0"/>
          <p>0 0 1 1 2 2 2 2 3 3 0 0 4 4 5 5 6 6 6 6 7 7 4 4 0 8 3 9 8 10 8 10 9 11 0 8 10 12 11 13 12 14 12 14 2 15 10 12 13 51 14 52 15 53 15 53 16 54 13 51 17 16 18 17 19 18 19 18 20 19 17 16 9 11 8 10 21 20 21 20 22 21 9 11 11 13 23 22 24 23 24 23 12 14 11 13 16 55 15 56 25 57 25 57 26 58 16 55 18 17 27 24 28 59 28 59 19 18 18 17 22 21 21 20 29 25 29 25 30 26 22 21 24 23 23 22 5 27 5 27 4 28 24 23 26 60 25 61 31 29 31 29 32 30 26 60 28 62 27 24 6 63 6 63 33 64 28 62 2 31 12 32 8 10 8 10 3 9 2 31 34 33 1 34 0 65 0 65 9 35 34 33 13 36 16 37 35 66 35 66 36 67 13 36 20 68 19 69 15 70 15 70 14 71 20 68 9 35 22 38 37 39 37 39 34 33 9 35 8 10 12 32 24 40 24 40 21 20 8 10 16 37 26 41 38 42 38 42 35 72 16 37 15 73 19 74 28 75 28 75 25 76 15 73 22 38 30 43 7 44 7 44 37 39 22 38 24 40 4 77 29 25 29 25 21 20 24 40 26 41 32 45 39 78 39 78 38 42 26 41 28 79 33 46 31 29 31 29 25 80 28 79 20 81 36 82 10 47 10 47 17 48 20 81 39 83 33 84 6 6 6 6 5 5 39 83 10 12 36 85 35 86 35 86 11 13 10 12 17 16 1 34 34 33 34 33 18 17 17 16 11 13 35 87 38 42 38 42 23 22 11 13 18 17 34 33 37 39 37 39 27 24 18 17 38 42 39 88 5 27 5 27 23 22 38 42 37 39 7 44 6 89 6 89 27 24 37 39 17 48 10 47 2 2 2 2 1 1 17 48 20 90 14 91 13 92 13 92 36 93 20 90 7 7 30 49 29 50 29 50 4 4 7 7 39 94 32 95 31 96 31 96 33 97 39 94 40 98 41 99 42 100 40 98 42 100 43 101 40 98 43 101 44 102 40 98 44 102 41 99 41 99 45 103 46 104 41 99 46 104 42 100 42 100 46 104 47 105 42 100 47 105 48 106 42 100 48 106 43 101 49 107 44 102 55 108 44 102 50 109 41 99 41 99 50 109 45 103 52 110 56 111 46 104 46 104 45 103 52 110 56 111 58 112 46 104 58 112 59 113 47 105 47 105 46 104 58 112 47 105 61 114 48 106 48 106 61 114 62 115 43 101 53 116 54 117 55 108 54 117 65 118 55 108 65 118 49 107 50 109 49 107 69 119 70 120 71 121 50 109 71 121 51 122 45 103 45 103 50 109 71 121 74 123 56 111 52 110 52 110 57 124 74 123 77 125 58 112 56 111 56 111 74 123 77 125 79 126 59 113 58 112 58 112 77 125 79 126 81 127 60 128 59 113 59 113 79 126 81 127 83 129 61 114 60 128 60 128 81 127 83 129 85 130 62 115 61 114 61 114 83 129 85 130 87 131 63 132 62 115 62 115 85 130 87 131 66 133 54 117 53 116 53 116 64 134 66 133 91 135 65 118 54 117 54 117 66 133 91 135 93 136 67 137 65 118 65 118 91 135 93 136 95 138 68 139 67 137 67 137 93 136 95 138 97 140 69 119 68 139 68 139 95 138 97 140 99 141 70 120 69 119 69 119 97 140 99 141 101 142 71 121 70 120 70 120 99 141 101 142 72 143 51 122 71 121 71 121 101 142 72 143 74 123 57 124 75 144 75 144 76 145 74 123 77 125 74 123 76 145 76 145 78 146 77 125 79 126 77 125 78 146 78 146 80 147 79 126 81 127 79 126 80 147 80 147 82 148 81 127 83 129 81 127 82 148 82 148 84 149 83 129 85 130 83 129 84 149 84 149 86 150 85 130 87 131 85 130 86 150 86 150 88 151 87 131 66 133 64 134 89 152 89 152 90 153 66 133 91 135 66 133 90 153 90 153 92 154 91 135 93 136 91 135 92 154 92 154 94 155 93 136 95 138 93 136 94 155 94 155 96 156 95 138 97 140 95 138 96 156 96 156 98 157 97 140 99 141 97 140 98 157 98 157 100 158 99 141 101 142 99 141 100 158 100 158 102 159 101 142 72 143 101 142 102 159 102 159 73 160 72 143 87 131 64 134 53 116 53 116 63 132 87 131 64 134 87 131 88 151 88 151 89 152 64 134 43 101 63 132 53 116 43 101 54 117 55 108 72 143 57 124 52 110 52 110 51 122 72 143 57 124 72 143 73 160 73 160 75 144 57 124 51 122 52 110 45 103 62 115 63 132 48 106 47 105 60 128 61 114 59 113 60 128 47 105 65 118 67 137 49 107 49 107 67 137 68 139 49 107 68 139 69 119 69 119 70 120 50 109 86 150 84 149 89 152 89 152 88 151 86 150 82 148 80 147 78 146 78 146 76 145 82 148 84 149 82 148 90 153 90 153 89 152 84 149 94 155 92 154 90 153 90 153 96 156 94 155 103 161 100 158 98 157 98 157 73 160 103 161 82 148 76 145 75 144 75 144 73 160 82 148 82 148 73 160 98 157 98 157 90 153 82 148 96 156 90 153 98 157 55 108 44 102 43 101 48 106 63 132 43 101 44 102 49 107 50 109</p>
        </triangles>
      </mesh>
      <extra>
        <technique profile="MAYA">
          <double_sided>1</double_sided>
        </technique>
      </extra>
    </geometry>
  </library_geometries>
  <library_controllers>
    <controller id="S_J7Mesh-skin" name="skinCluster1">
      <skin source="#S_J7Mesh">
        <bind_shape_matrix>1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1</bind_shape_matrix>
        <source id="S_J7Mesh-skin-joints">
          <Name_array id="S_J7Mesh-skin-joints-array" count="2">bone0 bone1</Name_array>
          <technique_common>
            <accessor source="#S_J7Mesh-skin-joints-array" count="2" stride="1">
              <param name="JOINT" type="Name"/>
            </accessor>
          </technique_common>
        </source>
        <source id="S_J7Mesh-skin-bind_poses">
          <float_array id="S_J7Mesh-skin-bind_poses-array" count="32">0.503027 0 -0.864271 0 0 0.96581 0 0 0.864271 0 0.503027 0 0 0 0 1 0.503027 0 -0.864271 0 0 1.00303 0 -3.56288 0.864271 0 0.503027 0 0 0 0 1</float_array>
          <technique_common>
            <accessor source="#S_J7Mesh-skin-bind_poses-array" count="2" stride="16">
              <param name="TRANSFORM" type="float4x4"/>
            </accessor>
          </technique_common>
        </source>
        <source id="S_J7Mesh-skin-weights">
          <float_array id="S_J7Mesh-skin-weights-array" count="209">1 0.577022 0.422978 0.576848 0.423152 0.576848 0.423152 0.576994 0.423006 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.623743 0.376257 0.5 0.5 0.5 0.5 0.576994 0.423006 0.577022 0.422978 0.5 0.5 0.5 0.5 0.623743 0.376257 0.5 0.5 0.5 0.5 0.577005 0.422995 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.577005 0.422995 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.500028 0.499972 0.5 0.5 0.500032 0.499968 0.500026 0.499974 0.5 0.5 0.500023 0.499977 0.5 0.5 0.500023 0.499977 0.5 0.5 0.50003 0.49997 0.5 0.5 0.500025 0.499975 0.5 0.5 0.500026 0.499974 0.5 0.5 0.500027 0.499973 0.50003 0.49997 0.500035 0.499965 0.5 0.5 0.500024 0.499976 0.5 0.5 0.500022 0.499978 0.5 0.5 0.500022 0.499978 0.5 0.5 0.50003 0.49997 0.5 0.5 0.500026 0.499974 0.5 0.5 0.500023 0.499977 0.50003 0.49997</float_array>
          <technique_common>
            <accessor source="#S_J7Mesh-skin-weights-array" count="209" stride="1">
              <param name="WEIGHT" type="float"/>
            </accessor>
          </technique_common>
        </source>
        <joints>
          <input semantic="JOINT" source="#S_J7Mesh-skin-joints"/>
          <input semantic="INV_BIND_MATRIX" source="#S_J7Mesh-skin-bind_poses"/>
        </joints>
        <vertex_weights count="104">
          <input semantic="JOINT" source="#S_J7Mesh-skin-joints" offset="0"/>
          <input semantic="WEIGHT" source="#S_J7Mesh-skin-weights" offset="1"/>
          <vcount>2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 </vcount>
          <v>0 1 1 2 0 3 1 4 0 5 1 6 0 7 1 8 0 9 1 10 0 11 1 12 0 13 1 14 0 15 1 16 0 17 1 18 0 19 1 20 0 21 1 22 0 23 1 24 0 25 1 26 0 27 1 28 0 29 1 30 0 31 1 32 0 33 1 34 0 35 1 36 0 37 1 38 0 39 1 40 0 41 1 42 0 43 1 44 0 45 1 46 0 47 1 48 0 49 1 50 0 51 1 52 0 53 1 54 0 55 1 56 0 57 1 58 0 59 1 60 0 61 1 62 0 63 1 64 0 65 1 66 0 67 1 68 0 69 1 70 0 71 1 72 0 73 1 74 0 75 1 76 0 77 1 78 0 79 1 80 0 81 1 82 0 83 1 84 0 85 1 86 0 87 1 88 0 89 1 90 0 91 1 92 0 93 1 94 0 95 1 96 0 97 1 98 0 99 1 100 0 101 1 102 0 103 1 104 0 105 1 106 0 107 1 108 0 109 1 110 0 111 1 112 0 113 1 114 0 115 1 116 0 117 1 118 0 119 1 120 0 121 1 122 0 123 1 124 0 125 1 126 0 127 1 128 0 129 1 130 0 131 1 132 0 133 1 134 0 135 1 136 0 137 1 138 0 139 1 140 0 141 1 142 0 143 1 144 0 145 1 146 0 147 1 148 0 149 1 150 0 151 1 152 0 153 1 154 0 155 1 156 0 157 1 158 0 159 1 160 0 161 1 162 0 163 1 164 0 165 1 166 0 167 1 168 0 169 1 170 0 171 1 172 0 173 1 174 0 175 1 176 0 177 1 178 0 179 1 180 0 181 1 182 0 183 1 184 0 185 1 186 0 187 1 188 0 189 1 190 0 191 1 192 0 193 1 194 0 195 1 196 0 197 1 198 0 199 1 200 0 201 1 202 0 203 1 204 0 205 1 206 0 207 1 208</v>
        </vertex_weights>
      </skin>
    </controller>
  </library_controllers>
  <library_visual_scenes>
    <visual_scene id="VisualSceneNode" name="J7">
      <node id="J7_Joint1" name="J7_Joint1" sid="bone0" type="JOINT">
        <matrix sid="transform">0.811622 0 0.048468 0 0 1.47287 0 0.593253 -0.047741 0 0.823979 -21.2622 0 0 0 1</matrix>
        <node id="J7_Joint2" name="J7_Joint2" sid="bone1" type="JOINT">
          <matrix sid="transform">0.940671 0 0 0 0 1.06573 0 3.44708 0 0 0.924843 0 0 0 0 1</matrix>
          <extra>
            <technique profile="MAYA">
              <segment_scale_compensate>1</segment_scale_compensate>
            </technique>
          </extra>
        </node>
        <extra>
          <technique profile="MAYA">
            <segment_scale_compensate>1</segment_scale_compensate>
          </technique>
        </extra>
      </node>
      <node id="S_J7" name="S_J7" type="NODE">
        <matrix sid="transform">1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1</matrix>
        <instance_controller url="#S_J7Mesh-skin">
          <skeleton>#J7_Joint1</skeleton>
          <bind_material>
            <technique_common>
              <instance_material symbol="M_J7SG" target="#M_J7">
                <bind_vertex_input semantic="TEX0" input_semantic="TEXCOORD" input_set="0"/>
              </instance_material>
            </technique_common>
          </bind_material>
        </instance_controller>
      </node>
      <extra>
        <technique profile="FCOLLADA">
          <start_time>0.041666</start_time>
          <end_time>2</end_time>
        </technique>
      </extra>
    </visual_scene>
  </library_visual_scenes>
  <scene>
    <instance_visual_scene url="#VisualSceneNode"/>
  </scene>
</COLLADA>
