#declare crank_bigend_ko = box {
   <-0.35, -0.34, 0.34>, <0.35, 0.34, -0.34>
}

#declare bigend_offset = union {
   intersection {
      prism {
         bezier_spline
         linear_sweep
         0.05, -0.15,
         24,
         <-0.2916, 0.58646>, <-0.1369, 1.012>, <0.15521, 1.0503>, <0.33339, 0.52535>, <0.33339, 0.52535>, <0.39463, 0.43436>, <0.45799, 0.19629>, <0.48663, 0.01852>, <0.48663, 0.01852>, <0.56135, 0.0092219>, <0.45615, 0.016009>, <0.58964, 0.017118>, <0.58964, 0.017118>, <0.56316, -0.68304>, <-0.51527, -0.82604>, <-0.5657, -0.0085864>, <-0.5657, -0.0085864>, <-0.48262, -0.0095648>, <-0.54954, 0.010474>, <-0.47009, 0.010595>, <-0.47009, 0.010595>, <-0.46063, 0.1615>, <-0.34643, 0.49361>, <-0.2916, 0.58646>
         scale 1
         rotate <0, 90, 90>
      }
      
      cylinder {
         <1.6, -0.45, 0.5>, <1.6, -0.45, -0.5>, 4
         scale 1
         rotate <0, 0, 0>
         translate <2.32481, 0.435415, 0>
      }
   }
   
   cylinder {
      <0, 0, 0>, <-0.25, 0, 0>, 0.4
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   prism {
      //*PMName counterweight
      bezier_spline
      linear_sweep
      0.15, -0.15,
      24,
      <-0.198297, 0.0344155>, <-0.0591473, 0.0245401>, <-0.000295499, 0.00841316>, <0.107907, 0.0277324>, <0.107907, 0.0277324>, <0.215799, -0.0166059>, <0.333586, 0.0330092>, <0.48663, 0.01852>, <0.48663, 0.01852>, <0.56135, 0.0092219>, <0.45615, 0.016009>, <0.58964, 0.017118>, <0.58964, 0.017118>, <0.692327, -1.05804>, <-0.66527, -1.18437>, <-0.5657, -0.0085864>, <-0.5657, -0.0085864>, <-0.48262, -0.0095648>, <-0.54954, 0.010474>, <-0.47009, 0.010595>, <-0.47009, 0.010595>, <-0.359551, 0.0215451>, <-0.268677, 0.0348688>, <-0.198297, 0.0344155>
      scale 1
      rotate <0, 90, 90>
   }
   translate x*(-0.29)
   
   bounded_by {
      box {
         <-0.558437, -0.888909, -0.610565>, <-0.114736, 0.947834, 0.636923>
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
   }
}


#declare cshft_bigend_jnl = merge {
   object { bigend_offset }
   
   object {
      bigend_offset
      scale <-1, 1, 1>
   }
}

#declare cranksprocket = difference {
   union {
      cylinder { <0, 0, -0.05>, <0, 0, 0.05>, 0.2 }
      
      lathe {
         linear_spline
         4,
         <0, 0.35>, <0.2, 0.35>, <0.2, 0>, <0, 0>
         rotate x*(-90)
      }
      
      difference {
         cylinder { <0, 0.00416667, -0.12467>, <0, 0.00416667, -0.0134729>, 0.254076 }
         
         torus {
            0.275, 0.076
            rotate x*90
            translate z*(-0.125)
         }
      }
   }
   //*PMRawBegin
   #declare i = 0;
   union {
   #while (i<18)
   cylinder { <0,0.245,-0.06>,<0,0.245,0.06>, 0.04
   rotate <0,0, i * 20>
   }
   #declare i=i+1;
   #end
   }
   //*PMRawEnd
}

#declare cshaft_main = cylinder {
   <-2.5, 0, 0>, <2.5, 0, 0>, 0.337
   
   texture {
      ShinyMetal
   }
   scale 1
   rotate <0, 0, 0>
   translate <0, 0, 0>
}

#declare crankshaft_assy = merge {
   difference {
      //*PMName main_journals
      
      object {
         //*PMName crank_main
         cshaft_main
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      merge {
         //*PMName bigend_kos
         
         object {
            //*PMName ko_4
            crank_bigend_ko
            scale 1
            rotate <0, 0, 0>
            translate x*1.875
         }
         
         object {
            //*PMName ko_3
            crank_bigend_ko
            scale 1
            rotate <0, 0, 0>
            translate x*0.625
         }
         
         object {
            //*PMName ko_2
            crank_bigend_ko
            scale 1
            rotate <0, 0, 0>
            translate x*(-0.625)
         }
         
         object {
            //*PMName ko_1
            crank_bigend_ko
            scale 1
            rotate <0, 0, 0>
            translate x*(-1.875)
         }
      }
   }
   
   merge {
      //*PMName bigend_assys
      
      object {
         //*PMName big_end_jnl_4
         cshft_bigend_jnl
         scale 1
         rotate <0, 0, 0>
         translate x*1.875
      }
      
      object {
         //*PMName big_end_jnl_1
         cshft_bigend_jnl
         scale 1
         rotate <0, 0, 0>
         translate x*(-1.875)
      }
      
      object {
         //*PMName big_end_jnl_3
         cshft_bigend_jnl
         scale 1
         rotate x*180
         translate x*0.625
      }
      
      object {
         //*PMName big_end_jnl_2
         cshft_bigend_jnl
         scale 1
         rotate x*180
         translate x*(-0.625)
      }
   }
   
   object {
      //*PMName sprocket
      cranksprocket
      scale 1
      rotate y*(-90)
      translate x*(-3)
   }
   
   pigment {
      color rgb <0.619608, 0.619608, 0.619608>
   }
}
