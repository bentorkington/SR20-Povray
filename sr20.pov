global_settings {
   assumed_gamma 1.5
   noise_generator 2
}

light_source {
   <4, 5, -5>, rgb <1, 1, 1>
}
#include "shapes.inc"
#include "functions.inc"
#include "textures.inc"
#include "colors.inc"

#include "include/textures.inc"
#include "include/camshaft.inc"
#include "include/piston.inc"
#include "include/crankshaft.inc"

#declare crankangle = -clock * 360 * 2;
#declare camangle = -clock * 360;

#declare bigend_orbit = 0.5;

#declare bigend14_y = cos ( clock * pi * 4) * bigend_orbit;
#declare bigend14_x = sin ( clock * pi * 4) * bigend_orbit;
#declare bigend23_y = -bigend14_y;
#declare bigend23_x = -bigend14_x;

#declare piston14_y = 1.25+bigend14_y-(0.07295 * sin (clock * pi * 4));
#declare con_tilt14 = sin(clock * pi * 4) * 16.6;

#declare piston23_y = 1.25+bigend23_y-(0.07295 * sin (clock * pi * 4));
#declare con_tilt23 = -con_tilt14;

#declare cyl1_in = min(0, (sin (clock + 0.75 ) * 2 * pi)/4) ;
#declare cyl3_in = min(0, (sin (clock + 0.5  ) * 2 * pi)/4) ;
#declare cyl4_in = min(0, (sin (clock + 0.25 ) * 2 * pi)/4) ;
#declare cyl2_in = min(0, (sin (clock + 0    ) * 2 * pi)/4) ;

#declare cyl1_ex = min(0, (sin (clock + 0    ) * 2 * pi)/4) ;
#declare cyl3_ex = min(0, (sin (clock + 0.75 ) * 2 * pi)/4) ;
#declare cyl4_ex = min(0, (sin (clock + 0.5  ) * 2 * pi)/4) ;
#declare cyl2_ex = min(0, (sin (clock + 0.25 ) * 2 * pi)/4) ;

#declare VapourCyl = cylinder {
   <0, 0, 0>, <0, -1, 0>, 0.5
}

#declare chainlink_single = union {
   cylinder {
      <0, 0.05, 0>, <0, -0.05, 0>, 0.45
      translate x*1
   }
   
   cylinder { <0, 0.05, 0>, <0, -0.05, 0>, 0.45 }
   box { <0, -0.051, -0.451>, <1, 0.051, 0.451> }
   pigment { color rgb <0.462745, 0.407843, 0.309804> }
   finish { phong 0.5 }
}

#declare chainlink_single_0 = merge {
   cylinder {
      <0.05, 0, 0>, <-0.05, 0, 0>, 0.5
      scale 1
      rotate <0, 0, 0>
      translate y*(-1)
   }
   
   cylinder {
      <0.05, 0, 0>, <-0.05, 0, 0>, 0.5
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   box {
      <0.051, 0, -0.501>, <-0.051, -1, 0.501>
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   pigment {
      color rgb <0.462745, 0.407843, 0.309804>
   }
   
   finish {
      roughness 0.2
   }
}

#declare oldchainboss = union {
   cylinder {
      <0, 0.71, 0>, <0, -0.71, 0>, 0.1
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   cylinder {
      <0, 0.5, 0>, <0, -0.5, 0>, 0.35
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   texture {
      ShinyMetal
   }
}

#declare newchainboss = union {
   cylinder {
      <0.71, 0, 0>, <-0.71, 0, 0>, 0.1
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   cylinder {
      <0.5, 0, 0>, <-0.5, 0, 0>, 0.35
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   texture {
      ShinyMetal
   }
}

#declare link_inner = union {
   object {
      chainlink_single
      scale 1
      rotate <0, 0, 0>
      translate y*0.5
   }
   
   object {
      chainlink_single
      scale 1
      rotate <0, 0, 0>
      translate y*(-0.5)
   }
   
   object {
      oldchainboss
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   //*PMRawBegin
   scale (pi/36)
   //*PMRawEnd
}

#declare link_inner_0 = union {
   object {
      chainlink_single_0
      scale 1
      rotate <0, 0, 0>
      translate x*(-0.5)
   }
   
   object {
      chainlink_single_0
      scale 1
      rotate <0, 0, 0>
      translate x*0.5
   }
   
   object {
      newchainboss
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   scale 0.08727
}

#declare link_outer_0 = union {
   object {
      chainlink_single_0
      scale 1
      rotate <0, 0, 0>
      translate x*(-0.6)
   }
   
   object {
      chainlink_single_0
      scale 1
      rotate <0, 0, 0>
      translate x*0.6
   }
   
   object {
      newchainboss
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   scale 0.08727
}

#declare link_outer = union {
   object {
      chainlink_single
      scale 1
      rotate <0, 0, 0>
      translate y*0.6
   }
   
   object {
      chainlink_single
      scale 1
      rotate <0, 0, 0>
      translate y*(-0.6)
   }
   
   object {
      oldchainboss
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   //*PMRawBegin
   scale (pi/36)
   //*PMRawEnd
}

#declare chainphase=mod(clock * 2 * 9, 1.0);
#declare index=0;

#declare strchain = union {
#if (chainphase >= 0.5)
 #while(index<44)
   object {
     link_outer_0
     translate <0,-index*0.08727-(mod(chainphase,0.5)*2*0.08727),0>
   }
   #declare index=index+1;
   object {
     link_inner_0
     translate <0,-index*0.08727-(mod(chainphase,0.5)*2*0.08727),0> 
   }
   #declare index=index+1;
 #end
#else
 #while(index<44)
   object {
     link_inner_0
     translate <0,-index*0.08727-(mod(chainphase,0.5)*2*0.08727),0>
   }
   #declare index=index+1;
   object {
     link_outer_0
     translate <0,-index*0.08727-(mod(chainphase,0.5)*2*0.08727),0> 
   }
   #declare index=index+1;
 #end
#end
}
#declare index=0;

#declare topchain = union {
#if (chainphase >= 0.5)
  #while(index<12)
    object {
      link_outer_0
      translate <0,-index*0.08727-(mod(chainphase,0.5)*2*0.08727),0>
    }
    #declare index=index+1;
    object {
      link_inner_0
      translate <0,-index*0.08727-(mod(chainphase,0.5)*2*0.08727),0>
    }
    #declare index=index+1;
  #end
#else
  #while(index<12)
    object {
      link_inner_0
      translate <0,-index*0.08727-(mod(chainphase,0.5)*2*0.08727),0>
    }
    #declare index=index+1;
    object {
      link_outer_0
      translate <0,-index*0.08727-(mod(chainphase,0.5)*2*0.08727),0>
    }
    #declare index=index+1;
  #end
#end
}
#declare index=20*mod(chainphase,0.5);

#declare rndchain = union {
#if(chainphase >= 0.5) 
 #while(index<100)
 object {
   link_outer_0
   rotate <85-index,0,0>
   translate <0,cos(radians(index))/2,-sin(radians(index))/2>
 }
 #declare index=index+10.0;
 object {
   link_inner_0
   rotate <85-index,0,0>  
   translate <0,cos(radians(index))/2,-sin(radians(index))/2>
 }
 #declare index=index+10.0;
 #end
#else
 #while(index<100)
 object {
   link_inner_0
   rotate <85-index,0,0>
   translate <0,cos(radians(index))/2,-sin(radians(index))/2>
 }
 #declare index=index+10.0;
 object {
   link_outer_0
   rotate <85-index,0,0>  
   translate <0,cos(radians(index))/2,-sin(radians(index))/2>
 }
 #declare index=index+10.0;
 #end
#end
}

#declare BoldHead = intersection {
   prism {
      linear_spline
      linear_sweep
      0, 1,
      7,
      <0.5, 1>, <1.09167, 0.00416667>, <0.5, -1>, <-0.5, -1>, <-1.10833, 0.0125>, <-0.5, 1>, <0.5, 1>
   }
   
   sphere { <0, -2, 0>, 3 }
   texture { FinishedMetal }
   bounded_by { cylinder { <0, 1.05, 0>, <0, -0.05, 0>, 1.2324 } }
}

#declare boss = difference {
   cylinder {
      <0, 0, -0.1>, <0, 0, 1>, 0.5      
      texture { BlockBumpy }
   }
   
   union {
      cylinder { <0, 0, -0.2>, <0, 0, 0.7>, 0.2 }
      box { <-0.6, -0.6, -0.6>, <0.6, 0.6, 0> }
      texture { BlockText }
   }
}

#declare bosssupport = union {
   object { boss }
   
   cylinder {
      <0, 4.03333, 1.6>, <0, 0.366667, 0.666667>, 0.5
      scale <0.35, 1, 1>
   }
   
   cylinder {
      <0, 4.03333, 1.6>, <0, 0.366667, 0.666667>, 0.5
      scale <0.35, -1, 1>
   }
}


#declare SR20_block = difference {
   union {
      box { <-2.5, 0.4, -0.833333>, <2.5, 2.75, 0.833333> }
      cylinder { <-2.501, 0, 0>, <2.501, 0, 0>, 1.3 }
      box { <-2.502, -1.2874, -1.2165>, <2.502, -0.46456, 1.0505> }
      
      texture { BlockBumpy }
   }
   
   union {
      union {
         //*PMName cyl_bores
         
         object { sr20_cyl_bore translate x*(-1.875) }
         object { sr20_cyl_bore translate x*(-0.625) }
         object { sr20_cyl_bore translate x*0.625 }
         object { sr20_cyl_bore translate x*1.875 }
      }
      
      box { <-2.322, -0.112401, -0.939836>, <2.3498, -1.0425, 0.807885> }
      cylinder { <-0.5, 0, 0>, <0.5, 0, 0>, 0.8 translate x*(-1.875) }
      cylinder { <-0.5, 0, 0>, <0.5, 0, 0>, 0.8 translate x*(-0.625) }
      cylinder { <-0.5, 0, 0>, <0.5, 0, 0>, 0.8 translate x*0.625 }
      cylinder { <-0.5, 0, 0>, <0.5, 0, 0>, 0.8 translate x*1.875 }
   }
}

#declare conrod_bolthsg = union {
   box { <-0.14, -0.001, 0.3>, <0.14, 0.25, 0.4> }
   
   object {
      BoldHead
      scale 0.055
      translate <0, 0.25, 0.35>
   }
}

#declare conrond_bolthsg_ko = cylinder { <0, 0.35, 0.35>, <0, 0.245, 0.35>, 0.065 }

#declare sr20_conrod = union {
   difference {
      cylinder { <-0.14, 0, 0>, <0.14, 0, 0>, 0.4 }
      
      cylinder { <-0.14, 0, 0>, <0.14, 0, 0>, 0.278 }
      
      object { conrond_bolthsg_ko }
      
      object {
         conrond_bolthsg_ko
         scale <1, -1, 1>
      }
      
      object {
         conrond_bolthsg_ko
         scale <1, 1, -1>
      }
      
      object {
         conrond_bolthsg_ko
         scale <1, -1, -1>
      }
   }
   
   object { conrod_bolthsg }
   
   object {
      conrod_bolthsg
      scale <1, -1, 1>
   }
   
   object {
      conrod_bolthsg
      scale <1, 1, -1>
   }
   
   object {
      conrod_bolthsg
      scale <1, -1, -1>
   }
   
   difference {
      cylinder { <-0.14, 1.75, 0>, <0.14, 1.75, 0>, 0.25 }
      cylinder { <-0.14, 1.75, 0>, <0.14, 1.75, 0>, 0.17 }
   }
   
   prism {
      linear_spline
      linear_sweep
      0.35, 1.5694,
      7,
      <0.092129, 0.13034>, <0.060889, 0.0022208>, <0.099193, -0.12194>, <-0.11392, -0.12237>, <-0.061735, 0.0035735>, <-0.097516, 0.13034>, <0.092129, 0.13034>
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   texture {
   }
}

#declare sr20_conrod_0 = merge {
   cylinder { <-0.14, 0, 0>, <0.14, 0, 0>, 0.585528 }
   
   object { conrod_bolthsg }
   
   object {
      conrod_bolthsg
      scale <1, -1, 1>
   }
   
   object {
      conrod_bolthsg
      scale <1, 1, -1>
   }
   
   object {
      conrod_bolthsg
      scale <1, -1, -1>
   }
   
   difference {
      cylinder { <-0.14, 1.75, 0>, <0.14, 1.75, 0>, 0.25 }
      cylinder { <-0.15, 1.75, 0>, <0.15, 1.75, 0>, 0.17 }
   }
   
   prism {
      //*PMName smoother
      bezier_spline
      linear_sweep
      0.54564, 1.5694,
      32,
      <0.0523097, 0.10466>, <0.045484, 0.0688182>, <0.0243368, 0.0920425>, <0.0149646, 0.0705492>, <0.0149646, 0.0705492>, <0.0195035, 0.0422717>, <0.0135004, -0.0275333>, <0.0137017, -0.0560505>, <0.0137017, -0.0560505>, <0.0144385, -0.0757438>, <0.0394164, -0.0721045>, <0.0469362, -0.101512>, <0.0469362, -0.101512>, <0.0553793, -0.121248>, <-0.0641002, -0.127866>, <-0.0619302, -0.0992563>, <-0.0619302, -0.0992563>, <-0.0512711, -0.0711436>, <-0.0264277, -0.0777679>, <-0.0187054, -0.0556771>, <-0.0187054, -0.0556771>, <-0.0175858, -0.0319536>, <-0.020986, 0.0436149>, <-0.01726, 0.0707541>, <-0.01726, 0.0707541>, <-0.0267633, 0.0933795>, <-0.0532537, 0.0714128>, <-0.0617234, 0.107694>, <-0.0617234, 0.107694>, <-0.0669342, 0.130284>, <0.064758, 0.127689>, <0.0523097, 0.10466>
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   texture { RoughMetal }
}

#declare portknockout = union {
   //*PMName ports
   
   torus {
      0.75, 0.125
      rotate <25, 0, 90>
      translate y*(-0.25)
   }
   
   torus {
      0.75, 0.125
      rotate <-25, 0, 90>
      translate y*(-0.25)
   }
}

#declare headhole = cylinder { <0, 1.05, 0>, <0, -0.05, 0>, 0.125 }

#declare valvegear_bore = cylinder { <0, 1.05, 0>, <0, 0.3, 0>, 0.3 }

#declare sr20_head_cast = union {
   difference {
      box { <-2.7, 1, 1>, <2.7, 0, -1> }
      
      merge {
         //*PMName ports
         
         object {
            portknockout
            translate x*(-1.875)
         }
         
         object {
            portknockout
            translate x*1.875
         }
         
         object {
            portknockout
            translate x*0.625
         }
         
         object {
            portknockout
            translate x*(-0.625)
         }
         translate z*1
      }
      
      merge {
         //*PMName ports
         
         object {
            portknockout
            translate x*(-1.875)
         }
         
         object {
            portknockout
            translate x*1.875
         }
         
         object {
            portknockout
            translate x*0.625
         }
         
         object {
            portknockout
            translate x*(-0.625)
         }
         translate z*(-1)
      }
      
      merge {
         //*PMName cylkos
         
         sphere {
            //*PMName cyl1
            <0, 0, 0>, 2
            translate <-1.875, -1.92, 0>
         }
         
         sphere {
            //*PMName cyl2
            <0, 0, 0>, 2
            translate <-0.625, -1.92, 0>
         }
         
         sphere {
            //*PMName cyl3
            <0, 0, 0>, 2
            translate <0.625, -1.92, 0>
         }
         
         sphere {
            //*PMName cyl4
            <0, 0, 0>, 2
            translate <1.875, -1.92, 0>
         }
      }
      
      merge {
         //*PMName oles
         
         object {
            //*PMName spark_1
            headhole
            translate x*(-1.875)
         }
         
         object {
            //*PMName spark_2
            headhole
            translate x*(-0.625)
         }
         
         object {
            //*PMName spark_3
            headhole
            translate x*0.625
         }
         
         object {
            //*PMName spark_4
            headhole
            translate x*1.875
         }
         
         object { valvegear_bore }
      }
      
      box { <-2.9404, 0.445647, -1.2>, <2.97442, 1.2917, 1.16667> }
   }
   
   texture {
      FinishedMetal
   }
}

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

#declare sr20_head = object {
   valvetrain   
   bounded_by { box { <-3.27161, 1.64306, 1.07145>, <3.07512, -0.160766, -1.12504> } }
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

union {
   //*PMName engine_sr20
   
   object {
      crankshaft_assy
      rotate <crankangle, 0, 0>
   }
   
   union {
      //*PMName pistons
      
      object {
         //*PMName piston4
         sr20_piston
         scale 0.5
         translate <1.875,piston14_y,0>
      }
      
      object {
         //*PMName piston3
         sr20_piston
         scale 0.5
         translate <0.625,piston23_y,0>
      }
      
      object {
         //*PMName piston2
         sr20_piston
         scale 0.5
         translate <-0.625,piston23_y,0>
      }
      
      object {
         //*PMName piston1
         sr20_piston
         scale 0.5
         translate <-1.875,piston14_y,0>
      }
   }
   
   union {
      //*PMName conrods
      
      object {
         //*PMName conrod_4
         sr20_conrod_0
         rotate <con_tilt14, 0, 0>
         translate <0, bigend14_y, -bigend14_x>
         translate x*1.875
      }
      
      object {
         //*PMName conrod_1
         sr20_conrod_0
         rotate <con_tilt14, 0, 0>
         translate <0, bigend14_y, -bigend14_x>
         translate x*(-1.875)
      }
      
      object {
         //*PMName conrod_3
         sr20_conrod_0
         rotate <con_tilt23, 0, 0>
         translate <0, bigend23_y, -bigend23_x>
         translate x*0.675
      }
      
      object {
         //*PMName conrod_2
         sr20_conrod_0
         rotate <con_tilt23, 0, 0>
         translate <0, bigend23_y, -bigend23_x>
         translate x*(-0.675)
      }
   }
   
   difference {
      object { SR20_block }
      
      box {
         <-3.3454, -1.21452, -1.62458>, <2.83591, 2.87324, 0.0126486>         
         texture { BlockText }
      }
   }
   
   object {
      sr20_head
      translate y*2.75
   }
   
   union {
      //*PMName timing chain 1
      object { strchain }
      rotate x*(-10.75)
      translate <-3, 3.65359, -0.985>
   }
   
   union {
      //*PMName timing chain 3
      object { topchain }
      rotate x*90
      translate <-3, 4.25, 0.55>
   }
   
   union {
      //*PMName timing chain 2
      object { rndchain }
      translate <-3, 3.75, -0.5>
   }
   
   union {
      //*PMName vapours
      
      object {
         VapourCyl
         
         texture {
            //*PMName fire
            bozo
            turbulence <0, 0, 0>
            
            texture_map {
               [ 0 pigment { color rgbt <0, 0, 0, 1> } ]
               [ 0.1 pigment { color rgbt <1, 0.0352941, 0.0352941, 0.6> } ]
               [ 1 pigment { color rgbt <0.95294, 1, 0.078431, 0.25> } ]
            }
            scale <0.5, 0.1, 0.5>
         }
         translate <-0.625, 2.75, 0>
      }
      
      object {
         VapourCyl
         
         texture {
            //*PMName fuel
            bozo
            turbulence <0, 0, 0>
            
            texture_map {
               [ 0 pigment { color rgbt <0, 0, 0, 1> } ]
               [ 0.1 pigment { color rgbt <0.47059, 0.66667, 1, 0.8> } ]
               [ 1 pigment { color rgbt <0.47059, 0.66667, 1, 0.4> } ]
            }
            scale 0.1
         }
         translate <0.625, 2.75, 0>
      }
   }
}

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

camera {
   perspective
   location <3.89027, 4.84714, -4.85113>
   sky <0, 1, 0>
   direction <0, 0, 1>
   right <1.78, 0, 0>
   up <0, 1, 0>
   look_at <-0.16945, 2.24958, 0.913192>
   angle 55
}