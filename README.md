# Original Models
* Thingiverse link: https://www.thingiverse.com/thing:4781176

# Magnets
In addition to the large magnets in the original model, this modification
creates pockets for additional bit-retention magnets.  
* The pockets are open to the side (through the denture gum-line) so the
bits can't pull the magnets out.  It also sorta looks like orthodontic braces.
* There is one slightly-larger magnet per 2 bits (14x), making it more cost
effective than having a single small magnet under every bit (28x).
* The magnets required for this mod are 10mm x 2.75mm.
  * Note: There are many "multi-magnet" sets on Amazon which
  include enough for 1 or 2 denture sets.  Search "small magnets different sizes"
  with keywords like "rare earth" or "neodymium" or "strong,"
  and check the sizes and counts included.
  * Note: If the actual diameter or thickness is slightly different, e.g. 10mm x 3mm
  the corresponding diameter and thickness variable values in denture_bit_holder_common.stl 
  could be adjusted a little.

# Remaking the mmix STL files
The original models downloaded from Thingiverse have gaps in the 
mesh that prevent OpenSCAD from rendering. 

The .scad files reference .stl files with -mmix_repair suffixed
on the filename.  Those files are created from the originals
using Autodesk's free MeshMixer tool.
* https://meshmixer.com/download.html
  * Note: Autodesk let their SSL cert for this domain expire in May 2024, 
  freaking out browsers which check the cert details, but this is the right 
  URL/domain.

Steps to fix...
* Open original stl in MeshMixer
* Edit -> Close Cracks
* Analysis -> Inspector -> Auto Repair All (Hole Fill Mode: Flat Fill)
