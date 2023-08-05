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

#declare newvalvepair_1IN = union {
   object {
      valve
      translate <0, cyl1_in ,0>
      rotate x*16.2
      translate <-0.175, 0.045, 0.25>
   }
   
   object {
      valve
      translate <0, cyl1_in ,0>
      rotate x*16.2
      translate <0.175, 0.045, 0.25>
   }
}

#declare newvalvepair_3IN = union {
   object {
      valve
      translate <0, cyl3_in ,0>
      rotate x*16.2
      translate <-0.175, 0.045, 0.25>
   }
   
   object {
      valve
      translate <0, cyl3_in ,0>
      rotate x*16.2
      translate <0.175, 0.045, 0.25>
   }
}

#declare newvalvepair_4IN = union {
   object {
      valve
      translate <0, cyl4_in ,0>
      rotate x*16.2
      translate <-0.175, 0.045, 0.25>
   }
   
   object {
      valve
      translate <0, cyl4_in ,0>
      rotate x*16.2
      translate <0.175, 0.045, 0.25>
   }
}

#declare newvalvepair_2IN = union {
   object {
      valve
      translate <0, cyl2_in ,0>
      rotate x*16.2
      translate <-0.175, 0.045, 0.25>
   }
   
   object {
      valve
      translate <0, cyl2_in ,0>
      rotate x*16.2
      translate <0.175, 0.045, 0.25>
   }
}

#declare newvalvepair_1OUT = union {
   object {
      valve
      translate <0, cyl1_ex ,0>
      rotate x*16.2
      translate <-0.175, 0.045, 0.25>
   }
   
   object {
      valve
      translate <0, cyl1_ex ,0>
      rotate x*16.2
      translate <0.175, 0.045, 0.25>
   }
}

#declare newvalvepair_3OUT = union {
   object {
      valve
      translate <0, cyl3_ex ,0>
      rotate x*16.2
      translate <-0.175, 0.045, 0.25>
   }
   
   object {
      valve
      translate <0, cyl3_ex ,0>
      rotate x*16.2
      translate <0.175, 0.045, 0.25>
   }
}

#declare newvalvepair_4OUT = union {
   object {
      valve
      translate <0, cyl4_ex ,0>
      rotate x*16.2
      translate <-0.175, 0.045, 0.25>
   }
   
   object {
      valve
      translate <0, cyl4_ex ,0>
      rotate x*16.2
      translate <0.175, 0.045, 0.25>
   }
}

#declare newvalvepair_2OUT = union {
   object {
      valve
      translate <0, cyl2_ex ,0>
      rotate x*16.2
      translate <-0.175, 0.045, 0.25>
   }
   
   object {
      valve
      translate <0, cyl2_ex ,0>
      rotate x*16.2
      translate <0.175, 0.045, 0.25>
   }
}

#declare valveset_inlet = union {
   //*PMName inlet_valves
   
   object {
      exvalve_pair
      translate x*(-1.875)
   }
   
   object {
      //*PMName 2
      exvalve_pair
      translate x*(-0.625)
   }
   
   object {
      exvalve_pair
      translate x*0.625
   }
   
   object {
      exvalve_pair
      translate x*1.875
   }
}

#declare valveset_exhaust = union {
   //*PMName outlet_valves
   
   object {
      newvalvepair_1OUT
      translate x*(-1.875)
   }
   
   object {
      //*PMName 2
      newvalvepair_2OUT
      translate x*(-0.625)
   }
   
   object {
      newvalvepair_3OUT
      translate x*0.625
   }
   
   object {
      newvalvepair_4OUT
      translate x*1.875
   }
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
   
   object {
      valveset_exhaust
      scale <1, 1, -1>
   }
   
   texture { ShinyMetal }
}