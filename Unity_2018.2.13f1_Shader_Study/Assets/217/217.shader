Shader "Custom/217" {
	Properties {
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Metallic ("Metallic", Range (0,1)) = 0
		_Smoothness ("Smoothness", Range (0,1)) = 0.5
		_BumpMap ("Normalmap", 2D) = "bump" {}
		_StrengthNormal ("Strength of Normalmap", Range(0,2)) = 1
	}
	SubShader {
		Tags { "RenderType"="Opaque" }

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows

		sampler2D _MainTex;
		sampler2D _BumpMap;
		float _Metallic;
		float _Smoothness;
		float _StrengthNormal;

		struct Input {
			float2 uv_MainTex;
			float2 uv_BumpMap;
		};

		void surf (Input IN, inout SurfaceOutputStandard o) {
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
			float pn = _StrengthNormal;
			fixed3 n = UnpackNormal (tex2D (_BumpMap, IN.uv_BumpMap));
			o.Normal = float3 (n.x * pn, n.y * pn, n.z);
			o.Albedo = c.rgb;
			o.Metallic = _Metallic;
			o.Smoothness = _Smoothness;
			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
