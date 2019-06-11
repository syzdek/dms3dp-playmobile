/*
 *  Window Wedges
 *  Copyright (c) 2019 David M. Syzdek <david@syzdek.net>
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are
 *  met:
 *
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of David M. Syzdek nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 *  IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 *  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 *  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL DAVID M. SYZDEK BE LIABLE FOR
 *  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 *  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 *  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 *  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 *  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 *  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 *  SUCH DAMAGE.
 *
 *  This is a non-permanent, adjustable stopper for a casement window. The
 *  stopper works by placing two opposing, interlocked wedges within the
 *  track of the sash runner.  As the runner pushes against the wedges, the
 *  wedges lock into place using friction generated by the pressure on the
 *  wedges to prevent the sash from moving forward.
 *
 *  Window Wedges are used to create a casement window sash stopper.
 *
 *  To adjust the placement of the wedges:
 *     1. Loosen the wedges by using the fingernail notches to pull the wedges
 *        apart.
 *     2. Adjust the location of the wedges by pulling the leading wedge using
 *        the fingernail notches in the direction of intended adjustment.
 *     3. Once the wedges are adjusted to the desired location, squeeze the two
 *        wedges together to lock into place.
 */


w = 15.5;  // width
h =  5.0;  // height
s = 10.0;  // length of pull stub


l = h*4;              // length of slope
a = atan((h*0.75)/l); // angle of slope

module window_stopper()
{
   union()
   {
      difference()
      {
         // creates base
         translate([  0, 0, 0 ])
            cube([  l+s, w, h ], center = false);

         // cuts slope
         translate( [ s,    -1,   h ] ) 
            rotate( [ 0,     a,   0 ] ) 
            cube(   [ l*2, w+2, h*2 ], center=false);
      
         // cuts slot for stopper
         translate([ s+1-(w/3), ((w/3)), -1 ] )
            cube(  [       l-2, ((w/3)), h+2 ], center=false);

         // cuts bottom fingernail tab
         translate([ 2.5,  -1,  -1 ] )
            cube([   1.5, w+2,   2 ], center=false);
          
         // cuts top fingernail tab
         translate([ 2.5,  -1, h-1 ] )
            cube([   1.5, w+2,   2 ], center=false);

         // cuts left fingernail tab
         translate([ 2.5,  -1,  -1 ] )
            cube([   1.5,   2, h+2 ], center=false);

         // cuts right fingernail tab
         translate([ 2.5, w-1,  -1 ] )
            cube([   1.5,   2, h+2 ], center=false);
      };

      // adds stopper
      translate( [ l+s-(w/3)-1, (w/3)*1.10,     0 ] )
         cube(   [     (w/3)+1, (w/3)*0.80, h*.85 ], center=false);
   };
};


// bottom stopper
translate([0,    5, 0]) window_stopper();
translate([0, -w-5, 0]) window_stopper();


/* end of script */