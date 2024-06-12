// TODO: Fix original "mesh is not closed" error
include <denture_bit_holder_common.scad>

difference() {
    centeredOriginalPart();
    for (i=[0:2:12]) {
        translate(midpoint(bitPocketCenterCoordinates[i],bitPocketCenterCoordinates[i+1],-overlap)) {
            translate([0,0,bitPocketBottomHeight-magnetThickness])
                magnetInsertSlot(bitPocketCenterCoordinates[i],bitPocketCenterCoordinates[i+1], magnetThickness+overlap*2);
            if (positioningHelperPocketCut) 
                translate([0,0,bitPocketBottomHeight-0.05])
                    cylinder(d=bitPocketDia-positionHelperDiaReduction, h=1);
        }
    }
    // recut handle incursion in pocket
    translate([bitPocketCenterCoordinates[0][0],bitPocketCenterCoordinates[0][1],bitPocketBottomHeight+overlap])
        cylinder(d=bitPocketDia, h=bitPocketDepth*2);
}

// from Thingiverse item 4781176
// Repaired in Meshmixer with 2 steps:
//  * Edit -> Close Cracks
//  * Analysis -> Inspector -> Auto Repair All (Hole Fill Mode: Flat Fill)
module centeredOriginalPart() {
    translate([15,53.8,positionPreviewZShift])
        import("Jaw1a-mmix_repair.stl", convexity=3);
}