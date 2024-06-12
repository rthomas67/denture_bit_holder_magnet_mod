// TODO: Fix original "The given mesh is not closed" error
include <denture_bit_holder_common.scad>

hingeCenterZ=35.25;
hingeCenterY=76.25;
hingeOuterSurfaceLeftX=-25.4;
hingeOuterSurfaceRightX=30;
detentHoleDia=3.1;
detentStartingAngle=-27;
detentPositionRadius=5.75;

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
    translate([0,hingeCenterY,hingeCenterZ]) {
        for (extraDetentAngle=[60:60:120]) {
            rotate([detentStartingAngle-extraDetentAngle,0,0])
                translate([0,detentPositionRadius,0]) {
                    translate([hingeOuterSurfaceLeftX,0,0])
                        sphere(d=detentHoleDia);
                    translate([hingeOuterSurfaceRightX,0,0])
                        sphere(d=detentHoleDia);
                }
        }
    }
}

// from Thingiverse item 4781176
// Repaired in Meshmixer with 2 steps:
//  * Edit -> Close Cracks
//  * Analysis -> Inspector -> Auto Repair All (Hole Fill Mode: Flat Fill)
module centeredOriginalPart() {
    rotate([0,0,180])
        translate([11,-98,positionPreviewZShift])
            import("Jaw_2a-magnets_on_back-mmix_repair.stl", convexity=3);
}