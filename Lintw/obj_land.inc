#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"

#macro OBJ_LAND(P_LandBase, P_ForestBase, waterlevel)

#local P_Forest = pigment
{ 
	pigment_pattern { P_ForestBase }
	color_map
	{
		[0.00 rgb<0.30, 0.58, 0.55>] // 水色(ハイライト)
		[0.08 rgb<0.20, 0.38, 0.40>] // 水色
		[0.38 rgb<0.46, 0.28, 0.26>] // 赤
		[0.40 rgb<0.15, 0.33, 0.25>] // 緑
		[0.45 rgb<0.32, 0.33, 0.32>] // 灰色
		[0.65 rgb<0.28, 0.28, 0.28>] // 灰色
		[0.80 rgb<0.45, 0.30, 0.24>] // オレンジ
		[1.00 rgb<0.58, 0.40, 0.32>] // オレンジ
	}
};

/*
		[0.00 rgb<0.68, 0.26, 0.55>] // 赤紫(ハイライト)
		[0.08 rgb<0.48, 0.26, 0.25>] // 赤
		[0.25 rgb<0.20, 0.38, 0.40>] // 水色
		[0.45 rgb<0.32, 0.33, 0.32>] // 灰色
		[0.75 rgb<0.28, 0.28, 0.28>] // 灰色
		[0.90 rgb<0.45, 0.30, 0.24>] // オレンジ
		[1.00 rgb<0.58, 0.40, 0.32>] // オレンジ
*/

sphere
{
	0, 1
	texture
	{
		pigment
		{
			pigment_pattern { P_LandBase }
			pigment_map
			{
				[0.00 color Transparent]
				[waterlevel color Transparent] // 透明
				[waterlevel color rgb<0.78, 0.72, 0.50> * 0.90] // 砂浜
				[waterlevel + 0.02 color rgb<0.30, 0.28, 0.22>]
				[waterlevel + 0.03 P_Forest] [0.29 P_Forest] // 森(丘)
				[waterlevel + (1-waterlevel-0.03) * 33 / 77 rgb<0.35, 0.36, 0.32> * 0.7] // 山
				[1 color rgb<0.65, 0.76, 0.32>]
			}
		}
		normal
		{
			pigment_pattern { P_LandBase }
			0.01
		}
		finish
		{
			diffuse 1
			brilliance 0.75
		}
	}
}
	
#end
