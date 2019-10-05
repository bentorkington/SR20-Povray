//*PMRawBegin
#include "shapes.inc"
#include "functions.inc"
#include "textures.inc"
#include "colors.inc"
//*PMRawEnd
//*PMRawBegin


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
 
//*PMRawEnd

#declare Silver = pigment {
   color rgb <0.94, 0.93, 0.9>
}

#declare Copper = pigment {
   color rgb <0.65, 0.35, 0.15>
}

#declare BlockText = texture {
   finish {
      ambient rgb <0.35, 0.35, 0.35>
      diffuse 0.3
      brilliance 2
      metallic 1
      specular 0.8
      roughness 0.05
   }
   
   pigment {
      color rgb <0.694118, 0.694118, 0.694118>
   }
}

#declare cranksprocket = difference {
   union {
      cylinder {
         <0, 0, -0.05>, <0, 0, 0.05>, 0.2
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      lathe {
         linear_spline
         4,
         <0, 0.35>, <0.2, 0.35>, <0.2, 0>, <0, 0>
         scale 1
         rotate x*(-90)
         translate <0, 0, 0>
      }
      
      difference {
         cylinder {
            <0, 0.00416667, -0.12467>, <0, 0.00416667, -0.0134729>, 0.254076
            scale 1
            rotate <0, 0, 0>
            translate <0, 0, 0>
         }
         
         torus {
            0.275, 0.076
            scale 1
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

#declare BlockBumpy = texture {
   normal {
      wrinkles
      0.15
      scale 0.05
   }
   
   finish {
      ambient rgb <0.35, 0.35, 0.35>
      diffuse 0.3
      brilliance 2
      metallic 1
      specular 0.8
      roughness 0.05
   }
   
   pigment {
      color rgb <0.694118, 0.694118, 0.694118>
   }
}

#declare FinishedMetal = texture {
   finish {
      ambient rgb <0.384314, 0.384314, 0.384314>
      diffuse 0.6
      phong 0.1
      roughness 0.05
   }
   
   pigment {
      color rgb <0.54902, 0.54902, 0.54902>
   }
}

#declare PistonTexture = texture {
   pigment {
      color rgb <0.780392, 0.780392, 0.780392>
   }
   
   finish {
      phong 0.2
      metallic 1
      roughness 0.05
      
      reflection {
         rgb <0.290196, 0.290196, 0.290196>
      }
   }
}

#declare SleeveTexture = texture {
   pigment {
      color rgb <0.572549, 0.572549, 0.572549>
   }
   
   finish {
      phong 0.2
      metallic 1
      roughness 0.08
   }
}

#declare ShinyMetal = texture {
   pigment {
      color rgb <0.631373, 0.623529, 0.780392>
   }
   
   finish {
      metallic 1
      roughness 0.05
      
      reflection {
         rgb <0.658824, 0.658824, 0.658824>
         metallic 1
      }
   }
}

#declare RoughMetal = texture {
   normal {
      wrinkles
      0.3
      scale 0.01
   }
   
   finish {
      phong 0.1
      metallic 1
      roughness 0.2
   }
   
   pigment {
      color rgb <0.376471, 0.25098, 0.152941>
   }
}

#declare SprockText = texture {
   finish {
      phong 0.1
      metallic 1
      roughness 0.3
   }
   
   pigment {
      color rgb <0.54902, 0.47451, 0.45098>
   }
}

#declare RoughMetal_0 = texture {
   normal {
      wrinkles
      0.3
      scale 0.01
   }
   
   finish {
      phong 0.1
      metallic 1
      roughness 0.2
   }
   
   pigment {
      color rgb <0.768627, 0.607843, 0.490196>
   }
}

#declare VapourCyl = cylinder {
   <0, 0, 0>, <0, -1, 0>, 0.5
   scale 1
   rotate <0, 0, 0>
   translate <0, 0, 0>
}

#declare chainlink_single = merge {
   cylinder {
      <0, 0.05, 0>, <0, -0.05, 0>, 0.5
      scale 1
      rotate <0, 0, 0>
      translate x*1
   }
   
   cylinder {
      <0, 0.05, 0>, <0, -0.05, 0>, 0.5
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   box {
      <0, -0.051, -0.501>, <1, 0.051, 0.501>
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

#declare camsprocket = difference {
   union {
      cylinder {
         //*PMName thesprocket
         <0, 0, -0.02>, <0, 0, 0.02>, 0.5
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      cylinder {
         <0, 0.0041667, 0>, <0, 0.0041667, -0.3>, 0.175
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      difference {
         cylinder {
            <0, 0.00416667, -0.12467>, <0, 0.00416667, -0.0134729>, 0.254076
            scale 1
            rotate <0, 0, 0>
            translate <0, 0, 0>
         }
         
         torus {
            0.275, 0.076
            scale 1
            rotate x*90
            translate z*(-0.095)
         }
      }
   }
   
   union {
      //*PMRawBegin
      #declare i = 0;
      union {
      #while (i<36)
      cylinder { <0,0.495,-0.05>,<0,0.495,0.05>, 0.045
      rotate <0,0, i * 10>
      }
      #declare i=i+1;
      #end
      }
      //*PMRawEnd
      
      cylinder {
         <0, 0, 0.05>, <0, 0, -0.05>, 0.1
         scale 1
         translate x*0.3
         rotate <0, 0, 0>
      }
      
      cylinder {
         <0, 0, 0.05>, <0, 0, -0.05>, 0.1
         scale 1
         translate x*0.3
         rotate z*60
      }
      
      cylinder {
         <0, 0, 0.05>, <0, 0, -0.05>, 0.1
         scale 1
         translate x*0.3
         rotate z*120
      }
      
      cylinder {
         <0, 0, 0.05>, <0, 0, -0.05>, 0.1
         scale 1
         translate x*0.3
         rotate z*180
      }
      
      cylinder {
         <0, 0, 0.05>, <0, 0, -0.05>, 0.1
         scale 1
         translate x*0.3
         rotate z*240
      }
      
      cylinder {
         <0, 0, 0.05>, <0, 0, -0.05>, 0.1
         scale 1
         translate x*0.3
         rotate z*300
      }
   }
   
   texture {
      SprockText
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
//*PMRawBegin
#declare chainphase=mod(clock * 2 * 9, 1.0);

//*PMRawEnd
//*PMRawBegin
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
//*PMRawEnd
//*PMRawBegin
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
//*PMRawEnd
//*PMRawBegin
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
//*PMRawEnd

#declare gudgeonpin = difference {
   cylinder {
      //*PMName gp_outer
      <0.7, 1, 0>, <-0.7, 1, 0>, 0.32328
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   cylinder {
      //*PMName gp_inner
      <0.75, 1, 0>, <-0.75, 1, 0>, 0.225
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   texture {
      BlockText
   }
}

#declare BoldHead = intersection {
   prism {
      linear_spline
      linear_sweep
      0, 1,
      7,
      <0.5, 1>, <1.09167, 0.00416667>, <0.5, -1>, <-0.5, -1>, <-1.10833, 0.0125>, <-0.5, 1>, <0.5, 1>
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   sphere {
      <0, -2, 0>, 3
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   texture {
      FinishedMetal
   }
   
   bounded_by {
      cylinder {
         <0, 1.05, 0>, <0, -0.05, 0>, 1.2324
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
   }
}

#declare crank_bigend_ko = box {
   <-0.35, -0.34, 0.34>, <0.35, 0.34, -0.34>
   scale 1
   rotate <0, 0, 0>
   translate <0, 0, 0>
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
         <1.6, -0.45, 0.5>, <1.6, -0.45, -0.5>, 2
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
   }
   
   cylinder {
      <0, 0, 0>, <-0.25, 0, 0>, 0.35
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
      <-0.178719, 0.506653>, <-0.111986, 0.932193>, <0.130469, 0.951337>, <0.165703, 0.500609>, <0.165703, 0.500609>, <0.196704, 0.437109>, <0.341323, 0.175457>, <0.369963, -0.00231333>, <0.369963, -0.00231333>, <0.43635, -0.0282781>, <0.485317, -0.0798243>, <0.543807, -0.112049>, <0.543807, -0.112049>, <0.614415, -0.703673>, <-0.567224, -0.766659>, <-0.550149, -0.132991>, <-0.550149, -0.132991>, <-0.467069, -0.133969>, <-0.453707, -0.002026>, <-0.374257, -0.001905>, <-0.374257, -0.001905>, <-0.296072, 0.245214>, <-0.241796, 0.400058>, <-0.178719, 0.506653>
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
   object {
      bigend_offset
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   object {
      bigend_offset
      scale <-1, 1, 1>
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
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

#declare cshaft_assy = merge {
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

#declare pistonlathe = lathe {
   //*PMName piston_lathe
   linear_spline
   11,
   <0, 2>, <1, 2>, <1, 1.9>, <0.95, 1.9>, <0.95, 1.85>, <1, 1.85>, <1, 1.8>, <0.95, 1.8>, <0.95, 1.75>, <1, 1.75>, <1, 0>
   sturm
   scale <0.9995, 1, 0.9995>
   rotate <0, 0, 0>
   translate <0, 0, 0>
}

#declare sr20_cyl_bore = cylinder {
   <0, 2.8, 0>, <0, 0, 0>, 0.505
   scale 1
   rotate <0, 0, 0>
   translate <0, 0, 0>
}

#declare sr20_cyl_sleeve = difference {
   cylinder {
      <0, 2.8, 0>, <0, 0, 0>, 0.5051
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   cylinder {
      <0, 2.8, 0>, <0, 0, 0>, 0.5
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   texture {
      SleeveTexture
   }
}

#declare SR20_block = difference {
   merge {
      box {
         <-2.5, 0.4, -0.833333>, <2.5, 2.75, 0.833333>
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      cylinder {
         <-2.501, 0, 0>, <2.501, 0, 0>, 1.3
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      box {
         <-2.502, -1.2874, -1.2165>, <2.502, -0.46456, 1.0505>
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      texture {
         BlockBumpy
      }
   }
   
   merge {
      merge {
         //*PMName cyl_bores
         
         object {
            sr20_cyl_bore
            scale 1
            rotate <0, 0, 0>
            translate x*(-1.875)
         }
         
         object {
            sr20_cyl_bore
            scale 1
            rotate <0, 0, 0>
            translate x*(-0.625)
         }
         
         object {
            sr20_cyl_bore
            scale 1
            rotate <0, 0, 0>
            translate x*0.625
         }
         
         object {
            sr20_cyl_bore
            scale 1
            rotate <0, 0, 0>
            translate x*1.875
         }
      }
      
      merge {
         //*PMName cyl_sleeves
         
         object {
            sr20_cyl_sleeve
            scale 1
            rotate <0, 0, 0>
            translate x*(-1.875)
         }
         
         object {
            sr20_cyl_sleeve
            scale 1
            rotate <0, 0, 0>
            translate x*(-0.625)
         }
         
         object {
            sr20_cyl_sleeve
            scale 1
            rotate <0, 0, 0>
            translate x*0.625
         }
         
         object {
            sr20_cyl_sleeve
            scale 1
            rotate <0, 0, 0>
            translate x*1.875
         }
      }
      
      box {
         <-2.322, -0.112401, -0.939836>, <2.3498, -1.0425, 0.807885>
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      cylinder {
         <-0.5, 0, 0>, <0.5, 0, 0>, 0.8
         scale 1
         rotate <0, 0, 0>
         translate x*(-1.875)
      }
      
      cylinder {
         <-0.5, 0, 0>, <0.5, 0, 0>, 0.8
         scale 1
         rotate <0, 0, 0>
         translate x*(-0.625)
      }
      
      cylinder {
         <-0.5, 0, 0>, <0.5, 0, 0>, 0.8
         scale 1
         rotate <0, 0, 0>
         translate x*0.625
      }
      
      cylinder {
         <-0.5, 0, 0>, <0.5, 0, 0>, 0.8
         scale 1
         rotate <0, 0, 0>
         translate x*1.875
      }
   }
}

#declare sr20_piston = merge {
   difference {
      //*PMName piston_cast
      
      object {
         //*PMName piston_cyl
         pistonlathe
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      cylinder {
         //*PMName gudgeon_knockout
         <1.05, 1, 0>, <-1.05, 1, 0>, 0.32328
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      superellipsoid {
         <1, 0.25>
         scale 1
         rotate x*90
         translate y*2.9
      }
      
      superellipsoid {
         <0.15, 0.15>
         scale 1
         rotate x*90
         translate <-1.7345, 0.55905, 0>
      }
      
      superellipsoid {
         <0.15, 0.15>
         scale 1
         rotate x*90
         translate <1.7345, 0.55905, 0>
      }
      
      box {
         <-0.35, -0.1, -0.5>, <0.35, 1.5, 0.5>
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      cylinder {
         <-1.05, -1, 0>, <1.05, -1, 0>, 1.25
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      pigment {
         color rgb <0.780392, 0.780392, 0.780392>
      }
      
      finish {
         phong 0.2
         metallic 1
         roughness 0.05
         
         reflection {
            rgb <0.380392, 0.380392, 0.380392>
         }
      }
   }
   
   object {
      //*PMName gudgeon_pin
      gudgeonpin
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   bounded_by {
      cylinder {
         <0, 2.0541, 0>, <0, -0.02, 0>, 1.1227
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
   }
}

#declare conrod_bolthsg = merge {
   box {
      <-0.14, -0.001, 0.3>, <0.14, 0.25, 0.4>
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   object {
      BoldHead
      scale 0.055
      rotate <0, 0, 0>
      translate <0, 0.25, 0.35>
   }
}

#declare conrond_bolthsg_ko = cylinder {
   <0, 0.35, 0.35>, <0, 0.245, 0.35>, 0.065
   scale 1
   rotate <0, 0, 0>
   translate <0, 0, 0>
}

#declare sr20_conrod = merge {
   difference {
      cylinder {
         <-0.14, 0, 0>, <0.14, 0, 0>, 0.4
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      cylinder {
         <-0.14, 0, 0>, <0.14, 0, 0>, 0.278
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      object {
         conrond_bolthsg_ko
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      object {
         conrond_bolthsg_ko
         scale <1, -1, 1>
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      object {
         conrond_bolthsg_ko
         scale <1, 1, -1>
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      object {
         conrond_bolthsg_ko
         scale <1, -1, -1>
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
   }
   
   object {
      conrod_bolthsg
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   object {
      conrod_bolthsg
      scale <1, -1, 1>
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   object {
      conrod_bolthsg
      scale <1, 1, -1>
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   object {
      conrod_bolthsg
      scale <1, -1, -1>
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   difference {
      cylinder {
         <-0.14, 1.75, 0>, <0.14, 1.75, 0>, 0.25
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      cylinder {
         <-0.14, 1.75, 0>, <0.14, 1.75, 0>, 0.17
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
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
      RoughMetal
   }
}

#declare cam_lobe = merge {
   prism {
      bezier_spline
      linear_sweep
      0, 0.25,
      12,
      <-0.0620931, 0.092178>, <0.0290616, 0.157045>, <0.190012, 0.0648477>, <0.197061, 0.00361682>, <0.197061, 0.00361682>, <0.204902, -0.0539845>, <0.050492, -0.132006>, <-0.0346815, -0.105879>, <-0.0346815, -0.105879>, <-0.104526, -0.0878001>, <-0.14183, 0.0352019>, <-0.0620931, 0.092178>
      scale 1
      rotate <0, 45, 90>
      translate x*0.125
   }
}

#declare cam_journal = cylinder {
   <-0.125, 0, 0>, <0.125, 0, 0>, 0.11
   scale 1
   rotate <0, 0, 0>
   translate <0, 0, 0>
}

#declare camshaft = merge {
   object {
      //*PMName Sprocket
      camsprocket
      scale 1
      rotate y*(-90)
      translate x*(-3)
   }
   
   cylinder {
      <-2.9, 0, 0>, <2.5, 0, 0>, 0.1
      
      texture {
         RoughMetal
      }
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   merge {
      //*PMName lobes_and_journals
      
      object {
         //*PMName lobe_1
         cam_lobe
         scale 1
         rotate <0, 0, 0>
         translate x*(-1.875)
      }
      
      object {
         //*PMName lobe_4
         cam_lobe
         scale 1
         rotate x*180
         translate x*1.875
      }
      
      object {
         //*PMName lobe_3
         cam_lobe
         scale 1
         rotate x*90
         translate x*0.625
      }
      
      object {
         //*PMName lobe_2
         cam_lobe
         scale 1
         rotate x*(-90)
         translate x*(-0.625)
      }
      
      object {
         //*PMName journal1
         cam_journal
         scale 1
         rotate <0, 0, 0>
         translate x*(-2.4)
      }
      
      object {
         //*PMName journal2
         cam_journal
         scale 1
         rotate <0, 0, 0>
         translate x*(-1.25)
      }
      
      object {
         //*PMName journal3
         cam_journal
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      object {
         //*PMName journal4
         cam_journal
         scale 1
         rotate <0, 0, 0>
         translate x*1.25
      }
      
      object {
         //*PMName journal5
         cam_journal
         scale 1
         rotate <0, 0, 0>
         translate x*2.4
      }
      
      texture {
         ShinyMetal
      }
   }
}

#declare valve = lathe {
   linear_spline
   6,
   <0, 0.7>, <0.02, 0.7>, <0.02, 0.05>, <0.1, 0.02>, <0.15, 0>, <0, 0>
   scale 1
   rotate <0, 0, 0>
   translate <0, 0, 0>
}

#declare exvalve_pair = merge {
   object {
      valve
      scale 1
      rotate x*16.2
      translate <-0.175, 0.043527, 0.25>
   }
   
   object {
      valve
      scale 1
      rotate x*16.2
      translate <0.175, 0.043527, 0.25>
   }
}

#declare newvalvepair_1IN = merge {
   object {
      valve
      //*PMRawBegin
      translate <0, cyl1_in ,0>
      //*PMRawEnd
      scale 1
      rotate x*16.2
      translate <-0.175, 0.045, 0.25>
   }
   
   object {
      valve
      //*PMRawBegin
      translate <0, cyl1_in ,0>
      //*PMRawEnd
      scale 1
      rotate x*16.2
      translate <0.175, 0.045, 0.25>
   }
}

#declare newvalvepair_3IN = merge {
   object {
      valve
      //*PMRawBegin
      translate <0, cyl3_in ,0>
      //*PMRawEnd
      scale 1
      rotate x*16.2
      translate <-0.175, 0.045, 0.25>
   }
   
   object {
      valve
      //*PMRawBegin
      translate <0, cyl3_in ,0>
      //*PMRawEnd
      scale 1
      rotate x*16.2
      translate <0.175, 0.045, 0.25>
   }
}

#declare newvalvepair_4IN = merge {
   object {
      valve
      //*PMRawBegin
      translate <0, cyl4_in ,0>
      //*PMRawEnd
      scale 1
      rotate x*16.2
      translate <-0.175, 0.045, 0.25>
   }
   
   object {
      valve
      //*PMRawBegin
      translate <0, cyl4_in ,0>
      //*PMRawEnd
      scale 1
      rotate x*16.2
      translate <0.175, 0.045, 0.25>
   }
}

#declare newvalvepair_2IN = merge {
   object {
      valve
      //*PMRawBegin
      translate <0, cyl2_in ,0>
      //*PMRawEnd
      scale 1
      rotate x*16.2
      translate <-0.175, 0.045, 0.25>
   }
   
   object {
      valve
      //*PMRawBegin
      translate <0, cyl2_in ,0>
      //*PMRawEnd
      scale 1
      rotate x*16.2
      translate <0.175, 0.045, 0.25>
   }
}

#declare newvalvepair_1OUT = merge {
   object {
      valve
      //*PMRawBegin
      translate <0, cyl1_ex ,0>
      //*PMRawEnd
      scale 1
      rotate x*16.2
      translate <-0.175, 0.045, 0.25>
   }
   
   object {
      valve
      //*PMRawBegin
      translate <0, cyl1_ex ,0>
      //*PMRawEnd
      scale 1
      rotate x*16.2
      translate <0.175, 0.045, 0.25>
   }
}

#declare newvalvepair_3OUT = merge {
   object {
      valve
      //*PMRawBegin
      translate <0, cyl3_ex ,0>
      //*PMRawEnd
      scale 1
      rotate x*16.2
      translate <-0.175, 0.045, 0.25>
   }
   
   object {
      valve
      //*PMRawBegin
      translate <0, cyl3_ex ,0>
      //*PMRawEnd
      scale 1
      rotate x*16.2
      translate <0.175, 0.045, 0.25>
   }
}

#declare newvalvepair_4OUT = merge {
   object {
      valve
      //*PMRawBegin
      translate <0, cyl4_ex ,0>
      //*PMRawEnd
      scale 1
      rotate x*16.2
      translate <-0.175, 0.045, 0.25>
   }
   
   object {
      valve
      //*PMRawBegin
      translate <0, cyl4_ex ,0>
      //*PMRawEnd
      scale 1
      rotate x*16.2
      translate <0.175, 0.045, 0.25>
   }
}

#declare newvalvepair_2OUT = merge {
   object {
      valve
      //*PMRawBegin
      translate <0, cyl2_ex ,0>
      //*PMRawEnd
      scale 1
      rotate x*16.2
      translate <-0.175, 0.045, 0.25>
   }
   
   object {
      valve
      //*PMRawBegin
      translate <0, cyl2_ex ,0>
      //*PMRawEnd
      scale 1
      rotate x*16.2
      translate <0.175, 0.045, 0.25>
   }
}

#declare valveset_inlet = merge {
   //*PMName inlet_valves
   
   object {
      exvalve_pair
      scale 1
      rotate <0, 0, 0>
      translate x*(-1.875)
   }
   
   object {
      //*PMName 2
      exvalve_pair
      scale 1
      rotate <0, 0, 0>
      translate x*(-0.625)
   }
   
   object {
      exvalve_pair
      scale 1
      rotate <0, 0, 0>
      translate x*0.625
   }
   
   object {
      exvalve_pair
      scale 1
      rotate <0, 0, 0>
      translate x*1.875
   }
}

#declare valveset_exhaust = merge {
   //*PMName outlet_valves
   
   object {
      newvalvepair_1OUT
      scale 1
      rotate <0, 0, 0>
      translate x*(-1.875)
   }
   
   object {
      //*PMName 2
      newvalvepair_2OUT
      scale 1
      rotate <0, 0, 0>
      translate x*(-0.625)
   }
   
   object {
      newvalvepair_3OUT
      scale 1
      rotate <0, 0, 0>
      translate x*0.625
   }
   
   object {
      newvalvepair_4OUT
      scale 1
      rotate <0, 0, 0>
      translate x*1.875
   }
}

#declare valvetrain = merge {
   object {
      //*PMName inlet_cam
      camshaft
      //*PMRawBegin
            rotate <camangle,0,0>
      //*PMRawEnd
      scale 1
      rotate <0, 0, 0>
      translate <0, 1, 0.5>
   }
   
   object {
      //*PMName exhaust_cam
      camshaft
      //*PMRawBegin
            rotate <camangle+90,0,0>
      //*PMRawEnd
      scale 1
      rotate <0, 0, 0>
      translate <0, 1, -0.5>
   }
   
   object {
      //*PMName inlet_valves
      valveset_inlet
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   object {
      //*PMName exhaust_valves
      valveset_exhaust
      scale <1, 1, -1>
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   texture {
      ShinyMetal
   }
}

#declare sr20_head = merge {
   object {
      //*PMName Valvetrain
      valvetrain
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
}

sky_sphere {
   pigment {
      bozo
      
      color_map {
         [ 0 color rgb <0.164706, 0.796078, 0.968627>
         ]
         [ 0.8 color rgb <0.164706, 0.796078, 0.968627>
         ]
         [ 1 color rgb <0.972549, 1, 0.992157>
         ]
      }
   }
}

merge {
   //*PMName engine_sr20
   
   object {
      //*PMName crankshaft
      cshaft_assy
      //*PMRawBegin
            rotate <crankangle, 0, 0>
      //*PMRawEnd
   }
   
   merge {
      //*PMName pistons
      
      object {
         //*PMName piston4
         sr20_piston
         scale 0.5
         rotate <0, 0, 0>
         translate x*1.875
         //*PMRawBegin
         translate <0,piston14_y,0>
         //*PMRawEnd
      }
      
      object {
         //*PMName piston3
         sr20_piston
         scale 0.5
         rotate <0, 0, 0>
         translate x*0.625
         //*PMRawBegin
         translate <0,piston23_y,0>
         //*PMRawEnd
      }
      
      object {
         //*PMName piston2
         sr20_piston
         scale 0.5
         rotate <0, 0, 0>
         translate x*(-0.625)
         //*PMRawBegin
         translate <0,piston23_y,0>
         //*PMRawEnd
      }
      
      object {
         //*PMName piston1
         sr20_piston
         scale 0.5
         rotate <0, 0, 0>
         translate x*(-1.875)
         //*PMRawBegin
         translate <0,piston14_y,0>
         //*PMRawEnd
      }
   }
   
   merge {
      //*PMName conrods
      
      object {
         //*PMName conrod_4
         sr20_conrod
         //*PMRawBegin
         scale 1
         rotate <con_tilt14, 0, 0>
         translate <0, bigend14_y, -bigend14_x>
         //*PMRawEnd
         translate x*1.875
      }
      
      object {
         //*PMName conrod_1
         sr20_conrod
         //*PMRawBegin
         scale 1
         rotate <con_tilt14, 0, 0>
         translate <0, bigend14_y, -bigend14_x>
         //*PMRawEnd
         translate x*(-1.875)
      }
      
      object {
         //*PMName conrod_3
         sr20_conrod
         //*PMRawBegin
         scale 1
         rotate <con_tilt23, 0, 0>
         translate <0, bigend23_y, -bigend23_x>
         //*PMRawEnd
         translate x*0.675
      }
      
      object {
         //*PMName conrod_2
         sr20_conrod
         //*PMRawBegin
         scale 1
         rotate <con_tilt23, 0, 0>
         translate <0, bigend23_y, -bigend23_x>
         //*PMRawEnd
         translate x*(-0.675)
      }
   }
   
   difference {
      //*PMName block_cutaway
      
      object {
         //*PMName block
         SR20_block
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      box {
         <-3.3454, -1.21452, -1.62458>, <2.83591, 2.87324, 0.0126486>
         
         texture {
            BlockText
         }
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
   }
   
   object {
      //*PMName ed
      sr20_head
      scale 1
      rotate <0, 0, 0>
      translate y*2.75
   }
   
   union {
      //*PMName timing chain 1
      //*PMRawBegin
      object {
      strchain}
      //*PMRawEnd
      rotate x*(-10.75)
      translate <-3, 3.65359, -0.985>
   }
   
   union {
      //*PMName timing chain 3
      //*PMRawBegin
      object {
      topchain}
      //*PMRawEnd
      rotate x*90
      translate <-3, 4.25, 0.55>
   }
   
   union {
      //*PMName timing chain 2
      //*PMRawBegin
      object {
      rndchain}
      //*PMRawEnd
      rotate <0, 0, 0>
      translate <-3, 3.75, -0.5>
   }
}

global_settings {
   adc_bailout 0.0039216
   ambient_light rgb <0.792157, 0.917647, 1>
   assumed_gamma 1.5
   noise_generator 2
}

light_source {
   <5.28852, 5.1661, -5.67463>, rgb <1, 1, 1>
   area_light <1, 0, 0>, <0, 1, 0>, 3, 3
   circular
}

light_source {
   <-8.80633, -1.52784, -5.58872>, rgb <1, 1, 1>
   area_light <1, 0, 0>, <0, 1, 0>, 3, 3
   circular
}

camera {
   perspective
   location < cos(clock * pi * 0.5 ) * -4.65457, 4.63023, -3.0761>
   sky <0, 1, 0>
   direction <0, 0, 1>
   right <1.3333, 0, 0>
   up <0, 1, 0>
   look_at <-0.101475, 2.05249, 1.25252>
   angle 45
}
