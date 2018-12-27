## DOF2DTM Layer Matrix

Historically all of these datasets are jumbled together in the DOF_TAXMAP Oracle schema and people refer to the whole deal generally as "The Digital Tax Map."  Maybe this is all documented somewhere already?  Until we find better docs let's categorize the datasets in more detail like:

### The Digital Tax Map Jumble 
1. Layers that are actively edited by the Department of Finance and directly consumed by Geowebcache
2. Layers that are actively edited by the Department of Finance, ETL'd, then consumed by Geowebcache 
3. DOF Reference layers and other tracking stuff 
4. Reference layers consumed by Geoserver or Geowebcache
5. Layers that are legacy ETL'd but do not participate in tiles
6. Trash layers that exist only to confuse us 
7. Some exotic BBLs to puzzle over 


### 1. Layers that are actively edited by the Department of Finance and directly consumed by Geowebcache

These don't participate in the legacy ETL but should be part of our dtm2cloud project.

| Table Name | Notes |
| ------------- | ------------- | 
| Boundary  | Lines. Geometries may be invalid | 
| Condo_Units | Not spatial. Careful: Don't confuse with the CONDO_UNIT view, which is dangerous and bad |
| Lot_Face_Possession_Hooks | Points | 
| Misc_Text | Points | 
| Possession_Hooks | Points | 
| REUC_Lots | Not spatial.  Need to verify relationship to V_REUC_LOT |
| Tax_Block_Polygon | Polygons, rarely edited. Also ETLs into TAX_BLOCK, a category #5 | 
| Tax_Lot_Face | Lines. Geometries may be invalid. Also feeds into LOT_FACE_POINT in category #2 below | 

### 2. Layers that are actively edited by the Department of Finance, ETL'd, then consumed by Geowebcache 

| Target Table/View Name  | DOF Source | Notes |
| ------------- | ------------- | ------------- |
| LOT_FACE_POINT | Tax_Lot_Face | Midpoint of the line I think, selected attributes transferred and some attributes derived |
| TAX_BLOCK_POINT | Tax_Block_Polygon | Centroid of the polygon, selected attributes transferred. Rarely (if ever?) change |
| TAX_LOT_POINT | Tax_Lot_Polygon | Centroid of the polygon, selected attributes transferred |
| V_TAX_LOT_POINT | Air_Label | No spatial data, adds labels to TAX_LOT_POINT |
|                 | Condo_Label | No spatial data, adds labels to TAX_LOT_POINT |
|                 | Sub_Label | No spatial data, adds labels to TAX_LOT_POINT |


### 3. DOF Reference layers and other tracking stuff 

These are mostly DAB_% tables supporting the Digital Alteration Book and related views like V_BORO_BLOCK_CHANGES that summarize editing work.

We may wish to partially translate some of these in the ETL for tracking purposes.


### 4. Reference layers consumed by Geoserver or Geowebcache

Skipping for now


### 5. Layers that are legacy ETL'd but do not participate in tiles

| Table Name | Notes |
| ------------- | ------------- | 
| TAX_BLOCK | This is a subset (87%) of all tax_block_polygon records with some formatted columns and geometry as sdo_geometry. It feeds into the v_boro_block_changes view that drives the legacy ETL. |



### 6. Trash layers that exist only to confuse us 

| Table/View Name  | Notes |
| ------------- | ------------- | 
| CONDO_UNIT   | Warning: Don't even look at this view. It is defined such that unconstrained selects write and fill the TEMP tablespace, resulting in alerts. It has no known application uses or referenced depedencies  |
| Tax_Lot_Centroid   | Appears to have been at one time the legacy SDE version of TAX_LOT_FACE but is now empty. |


### 7. Some exotic BBLs to puzzle over

The notes below were noted during October 2018 puzzling.  They tend to represent edge cases in the existing editing and ETL workflows.

| BBL | Dataset | Description |
| ------------- | ------------- | ------------- |
| **1006050046** | SDE tax_lot_polygon | 2 adjacent (chained with shared edge lots) with same bbl.  One is a sliver and is missing attributes |
| | SDO tax_lot_point | 2 separate records to label each lot.  Without knowing these dets, the sliver label on the DTM looks wrong | 
| | SDO tax_lot_polygon_sdo | 1 merged, zoomable, single outer ring polygon |
| | PostGIS tax_lot_point | 2 records to label each lot |
| | PostGIS tax_lot_polygon |  2 separate lots (preventing unique key on bbl) |
| **2025418900** | SDE tax_lot_polygon | 3 adjacent (chained with shared edge) lots with the same bbl |
| | SDO tax_lot_point | 3 separate records to label each lot | 
| | SDO tax_lot_polygon_sdo | 1 merged, zoomable, single outer ring polygon |
| | PostGIS tax_lot_point | 3 records to label each lot |
| | PostGIS tax_lot_polygon |  3 separate lots (preventing unique key on bbl) |

A list of puzzling candidates.  These are legacy duplicate bbl tax_lot_point records (multiple labels) that correspond to unique tax_lot_polygon_sdo records where the tax_lot_polygon_sdo is a single outer ring.  

Roughly half of these are duplicates (or more) where the shapes are visible at scale.  The other half are slivers.  Then there is 5061560032 which is a completely duplicated and coincident lot.

| BBL | 
| ------------- |
| 1006050046 |
| 1006050047 |
| 2025418900 |
| 2042260001 |
| 3044520570 |
| 3059210088 |
| 4039160030 |
| 4159050003 |
| 4159050057 |
| 4159050058 |
| 4159050093 |
| 4159050295 |
| 5014890001 |
| 5015250100 |
| 5018650020 |
| 5019550150 |
| 5019550425 |
| 5020850014 |
| 5024500120 |
| 5030240001 |
| 5057350345 |
| 5057350390 |
| 5061560032 |
| 5062490230 |
| 5062500016 |
| 5062500018 |
| 5063480001 |
| 5070410001 |
| 5070480150 |
| 5070540301 |

A less puzzling but still exotic list. These are legacy duplicate bbl tax_lot_point records (multiple labels) that correspond to unique tax_lot_polygon_sdo records where the tax_lot_polygon_sdo is multiple outer rings.

Some of these digits (0000, 9999, 8900) appear to indicate medians and other unruly blocks and lots. 

| BBL |
| ------------- |
| 1000620001 |
| 1001420025 |
| 1001420050 |
| 1011710007 |
| 1011710100 |
| 1013730001 |
| 1013730030 |
| 1018970001 |
| 2000008900 |
| 2027810500 |
| 2054870073 |
| 2099990100 |
| 2099998900 |
| 3044520301 |
| 4039160010 |
| 4039160025 |
| 4076210001 |
| 4091770001 |
| 5001100001 |
| 5003190001 |
| 5008230024 |
| 5024500010 |
| 5024500020 |
| 5024500200 |
| 5024500240 |
| 5024510040 |
| 5024510048 |
| 5031730001 |
| 5031730999 |
| 5060172601 |
| 5062500035 |
| 5063730001 |
| 5067510125 |
| 5070550001 |