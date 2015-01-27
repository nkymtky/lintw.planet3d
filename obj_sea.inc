#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"

#macro OBJ_SEA(P_LandBase, waterlevel)

sphere
{
	0, 1
	pigment
	{
		pigment_pattern { P_LandBase }
		color_map
		{
			[0.00 color rgb<0.10, 0.30, 0.35>]
			[waterlevel - 0.10 color rgb<0.15, 0.35, 0.40>]
			[waterlevel - 0.04 color rgb<0.20, 0.50, 0.55>]
			[waterlevel color rgb<0.20, 0.70, 0.60>]
		}
	}
	finish
	{
		diffuse 1.0  
		brilliance 0.75
		specular 0.78
		roughness 0.008 // ‚­‚Á‚«‚è‚¶‚á‚È‚³
	}
	hollow
}

#end
