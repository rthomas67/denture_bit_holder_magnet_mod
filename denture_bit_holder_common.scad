

magnetDia=10;
magnetThickness=3;
magnetSlotCutLength=15;


bitPocketCenterCoordinates=[
    [-31,55.6],  // left molar (also used to re-cut flaw in original model)
    [-29.8,44.3],
    [-27.6,34.1],
    [-25,25.6],
    [-20.7,17.7],
    [-14.6,11.4],
    [-6.6,7],  // left front tooth
    [4.6,6.2],  // right front tooth
    [12.8,9.8], 
    [19.7,15.1],
    [23.8,23.2],
    [27.3,31.6],
    [31.9,41.4],
    [35.4,51]  // right molar
];

positionPreviewZShift=0;//-20;

positioningHelperPocketCut=false;
positionHelperDiaReduction=0.4;

bitPocketDia=7.8;
bitPocketDepth=15;
bitPocketBottomHeight=7;

overlap=0.01;
$fn=20;

function midpoint(xyA, xyB, zCoord) = 
    [xyA[0] + ((xyB[0]-xyA[0])/2), xyA[1] + ((xyB[1]-xyA[1])/2), zCoord];

module magnetInsertSlot(xyA, xyB, thickness) {
    // calculate normal angle from the 2 points
    rotate([0,0,slotCutAngle(xyA, xyB)])
        hull() {
            cylinder(d=magnetDia, h=thickness);
            translate([0,-magnetDia/2,0])
                cube([magnetSlotCutLength,magnetDia,thickness]);
        }
}

// Reminder: atan2 args are reversed order: y, x, so index 1, then index 0
function slotCutAngle(xyA, xyB) = atan2( (xyB[1]-xyA[1]), (xyB[0]-xyA[0]) ) + -90;
