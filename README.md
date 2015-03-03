#### Foreign-Assistance-Dashboard-Data-Processing
<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/5873344/6418718/5fdf6054-be85-11e4-9dfd-cc43b8137e7c.PNG" width="700px" height="400px"/> 
</p>
This repo details how the GeoCenter team created the [USAID Foreign Assistance Dashboard Map][1]. Derived data can be found in the ```Data``` folder.

===  

*General updating process and data processing procedures for GeoCenter*

**Full Foreign Assistance Dashboard Spreadsheet Processing**  
This is a general overview of the data processing. For specific details see the Stata[5] folder and the corresponding ```.do``` files.  
  
1. Download [Full Foreign Assistance Dashboard dataset][2] and [USAID Transaction dataset][3] as excel
2. Import into Stata and extract Spent and Obligated data only for USAID 
3. Remove any duplicates in the data  
4. Calculate funding aggregates over time and by category
5. Calculate totals and shares by country (operating unit), category and by fiscal year
5. Generate percentage change for each category
6. Calculate at the global scale the Spent and Obligated by sector and by year
7. Merge Spent and Obligated data sets and if necessary reshape them to form a panel
8. Remove any USAID offices that are not countries
9. Rename countries to meet DOS country naming standards
10. Added URLs for country's [Dollars to Results][6] site based on country flag image  

**GIS Processing**  

1. Join data with [Department of State Large Scale International Boundaries polygon file][4] in ArcGIS Desktop  
    + Removed all FY 2014 (only showing complete data up to FY 2013)   
    + Multiply shares by 100 to convert decimals to percent    
2. Convert spreadsheet to a geodatabase table in Foreign Assistance Dashboard geodatabase    
3. Set sector domains using the category domain field and use abbreviations below   
    + Domain Field Codes in Geodatabase:    
        - All - All (Total)  
        - Edu - Education and Social Services  
        - Envir - Environment  
        - Health - Health
        - Human - Humanitarian Assistance  
        - Peace - Peace and Security  
        - PM - Program Management     
        - Mulit - Multi-Sector  
4. Symbolize data in ArcMap and upload as a feature service in ArcGIS for Server.   
5. Symbology  
    + Sudan and PreSudan2011  
    + Remove Sudan FY 2010 and 2009 values (only 4 rows)  
    + Add two polygons to State Department LSIB file  for PreSudan 2011 (with South Sudan Border and without)  
    + Edit country codes in the table - (SUP and SUB(withboundaries))   
    + Sort data so that South Sudan and Sudan are overlapping Sudan Pre-2011  
    + Creat custom color ramp classifications  
6. Web Map application configured to display Spent/obligated, Fiscal Year and Category    

===

*Disclaimer: The findings, interpretation, and conclusions expressed herein are those of the authors and do not necessarily reflect the views of United States Agency for International Development or the United States Government. All errors remain our own. Contact us with questions at geocenter[at]usaid.gov.*  


[1]: http://geocenterdev.org/ForeignAssistance/index.html
[2]: http://www.foreignassistance.gov/web/Documents/Full_ForeignAssistanceData.zip
[3]: http://www.foreignassistance.gov/web/Documents/Full_ForeignAssistanceData_Transaction.zip  
[4]: https://hiu.state.gov/data/data.aspx
[5]: https://github.com/mnajarro/Foreign-Assistance-Dashboard-Data-Processing/tree/master/Stata.
[6]: http://results.usaid.gov/  


