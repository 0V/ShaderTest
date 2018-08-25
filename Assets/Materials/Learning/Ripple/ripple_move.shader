Shader "Custom/move_ripple" {
	Properties{
		_CnterPos("Center", Vector) = (0,0,0)
		_Thickness("Thickness", Float) = 0.2
		_Frequency("Frequency", Float) = 3
		_Speed("Speed", Float) = 3
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
	float _Frequency;
	float _Speed;

	void surf(Input IN, inout SurfaceOutputStandard o) {
		float dist = distance(_CnterPos, IN.worldPos);
		float val = abs(sin(dist*_Frequency + _Time * _Speed));
		if (val > (1 - _Thickness)) {
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
