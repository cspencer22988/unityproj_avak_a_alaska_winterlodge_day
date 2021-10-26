Shader "Lockwood/Mobile/VertexBlend_2Tex_Alpha" {
	Properties {
		_MainTex ("Texture 1 (alpha cut)", 2D) = "white" {}
		_Texture2 ("Texture 2", 2D) = "white" {}
		_BlendIntensity ("Blend Intensity", Float) = 0.8
		_BlendOffset ("Blend Offset", Float) = 0
		_BlendRamp ("Blend Ramp", Float) = 0.5
		_TintTexture2Intensity ("Tint Texture 2 Intensity", Float) = 0
	}
	SubShader {
		Tags { "RenderType" = "Opaque" }
		Pass {
			Tags { "RenderType" = "Opaque" }
			GpuProgramID 60953
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					uniform highp float _BlendIntensity;
					uniform highp float _BlendRamp;
					uniform highp float _BlendOffset;
					uniform highp float _TintTexture2Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp float blendFac_1;
					  lowp vec4 col2_2;
					  lowp vec4 col1_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col1_3.w = tmpvar_4.w;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_Texture2, xlv_TEXCOORD1);
					  col2_2.w = tmpvar_5.w;
					  col1_3.xyz = (tmpvar_4.xyz * xlv_COLOR0.xyz);
					  highp vec3 tmpvar_6;
					  mediump vec3 y_7;
					  y_7 = (tmpvar_5.xyz * xlv_COLOR0.xyz);
					  tmpvar_6 = mix (tmpvar_5.xyz, y_7, vec3(_TintTexture2Intensity));
					  col2_2.xyz = tmpvar_6;
					  blendFac_1 = ((xlv_COLOR0.w * (1.0 - 
					    (tmpvar_4.w * _BlendIntensity)
					  )) + _BlendOffset);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((0.5 + (
					    (blendFac_1 - 0.5)
					   / _BlendRamp)), 0.0, 1.0);
					  blendFac_1 = tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9 = mix (col1_3, col2_2, vec4(tmpvar_8));
					  col1_3 = tmpvar_9;
					  mediump vec4 tmpvar_10;
					  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
					  lowp vec4 color_11;
					  color_11 = tmpvar_10;
					  mediump vec3 tmpvar_12;
					  tmpvar_12 = (unity_Lightmap_HDR.x * color_11.xyz);
					  col1_3.xyz = (col1_3.xyz * tmpvar_12);
					  gl_FragData[0] = col1_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					uniform highp float _BlendIntensity;
					uniform highp float _BlendRamp;
					uniform highp float _BlendOffset;
					uniform highp float _TintTexture2Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp float blendFac_1;
					  lowp vec4 col2_2;
					  lowp vec4 col1_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col1_3.w = tmpvar_4.w;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_Texture2, xlv_TEXCOORD1);
					  col2_2.w = tmpvar_5.w;
					  col1_3.xyz = (tmpvar_4.xyz * xlv_COLOR0.xyz);
					  highp vec3 tmpvar_6;
					  mediump vec3 y_7;
					  y_7 = (tmpvar_5.xyz * xlv_COLOR0.xyz);
					  tmpvar_6 = mix (tmpvar_5.xyz, y_7, vec3(_TintTexture2Intensity));
					  col2_2.xyz = tmpvar_6;
					  blendFac_1 = ((xlv_COLOR0.w * (1.0 - 
					    (tmpvar_4.w * _BlendIntensity)
					  )) + _BlendOffset);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((0.5 + (
					    (blendFac_1 - 0.5)
					   / _BlendRamp)), 0.0, 1.0);
					  blendFac_1 = tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9 = mix (col1_3, col2_2, vec4(tmpvar_8));
					  col1_3 = tmpvar_9;
					  mediump vec4 tmpvar_10;
					  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
					  lowp vec4 color_11;
					  color_11 = tmpvar_10;
					  mediump vec3 tmpvar_12;
					  tmpvar_12 = (unity_Lightmap_HDR.x * color_11.xyz);
					  col1_3.xyz = (col1_3.xyz * tmpvar_12);
					  gl_FragData[0] = col1_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					uniform highp float _BlendIntensity;
					uniform highp float _BlendRamp;
					uniform highp float _BlendOffset;
					uniform highp float _TintTexture2Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp float blendFac_1;
					  lowp vec4 col2_2;
					  lowp vec4 col1_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col1_3.w = tmpvar_4.w;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_Texture2, xlv_TEXCOORD1);
					  col2_2.w = tmpvar_5.w;
					  col1_3.xyz = (tmpvar_4.xyz * xlv_COLOR0.xyz);
					  highp vec3 tmpvar_6;
					  mediump vec3 y_7;
					  y_7 = (tmpvar_5.xyz * xlv_COLOR0.xyz);
					  tmpvar_6 = mix (tmpvar_5.xyz, y_7, vec3(_TintTexture2Intensity));
					  col2_2.xyz = tmpvar_6;
					  blendFac_1 = ((xlv_COLOR0.w * (1.0 - 
					    (tmpvar_4.w * _BlendIntensity)
					  )) + _BlendOffset);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((0.5 + (
					    (blendFac_1 - 0.5)
					   / _BlendRamp)), 0.0, 1.0);
					  blendFac_1 = tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9 = mix (col1_3, col2_2, vec4(tmpvar_8));
					  col1_3 = tmpvar_9;
					  mediump vec4 tmpvar_10;
					  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
					  lowp vec4 color_11;
					  color_11 = tmpvar_10;
					  mediump vec3 tmpvar_12;
					  tmpvar_12 = (unity_Lightmap_HDR.x * color_11.xyz);
					  col1_3.xyz = (col1_3.xyz * tmpvar_12);
					  gl_FragData[0] = col1_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  tmpvar_2 = tmpvar_1;
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					uniform highp float _BlendIntensity;
					uniform highp float _BlendRamp;
					uniform highp float _BlendOffset;
					uniform highp float _TintTexture2Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp float blendFac_1;
					  lowp vec4 col2_2;
					  lowp vec4 col1_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col1_3.w = tmpvar_4.w;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_Texture2, xlv_TEXCOORD1);
					  col2_2.w = tmpvar_5.w;
					  col1_3.xyz = (tmpvar_4.xyz * xlv_COLOR0.xyz);
					  highp vec3 tmpvar_6;
					  mediump vec3 y_7;
					  y_7 = (tmpvar_5.xyz * xlv_COLOR0.xyz);
					  tmpvar_6 = mix (tmpvar_5.xyz, y_7, vec3(_TintTexture2Intensity));
					  col2_2.xyz = tmpvar_6;
					  blendFac_1 = ((xlv_COLOR0.w * (1.0 - 
					    (tmpvar_4.w * _BlendIntensity)
					  )) + _BlendOffset);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((0.5 + (
					    (blendFac_1 - 0.5)
					   / _BlendRamp)), 0.0, 1.0);
					  blendFac_1 = tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9 = mix (col1_3, col2_2, vec4(tmpvar_8));
					  col1_3 = tmpvar_9;
					  mediump vec4 tmpvar_10;
					  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
					  lowp vec4 color_11;
					  color_11 = tmpvar_10;
					  mediump vec3 tmpvar_12;
					  tmpvar_12 = (unity_Lightmap_HDR.x * color_11.xyz);
					  col1_3.xyz = (col1_3.xyz * tmpvar_12);
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  col1_3.xyz = mix (unity_FogColor.xyz, col1_3.xyz, vec3(tmpvar_13));
					  gl_FragData[0] = col1_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  tmpvar_2 = tmpvar_1;
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					uniform highp float _BlendIntensity;
					uniform highp float _BlendRamp;
					uniform highp float _BlendOffset;
					uniform highp float _TintTexture2Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp float blendFac_1;
					  lowp vec4 col2_2;
					  lowp vec4 col1_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col1_3.w = tmpvar_4.w;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_Texture2, xlv_TEXCOORD1);
					  col2_2.w = tmpvar_5.w;
					  col1_3.xyz = (tmpvar_4.xyz * xlv_COLOR0.xyz);
					  highp vec3 tmpvar_6;
					  mediump vec3 y_7;
					  y_7 = (tmpvar_5.xyz * xlv_COLOR0.xyz);
					  tmpvar_6 = mix (tmpvar_5.xyz, y_7, vec3(_TintTexture2Intensity));
					  col2_2.xyz = tmpvar_6;
					  blendFac_1 = ((xlv_COLOR0.w * (1.0 - 
					    (tmpvar_4.w * _BlendIntensity)
					  )) + _BlendOffset);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((0.5 + (
					    (blendFac_1 - 0.5)
					   / _BlendRamp)), 0.0, 1.0);
					  blendFac_1 = tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9 = mix (col1_3, col2_2, vec4(tmpvar_8));
					  col1_3 = tmpvar_9;
					  mediump vec4 tmpvar_10;
					  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
					  lowp vec4 color_11;
					  color_11 = tmpvar_10;
					  mediump vec3 tmpvar_12;
					  tmpvar_12 = (unity_Lightmap_HDR.x * color_11.xyz);
					  col1_3.xyz = (col1_3.xyz * tmpvar_12);
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  col1_3.xyz = mix (unity_FogColor.xyz, col1_3.xyz, vec3(tmpvar_13));
					  gl_FragData[0] = col1_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  tmpvar_2 = tmpvar_1;
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					uniform highp float _BlendIntensity;
					uniform highp float _BlendRamp;
					uniform highp float _BlendOffset;
					uniform highp float _TintTexture2Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp float blendFac_1;
					  lowp vec4 col2_2;
					  lowp vec4 col1_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col1_3.w = tmpvar_4.w;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_Texture2, xlv_TEXCOORD1);
					  col2_2.w = tmpvar_5.w;
					  col1_3.xyz = (tmpvar_4.xyz * xlv_COLOR0.xyz);
					  highp vec3 tmpvar_6;
					  mediump vec3 y_7;
					  y_7 = (tmpvar_5.xyz * xlv_COLOR0.xyz);
					  tmpvar_6 = mix (tmpvar_5.xyz, y_7, vec3(_TintTexture2Intensity));
					  col2_2.xyz = tmpvar_6;
					  blendFac_1 = ((xlv_COLOR0.w * (1.0 - 
					    (tmpvar_4.w * _BlendIntensity)
					  )) + _BlendOffset);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((0.5 + (
					    (blendFac_1 - 0.5)
					   / _BlendRamp)), 0.0, 1.0);
					  blendFac_1 = tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9 = mix (col1_3, col2_2, vec4(tmpvar_8));
					  col1_3 = tmpvar_9;
					  mediump vec4 tmpvar_10;
					  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
					  lowp vec4 color_11;
					  color_11 = tmpvar_10;
					  mediump vec3 tmpvar_12;
					  tmpvar_12 = (unity_Lightmap_HDR.x * color_11.xyz);
					  col1_3.xyz = (col1_3.xyz * tmpvar_12);
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  col1_3.xyz = mix (unity_FogColor.xyz, col1_3.xyz, vec3(tmpvar_13));
					  gl_FragData[0] = col1_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  tmpvar_2 = tmpvar_1;
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					uniform highp float _BlendIntensity;
					uniform highp float _BlendRamp;
					uniform highp float _BlendOffset;
					uniform highp float _TintTexture2Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp float blendFac_1;
					  lowp vec4 col2_2;
					  lowp vec4 col1_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col1_3.w = tmpvar_4.w;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_Texture2, xlv_TEXCOORD1);
					  col2_2.w = tmpvar_5.w;
					  col1_3.xyz = (tmpvar_4.xyz * xlv_COLOR0.xyz);
					  highp vec3 tmpvar_6;
					  mediump vec3 y_7;
					  y_7 = (tmpvar_5.xyz * xlv_COLOR0.xyz);
					  tmpvar_6 = mix (tmpvar_5.xyz, y_7, vec3(_TintTexture2Intensity));
					  col2_2.xyz = tmpvar_6;
					  blendFac_1 = ((xlv_COLOR0.w * (1.0 - 
					    (tmpvar_4.w * _BlendIntensity)
					  )) + _BlendOffset);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((0.5 + (
					    (blendFac_1 - 0.5)
					   / _BlendRamp)), 0.0, 1.0);
					  blendFac_1 = tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9 = mix (col1_3, col2_2, vec4(tmpvar_8));
					  col1_3 = tmpvar_9;
					  mediump vec4 tmpvar_10;
					  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
					  lowp vec4 color_11;
					  color_11 = tmpvar_10;
					  mediump vec3 tmpvar_12;
					  tmpvar_12 = (unity_Lightmap_HDR.x * color_11.xyz);
					  col1_3.xyz = (col1_3.xyz * tmpvar_12);
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  col1_3.xyz = mix (unity_FogColor.xyz, col1_3.xyz, vec3(tmpvar_13));
					  gl_FragData[0] = col1_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  tmpvar_2 = tmpvar_1;
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					uniform highp float _BlendIntensity;
					uniform highp float _BlendRamp;
					uniform highp float _BlendOffset;
					uniform highp float _TintTexture2Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp float blendFac_1;
					  lowp vec4 col2_2;
					  lowp vec4 col1_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col1_3.w = tmpvar_4.w;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_Texture2, xlv_TEXCOORD1);
					  col2_2.w = tmpvar_5.w;
					  col1_3.xyz = (tmpvar_4.xyz * xlv_COLOR0.xyz);
					  highp vec3 tmpvar_6;
					  mediump vec3 y_7;
					  y_7 = (tmpvar_5.xyz * xlv_COLOR0.xyz);
					  tmpvar_6 = mix (tmpvar_5.xyz, y_7, vec3(_TintTexture2Intensity));
					  col2_2.xyz = tmpvar_6;
					  blendFac_1 = ((xlv_COLOR0.w * (1.0 - 
					    (tmpvar_4.w * _BlendIntensity)
					  )) + _BlendOffset);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((0.5 + (
					    (blendFac_1 - 0.5)
					   / _BlendRamp)), 0.0, 1.0);
					  blendFac_1 = tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9 = mix (col1_3, col2_2, vec4(tmpvar_8));
					  col1_3 = tmpvar_9;
					  mediump vec4 tmpvar_10;
					  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
					  lowp vec4 color_11;
					  color_11 = tmpvar_10;
					  mediump vec3 tmpvar_12;
					  tmpvar_12 = (unity_Lightmap_HDR.x * color_11.xyz);
					  col1_3.xyz = (col1_3.xyz * tmpvar_12);
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  col1_3.xyz = mix (unity_FogColor.xyz, col1_3.xyz, vec3(tmpvar_13));
					  gl_FragData[0] = col1_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  tmpvar_2 = tmpvar_1;
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					uniform highp float _BlendIntensity;
					uniform highp float _BlendRamp;
					uniform highp float _BlendOffset;
					uniform highp float _TintTexture2Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp float blendFac_1;
					  lowp vec4 col2_2;
					  lowp vec4 col1_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col1_3.w = tmpvar_4.w;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_Texture2, xlv_TEXCOORD1);
					  col2_2.w = tmpvar_5.w;
					  col1_3.xyz = (tmpvar_4.xyz * xlv_COLOR0.xyz);
					  highp vec3 tmpvar_6;
					  mediump vec3 y_7;
					  y_7 = (tmpvar_5.xyz * xlv_COLOR0.xyz);
					  tmpvar_6 = mix (tmpvar_5.xyz, y_7, vec3(_TintTexture2Intensity));
					  col2_2.xyz = tmpvar_6;
					  blendFac_1 = ((xlv_COLOR0.w * (1.0 - 
					    (tmpvar_4.w * _BlendIntensity)
					  )) + _BlendOffset);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((0.5 + (
					    (blendFac_1 - 0.5)
					   / _BlendRamp)), 0.0, 1.0);
					  blendFac_1 = tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9 = mix (col1_3, col2_2, vec4(tmpvar_8));
					  col1_3 = tmpvar_9;
					  mediump vec4 tmpvar_10;
					  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
					  lowp vec4 color_11;
					  color_11 = tmpvar_10;
					  mediump vec3 tmpvar_12;
					  tmpvar_12 = (unity_Lightmap_HDR.x * color_11.xyz);
					  col1_3.xyz = (col1_3.xyz * tmpvar_12);
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  col1_3.xyz = mix (unity_FogColor.xyz, col1_3.xyz, vec3(tmpvar_13));
					  gl_FragData[0] = col1_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp float tmpvar_5;
					  tmpvar_5 = (unity_FogParams.x * tmpvar_3.z);
					  tmpvar_2 = tmpvar_1;
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = exp2((-(tmpvar_5) * tmpvar_5));
					  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					uniform highp float _BlendIntensity;
					uniform highp float _BlendRamp;
					uniform highp float _BlendOffset;
					uniform highp float _TintTexture2Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp float blendFac_1;
					  lowp vec4 col2_2;
					  lowp vec4 col1_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col1_3.w = tmpvar_4.w;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_Texture2, xlv_TEXCOORD1);
					  col2_2.w = tmpvar_5.w;
					  col1_3.xyz = (tmpvar_4.xyz * xlv_COLOR0.xyz);
					  highp vec3 tmpvar_6;
					  mediump vec3 y_7;
					  y_7 = (tmpvar_5.xyz * xlv_COLOR0.xyz);
					  tmpvar_6 = mix (tmpvar_5.xyz, y_7, vec3(_TintTexture2Intensity));
					  col2_2.xyz = tmpvar_6;
					  blendFac_1 = ((xlv_COLOR0.w * (1.0 - 
					    (tmpvar_4.w * _BlendIntensity)
					  )) + _BlendOffset);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((0.5 + (
					    (blendFac_1 - 0.5)
					   / _BlendRamp)), 0.0, 1.0);
					  blendFac_1 = tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9 = mix (col1_3, col2_2, vec4(tmpvar_8));
					  col1_3 = tmpvar_9;
					  mediump vec4 tmpvar_10;
					  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
					  lowp vec4 color_11;
					  color_11 = tmpvar_10;
					  mediump vec3 tmpvar_12;
					  tmpvar_12 = (unity_Lightmap_HDR.x * color_11.xyz);
					  col1_3.xyz = (col1_3.xyz * tmpvar_12);
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  col1_3.xyz = mix (unity_FogColor.xyz, col1_3.xyz, vec3(tmpvar_13));
					  gl_FragData[0] = col1_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp float tmpvar_5;
					  tmpvar_5 = (unity_FogParams.x * tmpvar_3.z);
					  tmpvar_2 = tmpvar_1;
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = exp2((-(tmpvar_5) * tmpvar_5));
					  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					uniform highp float _BlendIntensity;
					uniform highp float _BlendRamp;
					uniform highp float _BlendOffset;
					uniform highp float _TintTexture2Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp float blendFac_1;
					  lowp vec4 col2_2;
					  lowp vec4 col1_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col1_3.w = tmpvar_4.w;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_Texture2, xlv_TEXCOORD1);
					  col2_2.w = tmpvar_5.w;
					  col1_3.xyz = (tmpvar_4.xyz * xlv_COLOR0.xyz);
					  highp vec3 tmpvar_6;
					  mediump vec3 y_7;
					  y_7 = (tmpvar_5.xyz * xlv_COLOR0.xyz);
					  tmpvar_6 = mix (tmpvar_5.xyz, y_7, vec3(_TintTexture2Intensity));
					  col2_2.xyz = tmpvar_6;
					  blendFac_1 = ((xlv_COLOR0.w * (1.0 - 
					    (tmpvar_4.w * _BlendIntensity)
					  )) + _BlendOffset);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((0.5 + (
					    (blendFac_1 - 0.5)
					   / _BlendRamp)), 0.0, 1.0);
					  blendFac_1 = tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9 = mix (col1_3, col2_2, vec4(tmpvar_8));
					  col1_3 = tmpvar_9;
					  mediump vec4 tmpvar_10;
					  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
					  lowp vec4 color_11;
					  color_11 = tmpvar_10;
					  mediump vec3 tmpvar_12;
					  tmpvar_12 = (unity_Lightmap_HDR.x * color_11.xyz);
					  col1_3.xyz = (col1_3.xyz * tmpvar_12);
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  col1_3.xyz = mix (unity_FogColor.xyz, col1_3.xyz, vec3(tmpvar_13));
					  gl_FragData[0] = col1_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp float tmpvar_5;
					  tmpvar_5 = (unity_FogParams.x * tmpvar_3.z);
					  tmpvar_2 = tmpvar_1;
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = exp2((-(tmpvar_5) * tmpvar_5));
					  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					uniform highp float _BlendIntensity;
					uniform highp float _BlendRamp;
					uniform highp float _BlendOffset;
					uniform highp float _TintTexture2Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp float blendFac_1;
					  lowp vec4 col2_2;
					  lowp vec4 col1_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col1_3.w = tmpvar_4.w;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_Texture2, xlv_TEXCOORD1);
					  col2_2.w = tmpvar_5.w;
					  col1_3.xyz = (tmpvar_4.xyz * xlv_COLOR0.xyz);
					  highp vec3 tmpvar_6;
					  mediump vec3 y_7;
					  y_7 = (tmpvar_5.xyz * xlv_COLOR0.xyz);
					  tmpvar_6 = mix (tmpvar_5.xyz, y_7, vec3(_TintTexture2Intensity));
					  col2_2.xyz = tmpvar_6;
					  blendFac_1 = ((xlv_COLOR0.w * (1.0 - 
					    (tmpvar_4.w * _BlendIntensity)
					  )) + _BlendOffset);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((0.5 + (
					    (blendFac_1 - 0.5)
					   / _BlendRamp)), 0.0, 1.0);
					  blendFac_1 = tmpvar_8;
					  highp vec4 tmpvar_9;
					  tmpvar_9 = mix (col1_3, col2_2, vec4(tmpvar_8));
					  col1_3 = tmpvar_9;
					  mediump vec4 tmpvar_10;
					  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
					  lowp vec4 color_11;
					  color_11 = tmpvar_10;
					  mediump vec3 tmpvar_12;
					  tmpvar_12 = (unity_Lightmap_HDR.x * color_11.xyz);
					  col1_3.xyz = (col1_3.xyz * tmpvar_12);
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  col1_3.xyz = mix (unity_FogColor.xyz, col1_3.xyz, vec3(tmpvar_13));
					  gl_FragData[0] = col1_3;
					}
					
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" }
					"!!GLES"
				}
			}
		}
		Pass {
			Name "META"
			Tags { "LIGHTMODE" = "META" "RenderType" = "Opaque" }
			Cull Off
			GpuProgramID 70579
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 vertex_3;
					  vertex_3 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_3.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_4;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_4 = 0.0001;
					    } else {
					      tmpvar_4 = 0.0;
					    };
					    vertex_3.z = tmpvar_4;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_3.xy = ((_glesMultiTexCoord1.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_5;
					    if ((vertex_3.z > 0.0)) {
					      tmpvar_5 = 0.0001;
					    } else {
					      tmpvar_5 = 0.0;
					    };
					    vertex_3.z = tmpvar_5;
					  };
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = vertex_3.xyz;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = vec2(0.0, 0.0);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					uniform highp float _BlendIntensity;
					uniform highp float _BlendRamp;
					uniform highp float _BlendOffset;
					uniform highp float _TintTexture2Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp float blendFac_1;
					  lowp vec4 tex2_2;
					  lowp vec4 tex_3;
					  mediump vec3 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_3.w = tmpvar_6.w;
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_Texture2, xlv_TEXCOORD1);
					  tex2_2.w = tmpvar_7.w;
					  tex_3.xyz = (tmpvar_6.xyz * xlv_COLOR0.xyz);
					  highp vec3 tmpvar_8;
					  mediump vec3 y_9;
					  y_9 = (tmpvar_7.xyz * xlv_COLOR0.xyz);
					  tmpvar_8 = mix (tmpvar_7.xyz, y_9, vec3(_TintTexture2Intensity));
					  tex2_2.xyz = tmpvar_8;
					  blendFac_1 = ((xlv_COLOR0.w * (1.0 - 
					    (tmpvar_6.w * _BlendIntensity)
					  )) + _BlendOffset);
					  highp float tmpvar_10;
					  tmpvar_10 = clamp ((0.5 + (
					    (blendFac_1 - 0.5)
					   / _BlendRamp)), 0.0, 1.0);
					  blendFac_1 = tmpvar_10;
					  highp vec4 tmpvar_11;
					  tmpvar_11 = mix (tex_3, tex2_2, vec4(tmpvar_10));
					  tex_3 = tmpvar_11;
					  tmpvar_4 = tex_3.xyz;
					  mediump vec4 res_12;
					  res_12 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_13;
					    tmpvar_13.w = 1.0;
					    tmpvar_13.xyz = tmpvar_4;
					    res_12.w = tmpvar_13.w;
					    highp vec3 tmpvar_14;
					    tmpvar_14 = clamp (pow (tmpvar_4, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_12.xyz = tmpvar_14;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_15;
					    if (bool(unity_UseLinearSpace)) {
					      emission_15 = tmpvar_5;
					    } else {
					      emission_15 = (tmpvar_5 * ((tmpvar_5 * 
					        ((tmpvar_5 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_16;
					    tmpvar_16.w = 1.0;
					    tmpvar_16.xyz = emission_15;
					    res_12 = tmpvar_16;
					  };
					  gl_FragData[0] = res_12;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 vertex_3;
					  vertex_3 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_3.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_4;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_4 = 0.0001;
					    } else {
					      tmpvar_4 = 0.0;
					    };
					    vertex_3.z = tmpvar_4;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_3.xy = ((_glesMultiTexCoord1.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_5;
					    if ((vertex_3.z > 0.0)) {
					      tmpvar_5 = 0.0001;
					    } else {
					      tmpvar_5 = 0.0;
					    };
					    vertex_3.z = tmpvar_5;
					  };
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = vertex_3.xyz;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = vec2(0.0, 0.0);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					uniform highp float _BlendIntensity;
					uniform highp float _BlendRamp;
					uniform highp float _BlendOffset;
					uniform highp float _TintTexture2Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp float blendFac_1;
					  lowp vec4 tex2_2;
					  lowp vec4 tex_3;
					  mediump vec3 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_3.w = tmpvar_6.w;
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_Texture2, xlv_TEXCOORD1);
					  tex2_2.w = tmpvar_7.w;
					  tex_3.xyz = (tmpvar_6.xyz * xlv_COLOR0.xyz);
					  highp vec3 tmpvar_8;
					  mediump vec3 y_9;
					  y_9 = (tmpvar_7.xyz * xlv_COLOR0.xyz);
					  tmpvar_8 = mix (tmpvar_7.xyz, y_9, vec3(_TintTexture2Intensity));
					  tex2_2.xyz = tmpvar_8;
					  blendFac_1 = ((xlv_COLOR0.w * (1.0 - 
					    (tmpvar_6.w * _BlendIntensity)
					  )) + _BlendOffset);
					  highp float tmpvar_10;
					  tmpvar_10 = clamp ((0.5 + (
					    (blendFac_1 - 0.5)
					   / _BlendRamp)), 0.0, 1.0);
					  blendFac_1 = tmpvar_10;
					  highp vec4 tmpvar_11;
					  tmpvar_11 = mix (tex_3, tex2_2, vec4(tmpvar_10));
					  tex_3 = tmpvar_11;
					  tmpvar_4 = tex_3.xyz;
					  mediump vec4 res_12;
					  res_12 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_13;
					    tmpvar_13.w = 1.0;
					    tmpvar_13.xyz = tmpvar_4;
					    res_12.w = tmpvar_13.w;
					    highp vec3 tmpvar_14;
					    tmpvar_14 = clamp (pow (tmpvar_4, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_12.xyz = tmpvar_14;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_15;
					    if (bool(unity_UseLinearSpace)) {
					      emission_15 = tmpvar_5;
					    } else {
					      emission_15 = (tmpvar_5 * ((tmpvar_5 * 
					        ((tmpvar_5 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_16;
					    tmpvar_16.w = 1.0;
					    tmpvar_16.xyz = emission_15;
					    res_12 = tmpvar_16;
					  };
					  gl_FragData[0] = res_12;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 vertex_3;
					  vertex_3 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_3.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_4;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_4 = 0.0001;
					    } else {
					      tmpvar_4 = 0.0;
					    };
					    vertex_3.z = tmpvar_4;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_3.xy = ((_glesMultiTexCoord1.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_5;
					    if ((vertex_3.z > 0.0)) {
					      tmpvar_5 = 0.0001;
					    } else {
					      tmpvar_5 = 0.0;
					    };
					    vertex_3.z = tmpvar_5;
					  };
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = vertex_3.xyz;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = vec2(0.0, 0.0);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					uniform highp float _BlendIntensity;
					uniform highp float _BlendRamp;
					uniform highp float _BlendOffset;
					uniform highp float _TintTexture2Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp float blendFac_1;
					  lowp vec4 tex2_2;
					  lowp vec4 tex_3;
					  mediump vec3 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_3.w = tmpvar_6.w;
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_Texture2, xlv_TEXCOORD1);
					  tex2_2.w = tmpvar_7.w;
					  tex_3.xyz = (tmpvar_6.xyz * xlv_COLOR0.xyz);
					  highp vec3 tmpvar_8;
					  mediump vec3 y_9;
					  y_9 = (tmpvar_7.xyz * xlv_COLOR0.xyz);
					  tmpvar_8 = mix (tmpvar_7.xyz, y_9, vec3(_TintTexture2Intensity));
					  tex2_2.xyz = tmpvar_8;
					  blendFac_1 = ((xlv_COLOR0.w * (1.0 - 
					    (tmpvar_6.w * _BlendIntensity)
					  )) + _BlendOffset);
					  highp float tmpvar_10;
					  tmpvar_10 = clamp ((0.5 + (
					    (blendFac_1 - 0.5)
					   / _BlendRamp)), 0.0, 1.0);
					  blendFac_1 = tmpvar_10;
					  highp vec4 tmpvar_11;
					  tmpvar_11 = mix (tex_3, tex2_2, vec4(tmpvar_10));
					  tex_3 = tmpvar_11;
					  tmpvar_4 = tex_3.xyz;
					  mediump vec4 res_12;
					  res_12 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_13;
					    tmpvar_13.w = 1.0;
					    tmpvar_13.xyz = tmpvar_4;
					    res_12.w = tmpvar_13.w;
					    highp vec3 tmpvar_14;
					    tmpvar_14 = clamp (pow (tmpvar_4, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_12.xyz = tmpvar_14;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_15;
					    if (bool(unity_UseLinearSpace)) {
					      emission_15 = tmpvar_5;
					    } else {
					      emission_15 = (tmpvar_5 * ((tmpvar_5 * 
					        ((tmpvar_5 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_16;
					    tmpvar_16.w = 1.0;
					    tmpvar_16.xyz = emission_15;
					    res_12 = tmpvar_16;
					  };
					  gl_FragData[0] = res_12;
					}
					
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES"
				}
			}
		}
	}
	Fallback "Lockwood/VertexBlend_2Tex"
}