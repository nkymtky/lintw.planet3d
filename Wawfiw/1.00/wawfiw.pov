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

#declare r1 = 0.0; // ƒŠƒ“ƒO“à‘¤‚Ì”¼Œa(–¢g—p)
#declare r2 = 2.6; // ƒŠƒ“ƒOŠO‘¤‚Ì”¼Œa
#declare c = 7; // ƒJƒƒ‰‚Ì‹——£
#declare s = 20; // P¯‚Ì‹——£

#declare henpei = 0.99; // 0`1‚Å0‚È‚ç‰~”ÕA1‚È‚ç^‹…

#declare prot = <5, 12, 0>; // ˜f¯‚Ì‰ñ“]
#declare crot = <0, 0, 0>; // ƒJƒƒ‰‚Ì‰ñ“]
#declare srot = <0, 5, 110>; // P¯‚Ì‰ñ“]

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
	scale <1, 1, henpei> // ­‚µ’×‚·
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

// ƒJƒƒ‰
camera
{
	location <0, -c, 0>
	sky <0, 0, 1>
	right <-1, 0, 0>
	rotate crot
	look_at 0
	angle 45
}


// ŒõŒ¹
light_source
{
	<0, -s, 0>
	color White
	rotate srot
}

// “V‹…
background { color 0 }

