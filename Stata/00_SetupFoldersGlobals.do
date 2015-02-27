/*-------------------------------------------------------------------------------
# Name:		00_SetupFolderGlobals
# Purpose:	Create series of folders Food for Peace Time Animated Maps & Analysis
# Author:	Tim Essam, Ph.D. (USAID GeoCenter/OakStream Systems, LLC)
# Created:	07/23/2014
# Owner:	USAID GeoCenter | OakStream Systems, LLC
# License:	MIT License
# Ado(s):	see below
#-------------------------------------------------------------------------------
*/

/* RUN/READ ME FIRST -- Make directories for the study.
 1. Requires root name for file folder structure
 2. Requires branch names for sub-folders
 3. Sets global macros for the study; These are used through the do files.
*/
	
* install the confirm directory ado if not already installed
* list all known user-written .ados needed for project (may have missed some here)
* if code breaks due to missing .ado, type ssc install "NAME" or findit "NAME"
local required_ados confirmdir mvfiles fs spatgsa  adolist labellist winsor2 log2html  
foreach x of local required_ados { 
	capture findfile `x'.ado
		if _rc==601 {
			cap ssc install `x'
		}
		else disp in yellow "`x' currently installed."
	}
*end

* Determine path for the study 
global projectpath "U:/"
cd "$projectpath"

* Run a macro to set up study folder (needs to be modified)
* Name the file path below -- replace "nigerlsms" with your folder name
local pFolder FAD
foreach dir in `pFolder' {
	confirmdir "`dir'"
	if `r(confirmdir)'==170 {
		mkdir "`dir'"
		display in yellow "Project directory named: `dir' created"
		}
	else disp as error "`dir' already exists, not created."
	cd "$projectpath/`dir'"
	}
* end

* Run initially to set up folder structure
* Choose your folders to set up as the local macro `folders'
local folders Rawdata Stata Datain Log Output Dataout Excel PDF Word Graph GIS Export R Python
foreach dir in `folders' {
	confirmdir "`dir'"
	if `r(confirmdir)'==170 {
			mkdir "`dir'"
			disp in yellow "`dir' successfully created."
		}
	else disp as error "`dir' already exists. Skipped to next folder."
}
*end

/*---------------------------------
# Set Globals based on path above #
-----------------------------------*/
global date $S_DATE
local dir `c(pwd)'
global path "`dir'"
global pathdo "`dir'/Stata"
global pathlog  "`dir'/Log"
global pathin "`dir'/Datain"
global pathout "`dir'/Dataout"
global pathgraph "`dir'/Graph"
global pathxls "`dir'/Excel"
global pathreg "`dir'/Output"
global pathgis "`dir'/GIS"
global pathraw "`dir'/Rawdata"
global pathexport "`dir'/Export"
global pathR "`dir'/R"
global pathPython "`dir'/Python"

* Project macros are defined as:
macro list 

* End
