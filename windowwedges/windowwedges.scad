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
 *  Window Wedges are placed in a casement window oerator's track to restrict
 *  movement of the operator arm with the purpose of either preventing the
 *  from fulling opening or from fulling closing.
 *
 *  To adjust the placement of the wedges:
 *     1. Loosen the wedges by using the fingernail notches to pull the wedges
 *        apart.
 *     2. Adjust the location of the wedges by pulling the leading wedge using
 *        the fingernail notches in the direction of intended adjustment.
 *     3. Once the wedges are adjusted to the desired location, squeeze the two
 *        wedges together to lock into place.
 */


// width of window operator track
track_width  = 15.5;

// height of window operator track
track_height = 5.0;  // height of window operator track


module window_stopper(w, h)
{
   s = 3.0*h;            // length of pull stub
   l = h*4;              // length of slope
   a = atan((h*0.75)/l); // angle of slope

   union()
   {
      difference()
      {
         // creates base
         translate([  0, 0, 0 ])
            cube([  l+s, w, h ], center = false);

         // cuts slope
         translate( [   s,  -1,   h ] )
            rotate( [   0,   a,   0 ] )
            cube(   [ l*2, w+2, h*2 ], center=false);

         // cuts track for catch
         translate([      -1, (w/2)-1.25, 1.5 ] )
            cube(  [ s+l-h+1,        2.5,   h ], center=false);

         // cuts bottom fingernail tab
         translate([ 2.5,  -1,  -1 ] )
            cube([   1.5, w+2,   2 ], center=false);

         // cuts top fingernail tab
         translate([ 2.5,  -1, h-1 ] )
            cube([   1.5, w+2,   2 ], center=false);
      };

      // adds catch
      translate( [ l+s-h, (w/2)-1.0,     0 ] )
         cube(   [     h,       2.0, h-1.0 ], center=false);
   };
};


// bottom stopper
translate([1,               2, 0]) window_stopper( track_width, track_height );
translate([1, 0-track_width-2, 0]) window_stopper( track_width, track_height );


/* end of script */
