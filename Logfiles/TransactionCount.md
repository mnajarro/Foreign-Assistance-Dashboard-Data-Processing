
<html>
<body>
<pre>
------------------------------------------------------------------------------------------------------------------------------------------------------------------
      name:  <span class=result>&lt;unnamed&gt;</span>
<span class=result>       </span>log:  <span class=result>U:\FAD/Log/01_TransactionCount.smcl</span>
<span class=result>  </span>log type:  <span class=result>smcl</span>
<span class=result> </span>opened on:  <span class=result>27 Feb 2015, 11:57:57</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Check if data have been downloaded, if not download and open</span>
<span class=input>. cd "$pathin"</span>
<span class=result>U:\FAD\Datain</span>
<br><br>
<span class=input>. local Required_file Full_ForeignAssistanceData_Transaction</span>
<br><br>
<span class=input>. foreach x of local Required_file { </span>
  2<span class=input>.          capture findfile `x'.zip</span>
  3<span class=input>.                 if _rc==601 {</span>
  4<span class=input>.                         copy http://www.foreignassistance.gov/web/Documents/Full_ForeignAssistanceData_Transaction.zip $pathin/Full_ForeignAssistanceData_Tra</span>
<span class=input>&gt; nsaction.zip, replace </span>
  5<span class=input>.                         unzipfile $pathin/Full_ForeignAssistanceData_Transaction.zip, replace</span>
  6<span class=input>.                         * Create an exit conditions based on whether or not file is found.</span>
<span class=input>.                         *if _rc==601 exit = 1</span>
<span class=input>.                 }</span>
  7<span class=input>.                 else disp in yellow "`x' already downloaded and unzipped to Pathin folder." </span>
  8<span class=input>.                 }</span>
<span class=result>Full_ForeignAssistanceData_Transaction already downloaded and unzipped to Pathin folder.</span>
<br><br>
<span class=input>. *end</span>
<span class=input>. </span>
<span class=input>. * Import the Planned data (may have to change the cellrange)</span>
<span class=input>. set excelxlsxlargefile on</span>
<br><br>
<span class=input>. import excel "$pathin\Full_ForeignAssistanceData_Transaction.xlsx"</span>
<br><br>
<span class=input>. set more off</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Replace variable names with strings from first row</span>
<span class=input>. foreach var of varlist * {</span>
  2<span class=input>.   label variable `var' "`=`var'[1]'"</span>
  3<span class=input>.   replace `var'="" if _n==1</span>
  4<span class=input>.   destring `var', replace</span>
  5<span class=input>. }</span>
(1 real change made)
A has all characters numeric; <span class=result>replaced </span>as <span class=result>long</span>
(1 missing value generated)
(1 real change made)
B contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
C contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
D contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
E has all characters numeric; <span class=result>replaced </span>as <span class=result>int</span>
(2 missing values generated)
(1 real change made)
F has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(230 missing values generated)
(1 real change made)
G has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(163504 missing values generated)
(1 real change made)
H has all characters numeric; <span class=result>replaced </span>as <span class=result>int</span>
(2 missing values generated)
(1 real change made)
I contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
J contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
K contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
L contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
M has all characters numeric; <span class=result>replaced </span>as <span class=result>double</span>
(15999 missing values generated)
(1 real change made)
N has all characters numeric; <span class=result>replaced </span>as <span class=result>double</span>
(3344 missing values generated)
(1 real change made)
O contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
P contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
Q has all characters numeric; <span class=result>replaced </span>as <span class=result>int</span>
(2 missing values generated)
(1 real change made)
R contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
S has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(1804 missing values generated)
(1 real change made)
T contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
U contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
V contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
W contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
X contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
Y contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
Z contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
AA contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
AB contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
AC contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
AD contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
AE has all characters numeric; <span class=result>replaced </span>as <span class=result>double</span>
(20661 missing values generated)
(1 real change made)
AF has all characters numeric; <span class=result>replaced </span>as <span class=result>double</span>
(15999 missing values generated)
(1 real change made)
AG has all characters numeric; <span class=result>replaced </span>as <span class=result>double</span>
(3344 missing values generated)
(1 real change made)
AH contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
AI contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
AJ has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(111042 missing values generated)
(1 real change made)
AK has all characters numeric; <span class=result>replaced </span>as <span class=result>int</span>
(40733 missing values generated)
(1 real change made)
AL contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
AM contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
AN has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(163504 missing values generated)
(1 real change made)
AO has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(163504 missing values generated)
(1 real change made)
AP has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(163504 missing values generated)
(1 real change made)
AQ contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
AR contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
AS contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
AT contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
AU contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
AV contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
AW contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
AX has all characters numeric; <span class=result>replaced </span>as <span class=result>int</span>
(2476 missing values generated)
(1 real change made)
AY contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
AZ has all characters numeric; <span class=result>replaced </span>as <span class=result>long</span>
(145466 missing values generated)
(1 real change made)
BA contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
BB contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
BC contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
BD contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
BE has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(163504 missing values generated)
(1 real change made)
BF contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
BG contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
BH contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
BI contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
BJ contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
BK contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
BL has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(163504 missing values generated)
(1 real change made)
BM contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
BN has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(163504 missing values generated)
(1 real change made)
BO has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(163504 missing values generated)
(1 real change made)
BP has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(163504 missing values generated)
(1 real change made)
BQ contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
BR contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
BS contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
BT contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
BU contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
BV has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(1 missing value generated)
(1 real change made)
BW has all characters numeric; <span class=result>replaced </span>as <span class=result>int</span>
(68394 missing values generated)
(1 real change made)
BX has all characters numeric; <span class=result>replaced </span>as <span class=result>int</span>
(2 missing values generated)
(1 real change made)
BY has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(230 missing values generated)
(1 real change made)
BZ has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(2 missing values generated)
(1 real change made)
CA contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
CB contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
CC has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(2 missing values generated)
(1 real change made)
CD contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
CE contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
CF contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
CG contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
CH contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
CI contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
CJ has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(163504 missing values generated)
(1 real change made)
CK contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
CL contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
CM has all characters numeric; <span class=result>replaced </span>as <span class=result>int</span>
(2 missing values generated)
(1 real change made)
CN has all characters numeric; <span class=result>replaced </span>as <span class=result>int</span>
(2 missing values generated)
(1 real change made)
CO contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
CP has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(145900 missing values generated)
(1 real change made)
CQ has all characters numeric; <span class=result>replaced </span>as <span class=result>int</span>
(145972 missing values generated)
(1 real change made)
CR has all characters numeric; <span class=result>replaced </span>as <span class=result>int</span>
(52692 missing values generated)
(1 real change made)
CS contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
CT contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
CU contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
CV has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(145466 missing values generated)
(1 real change made)
CW has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(145466 missing values generated)
(1 real change made)
CX contains nonnumeric characters; no <span class=result>replace</span>
(1 real change made)
CY has all characters numeric; <span class=result>replaced </span>as <span class=result>byte</span>
(163504 missing values generated)
<br><br>
<span class=input>. *end</span>
<span class=input>. </span>
<span class=input>. *Create variable names from variable labels</span>
<span class=input>. foreach var of varlist _all {</span>
  2<span class=input>.         local label : variable label `var'</span>
  3<span class=input>.         local new_name = lower(strtoname("`label'"))</span>
  4<span class=input>.         rename `var' `new_name'</span>
  5<span class=input>. }</span>
<br><br>
<span class=input>. *end</span>
<span class=input>. </span>
<span class=input>. drop in 1</span>
(1 observation deleted)
<br><br>
<span class=input>. isid id</span>
<br><br>
<span class=input>. compress</span>
<span class=result>  </span>objective number was <span class=result>str16</span> now <span class=result>str5</span>
<span class=result>  </span>sourceagency was <span class=result>str12</span> now <span class=result>str11</span>
<span class=result>  </span>sourceobligationtype was <span class=result>str20</span> now <span class=result>str13</span>
<span class=result>  </span>collaborationtype was <span class=result>str17</span> now <span class=result>str13</span>
<span class=result>  </span>implementingagentcountryoforigin was <span class=result>str32</span> now <span class=result>str24</span>
<span class=result>  </span>implementingagentduns was <span class=result>str21</span> now <span class=result>str16</span>
<span class=result>  </span>currentstatusofreportingdate was <span class=result>str28</span> now <span class=result>str15</span>
<span class=result>  </span>reportingdate was <span class=result>str13</span> now <span class=result>str10</span>
<span class=result>  </span>fad_objnumber was <span class=result>str13</span> now <span class=result>str5</span>
<span class=result>  </span>fad_objabbreviation was <span class=result>str19</span> now <span class=result>str9</span>
<span class=result>  </span>fad_lineage was <span class=result>str11</span> now <span class=result>str6</span>
<span class=result>  </span>fad_type was <span class=result>str8</span> now <span class=result>str4</span>
<span class=result>  </span>fad_hexvalue was <span class=result>str12</span> now <span class=result>str7</span>
<span class=result>  </span>fad_reporting was <span class=result>str13</span> now <span class=result>str3</span>
<span class=result>  </span>fad_endhexvalue was <span class=result>str15</span> now <span class=result>str7</span>
  (16,677,306 bytes saved)
<br><br>
<span class=input>. </span>
<span class=input>. * Filter on USAID &amp; FY2013</span>
<span class=input>. keep if agency=="USAID"</span>
(72303 observations deleted)
<br><br>
<span class=input>. keep if fy==2013</span>
(17635 observations deleted)
<br><br>
<span class=input>. </span>
<span class=input>. * Save a copy so you don't have to go through long excel open each time</span>
<span class=input>. save "$pathout/transactions.dta", replace</span>
file U:\FAD/Dataout/transactions.dta saved
<br><br>
<span class=input>. </span>
<span class=input>. keep if disbursed_amount!=0</span>
(17693 observations deleted)
<br><br>
<span class=input>. ren organizational unit organizational_unit</span>
<br><br>
<span class=input>. </span>
<span class=input>. * Count the number of non-zero transactions by </span>
<span class=input>. collapse (count) disbursed_amount , by(organizational_unit)</span>
<br><br>
<span class=input>. clonevar Country = organizational_unit</span>
<br><br>
<span class=input>. </span>
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
(1 real change made)
<br><br>
<span class=input>. replace Country = "Democratic Republic of the Congo" if Country == "Congo, Democratic Republic of"</span>
(1 real change made)
<br><br>
<span class=input>. replace Country = "Republic of the Congo" if Country == "Congo, Republic of"</span>
(1 real change made)
<br><br>
<span class=input>. replace Country = "The Gambia" if Country == "Gambia, The"</span>
(1 real change made)
<br><br>
<span class=input>. replace Country = "North Korea" if Country == "Korea, North"</span>
(0 real changes made)
<br><br>
<span class=input>. replace Country = "South Korea" if Country == "Korea, Republic of"</span>
(0 real changes made)
<br><br>
<span class=input>. replace Country = "Federated States of Micronesia" if Country == "Micronesia"</span>
(0 real changes made)
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
(1 real change made)
<br><br>
<span class=input>. replace Country = "South Korea" if Country=="Korea, South"</span>
(0 real changes made)
<br><br>
<span class=input>. replace Country = "Syria" if Country=="Syrian Arab Republic"</span>
(0 real changes made)
<br><br>
<span class=input>. replace Country = "Barbados" if Country=="Barbados and Eastern Caribbean"</span>
(0 real changes made)
<br><br>
<span class=input>. drop if regexm(Country, "(USAID|Region|Worldwide)")</span>
(30 observations deleted)
<br><br>
<span class=input>. replace Country = upper(Country)</span>
(118 real changes made)
<br><br>
<span class=input>. </span>
<span class=input>. *save "$pathout/transactionsCounts.dta", replace</span>
<span class=input>. log2html "$pathdo/01_TransactionCount", replace</span>
file U:\FAD/Stata/01_TransactionCount.smcl not found
<div class=error> r(601); </div>
<br><br>
end of do-file
<br><br>
<div class=error> r(601); </div>
<br><br>
<span class=input>. do "C:\Users\tessam\AppData\Local\Temp\1\STD01000000.tmp"</span>
<br><br>
</pre>
</body>
</html>
