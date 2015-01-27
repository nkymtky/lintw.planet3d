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

// ���_�ɘf���A���a1�Ƃ���i�n�����j

#declare PLANET_ROTATION_DEG = clock * 360; // ���]�ʑ�(�X�J���[)
#declare PLANET_OBLIQUITY_DEG = <0, 0, 0>; // �n���X��(�x�N�g��)
#declare PLANET_ROUNDNESS = 1; // 0�`1��0�Ȃ�~�ՁA1�Ȃ�^��

#local waterlevel = 0.23; // 23
#local Transparent = rgbt<1, 1, 1, 1>;

// ��
object
{
	OBJ_SNOW(P_LandBase(waterlevel), 0.78)
	scale 2 - 1.00001
	scale <1, 1, PLANET_ROUNDNESS> // �����ׂ�
	rotate z *  PLANET_ROTATION_DEG
	rotate PLANET_OBLIQUITY_DEG
}

// �n�\
object
{
	OBJ_LAND(P_LandBase(waterlevel), P_ForestBase, waterlevel)
	scale <1, 1, PLANET_ROUNDNESS> // �����ׂ�
	rotate z *  PLANET_ROTATION_DEG
	rotate PLANET_OBLIQUITY_DEG
}

// �C
object
{
	OBJ_SEA(P_LandBase(waterlevel), waterlevel)
	scale 2 - 0.99999
	scale <1, 1, PLANET_ROUNDNESS> // �����ׂ�
	rotate z *  PLANET_ROTATION_DEG
	rotate PLANET_OBLIQUITY_DEG
}

// �J����
camera
{
	spherical
	angle 360 180
	location 0
	look_at x
	sky z
	right <-1, 0, 0>
}

// ����
light_source
{
	0 color White * 0
}

// �V��
background { color rgb<0.0, 0.0, 0.0> } // ��

global_settings
{
	ambient_light 10
}
