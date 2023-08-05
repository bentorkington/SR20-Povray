
#declare PistonTexture = texture {
   pigment { color rgb <0.780392, 0.780392, 0.780392> }
   
   finish {
      phong 0.2
      metallic 1
      roughness 0.05
      
      reflection { rgb <0.290196, 0.290196, 0.290196>, rgb <0, 0, 0> }
   }
}

#declare gudgeonpin = difference {
   cylinder { <0.7, 1, 0>, <-0.7, 1, 0>, 0.32328 }
   cylinder { <0.75, 1, 0>, <-0.75, 1, 0>, 0.225 }
   texture { BlockText }
}

#declare ring_void = difference {
   cylinder { <0, 0, 0>, <0, 0.05, 0> 1.1 }
   cylinder { <0, -0.001, 0>, <0, 0.0501, 0> 0.95 }
}

#declare piston_shape = cylinder { <0, 0, 0> <0, 2, 0> 0.9995 }

#declare piston_lathe = difference {
   object { piston_shape }
   object { ring_void translate y * 1.85 }
   object { ring_void translate y * 1.75 }
   object { ring_void translate y * 1.65 }
}

#declare sr20_cyl_bore = cylinder {
   <0, 2.8, 0>, <0, 0, 0>, 0.5
   texture { SleeveTexture }
}

#declare sr20_cyl_sleeve = difference {
   cylinder { <0, 2.8, 0>, <0, 0, 0>, 0.5051 }
   cylinder { <0, 2.8, 0>, <0, 0, 0>, 0.5 }
}

#declare sr20_piston = union {
   difference {
      object { piston_lathe }
      
      cylinder { <1.05, 1, 0>, <-1.05, 1, 0>, 0.32328 }
      
      // piston top shape
      union {
         cylinder { <0, 1.95, 0>, <0, 2.05, 0>, 0.85 }
         torus { 0.85, .05 translate y * 2 }
         texture { BlockBumpy }
      }

      superellipsoid {
         <0.15, 0.15>
         rotate x*90
         translate <-1.7345, 0.55905, 0>
      }
      
      superellipsoid {
         <0.15, 0.15>
         rotate x*90
         translate <1.7345, 0.55905, 0>
      }
      
      box { <-0.35, -0.1, -0.5>, <0.35, 1.5, 0.5> }
      
      cylinder { <-1.05, -0.75, 0>, <1.05, -0.75, 0>, 1.25 } // counterweight interference
      
      pigment { color rgb <0.780392, 0.780392, 0.780392> }
      
      finish {
         phong 0.2
         metallic 1
         roughness 0.05
         
         reflection {
            rgb <0.380392, 0.380392, 0.380392>, rgb <0, 0, 0>
         }
      }      
   }
   
   object { gudgeonpin }
}
