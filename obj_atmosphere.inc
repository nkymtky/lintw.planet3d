#include "colors.inc"
#include "shapes.inc"

#macro OBJ_ATMOSPHERE()

	sphere
	{
		0, 1
		pigment
		{
			color rgbt <0, 0, 0, 1>
		}
		hollow // ’†‹óƒIƒvƒVƒ‡ƒ“
		interior
		{
			media
			{
				scattering { 4, rgb <0.99, 0.58, 0.75> * 10 }
			}
		}
	}

#end