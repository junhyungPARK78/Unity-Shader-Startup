Shader "Custom/fire_187" {
	Properties {
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_MainTex2 ("Albedo (RGB)", 2D) = "gray" {}
		_Wrap ("Wrap number", range (0,2)) = 0
	}
	SubShader {
		Tags { "RenderType"="Transparent" "Queue"="Transparent" }

		CGPROGRAM
		#pragma surface surf Standard alpha:fade

		sampler2D _MainTex;
		sampler2D _MainTex2;

		struct Input {
			float2 uv_MainTex;
			float2 uv_MainTex2;
		};

		float _Wrap;

		void surf (Input IN, inout SurfaceOutputStandard o) {
			fixed4 d = tex2D (_MainTex2, float2 (IN.uv_MainTex2.x, IN.uv_MainTex2.y - _Time.y));
			fixed4 c = tex2D (_MainTex, saturate(IN.uv_MainTex + (d.r-0.1) * _Wrap));
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
