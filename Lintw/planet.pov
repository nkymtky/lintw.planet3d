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

// ���_�ɘf���A���a1�Ƃ���i�n�����j

#declare PLANET_ROTATION_DEG = clock * 360; // ���]�ʑ�(�X�J���[)
#declare PLANET_OBLIQUITY_DEG = <0, 8, 0>; // �n���X��(�x�N�g��)
#declare PLANET_ROUNDNESS = 1; // 0�`1��0�Ȃ�~�ՁA1�Ȃ�^��

#local sun_dis = 100;
#local sun_radius = 20;
#declare SUN_PHASE_DEG = 125; // ������ς�����light_source���������K�v
#local sun_loc = <sun_dis*sin(radians(SUN_PHASE_DEG)), -sun_dis*cos(radians(SUN_PHASE_DEG)), 0>; // ���z�̈ʒu

#local camera_dis = 8; // �J�����̍P������̋���
#local camera_deg = SUN_PHASE_DEG + 45; // �J�����̊p�x
#local camera_loc = <camera_dis*sin(radians(camera_deg)), -camera_dis*cos(radians(camera_deg)), 0>; // �J�����̈ʒu

#local waterlevel = 0.23; // 0.23
#local Transparent = rgbt<1, 1, 1, 1>;

#local land_base = P_LandBase(waterlevel);

// ��C
object
{
	OBJ_ATMOSPHERE()
	scale 1.01
	scale <1, 1, PLANET_ROUNDNESS> // �����ׂ�
	rotate z *  PLANET_ROTATION_DEG
	rotate PLANET_OBLIQUITY_DEG
}

// �ϗ��_
object
{
	OBJ_CUMULONIMBUS()
	scale 1.003
	scale <1, 1, PLANET_ROUNDNESS> // �����ׂ�
	rotate z *  PLANET_ROTATION_DEG
	rotate PLANET_OBLIQUITY_DEG
}

// ��
object
{
	OBJ_SNOW(land_base, 0.78)
	scale 1.000001
	scale <1, 1, PLANET_ROUNDNESS> // �����ׂ�
	rotate z *  PLANET_ROTATION_DEG
	rotate PLANET_OBLIQUITY_DEG
}

// �n�\
object
{
	OBJ_LAND(land_base, P_ForestBase, waterlevel)
	scale <1, 1, PLANET_ROUNDNESS> // �����ׂ�
	rotate z *  PLANET_ROTATION_DEG
	rotate PLANET_OBLIQUITY_DEG
}

// �C
object
{
	OBJ_SEA(land_base, waterlevel)
	scale 0.999999
	scale <1, 1, PLANET_ROUNDNESS> // �����ׂ�
	rotate z *  PLANET_ROTATION_DEG
	rotate PLANET_OBLIQUITY_DEG
}

// �J����
camera
{
	location camera_loc
	sky <0, 0, 1>
	right <-1, 0, 0> // �E����W�n
	look_at 0
	angle 15
}

// ����
light_source
{
	sun_loc
	color White*1.0
}

/*      
// �ʌ����ɂ��邱�ƂŁA���Ɩ�̋��E���Ȃ߂炩�ɂȂ�
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

// �V��
// background { color rgbt<0.0, 0.0, 0.0, 1.0> } // ����
background { color rgb<0.0, 0.0, 0.0> } // ��

global_settings
{
	ambient_light 0
}
