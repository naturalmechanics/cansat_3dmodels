#include "colors.inc"
#include "stones.inc"

 
  
  
  #macro tube(P1, _height, _o_radius, _thickness) 
  #local _P2 = P1 + <0,_height,0>;
  #local _P3 = P1 - 0.01*(<0,_height,0>); // V1 - 0.1*V2
  #local _P4 = P1 + 1.01*(<0,_height,0>); // V1 + 1.1*V2
  
  // the inner cylinder is a little bit larger to ensure that it 
  // cuts through the outer cylinder caps
  // a texture enforces a cap
  
  difference {
    cylinder {P1,_P2,_o_radius}
   object{ cylinder {_P3,_P4,_o_radius - _thickness}
  // texture{ pigment{ color rgbf<0.1,0.2,0.3,0.94>}
    //         finish { phong 0.2 }}
    }
  }
  #end
  
  
  
  
  
  
  #macro funnel(P1, _height, _o_bottom_radius, _o_top_radius, _thickness)
  
  #local _P2 = P1 + <0,_height,0>;
  #local _P3 = P1 - 0.001*(_P2-P1); // V1 - 0.1*V2
  #local _P4 = P1 + 1.001*(_P2-P1); // V1 + 1.1*V2
  difference {
    cone {P1,  _o_bottom_radius
	  _P2,  _o_top_radius}
    object { cone {_P3, _o_bottom_radius - _thickness
	  _P4, _o_top_radius - _thickness}
	   //texture{ pigment{ color rgbf<0.1,0.2,0.3,0.94>}
             //finish { phong 0.2 }}
             }
	  
  }
  #end
  
  
  
  
  
 #declare _tube_base = <0,0,0>; 
 #declare _tube_height = 11.6;
 #declare _tube_thickness = 0.05;
 #declare _tube_radius = 3.15;
 
 #declare _t_funnel_base = _tube_base + <0, _tube_height, 0>;
 #declare _t_funnel_top_radius = 3.03;
 #declare _t_funnel_height = 1.4;
 #declare _t_funnel_base_radius = _tube_radius;
 #declare _t_funnel_thickness = _tube_thickness;
 
 
 
 #declare _b_funnel_height = 0.95;
 #declare _b_funnel_base = _tube_base - <0,_b_funnel_height.0>;
 #declare _b_funnel_base_radius = 3.11;
 #declare _b_funnel_top_radius = _tube_radius;
 #declare _b_funnel_thickness = _tube_thickness;
 

  
  
  
  
  
  
  
  
  // circuit board
  
  
  
  
  
  
  
  
  #macro dyn_polygon(_com, _enclosing_radius, _numpnts)
  
  //polygon is ALWAYS in x,y plane. rotate to put it to the correct plane.
  
  #local _circ = 2*3.14159;
  #local _ang = _circ / _numpnts;
  #local _aa = 0;
  
  polygon{
  
  _numpnts,
  #for (_aa, 0, _circ - 2*_ang, _ang)
      < _com.x + cos(_aa)*_enclosing_radius , _com.y + sin(_aa)*_enclosing_radius , _com.z> ,
      
  #end
  < _com.x + cos(_aa)*_enclosing_radius , _com.y + sin(_aa)*_enclosing_radius , _com.z> 
   
  }
  
  #end
  
  
  
  
  
  
  
  
  
  
  
  // battery 
  
  // #declare _battery_type = "9 V tenergy battery"
  #declare _battery_h = 1.75 ;
  #declare _battery_w = 2.65 ;
  #declare _battery_l = 4.85 ;
  
  
  
  
  
  
  
  
  
  
  union {
  
  
  
  
  
   
 merge{
 merge{
  object{
  tube(_tube_base, _tube_height, _tube_radius, _tube_thickness)
   texture{ pigment{ color rgbf<0.2,0.7,0.5,0.94>}
             finish { phong 0.2 }}
             
             
     
	     
  }
  
  object{
  
  funnel(_t_funnel_base, _t_funnel_height, _t_funnel_base_radius, _t_funnel_top_radius, _t_funnel_thickness)
      texture{ pigment{ color rgbf<0.2,0.7,0.5,0.94>}
             finish { phong 0.2 }}
  }
  }
  
  
  
  object{
  
  funnel(_b_funnel_base, _b_funnel_height, _b_funnel_base_radius, _b_funnel_top_radius, _b_funnel_thickness)
      texture{ pigment{ color rgbf<0.2,0.7,0.5,0.94>}
             finish { phong 0.2 }}
  }
  
  
  
  //        rotate <40, -20, 00>
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  union {

object {

dyn_polygon(<0,0,-1.80>, 3.0, 8)

  texture{ pigment{ color rgbf<0.7,0.2,0.5,0.14>}
             finish { phong 0.2 }}
  //rotate < 130,-20,0>
  }
  
object {

dyn_polygon(<0,0,-3.2>, 3.0, 8)

  texture{ pigment{ color rgbf<0.7,0.2,0.5,0.14>}
             finish { phong 0.2 }}
 // rotate < 130,-20,0>
  }  
  
  rotate <90,0,0>
  
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  object{
  box {
  <2.45, 1.33, 0.02>, <-2.45, -1.33, -1.73>
  }
  
  
  texture{ pigment{ color rgbf<0.5,0.2,0.9,0.14>}
             finish { phong 0.2 }}
  rotate < 90,-25,0>
    translate <0.1,0,-0.0>
  }
  

  
  rotate <90, -50, 0>
 
  scale 1.6
  }
  
  
  
  

   camera {
    location <25, 6,-25>
    look_at  <3, 6 , 3>
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  light_source { <2, 4, -3> color White}

  background {color rgb <0.9, 0.9, 0.5>}