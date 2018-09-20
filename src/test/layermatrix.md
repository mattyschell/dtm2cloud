## DOF2DTM Layer Matrix

Historically all of these datasets are jumbled together in the DOF_TAXMAP Oracle schema and people refer to the whole deal generally as "The Digital Tax Map."  Maybe this is all documented somewhere already?  Until we find better docs let's categorize the datasets in more detail like:

### The Digital Tax Map Jumble 
1. Layers that are actively edited by the Department of Finance and directly consumed by Geowebcache
2. Layers that are actively edited by the Department of Finance, ETL'd, then consumed by Geowebcache 
3. DOF Reference layers and other tracking stuff 
4. Reference layers consumed by Geoserver or Geowebcache
5. Layers that are legacy ETL'd but do not participate in tiles
6. Trash layers that exist only to confuse us 


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
| Tax_Block_Polygon | Polygons, good name! Also ETLs into TAX_BLOCK, a category #5.  Rarely changes  | 
| Tax_Lot_Face | Lines. Geometries may be invalid. Also feeds into LOT_FACE_POINT in category #2 below | 

### 2. Layers that are actively edited by the Department of Finance, ETL'd, then consumed by Geowebcache 

| Target Table/View Name  | DOF Source | Notes |
| ------------- | ------------- | ------------- |
| LOT_FACE_POINT  | Tax_Lot_Face  | Midpoint of the line I think, selected attributes transferred and some attributes derived |
| TAX_BLOCK_POINT   | Tax_Block_Polygon  | Centroid of the polygon, selected attributes transferred. Rarely (if ever?) change |
| TAX_LOT_POINT   | Tax_Lot_Polygon  | Centroid of the polygon, selected attributes transferred |
| V_TAX_LOT_POINT | Air_Label | No spatial data, adds labels to TAX_LOT_POINT |
|                 | Condo_Label | No spatial data, adds labels to TAX_LOT_POINT |
|                 | Sub_Label | No spatial data, adds labels to TAX_LOT_POINT |


## 3. DOF Reference layers and other tracking stuff 

These are mostly DAB_% tables supporting the Digital Alteration Book and related views like V_BORO_BLOCK_CHANGES that summarize editing work.

We may wish to partially translate some of these in the ETL for tracking purposes.


### 4. Reference layers consumed by Geoserver or Geowebcache

Skipping

### 5. Layers that are legacy ETL'd but do not participate in tiles

Skipping for now

### 6. Trash layers that exist only to confuse us 

| Table/View Name  | Notes |
| ------------- | ------------- | 
| CONDO_UNIT   | Warning: Don't even look at this view. It is defined such that unconstrained selects write and fill the TEMP tablespace, resulting in alerts. It has no known application uses or referenced depedencies  |
| Tax_Lot_Centroid   | Appears to have been at one time the legacy SDE version of TAX_LOT_FACE but is now empty. |
