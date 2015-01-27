#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"

#macro P_LandBase(waterlevel)

#local Transparent = rgbt<1, 1, 1, 1>;

#local Bozo01 = pigment
{
	bozo color_map
	{
		[0.00 color White * 0.00 transmit 0]
		[1.00 color White * 0.08 transmit 0]
	}        
	turbulence 0.2
	scale 0.31
};

#local _Wrinkles01 = pigment
{
	wrinkles color_map
	{
		[0.00 color White * 0.00 transmit 0]
		[0.04 color White * 0.25 transmit 0]
		[0.12 color White * 0.33 transmit 0]
		[0.30 color White * 0.40 transmit 0] // éRÇÕÇ∂Ç‹ÇË
		[0.40 color White * 0.45 transmit 0]
		[0.50 color White * 0.55 transmit 0]
		[0.60 color White * 0.58 transmit 0]
		[0.70 color White * 0.66 transmit 0]
		[0.80 color White * 0.75 transmit 0]
		[0.90 color White * 0.86 transmit 0]
		[1.00 color White * 1.00 transmit 0]
	}
	poly_wave 4 // x^e (not e^x)
	turbulence 0.25
	scale 0.27    
	translate z * 0.22 // Ç±Ç±ÇÃílÇïœÇ¶ÇƒÇ®ãCÇ…è¢Ç∑Ç‹Ç≈
};

#local Wrinkles01 = pigment
{
	pigment_pattern { _Wrinkles01 }
	pigment_map
	{
		[0.00 Bozo01] // ê[äC
		[0.08 _Wrinkles01]
	}
};

#local River = pigment { color White * (waterlevel - 0.01) transmit 0 };

#local RiverOrWrinkles01 = pigment
{
	pigment_pattern
	{
		bozo
		turbulence 0.2
		scale 0.31
	}
	pigment_map
	{
		[0.00 River]
		[0.50 River]
		[0.75 Wrinkles01]
	}
};

#local _Clackle01 = pigment
{
	crackle metric 1 color_map
	{
		[0.00 color White * 0.00 transmit 0]
		[0.08 color White * 1.00 transmit 0]
	}
	turbulence 0.1
	scale 0.05
};

#local Crackle01 = pigment
{
	pigment_pattern { _Clackle01 }
	pigment_map
	{
		[0.00 RiverOrWrinkles01]
		[1.00 Wrinkles01]
	}
};
	
pigment
{
	Wrinkles01
	pigment_map
	{
		[0.00 Bozo01]
		[0.08 Wrinkles01]
		[waterlevel - 0.01 Wrinkles01]
		[waterlevel Crackle01]
		[waterlevel + 0.10 Crackle01]
		[(0.90-waterlevel) * 0.50 / 0.67 Wrinkles01]

	}
}
 
#end