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

/*
[Test]
+Otest +FN -A +W500 +H500

[Large Black]
+Oblack +FN +A +W1500 +H1500

[Large Transparent]
+Otransparent +FN +UA +A +W1500 +H1500

[Animation]
+Oanim/o +W240 +H240 +KFI0 +KFF128
*/

// 原点に惑星、半径1とする（地動説）

#declare PLANET_ROTATION_DEG = clock * 360; // 自転位相(スカラー)
#declare PLANET_OBLIQUITY_DEG = <0, 8, 0>; // 地軸傾斜(ベクトル)
#declare PLANET_ROUNDNESS = 1; // 0～1で0なら円盤、1なら真球

#local sun_dis = 100;
#local sun_radius = 20;
#declare SUN_PHASE_DEG = 125; // ここを変えたらlight_sourceも調整が必要
#local sun_loc = <sun_dis*sin(radians(SUN_PHASE_DEG)), -sun_dis*cos(radians(SUN_PHASE_DEG)), 0>; // 太陽の位置

#local camera_dis = 8; // カメラの恒星からの距離
#local camera_deg = SUN_PHASE_DEG + 45; // カメラの角度
#local camera_loc = <camera_dis*sin(radians(camera_deg)), -camera_dis*cos(radians(camera_deg)), 0>; // カメラの位置

#local waterlevel = 0.23; // 0.23
#local Transparent = rgbt<1, 1, 1, 1>;

#local land_base = P_LandBase(waterlevel);

// 大気
object
{
	OBJ_ATMOSPHERE()
	scale 1.01
	scale <1, 1, PLANET_ROUNDNESS> // 少し潰す
	rotate z *  PLANET_ROTATION_DEG
	rotate PLANET_OBLIQUITY_DEG
}

// 積乱雲
object
{
	OBJ_CUMULONIMBUS()
	scale 1.003
	scale <1, 1, PLANET_ROUNDNESS> // 少し潰す
	rotate z *  PLANET_ROTATION_DEG
	rotate PLANET_OBLIQUITY_DEG
}

// 雪
object
{
	OBJ_SNOW(land_base, 0.78)
	scale 1.000001
	scale <1, 1, PLANET_ROUNDNESS> // 少し潰す
	rotate z *  PLANET_ROTATION_DEG
	rotate PLANET_OBLIQUITY_DEG
}

// 地表
object
{
	OBJ_LAND(land_base, P_ForestBase, waterlevel)
	scale <1, 1, PLANET_ROUNDNESS> // 少し潰す
	rotate z *  PLANET_ROTATION_DEG
	rotate PLANET_OBLIQUITY_DEG
}

// 海
object
{
	OBJ_SEA(land_base, waterlevel)
	scale 0.999999
	scale <1, 1, PLANET_ROUNDNESS> // 少し潰す
	rotate z *  PLANET_ROTATION_DEG
	rotate PLANET_OBLIQUITY_DEG
}

// カメラ
camera
{
	location camera_loc
	sky <0, 0, 1>
	right <-1, 0, 0> // 右手座標系
	look_at 0
	angle 15
}

// 光源
light_source
{
	sun_loc
	color White*1.0
}

/*      
// 面光源にすることで、昼と夜の境界がなめらかになる
light_source
{
	<sun_dis, 0, 0> color White * 1.0
	area_light
	<sun_dis,-sun_radius/2,-sun_radius/2>,
	<sun_dis, sun_radius/2, sun_radius/2>,
	5, 5
	jitter
	circular
}
*/

// 天球
// background { color rgbt<0.0, 0.0, 0.0, 1.0> } // 透明
background { color rgb<0.0, 0.0, 0.0> } // 黒

global_settings
{
	ambient_light 0
}
