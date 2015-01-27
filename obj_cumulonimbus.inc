#include "colors.inc"
#include "shapes.inc"

#macro OBJ_CUMULONIMBUS()

	#local Transparent = rgbt<1, 1, 1, 1>;
	
	// scallop_waveは積乱雲(Cumulonimbus)に適している
	#local P_SmallCloud01 = pigment
	{
		wrinkles color_map
		{
			[0.0 color White transmit 0]
			[1.0 color White transmit 1]
		}
		scallop_wave
		scale 0.05
		rotate z * (clock * 180)  
		noise_generator 3
	};
	
	#local P_SmallCloud02 = pigment
	{
		wrinkles color_map
		{
			[0.0 color White transmit 0]
			[1.0 color White transmit 1]
		}
		scallop_wave
		scale 0.02
		rotate z * (clock * 60)
		noise_generator 3
	};
	
	#local P_Region = pigment
	{
		wrinkles  
		
		scale 0.25
		rotate z * (clock * 120)    
		   
		lambda 0.6
		octaves 2
		turbulence 0.5
	};
	
	#declare P_Cumulonimbus = pigment
	{
		// Region
		pigment_pattern { P_Region }
		pigment_map
		{
			[0.00 color Transparent]
			[0.45 color Transparent]
			[0.70 P_SmallCloud01]
			[0.75 color Transparent]
			[0.80 P_SmallCloud02]
			[0.99 P_SmallCloud02]
		}
	};
	
	sphere
	{
		0, 1
		texture
		{
			P_Cumulonimbus
			finish
			{
				diffuse 1.0 // 1.5くらいでもいいかも？
				brilliance 0.75
			}
		}
		hollow // 付け忘れないこと！
	}

#end
