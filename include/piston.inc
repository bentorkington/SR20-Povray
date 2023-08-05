#declare AluminiumPigment = pigment { color rgb <0.780392, 0.780392, 0.780392> }

#declare PistonTexture = texture {
   pigment { AluminiumPigment }
   
   // attempt at a spun-like texture
   //normal { waves 0.35 frequency 2 scale 0.01 }

   finish {
      phong 0.2
      metallic 1
      roughness 0.05
      
      reflection { rgb <0.290196, 0.290196, 0.290196>, rgb <0, 0, 0> }
   }
}

#declare CastAluminium = texture {
    pigment { AluminiumPigment }
    normal { wrinkles 0.15 scale 0.05 }
    finish {
        ambient rgb <0.278431, 0.278431, 0.278431>
        metallic 1
        specular 0.8
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

#declare piston_flat = union {
    box { <0.8, 0.65, -1>, <1.01, 1.35, 1> }
    cylinder { <0.8 + 0.2, 0.65, -1>, <0.8 + 0.2, 0.65, 1> 0.2 }
    cylinder { <0.8 + 0.2, 1.35, -1>, <0.8 + 0.2, 1.35, 1> 0.2 }

    texture { CastAluminium }
}

#declare sr20_piston = union {
   difference {
      object { piston_lathe }
      
      // gudgeon pin bore
      cylinder { <1.05, 1, 0>, <-1.05, 1, 0>, 0.32328 }
      
      // piston top shape
      union {
         cylinder { <0, 1.95, 0>, <0, 2.05, 0>, 0.85 }
         torus { 0.85, .05 translate y * 2 }
         texture { CastAluminium }
      }

      object { piston_flat }
      object { piston_flat scale <-1, 1, 1> }

      
      box { <-0.35, -0.1, -0.5>, <0.35, 1.5, 0.5> }
      
      cylinder { <-1.05, -0.85, 0>, <1.05, -0.85, 0>, 1.25 } // counterweight interference
      
      texture { PistonTexture }    
   }
   
   object { gudgeonpin }
}
