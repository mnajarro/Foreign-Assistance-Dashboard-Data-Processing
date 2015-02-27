
<html>
<body>
<pre>
------------------------------------------------------------------------------------------------------------------------------------------------------------------
      name:  <span class=result>&lt;unnamed&gt;</span>
<span class=result>       </span>log:  <span class=result>U:\FAD/Log/FullFAD.smcl</span>
<span class=result>  </span>log type:  <span class=result>smcl</span>
<span class=result> </span>opened on:  <span class=result>27 Feb 2015, 12:20:16</span>
<br><br>
<span class=input>. </span>
end of do-file
<br><br>
<span class=input>. do "C:\Users\tessam\AppData\Local\Temp\1\STD01000000.tmp"</span>
<br><br>
<span class=input>. * Import the Planned data (may have to change the cellrange if using updated data)</span>
<span class=input>. import excel "$pathin/Full_ForeignAssistanceData.xlsx", sheet("Planned") cellrange(A3:H19752) firstrow</span>
<br><br>
<span class=input>. g type = "Planned"</span>
<br><br>
<span class=input>. destring FiscalYear, replace</span>
FiscalYear already numeric; no <span class=result>replace</span>
<br><br>
<span class=input>. </span>
<span class=input>. *Keep only USAID/DOS streams</span>
<span class=input>. keep if regexm(AgencyName, "(DOS and USAID)")==1</span>
(345 observations deleted)
<br><br>
<span class=input>. save "$pathout/FullPlanned.dta", replace</span>
file U:\FAD/Dataout/FullPlanned.dta saved
<br><br>
<span class=input>. </span>
<span class=input>. *************</span>
<span class=input>. * Obligated *</span>
<span class=input>. *************</span>
<span class=input>. clear</span>
<br><br>
<span class=input>. import excel "$pathin/Full_ForeignAssistanceData.xlsx", sheet("Obligated") cellrange(A3:J19752) firstrow</span>
<br><br>
<span class=input>. g type = "Obligated"</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Keep only USAID funded entries</span>
<span class=input>. keep if regexm(AgencyName, "(USAID)")==1</span>
(3192 observations deleted)
<br><br>
<span class=input>. </span>
<span class=input>. * Clean up missing information</span>
<span class=input>. replace Category="Multi-Sector" if Category==""</span>
(1 real change made)
<br><br>
<span class=input>. </span>
<span class=input>. * Create a unique ID for each observation</span>
<span class=input>. egen id = group(FiscalYear QTR AccountName OperatingUnit BenefitingCountry Category Sector)</span>
<br><br>
<span class=input>. sort id FiscalYear</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Collapse everything down to FY status</span>
<span class=input>. egen double fyAmount = total(Amount), by(FiscalYear  AccountName OperatingUnit BenefitingCountry Category Sector)</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Verify collapse by looking at OperatingUnit=="Armenia" &amp; Sector=="Civil Society" &amp; FiscalYear==2009</span>
<span class=input>. clist Amount  if OperatingUnit=="Armenia" &amp; Sector=="Civil Society" &amp; FiscalYear==2009, noo</span>
<br><br>
    Amount
<span class=result>     30000</span>
<span class=result>  20671.86</span>
<span class=result> 737466.89</span>
<span class=result> 1863688.4</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Collapse information down to FY</span>
<span class=input>. collapse (sum) Amount (mean) fyAmount, by(FiscalYear  AccountName OperatingUnit BenefitingCountry Category Sector type AgencyName)</span>
<br><br>
<span class=input>. g diff = Amount- fyAmount</span>
<br><br>
<span class=input>. sum diff, d</span>
<br><br>
<span class=result>                            </span>diff
-------------------------------------------------------------
      Percentiles      Smallest
 1%    <span class=result>-1.16e-10      -2.38e-07</span>
 5%    <span class=result>        0      -5.96e-08</span>
10%    <span class=result>        0      -2.98e-08       </span>Obs         <span class=result>      10511</span>
25%    <span class=result>        0      -7.45e-09       </span>Sum of Wgt. <span class=result>      10511</span>
<br><br>
50%    <span class=result>        0                      </span>Mean          <span class=result>-2.54e-11</span>
<span class=result>                        </span>Largest       Std. Dev.     <span class=result> 2.51e-09</span>
75%    <span class=result>        0       7.45e-09</span>
90%    <span class=result>        0       7.45e-09       </span>Variance      <span class=result> 6.32e-18</span>
95%    <span class=result>        0       2.98e-08       </span>Skewness      <span class=result>-81.13985</span>
99%    <span class=result> 2.91e-11       5.96e-08       </span>Kurtosis      <span class=result> 7759.014</span>
<br><br>
<span class=input>. </span>
<span class=input>. save "$pathout/FullObligated.dta", replace</span>
file U:\FAD/Dataout/FullObligated.dta saved
<br><br>
<span class=input>. clear</span>
<br><br>
<span class=input>. </span>
<span class=input>. *********</span>
<span class=input>. * Spent *</span>
<span class=input>. *********</span>
<span class=input>. </span>
<span class=input>. import excel "$pathin/Full_ForeignAssistanceData.xlsx", sheet("Spent") cellrange(A3:J62540) firstrow clear</span>
<br><br>
<span class=input>. g type = "Spent"</span>
<br><br>
<span class=input>. keep if regexm(AgencyName, "(USAID)")==1</span>
(6875 observations deleted)
<br><br>
<span class=input>. </span>
<span class=input>. * Clean up missing information</span>
<span class=input>. replace Category="Multi-Sector" if Category==""</span>
(1 real change made)
<br><br>
<span class=input>. </span>
<span class=input>. * Create a unique ID for each observation</span>
<span class=input>. egen id = group(FiscalYear QTR AccountName OperatingUnit BenefitingCountry Category Sector)</span>
<br><br>
<span class=input>. sort id FiscalYear</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Collapse everything down to FY status</span>
<span class=input>. egen double fyAmount = total(Amount), by(FiscalYear  AccountName OperatingUnit BenefitingCountry Category Sector)</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Verify collapse by looking at OperatingUnit=="Armenia" &amp; Sector=="Civil Society" &amp; FiscalYear==2009</span>
<span class=input>. table OperatingUnit Sector if OperatingUnit=="Armenia" &amp; Sector=="Civil Society" &amp; FiscalYear==2009, c(sum Amount mean fyAmount) row col</span>
<br><br>
----------------------------------------
Operating |            Sector           
Unit      | Civil Society          Total
----------+-----------------------------
  Armenia |       <span class=result>6708454        6708454</span>
<span class=result>          </span>|     <span class=result>6708454.1      6708454.1</span>
<span class=result>          </span>| 
    Total |       <span class=result>6708454        6708454</span>
<span class=result>          </span>|     <span class=result>6708454.1      6708454.1</span>
----------------------------------------
<br><br>
<span class=input>. </span>
<span class=input>. * Collapse information down to FY</span>
<span class=input>. collapse (sum) Amount (mean) fyAmount, by(FiscalYear  AccountName OperatingUnit BenefitingCountry Category Sector type AgencyName)</span>
<br><br>
<span class=input>. g diff = Amount- fyAmount</span>
<br><br>
<span class=input>. sum diff, d</span>
<br><br>
<span class=result>                            </span>diff
-------------------------------------------------------------
      Percentiles      Smallest
 1%    <span class=result>-9.31e-10      -1.19e-07</span>
 5%    <span class=result>-5.82e-11      -5.96e-08</span>
10%    <span class=result>        0      -5.96e-08       </span>Obs         <span class=result>      20191</span>
25%    <span class=result>        0      -5.96e-08       </span>Sum of Wgt. <span class=result>      20191</span>
<br><br>
50%    <span class=result>        0                      </span>Mean          <span class=result>-1.25e-12</span>
<span class=result>                        </span>Largest       Std. Dev.     <span class=result> 2.04e-09</span>
75%    <span class=result>        0       2.98e-08</span>
90%    <span class=result>        0       5.96e-08       </span>Variance      <span class=result> 4.15e-18</span>
95%    <span class=result> 5.82e-11       1.19e-07       </span>Skewness      <span class=result> 5.882767</span>
99%    <span class=result> 9.31e-10       1.19e-07       </span>Kurtosis      <span class=result> 1993.908</span>
<br><br>
<span class=input>. </span>
<span class=input>. save "$pathout/FullSpent.dta", replace</span>
file U:\FAD/Dataout/FullSpent.dta saved
<br><br>
<span class=input>. </span>
<span class=input>. append using "$pathout/FullObligated.dta"</span>
(note: variable type was str5, now str9 to accommodate using data's values)
<br><br>
<span class=input>. compress</span>
<span class=result>  </span>AgencyName was <span class=result>str11</span> now <span class=result>str5</span>
<span class=result>  </span>OperatingUnit was <span class=result>str133</span> now <span class=result>str54</span>
<span class=result>  </span>BenefitingCountry was <span class=result>str84</span> now <span class=result>str45</span>
  (3,807,048 bytes saved)
<br><br>
<span class=input>. *append using "$pathout/FullPlanned.dta"</span>
<span class=input>. </span>
<span class=input>. encode type, gen(fundType)</span>
<br><br>
<span class=input>. la var type "Foreign assistance type"</span>
<br><br>
<span class=input>. la var fundType "encoded Foreign assistance type"</span>
<br><br>
<span class=input>. </span>
<span class=input>. save "$pathout/FADcombined.dta", replace</span>
file U:\FAD/Dataout/FADcombined.dta saved
<br><br>
<span class=input>. </span>
<span class=input>. /* First consider spent data */</span>
<span class=input>. *******************************</span>
<span class=input>. </span>
<span class=input>. use "$pathout/FullSpent.dta", clear</span>
<br><br>
<span class=input>. </span>
<span class=input>. *Print a list of Operating units covered save in log folder</span>
<span class=input>. cd "$pathlog"</span>
<span class=result>U:\FAD\Log</span>
<br><br>
<span class=input>. file open myfile using "$pathlog/BeneficiaryList.txt", write replace</span>
<br><br>
<span class=input>. qui levelsof OperatingUnit, local(levels)</span>
<br><br>
<span class=input>. foreach x of local levels {</span>
  2<span class=input>.         file write myfile %133s "`x'" _tab _n</span>
  3<span class=input>.         }</span>
<br><br>
<span class=input>. file close myfile</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Create variables for AGOL mapping exercise</span>
<span class=input>. mdesc</span>
<br><br>
    Variable    |     Missing          Total     Percent Missing
----------------+-----------------------------------------------
     FiscalYear | <span class=result>          0         20,191           0.00</span>
<span class=result>    </span>AccountName | <span class=result>          0         20,191           0.00</span>
<span class=result>     </span>AgencyName | <span class=result>          0         20,191           0.00</span>
<span class=result>   </span>OperatingU~t | <span class=result>          0         20,191           0.00</span>
<span class=result>   </span>Benefiting~y | <span class=result>          0         20,191           0.00</span>
<span class=result>       </span>Category | <span class=result>          0         20,191           0.00</span>
<span class=result>         </span>Sector | <span class=result>          0         20,191           0.00</span>
<span class=result>           </span>type | <span class=result>          0         20,191           0.00</span>
<span class=result>         </span>Amount | <span class=result>          0         20,191           0.00</span>
<span class=result>       </span>fyAmount | <span class=result>          0         20,191           0.00</span>
<span class=result>           </span>diff | <span class=result>          0         20,191           0.00</span>
----------------+-----------------------------------------------
<br><br>
<span class=input>. </span>
<span class=input>. * First, look at the possibility of duplicates</span>
<span class=input>. drop if Amount==0</span>
(60 observations deleted)
<br><br>
<span class=input>. </span>
<span class=input>. * Drop USAID Offices &amp; Regions</span>
<span class=input>. drop if regexm(OperatingUnit, "(USAID|Region|Worldwide)")</span>
(5967 observations deleted)
<br><br>
<span class=input>. </span>
<span class=input>. *Combination of FY AN OU C &amp; S provide unique identifer</span>
<span class=input>. isid FiscalYear AccountName OperatingUnit BenefitingCountry Category Sector</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Calculate aggregates overtime, and by sector overtime</span>
<span class=input>. egen double TotalSpent = total(Amount), by(OperatingUnit)</span>
<br><br>
<span class=input>. egen double TotalSectorSpent = total(Amount), by(Category OperatingUnit)</span>
<br><br>
<span class=input>. g double TotalSectorShare = (TotalSectorSpent/TotalSpent)</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Now, totals and shares by country, by fiscal year</span>
<span class=input>. egen double AnnualSpent = total(Amount), by(OperatingUnit FiscalYear)</span>
<br><br>
<span class=input>. egen double AnnualSectorSpent = total(Amount), by(Category OperatingUnit FiscalYear)</span>
<br><br>
<span class=input>. g double AnnualSectorShare = AnnualSectorSpent/AnnualSpent</span>
(2 missing values generated)
<br><br>
<span class=input>. sort FiscalYear </span>
<br><br>
<span class=input>. </span>
<span class=input>. * label variables</span>
<span class=input>. la var TotalSpent "Total spending for all FYs"</span>
<br><br>
<span class=input>. la var TotalSectorSpent "Total sectoral spending for all FYs"</span>
<br><br>
<span class=input>. la var TotalSectorShare "Sectoral Share of total spending for all FYs"</span>
<br><br>
<span class=input>. la var AnnualSpent "Total annual spending by operating unit"</span>
<br><br>
<span class=input>. la var AnnualSectorSpent "Total sectoral annual spending by operating unit"</span>
<br><br>
<span class=input>. la var AnnualSectorShare "Total sectoral annual share by operating unit"</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Collapse data down </span>
<span class=input>. collapse (mean) TotalSpent TotalSectorSpent TotalSectorShare AnnualSpent AnnualSectorSpent AnnualSectorShare, by(FiscalYear OperatingUnit Category)</span>
<br><br>
<span class=input>. encode OperatingUnit, gen(country)</span>
<br><br>
<span class=input>. </span>
<span class=input>. egen cyid = group(OperatingUnit Category FiscalYear)</span>
<br><br>
<span class=input>. xtset cyid FiscalYear</span>
       panel variable:  <span class=result>cyid (weakly balanced)</span>
        time variable:  <span class=result>FiscalYear, 2009 to 2014</span>
                delta:  <span class=result>1 unit</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Generate percent change for each Category</span>
<span class=input>. encode Category, gen(sector)</span>
<br><br>
<span class=input>. </span>
<span class=input>. set more off</span>
<br><br>
<span class=input>. g pctChange=.</span>
(3668 missing values generated)
<br><br>
<span class=input>. g pctChange2=.</span>
(3668 missing values generated)
<br><br>
<span class=input>. levelsof country, local(place)</span>
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 
&gt; 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 10
&gt; 8 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146
<br><br>
<span class=input>. levelsof sector, local(levels)</span>
1 2 3 4 5 6 7 8 9
<br><br>
<span class=input>. foreach x of local place {</span>
  2<span class=input>.         foreach y of local levels {</span>
  3<span class=input>.                         qui replace pctChange=(AnnualSectorSpent[_n]-AnnualSectorSpent[_n-1])/AnnualSectorSpent[_n-1] if country[_n]==`x' &amp; sector[_n]==`y' &amp;</span>
<span class=input>&gt;  sector[_n]==sector[_n-1]</span>
  4<span class=input>.                         qui replace pctChange2=(AnnualSectorSpent[_n]-AnnualSectorSpent[_n-1])/AnnualSectorSpent[_n-1] if country[_n]==`x' &amp; sector[_n]==`y' </span>
<span class=input>&gt; &amp; sector[_n]==sector[_n-1] &amp; AnnualSectorSpent[_n-1]&gt;0</span>
  5<span class=input>.                 }       </span>
  6<span class=input>.         }</span>
<br><br>
<span class=input>. *end</span>
<span class=input>. </span>
<span class=input>. la var pctChange "Year-to-year percentage change in spending by sector"</span>
<br><br>
<span class=input>. la var pctChange2 "Year-to-year percentage change in spending by sector only for positive spending"</span>
<br><br>
<span class=input>. </span>
<span class=input>. *Double-check that all shares sum to 1</span>
<span class=input>. egen double shareValidate = total(AnnualSectorShare), by(OperatingUnit FiscalYear)</span>
<br><br>
<span class=input>. </span>
<span class=input>. *At the Global scale what does the Breakdown look like by sector, by year?</span>
<span class=input>. egen double WorldAnnualSpent = total(AnnualSpent), by(FiscalYear)</span>
<br><br>
<span class=input>. egen double WorldAnnualSpentSector = total(AnnualSpent), by(Category FiscalYear)</span>
<br><br>
<span class=input>. g double WorldAnnualSectorShare = WorldAnnualSpentSector/WorldAnnualSpent</span>
<br><br>
<span class=input>. </span>
<span class=input>. la var WorldAnnualSpent "Total aggregate spending by FY"</span>
<br><br>
<span class=input>. la var WorldAnnualSpentSector "Total sectoral aggregate spending by FY"</span>
<br><br>
<span class=input>. la var WorldAnnualSectorShare "Total sectoral aggregate share by FY"</span>
<br><br>
<span class=input>. compress</span>
<span class=result>  </span>country was <span class=result>long</span> now <span class=result>int</span>
<span class=result>  </span>sector was <span class=result>long</span> now <span class=result>byte</span>
<span class=result>  </span>cyid was <span class=result>double</span> now <span class=result>int</span>
<span class=result>  </span>OperatingUnit was <span class=result>str133</span> now <span class=result>str30</span>
  (418,152 bytes saved)
<br><br>
<span class=input>. </span>
<span class=input>. g Aidtype = "Spent"</span>
<br><br>
<span class=input>. la var Aidtype "Type of assistance"</span>
<br><br>
<span class=input>. </span>
<span class=input>. save "$pathout/AnnualSpent.dta", replace</span>
file U:\FAD/Dataout/AnnualSpent.dta saved
<br><br>
<span class=input>. </span>
<span class=input>. * Create a Category that is Total and contains the totals for each FY by Country</span>
<span class=input>. preserve</span>
<br><br>
<span class=input>. keep FiscalYear OperatingUnit AnnualSpent TotalSectorShare AnnualSectorShare AnnualSectorSpent TotalSpent WorldAnnualSpent</span>
<br><br>
<span class=input>. collapse (max) AnnualSpent (mean) TotalSectorShare AnnualSectorShare AnnualSectorSpent TotalSpent WorldAnnualSpent, by(FiscalYear OperatingUnit)</span>
<br><br>
<span class=input>. replace AnnualSectorSpent = AnnualSpent</span>
(661 real changes made)
<br><br>
<span class=input>. replace TotalSectorShare = 1</span>
(698 real changes made)
<br><br>
<span class=input>. replace AnnualSectorShare = 1</span>
(662 real changes made)
<br><br>
<span class=input>. </span>
<span class=input>. *Create filler vars</span>
<span class=input>. g Aidtype = "Spent"</span>
<br><br>
<span class=input>. g sector = 10</span>
<br><br>
<span class=input>. la define sect 10 "Total"</span>
<br><br>
<span class=input>. la val sector sect</span>
<br><br>
<span class=input>. g Category = "Total"</span>
<br><br>
<span class=input>. save "$pathout/SpentTotals.dta", replace</span>
file U:\FAD/Dataout/SpentTotals.dta saved
<br><br>
<span class=input>. restore</span>
<br><br>
<span class=input>. </span>
<span class=input>. append using "$pathout/SpentTotals.dta"</span>
(note: variable sector was byte, now double to accommodate using data's values)
<br><br>
<span class=input>. replace TotalSectorSpent = TotalSpent if Category=="Total"</span>
(730 real changes made)
<br><br>
<span class=input>. replace WorldAnnualSpentSector = WorldAnnualSpent if Category=="Total"</span>
(730 real changes made)
<br><br>
<span class=input>. replace WorldAnnualSectorShare=1  if Category=="Total"</span>
(730 real changes made)
<br><br>
<span class=input>. sort FiscalYear OperatingUnit Category</span>
<br><br>
<span class=input>. </span>
<span class=input>. * recode sector</span>
<span class=input>. drop sector</span>
<br><br>
<span class=input>. encode Category, gen(sector)</span>
<br><br>
<span class=input>. drop country</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Create a sector rank variable</span>
<span class=input>. egen sectRank = rank(-AnnualSectorSpent), by(FiscalYear Category)</span>
<br><br>
<span class=input>. </span>
<span class=input>. save "$pathout/AnnualSpent.dta", replace</span>
file U:\FAD/Dataout/AnnualSpent.dta saved
<br><br>
<span class=input>. </span>
<span class=input>. ************************************************</span>
<span class=input>. /* Create similar analysis for Disbursed funds */</span>
<span class=input>. *********************************************** </span>
<span class=input>. </span>
<span class=input>. use "$pathout/FullObligated.dta", clear</span>
<br><br>
<span class=input>. * Keep only USAID spending</span>
<span class=input>. *No USAID spending reported for FY2013</span>
<span class=input>. </span>
<span class=input>. keep if AgencyName=="USAID"</span>
(0 observations deleted)
<br><br>
<span class=input>. la var type "Type of foreign aid"</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Create variables for AGOL mapping exercise</span>
<span class=input>. mdesc</span>
<br><br>
    Variable    |     Missing          Total     Percent Missing
----------------+-----------------------------------------------
     FiscalYear | <span class=result>          0         10,511           0.00</span>
<span class=result>    </span>AccountName | <span class=result>          0         10,511           0.00</span>
<span class=result>     </span>AgencyName | <span class=result>          0         10,511           0.00</span>
<span class=result>   </span>OperatingU~t | <span class=result>          0         10,511           0.00</span>
<span class=result>   </span>Benefiting~y | <span class=result>          0         10,511           0.00</span>
<span class=result>       </span>Category | <span class=result>          0         10,511           0.00</span>
<span class=result>         </span>Sector | <span class=result>          0         10,511           0.00</span>
<span class=result>           </span>type | <span class=result>          0         10,511           0.00</span>
<span class=result>         </span>Amount | <span class=result>          0         10,511           0.00</span>
<span class=result>       </span>fyAmount | <span class=result>          0         10,511           0.00</span>
<span class=result>           </span>diff | <span class=result>          0         10,511           0.00</span>
----------------+-----------------------------------------------
<br><br>
<span class=input>. </span>
<span class=input>. * First, look at the possibility of duplicates</span>
<span class=input>. drop if Amount==0</span>
(91 observations deleted)
<br><br>
<span class=input>. </span>
<span class=input>. * Drop extra offices and worldwide funding</span>
<span class=input>. drop if regexm(OperatingUnit, "(USAID|Region|Worldwide)")</span>
(3655 observations deleted)
<br><br>
<span class=input>. </span>
<span class=input>. * Define a Unique ID</span>
<span class=input>. isid FiscalYear AccountName OperatingUnit BenefitingCountry Category Sector</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Calculate aggregates overtime, and by sector overtime</span>
<span class=input>. egen double TotalSpent = total(Amount), by(OperatingUnit)</span>
<br><br>
<span class=input>. egen double TotalSectorSpent = total(Amount), by(Category OperatingUnit)</span>
<br><br>
<span class=input>. g double TotalSectorShare = (TotalSectorSpent/TotalSpent)</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Now, totals and shares by country, by fiscal year</span>
<span class=input>. egen double AnnualSpent = total(Amount), by(OperatingUnit FiscalYear)</span>
<br><br>
<span class=input>. egen double AnnualSectorSpent = total(Amount), by(Category OperatingUnit FiscalYear)</span>
<br><br>
<span class=input>. g double AnnualSectorShare = AnnualSectorSpent/AnnualSpent</span>
<br><br>
<span class=input>. sort FiscalYear </span>
<br><br>
<span class=input>. </span>
<span class=input>. * label variables</span>
<span class=input>. la var TotalSpent "Total spending for all FYs"</span>
<br><br>
<span class=input>. la var TotalSectorSpent "Total sectoral spending for all FYs"</span>
<br><br>
<span class=input>. la var TotalSectorShare "Sectoral Share of total spending for all FYs"</span>
<br><br>
<span class=input>. la var AnnualSpent "Total annual spending by operating unit"</span>
<br><br>
<span class=input>. la var AnnualSectorSpent "Total sectoral annual spending by operating unit"</span>
<br><br>
<span class=input>. la var AnnualSectorShare "Total sectoral annual share by operating unit"</span>
<br><br>
<span class=input>. </span>
<span class=input>. * preserve</span>
<span class=input>. collapse (mean) TotalSpent TotalSectorSpent TotalSectorShare AnnualSpent AnnualSectorSpent AnnualSectorShare, by(FiscalYear OperatingUnit Category)</span>
<br><br>
<span class=input>. encode OperatingUnit, gen(country)</span>
<br><br>
<span class=input>. </span>
<span class=input>. egen cyid = group(OperatingUnit Category FiscalYear)</span>
<br><br>
<span class=input>. xtset cyid FiscalYear</span>
       panel variable:  <span class=result>cyid (weakly balanced)</span>
        time variable:  <span class=result>FiscalYear, 2009 to 2013</span>
                delta:  <span class=result>1 unit</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Generate percent change for each Category</span>
<span class=input>. encode Category, gen(sector)</span>
<br><br>
<span class=input>. </span>
<span class=input>. set more off</span>
<br><br>
<span class=input>. g pctChange=.</span>
(2334 missing values generated)
<br><br>
<span class=input>. g pctChange2=.</span>
(2334 missing values generated)
<br><br>
<span class=input>. levelsof country, local(place)</span>
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 
&gt; 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 10
&gt; 8 109 110 111 112 113 114 115 116 117 118 119 120 121 122
<br><br>
<span class=input>. levelsof sector, local(levels)</span>
1 2 3 4 5 6 7 8 9
<br><br>
<span class=input>. foreach x of local place {</span>
  2<span class=input>.         foreach y of local levels {</span>
  3<span class=input>.                         qui replace pctChange=(AnnualSectorSpent[_n]-AnnualSectorSpent[_n-1])/AnnualSectorSpent[_n-1] if country[_n]==`x' &amp; sector[_n]==`y' &amp;</span>
<span class=input>&gt;  sector[_n]==sector[_n-1]</span>
  4<span class=input>.                         qui replace pctChange2=(AnnualSectorSpent[_n]-AnnualSectorSpent[_n-1])/AnnualSectorSpent[_n-1] if country[_n]==`x' &amp; sector[_n]==`y' </span>
<span class=input>&gt; &amp; sector[_n]==sector[_n-1] &amp; AnnualSectorSpent[_n-1]&gt;0</span>
  5<span class=input>.                 }       </span>
  6<span class=input>.         }</span>
<br><br>
<span class=input>. *end</span>
<span class=input>. </span>
<span class=input>. la var pctChange "Year-to-year percentage change in spending by sector"</span>
<br><br>
<span class=input>. la var pctChange2 "Year-to-year percentage change in spending by sector only for positive spending"</span>
<br><br>
<span class=input>. </span>
<span class=input>. *Double-check that all shares sum to 1</span>
<span class=input>. egen shareValidate = total(AnnualSectorShare), by(OperatingUnit FiscalYear)</span>
<br><br>
<span class=input>. </span>
<span class=input>. *At the Global scale what does the Breakdown look like by sector, by year?</span>
<span class=input>. egen double WorldAnnualSpent = total(AnnualSpent), by(FiscalYear)</span>
<br><br>
<span class=input>. egen double WorldAnnualSpentSector = total(AnnualSpent), by(Category FiscalYear)</span>
<br><br>
<span class=input>. g double WorldAnnualSectorShare =WorldAnnualSpentSector/WorldAnnualSpent</span>
<br><br>
<span class=input>. </span>
<span class=input>. la var WorldAnnualSpent "Total aggregate obligated by FY"</span>
<br><br>
<span class=input>. la var WorldAnnualSpentSector "Total sectoral obligated by FY"</span>
<br><br>
<span class=input>. la var WorldAnnualSectorShare "Total sectoral obligated share by FY"</span>
<br><br>
<span class=input>. compress</span>
<span class=result>  </span>country was <span class=result>long</span> now <span class=result>int</span>
<span class=result>  </span>sector was <span class=result>long</span> now <span class=result>byte</span>
<span class=result>  </span>cyid was <span class=result>double</span> now <span class=result>int</span>
<span class=result>  </span>OperatingUnit was <span class=result>str127</span> now <span class=result>str29</span>
  (254,406 bytes saved)
<br><br>
<span class=input>. g Aidtype = "Obligated"</span>
<br><br>
<span class=input>. la var Aidtype "Type of assistance"</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Create a Category that is Total and contains the totals for each FY by Country</span>
<span class=input>. preserve</span>
<br><br>
<span class=input>. keep FiscalYear OperatingUnit AnnualSpent TotalSectorShare AnnualSectorShare AnnualSectorSpent TotalSpent WorldAnnualSpent</span>
<br><br>
<span class=input>. collapse (max) AnnualSpent (mean) TotalSectorShare AnnualSectorShare AnnualSectorSpent TotalSpent WorldAnnualSpent, by(FiscalYear OperatingUnit)</span>
<br><br>
<span class=input>. replace AnnualSectorSpent = AnnualSpent</span>
(470 real changes made)
<br><br>
<span class=input>. replace TotalSectorShare=1</span>
(529 real changes made)
<br><br>
<span class=input>. replace AnnualSectorShare=1</span>
(470 real changes made)
<br><br>
<span class=input>. </span>
<span class=input>. *Create filler vars</span>
<span class=input>. g Aidtype = "Obligated"</span>
<br><br>
<span class=input>. g sector = 10</span>
<br><br>
<span class=input>. la define sect 10 "Total"</span>
<br><br>
<span class=input>. la val sector sect</span>
<br><br>
<span class=input>. g Category = "Total"</span>
<br><br>
<span class=input>. save "$pathout/SpentObligated.dta", replace</span>
file U:\FAD/Dataout/SpentObligated.dta saved
<br><br>
<span class=input>. restore</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Append totals to main obligated data</span>
<span class=input>. append using "$pathout/SpentObligated.dta"</span>
(note: variable sector was byte, now double to accommodate using data's values)
<br><br>
<span class=input>. replace TotalSectorSpent = TotalSpent if Category=="Total"</span>
(541 real changes made)
<br><br>
<span class=input>. replace WorldAnnualSpentSector = WorldAnnualSpent if Category=="Total"</span>
(541 real changes made)
<br><br>
<span class=input>. replace WorldAnnualSectorShare=1  if Category=="Total"</span>
(541 real changes made)
<br><br>
<span class=input>. sort FiscalYear OperatingUnit Category</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Recode sector</span>
<span class=input>. drop sector</span>
<br><br>
<span class=input>. encode Category, gen(sector)</span>
<br><br>
<span class=input>. drop country</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Create a sector rank variable</span>
<span class=input>. egen sectRank = rank(-AnnualSectorSpent), by(FiscalYear Category)</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Append two datasets</span>
<span class=input>. append using "$pathout/AnnualSpent.dta"</span>
(note: variable OperatingUnit was str29, now str30 to accommodate using data's values)
(label sector already defined)
<br><br>
<span class=input>. compress</span>
<span class=result>  </span>sector was <span class=result>long</span> now <span class=result>byte</span>
  (21,819 bytes saved)
<br><br>
<span class=input>. </span>
<span class=input>. *Create a tag for South Sudan</span>
<span class=input>. g byte SudanTag = (OperatingUnit == "Sudan, Pre-2011 Election")</span>
<br><br>
<span class=input>. la var SudanTag "Tag for Pre-2011"</span>
<br><br>
<span class=input>. drop shareValidate</span>
<br><br>
<span class=input>. </span>
<span class=input>. save "$pathout/AnnualSpentAndObligated.dta", replace</span>
file U:\FAD/Dataout/AnnualSpentAndObligated.dta saved
<br><br>
<span class=input>. </span>
<span class=input>. * Fix country names</span>
<span class=input>. clonevar Country = OperatingUnit</span>
<br><br>
<span class=input>. replace Country = "Bosnia and Herzegovina" if Country == "Bosnia-Hercegovina"</span>
(0 real changes made)
<br><br>
<span class=input>. replace Country = "China" if Country == "China, People's Republic"</span>
(0 real changes made)
<br><br>
<span class=input>. replace Country = "Taiwan" if Country == "China, Republic of (Taiwan)"</span>
(0 real changes made)
<br><br>
<span class=input>. replace Country = "Kyrgyzstan" if Country == "Kyrgyz Republic"</span>
(74 real changes made)
<br><br>
<span class=input>. replace Country = "Democratic Republic of the Congo" if Country == "Congo, Democratic Republic of"</span>
Country was <span class=result>str30</span> now <span class=result>str32</span>
(84 real changes made)
<br><br>
<span class=input>. replace Country = "Republic of the Congo" if Country == "Congo, Republic of"</span>
(35 real changes made)
<br><br>
<span class=input>. replace Country = "The Gambia" if Country == "Gambia, The"</span>
(35 real changes made)
<br><br>
<span class=input>. replace Country = "North Korea" if Country == "Korea, North"</span>
(4 real changes made)
<br><br>
<span class=input>. replace Country = "South Korea" if Country == "Korea, Republic of"</span>
(0 real changes made)
<br><br>
<span class=input>. replace Country = "Federated States of Micronesia" if Country == "Micronesia"</span>
(8 real changes made)
<br><br>
<span class=input>. replace Country = "Moldova" if Country == "Moldovia"</span>
(0 real changes made)
<br><br>
<span class=input>. replace Country = "Sudan" if Country == "North Sudan"</span>
(0 real changes made)
<br><br>
<span class=input>. replace Country = "Palau" if Country == "Palau Islands"</span>
(0 real changes made)
<br><br>
<span class=input>. replace Country = "Somoa" if Country == "Western Samoa"</span>
(0 real changes made)
<br><br>
<span class=input>. replace Country = "West Bank-Gaza" if Country=="West Bank and Gaza"</span>
(78 real changes made)
<br><br>
<span class=input>. replace Country = "South Korea" if Country=="Korea, South"</span>
(4 real changes made)
<br><br>
<span class=input>. replace Country = "Syria" if Country=="Syrian Arab Republic"</span>
(9 real changes made)
<br><br>
<span class=input>. replace Country = "Barbados" if Country=="Barbados and Eastern Caribbean"</span>
(4 real changes made)
<br><br>
<span class=input>. replace Country = upper(Country)</span>
(7273 real changes made)
<br><br>
<span class=input>. </span>
<span class=input>. merge m:m Country using "$pathin/CountryNamesBase.dta"</span>
<br><br>
    Result                           # of obs.
    -----------------------------------------
    not matched              <span class=result>             151</span>
        from master          <span class=result>              87</span>  (_merge==1)
        from using           <span class=result>              64</span>  (_merge==2)
<br><br>
    matched                  <span class=result>           7,186</span>  (_merge==3)
    -----------------------------------------
<br><br>
<span class=input>. drop if _merge==2</span>
(64 observations deleted)
<br><br>
<span class=input>. </span>
<span class=input>. merge m:m Country using "$pathin/CountryLinks.dta", gen(_merge2)</span>
<br><br>
    Result                           # of obs.
    -----------------------------------------
    not matched              <span class=result>           4,534</span>
        from master          <span class=result>           4,533</span>  (_merge2==1)
        from using           <span class=result>               1</span>  (_merge2==2)
<br><br>
    matched                  <span class=result>           2,740</span>  (_merge2==3)
    -----------------------------------------
<br><br>
<span class=input>. drop if _merge2==2</span>
(1 observation deleted)
<br><br>
<span class=input>. </span>
<span class=input>. * Create a logged term for annual sector spent for symbolizing in ArcMap</span>
<span class=input>. g logAnnualSectorSpent = log10(AnnualSectorSpent)</span>
(214 missing values generated)
<br><br>
<span class=input>. </span>
<span class=input>. * Bring in transaction counts</span>
<span class=input>. </span>
<span class=input>. merge m:m Country using "$pathout\transactionsCounts.dta", gen(_merge3)</span>
(note: variable Country was str32, now str59 to accommodate using data's values)
<br><br>
    Result                           # of obs.
    -----------------------------------------
    not matched              <span class=result>             173</span>
        from master          <span class=result>             172</span>  (_merge3==1)
        from using           <span class=result>               1</span>  (_merge3==2)
<br><br>
    matched                  <span class=result>           7,101</span>  (_merge3==3)
    -----------------------------------------
<br><br>
<span class=input>. drop if _merge3==2</span>
(1 observation deleted)
<br><br>
<span class=input>. </span>
<span class=input>. compress</span>
<span class=result>  </span>disbursed_amount was <span class=result>long</span> now <span class=result>int</span>
<span class=result>  </span>Country was <span class=result>str59</span> now <span class=result>str32</span>
<span class=result>  </span>organizational_unit was <span class=result>str59</span> now <span class=result>str29</span>
  (429,107 bytes saved)
<br><br>
<span class=input>. save "$pathout/AnnualSpentAndObligated.dta", replace</span>
file U:\FAD/Dataout/AnnualSpentAndObligated.dta saved
<br><br>
<span class=input>. </span>
<span class=input>. * Export FAD data to a csv for graphics in R</span>
<span class=input>. preserve</span>
<br><br>
<span class=input>. drop _merge*</span>
<br><br>
<span class=input>. export delimited using "$pathexport/FAdashboard.csv", replace</span>
file U:\FAD/Export/FAdashboard.csv saved
<br><br>
<span class=input>. restore</span>
<br><br>
<span class=input>. </span>
</pre>
</body>
</html>
