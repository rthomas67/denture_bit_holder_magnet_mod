# Original Models
* Thingiverse link: https://www.thingiverse.com/thing:4781176

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
