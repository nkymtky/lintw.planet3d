#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"

#local Transparent = rgbt<1, 1, 1, 1>;

#local Base01 = pigment
{
	wrinkles color_map
	{
		[0.0 color White * 1.0 transmit 0]
		[1.0 color White * 0.0 transmit 0]
	}
	sine_wave
	scale 0.23
	turbulence 0.4
};

#local Base02 = pigment
{
	crackle metric 1 color_map
	{
		[0.00 color White * 0.00 transmit 0]
		[0.24 color White * 0.50 transmit 0]
		[1.00 color White * 0.75 transmit 0]
	}
	scale 0.04
	turbulence 0.2
};

#local RegionBase = pigment
{
	bozo scale 0.75
	pigment_map
	{
		[0.30 Black]
		[0.70 White]
	}
};

#local Region = pigment
{
	RegionBase
	pigment_map
	{
		[0.00 Black]
		[0.99 bozo scale 0.25]
	}
};

#declare P_ForestBase = pigment
{
	Region
	pigment_map
	{
		[0.00 Base01]
		[0.10 Base01]
		[0.90 Base02]
		[1.00 Base02]
	}
};
