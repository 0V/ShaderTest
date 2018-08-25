Shader "Custom/ring" {
	Properties{
		_CnterPos("Center", Vector) = (0,0,0)
		_Thickness("Thickness", Float) = 0.2
		_Radius("Radius", Float) =2
	}
	SubShader{
		Tags{ "RenderType" = "Opaque" }
		LOD 200

		CGPROGRAM
#pragma surface surf Standard 
#pragma target 3.0

		struct Input {
		float3 worldPos;
	};

	fixed3 _CnterPos;
	float _Thickness;
	float _Radius;

	void surf(Input IN, inout SurfaceOutputStandard o) {
		float dist = distance(_CnterPos, IN.worldPos);
		if (_Radius < dist && dist < _Radius + _Thickness) {
			o.Albedo = fixed4(1,1,1,1);
		}
		else {
			o.Albedo = fixed4(110 / 255.0, 87 / 255.0, 139 / 255.0, 1);
		}
	}
	ENDCG
	}
	FallBack "Diffuse"
}
