// +W500 +H500

#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"
#include "Woods.inc"
#include "stones.inc"
#include "glass.inc"
#include "metals.inc"

/*
[Test]
+Otest +FN -A +W500 +H500

[Large Black]
+Oblack +FN +A +W1500 +H1500

[Large Transparent]
+Otransparent +FN +UA +A +W1500 +H1500
*/

#declare r1 = 0.0; // �����O�����̔��a(���g�p)
#declare r2 = 2.6; // �����O�O���̔��a
#declare c = 7; // �J�����̋���
#declare s = 20; // �P���̋���

#declare henpei = 0.99; // 0�`1��0�Ȃ�~�ՁA1�Ȃ�^��

#declare prot = <5, 12, 0>; // �f���̉�]
#declare crot = <0, 0, 0>; // �J�����̉�]
#declare srot = <0, 5, 110>; // �P���̉�]

sphere
{
	0, 1
	pigment 
	{
		// color White
		image_map
		{
			png "face.png"
			map_type 1
		}
		rotate x*90
	}
	finish
	{
		ambient 0
		brilliance 0.4
		diffuse 0.8
	}
	scale <1, 1, henpei> // �����ׂ�
	rotate prot
}

disc
{
	<0.5, 0.5, 0>, z, 0.5, 0
	pigment 
	{
		// color White
		image_map
		{
			png "ring.png"
			map_type 0
			transmit all 0.05
		}
	}
	finish
	{
		ambient 0.0
		diffuse 2.0
	}
	translate <-0.5, -0.5, 0>
	scale <r2*2, r2*2, 1>
	rotate prot
}

// �J����
camera
{
	location <0, -c, 0>
	sky <0, 0, 1>
	right <-1, 0, 0>
	rotate crot
	look_at 0
	angle 45
}


// ����
light_source
{
	<0, -s, 0>
	color White
	rotate srot
}

// �V��
background { color 0 }

