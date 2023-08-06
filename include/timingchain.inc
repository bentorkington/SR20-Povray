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

#declare chainlink_single_0 = union {
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
