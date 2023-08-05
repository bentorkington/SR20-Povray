#include "include/textures.inc"
#include "include/piston.inc"

object { sr20_piston }

light_source {
   <5.238, 5.1661, -9.86811>, rgb <1, 1, 1>
   area_light <1, 0, 0>, <0, 1, 0>, 3, 3
   circular
}

light_source {
   <-6.73485, -1.52784, -9.83273>, rgb <1, 1, 1>
   area_light <1, 0, 0>, <0, 1, 0>, 3, 3
   circular
}

sky_sphere {
   pigment {
      bozo
      
      color_map {
         [ 0 color rgb <0.164706, 0.796078, 0.968627> ]
         [ 0.8 color rgb <0.164706, 0.796078, 0.968627> ]
         [ 1 color rgb <0.972549, 1, 0.992157> ]
      }
   }
}

camera {
   orthographic
   location <3.89027, 1.84714, -4.85113>
   sky <0, 1, 0>
   direction <0, 0, 1>
   right <1.33, 0, 0>
   up <0, 1, 0>
   look_at <0, 1, 0>
   angle 25
}
