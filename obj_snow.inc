#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"

#macro OBJ_SNOW(P_LandBase, waterlevel)

#local P_North = pigment
{
	gradient -z color_map
	{
		[0.0 color White * 0.0 transmit 0]
		[1.0 color White * 1.0 transmit 0]
	}
	poly_wave 1.5
	scale 1
};

#local P_South = pigment
{
	gradient z color_map
	{
		[0.0 color White * 0.0 transmit 0]
		[1.0 color White * 1.0 transmit 0]
	}
	poly_wave 1.5
	scale 1
};

#local P_Snow = pigment
{
	pigment_pattern
	{
		gradient z color_map
		{
			[0.0 color White * 0.0 transmit 0]
			[1.0 color White * 1.0 transmit 0]
		}
		scale 2
		translate z * 1
	}
	pigment_map
	{
		[0.0 P_North]
		[0.5 P_North]
		[0.5 P_South]
		[1.0 P_South]
	}
};

sphere
{
	0, 1
	texture
	{
		pigment
		{
			pigment_pattern
			{
				pigment_pattern { P_Snow }
				pigment_map
				{
					[0.00 P_LandBase]
					[1.00 color White]
				}
			}
			pigment_map
			{
				[0.00 color Transparent]
				[waterlevel - 0.005 color Transparent] // ìßñæ
				[waterlevel + 0.005 color rgb<0.93, 0.97, 1.00>]
			}
		}
		normal
		{
			pigment_pattern { P_LandBase }
			0.05
		}
		finish
		{
			diffuse 1.0
			brilliance 0.75
		}
	}
	hollow // ïtÇØñYÇÍÇ»Ç¢Ç±Ç∆ÅI
}

#end
