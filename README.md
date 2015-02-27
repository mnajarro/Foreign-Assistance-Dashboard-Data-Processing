# Foreign-Assistance-Dashboard-Data-Processing
This repo provides transparency on how the USAID Foreign Assistance Dashboard Map data was processed and created.

General updating process and data processing procedures for GeoCenter
Full Foreign Assistance Dashboard Spreadsheet Processing
1.	Download Full Foreign Assistance Dashboard dataset and USAID Transaction dataset as excel
2.	Import into STATA and extract Spent and Obligated data only for USAID
3.	Remove any duplicates in the data
4.	Calculate aggregates overtime, and by category overtime
a.	Calculate totals and shares by country (operating unit), category and by fiscal year
5.	Generate percent change for each Category
6.	Calculate at the Global scale the Spent and Obligated by sector and by year
7.	Spent and Obligated are merged and stacked
8.	Remove any USAID offices that are not countries
9.	Rename countries to meet DOS country naming standards.
10.	Added flag image URLs for countries on Dollars to results site
GIS Processing
1.	Data is joined with Department of State Large Scale International Boundaries polygon file in ArcGIS Desktop. 
a.	Removed all FY 2014 and above data(only showing complete data up to FY 2013)
b.	Multiply shares by 100 to convert decimals to percent
2.	Converted Spreadsheet to a GeoDatabase Table in the Foreign Assistance Dashboard geodatabase 
3.	Set sector domains using the category domain field and used abbreviations
a.	Domain Field Codes in Geodatabase
i.	All	All (Total)
ii.	Edu	Education and Social Services
iii.	Envir	Environment
iv.	Health	Health
v.	Human	Humanitarian Assistance
vi.	Peace	Peace and Security
vii.	PM	Program Management
viii.	Multi	Multi-Sector
ix.	DRG	Democracy Human Rights and Governance
x.	Econ	Economic Development
4.	Data is symbolized in ArcMap and uploaded as a Feature service in ArcGIS for Server. 
5.	Symbology
a.	Sudan and PreSudan2011
i.	Removed Sudan FY 2010 and 2009 values (only 4 rows)
ii.	added 2 polygons to State Department LSIB file  for PreSudan 2011 (with South Sudan Border and without)
iii.	Edited country codes in the codes in the table. (SUP and SUB(withboundaries)) 
iv.	sorted data so that South Sudan and Sudan were overlapping Sudan Pre-2011
b.	Created custom color ramp classifications
6.	Web Map application is configured to display Spent/obligated, Fiscal Year and Category

