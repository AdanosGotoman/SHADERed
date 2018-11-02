cbuffer cbPerFrame : register(b0)
{
	float4x4 matVP;
};

struct VSInput
{
	float3 Position : POSITION;
	float3 Normal : NORMAL;
};

struct VSOutput
{
	float4 Position : SV_POSITION;
	float4 Color : COLOR;
};

VSOutput main(VSInput vin)
{
	VSOutput vout = (VSOutput)0;

	vout.Position = mul(float4(vin.Position, 1.0f), matVP);
	vout.Color = abs(float4(vin.Normal,1)) * 1.0f;

	return vout;
}