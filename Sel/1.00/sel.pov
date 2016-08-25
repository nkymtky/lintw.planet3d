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

#declare c = 3; // �J�����̋���
#declare s = 20; // �P���̋���

#declare henpei = 0.99; // 0�`1��0�Ȃ�~�ՁA1�Ȃ�^��

#declare prot = <5, 12, 0>; // �f���̉�]
#declare crot = <0, 0, 0>; // �J�����̉�]

sphere
{
	0, 1
	pigment 
	{
		wrinkles color_map
		{
			[0.0 color rgb <1.00, 0.20, 0.40>]
			[0.55 White]
		}
		scale 0.025
		turbulence 0.5
	}
	finish
	{
		ambient 1
		brilliance 0.4
		diffuse 0.8
	}
	scale <1, 1, henpei> // �����ׂ�
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

// �V��
background { color 0 }

