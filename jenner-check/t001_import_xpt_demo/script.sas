/*------------------------------------------------------------
  Compatibility bundle for sas_nhanes_sleep_sbp_analysis.sas

  Runs the repo's own %import_xpt macro against a small,
  self-contained NHANES-shaped DEMO_I transport file so the
  import step can be exercised without the full CDC XPT
  download. The macro below is copied verbatim from the repo.
------------------------------------------------------------*/

/* ---- %import_xpt: copied verbatim from the repo ---- */
%macro import_xpt(xpt=, out=);
  libname xptlib xport "&PROJECT_DIR./&xpt..xpt";
  data &out;
    set xptlib.&out;
  run;
  libname xptlib clear;
%mend;

/* ---- Bundle setup: a tiny stand-in DEMO_I transport file ----
   Six mock rows shaped like the NHANES DEMO_I demographics file
   (SEQN + a few analysis variables). Written to a V5 transport
   file so the repo's macro reads it exactly as it would read the
   real CDC download. No external data or network needed. */
%let PROJECT_DIR=.;

data work.DEMO_I;
  input SEQN RIDAGEYR RIAGENDR RIDRETH1 INDFMPIR;
  datalines;
83732 62 1 3 4.39
83733 53 2 3 1.32
83734 78 1 4 1.51
83735 56 2 1 5.00
83736 42 1 5 2.02
83737 71 2 2 0.84
;
run;

libname demolib xport "&PROJECT_DIR./DEMO_I.xpt";
proc copy in=work out=demolib;
  select DEMO_I;
run;
libname demolib clear;

/* ---- Exercise the repo's macro exactly as the analysis calls it ---- */
%import_xpt(xpt=DEMO_I, out=DEMO_I);

/* Confirm the imported demographics look right */
proc contents data=DEMO_I; run;

proc means data=DEMO_I n mean min max maxdec=2;
  var ridageyr indfmpir;
run;

proc freq data=DEMO_I;
  tables riagendr ridreth1;
run;
