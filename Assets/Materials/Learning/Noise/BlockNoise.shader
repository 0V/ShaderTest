Shader "Custom/BlockNoise" {
	Properties{
		_MainTex("Albedo (RGB)", 2D) = "white" {}
	_BlockCount("Block Count", Int) = 8
	}
		SubShader{
		Tags{ "RenderType" = "Opaque" }
		LOD 200

		CGPROGRAM
#pragma surface surf Standard fullforwardshadows
#pragma target 3.0

		sampler2D _MainTex;

	struct Input {
		float2 uv_MainTex;
	};

	int _BlockCount;

	float random(fixed2 p)
	{
		return frac(sin(dot(p, fixed2(12.9898,78.233))) * 43758.5453);
	}

	float noise(fixed2 st)
	{
		fixed2 p = floor(st);
		return random(p);
	}

	void surf(Input IN, inout SurfaceOutputStandard o)
	{
		float c = noise(IN.uv_MainTex * _BlockCount);
		o.Albedo = fixed4(c,c,c,1);
	}
	ENDCG
	}
		FallBack "Diffuse"
}