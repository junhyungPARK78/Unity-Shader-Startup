Shader "Custom/NewSurfaceShader_116_TEST" {
	Properties {
		_Red ("Red", range(0,1)) = 0
		_Green ("Green", range(0,1)) = 0
		_Blue ("Blue", range(0,1)) = 0
		_BrightDark ("Brightness & Darkness", range(-1,1)) = 0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		
		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows
		
		struct Input {
			float4 color : COLOR ;
		};

		float _Red;
		float _Green;
		float _Blue;
		float _BrightDark;

		UNITY_INSTANCING_BUFFER_START(Props)
		UNITY_INSTANCING_BUFFER_END(Props)

		void surf (Input IN, inout SurfaceOutputStandard o) {
			o.Albedo = float3 (_Red, _Green, _Blue) + _BrightDark;
			o.Alpha = 1;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
