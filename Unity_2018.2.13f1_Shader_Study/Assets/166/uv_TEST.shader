Shader "Custom/uv" {
	Properties {
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_UvScrollX ("UVscrollX", range(-1,1)) = 0
		_UvScrollY ("UVscrollY", range(-1,1)) = 0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }

		CGPROGRAM
		#pragma surface surf Standard

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};

		float _UvScrollX;
		float _UvScrollY;

		void surf (Input IN, inout SurfaceOutputStandard o) {
			fixed4 c = tex2D (_MainTex, float2(IN.uv_MainTex.x + _UvScrollX, IN.uv_MainTex.y + _UvScrollY));
			o.Emission = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
