#declare SprocText = texture {
   finish {
      phong 0.1
      metallic 1
      roughness 0.3
   }
   
   pigment { color rgb <0.549, 0.475, 0.451> }
}

#declare camsprocket = difference {
   union {
      cylinder { <0, 0, -0.02>, <0, 0, 0.02>, 0.5 }
      cylinder { <0, 0.0041667, 0>, <0, 0.0041667, -0.3>, 0.175 }
      difference {
         cylinder { <0, 0.00416667, -0.12467>, <0, 0.00416667, -0.0134729>, 0.254076 }
         
         torus {
            0.275, 0.076
            rotate x*90
            translate z*(-0.095)
         }
      }
   }
   
    // sprocket teeth 
    #local i = 0;
    #while (i < 36)
    cylinder { <0, 0.495, -0.05>, <0, 0.495, 0.05>, 0.045 rotate <0,0, i * 10> }
    #local i = i + 1;
    #end

    // lightening bores
    #local i = 0;
    #while (i < 6)
    cylinder {
        <0, 0, 0.05>, <0, 0, -0.05>, 0.1
        translate x*0.3
        rotate <0, 0, i * 60>
    }
    #local i = i + 1;
    #end
   
    texture {
        SprocText
    }
}

#declare cam_lobe = prism {
   bezier_spline
   linear_sweep
   0, 0.25,
   12,
   <-0.0620931, 0.092178>, <0.0290616, 0.157045>, <0.190012, 0.0648477>, <0.197061, 0.00361682>, <0.197061, 0.00361682>, <0.204902, -0.0539845>, <0.050492, -0.132006>, <-0.0346815, -0.105879>, <-0.0346815, -0.105879>, <-0.104526, -0.0878001>, <-0.14183, 0.0352019>, <-0.0620931, 0.092178>
   scale 1
   rotate <0, 45, 90>
   translate x*0.125
}

#declare cam_journal = cylinder {
   <-0.125, 0, 0>, <0.125, 0, 0>, 0.11
}

#declare camshaft = union {
   object {
      camsprocket
      rotate y*(-90)
      translate x*(-3)
   }
   
   cylinder { <-2.9, 0, 0>, <2.5, 0, 0>, 0.1 texture { RoughMetal } }
   
   union {      
      // lobes 1, 2, 3, 4
      object { cam_lobe translate x*(-1.875) }
      object { cam_lobe rotate x*(-90) translate x*(-0.625) }
      object { cam_lobe rotate x*90 translate x*0.625 }
      object { cam_lobe rotate x*180 translate x*1.875 }
      
      object { cam_journal translate x*(-2.4) }
      object { cam_journal translate x*(-1.25) }
      object { cam_journal }
      object { cam_journal translate x*1.25 }      
      object { cam_journal translate x*2.4 }
      
      texture { ShinyMetal }
   }
}