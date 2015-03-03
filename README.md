#### Foreign-Assistance-Dashboard-Data-Processing
<p align="left">
  <img src="https://cloud.githubusercontent.com/assets/5873344/6418718/5fdf6054-be85-11e4-9dfd-cc43b8137e7c.PNG" width="800px" height="400px"/> 
</p>
This repo describes on how the [USAID Foreign Assistance Dashboard Map][1] data was processed and how the team produced the map.

===  

*General updating process and data processing procedures for GeoCenter*

**Full Foreign Assistance Dashboard Spreadsheet Processing**  
This is a general overview of the data processing. For specific details see the Stata[5] folder and the corresponding ```.do``` files.  
  
1. Download [Full Foreign Assistance Dashboard dataset][2] and [USAID Transaction dataset][3] as excel
2. Import into Stata and extract Spent and Obligated data only for USAID 
3. Remove any duplicates in the data  
4. Calculate aggregates over time, and by category over time 
5. Calculate totals and shares by country (operating unit), category and by fiscal year
5. Generate percent change for each category
6. Calculate at the clobal scale the Spent and Obligated by sector and by year
7. Merge Spent and Obligated dataare sets and if necessary reshape them to form a panel
8. Remove any USAID offices that are not countries
9. Rename countries to meet DOS country naming standards
10. Added flag image URLs for countries on Dollars to results site  

**GIS Processing**  

1. Data is joined with [Department of State Large Scale International Boundaries polygon file][4] in ArcGIS Desktop          
    + Removed all FY 2014 and above data(only showing complete data up to FY 2013)   
    + Multiply shares by 100 to convert decimals to percent    
2. Converted spreadsheet to a geodatabase table in the Foreign Assistance Dashboard geodatabase    
3. Set sector domains using the category domain field and used abbreviations   
    + Domain Field Codes in Geodatabase  
        - All - All (Total)  
        - Edu - Education and Social Services  
        - Envir - Environment  
        - Health - Health
        - Human - Humanitarian Assistance  
        - Peace - Peace and Security  
        - PM - Program Management     
        - Mulit - Multi-Sector  
4. Data is symbolized in ArcMap and uploaded as a feature service in ArcGIS for Server.   
5. Symbology  
    + Sudan and PreSudan2011  
    + Removed Sudan FY 2010 and 2009 values (only 4 rows)  
    + added 2 polygons to State Department LSIB file  for PreSudan 2011 (with South Sudan Border and without)  
    + Edited country codes in the table. (SUP and SUB(withboundaries))   
    + sorted data so that South Sudan and Sudan are overlapping Sudan Pre-2011  
    + Created custom color ramp classifications  
6. Web Map application configured to display Spent/obligated, Fiscal Year and Category    

===

*Disclaimer: The findings, interpretation, and conclusions expressed herein are those of the authors and do not necessarily reflect the views of United States Agency for International Development or the United States Government. All errors remain our own. Contact us with questions at geocenter[at]usaid.gov.*  


[1]: http://geocenterdev.org/ForeignAssistance/index.html
[2]: http://www.foreignassistance.gov/web/Documents/Full_ForeignAssistanceData.zip
[3]: http://www.foreignassistance.gov/web/Documents/Full_ForeignAssistanceData_Transaction.zip  
[4]: https://hiu.state.gov/data/data.aspx
[5]: https://github.com/mnajarro/Foreign-Assistance-Dashboard-Data-Processing/tree/master/Stata


