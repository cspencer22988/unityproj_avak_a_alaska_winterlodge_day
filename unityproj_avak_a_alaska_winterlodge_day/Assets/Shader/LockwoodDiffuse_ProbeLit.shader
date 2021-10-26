Shader "Lockwood/Diffuse_ProbeLit" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
		Pass {
			Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
			GpuProgramID 19079
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  highp mat3 tmpvar_4;
					  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _glesNormal);
					  worldN_1 = tmpvar_5;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = normalize(worldN_1);
					  mediump vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = tmpvar_6;
					  mediump vec3 res_8;
					  mediump vec3 x_9;
					  x_9.x = dot (unity_SHAr, tmpvar_7);
					  x_9.y = dot (unity_SHAg, tmpvar_7);
					  x_9.z = dot (unity_SHAb, tmpvar_7);
					  mediump vec3 x1_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
					  x1_10.x = dot (unity_SHBr, tmpvar_11);
					  x1_10.y = dot (unity_SHBg, tmpvar_11);
					  x1_10.z = dot (unity_SHBb, tmpvar_11);
					  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
					    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
					  )));
					  res_8 = max (((1.055 * 
					    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_8);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_EXP" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_EXP" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_EXP" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_EXP" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_EXP" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_EXP" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_EXP" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_EXP" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_EXP" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform lowp vec4 _LightColor0;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldN_1;
					  highp vec3 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp mat3 tmpvar_5;
					  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
					  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
					  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * _glesNormal);
					  worldN_1 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldN_1);
					  mediump vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tmpvar_7;
					  mediump vec3 res_9;
					  mediump vec3 x_10;
					  x_10.x = dot (unity_SHAr, tmpvar_8);
					  x_10.y = dot (unity_SHAg, tmpvar_8);
					  x_10.z = dot (unity_SHAb, tmpvar_8);
					  mediump vec3 x1_11;
					  mediump vec4 tmpvar_12;
					  tmpvar_12 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
					  x1_11.x = dot (unity_SHBr, tmpvar_12);
					  x1_11.y = dot (unity_SHBg, tmpvar_12);
					  x1_11.z = dot (unity_SHBb, tmpvar_12);
					  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
					    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
					  )));
					  res_9 = max (((1.055 * 
					    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  tmpvar_2 = (_LightColor0.xyz + res_9);
					  highp float tmpvar_13;
					  tmpvar_13 = (unity_FogParams.x * tmpvar_3.z);
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = exp2((-(tmpvar_13) * tmpvar_13));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_2.w;
					  tex_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD1);
					  highp float tmpvar_3;
					  tmpvar_3 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_1.xyz = mix (unity_FogColor.xyz, tex_1.xyz, vec3(tmpvar_3));
					  gl_FragData[0] = tex_1;
					}
					
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_EXP2" }
					"!!GLES"
				}
			}
		}
	}
	Fallback "Unlit/Texture"
}