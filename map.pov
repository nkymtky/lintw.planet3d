#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"

#include "p_landbase.inc"
#include "p_forestbase.inc"

#include "obj_cumulonimbus.inc"
#include "obj_atmosphere.inc"
#include "obj_snow.inc"
#include "obj_land.inc"
#include "obj_sea.inc"

// +W1000 +H500

// 原点に惑星、半径1とする（地動説）

#declare PLANET_ROTATION_DEG = clock * 360; // 自転位相(スカラー)
#declare PLANET_OBLIQUITY_DEG = <0, 0, 0>; // 地軸傾斜(ベクトル)
#declare PLANET_ROUNDNESS = 1; // 0～1で0なら円盤、1なら真球

#local waterlevel = 0.23; // 23
#local Transparent = rgbt<1, 1, 1, 1>;

// 雪
object
{
	OBJ_SNOW(P_LandBase(waterlevel), 0.78)
	scale 2 - 1.00001
	scale <1, 1, PLANET_ROUNDNESS> // 少し潰す
	rotate z *  PLANET_ROTATION_DEG
	rotate PLANET_OBLIQUITY_DEG
}

// 地表
object
{
	OBJ_LAND(P_LandBase(waterlevel), P_ForestBase, waterlevel)
	scale <1, 1, PLANET_ROUNDNESS> // 少し潰す
	rotate z *  PLANET_ROTATION_DEG
	rotate PLANET_OBLIQUITY_DEG
}

// 海
object
{
	OBJ_SEA(P_LandBase(waterlevel), waterlevel)
	scale 2 - 0.99999
	scale <1, 1, PLANET_ROUNDNESS> // 少し潰す
	rotate z *  PLANET_ROTATION_DEG
	rotate PLANET_OBLIQUITY_DEG
}

// カメラ
camera
{
	spherical
	angle 360 180
	location 0
	look_at x
	sky z
	right <-1, 0, 0>
}

// 光源
light_source
{
	0 color White * 0
}

// 天球
background { color rgb<0.0, 0.0, 0.0> } // 黒

global_settings
{
	ambient_light 10
}
