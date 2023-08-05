#declare BlockText = texture {
   finish {
      ambient rgb <0.35, 0.35, 0.35>
      diffuse 0.3
      brilliance 2
      metallic 1
      specular 0.8
      roughness 0.05
   }
   
   pigment { color rgb <0.694118, 0.694118, 0.694118> }
}

#declare BlockBumpy = texture {
   normal {
      wrinkles
      0.15
      scale 0.05
   }
   
   finish {
      ambient rgb <0.278431, 0.278431, 0.278431>
      metallic 1
      specular 0.8
      roughness 0.05
   }
   
   pigment { color rgb <0.694118, 0.694118, 0.694118> }
}

#declare FinishedMetal = texture {
   finish {
      ambient rgb <0.384314, 0.384314, 0.384314>
      diffuse 0.6
      phong 0.1
      roughness 0.05
   }
   
   pigment { color rgb <0.54902, 0.54902, 0.54902> }
}

#declare RoughMetal = texture {
   normal {
      bumps
      0.3
      scale 0.2
   }
   
   finish {
      phong 0.1
      metallic 1
      roughness 0.2
   }
   
   pigment { color rgb <0.376471, 0.25098, 0.152941> }
}

#declare SleeveTexture = texture {
   pigment { color rgb <0.572549, 0.572549, 0.572549> }
   
   finish {
      phong 0.2
      metallic 1
      roughness 0.08
   }
}

#declare ShinyMetal = texture {
   pigment { color rgb <0.631373, 0.623529, 0.780392> }
   
   finish {
      metallic 1
      roughness 0.05
      
      reflection { rgb <0.658824, 0.658824, 0.658824>, rgb <0, 0, 0> }
   }
}
