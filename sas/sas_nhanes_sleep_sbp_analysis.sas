/*------------------------------------------------------------
  NHANES Example: Sleep Duration and Mean SBP
  NOTE: Uses XPT files. Update PROJECT_DIR to your folder.
------------------------------------------------------------*/

options validvarname=v7;

/* 1) Set project directory (edit this path) */
%let PROJECT_DIR=/path/to/nhanes/xpt/files;

/* 2) Macro to import XPT into WORK with a consistent name */
%macro import_xpt(xpt=, out=);
  libname xptlib xport "&PROJECT_DIR./&xpt..xpt";
  data &out;
    set xptlib.&out;
  run;
  libname xptlib clear;
%mend;

/* --- Import 2015-2016 (I) --- */
%import_xpt(xpt=DEMO_I,   out=DEMO_I);
%import_xpt(xpt=SLQ_I,    out=SLQ_I);
%import_xpt(xpt=ALQ_I,    out=ALQ_I);
%import_xpt(xpt=BIOPRO_I, out=BIOPRO_I);
%import_xpt(xpt=BMX_I,    out=BMX_I);
%import_xpt(xpt=BPQ_I,    out=BPQ_I);
%import_xpt(xpt=CBC_I,    out=CBC_I);
%import_xpt(xpt=DIQ_I,    out=DIQ_I);
%import_xpt(xpt=SMQ_I,    out=SMQ_I);
%import_xpt(xpt=HDL_I,    out=HDL_I);
%import_xpt(xpt=BPX_I,    out=BPX_I);

/* --- Import 2017-2018 (J) --- */
%import_xpt(xpt=DEMO_J,   out=DEMO_J);
%import_xpt(xpt=SLQ_J,    out=SLQ_J);
%import_xpt(xpt=ALQ_J,    out=ALQ_J);
%import_xpt(xpt=BIOPRO_J, out=BIOPRO_J);
%import_xpt(xpt=BMX_J,    out=BMX_J);
%import_xpt(xpt=BPQ_J,    out=BPQ_J);
%import_xpt(xpt=CBC_J,    out=CBC_J);
%imp
