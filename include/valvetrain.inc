#declare valve = lathe {
   linear_spline
   6,
   <0, 0.7>, <0.02, 0.7>, <0.02, 0.05>, <0.1, 0.02>, <0.15, 0>, <0, 0>
}

#declare exvalve_pair = union {
   object {
      valve
      rotate x*16.2
      translate <-0.175, 0.043527, 0.25>
   }
   
   object {
      valve
      rotate x*16.2
      translate <0.175, 0.043527, 0.25>
   }
}

#declare cyl1_in = min(0, (sin (clock + 0.75 ) * 2 * pi)/4) ;
#declare cyl3_in = min(0, (sin (clock + 0.5  ) * 2 * pi)/4) ;
#declare cyl4_in = min(0, (sin (clock + 0.25 ) * 2 * pi)/4) ;
#declare cyl2_in = min(0, (sin (clock + 0    ) * 2 * pi)/4) ;

#declare cyl1_ex = min(0, (sin (clock + 0    ) * 2 * pi)/4) ;
#declare cyl3_ex = min(0, (sin (clock + 0.75 ) * 2 * pi)/4) ;
#declare cyl4_ex = min(0, (sin (clock + 0.5  ) * 2 * pi)/4) ;
#declare cyl2_ex = min(0, (sin (clock + 0.25 ) * 2 * pi)/4) ;


#macro ValvePair(ValveOpening, Position) 
    union {
        object {
            valve
            translate <0, ValveOpening ,0>
            rotate x*16.2
            translate <-0.175, 0.045, 0.25>
        }
        
        object {
            valve
            translate <0, ValveOpening ,0>
            rotate x*16.2
            translate <0.175, 0.045, 0.25>
        }

        translate x * Position
    }
#end


#declare valveset_inlet = union {
   object { exvalve_pair translate x*(-1.875) }
   object { exvalve_pair translate x*(-0.625) }
   object { exvalve_pair translate x*0.625 }
   object { exvalve_pair translate x*1.875 }
}

#declare valveset_exhaust = union {   
   object { ValvePair(cyl1_ex, -1.875) }
   object { ValvePair(cyl2_ex, -0.625) }
   object { ValvePair(cyl3_ex, 0.625) }
   object { ValvePair(cyl4_ex, 1.875) }
}
#declare camangle = -clock * 360;

#declare valvetrain = union {
   object {
      //*PMName inlet_cam
      camshaft
      rotate <camangle,0,0>
      translate <0, 1, 0.5>
   }
   
   object {
      //*PMName exhaust_cam
      camshaft
      rotate <camangle+90,0,0>
      translate <0, 1, -0.5>
   }
   
   object { valveset_inlet }
   object { valveset_exhaust scale <1, 1, -1> }
   
   texture { ShinyMetal }
}
