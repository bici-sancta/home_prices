

options ls = 78;

title "Discriminant Analysis - Homes - Foundation Types";

/*	...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=  */
/* ...	read in training data set	... */
/*	...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=  */

filename reffile '/folders/myfolders/stats_i/training_set_cleaned.csv';

proc import datafile = reffile
	dbms = csv
	out = home_prices;
	getnames = yes;
run;

/*	...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=  */
/* ...	read in test data set	... */
/*	...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=  */

filename reffile '/folders/myfolders/stats_i/test_set_cleaned.csv';

proc import datafile = reffile
	dbms = csv
	out = test_set;
	getnames = yes;
run;

/*	...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=  */
/* ...	combine train and test data sets		... */
/*	...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=  */

data train_test;
 set home_prices test_set;
run;

/*	...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=  */

/*proc discrim data = home_prices pool=test crossvalidate testdata = test_set testout = a;*/

proc discrim data = home_prices crossvalidate testdata = test_set testout = a;
	class foundation;
	var fullbath
		garagecars
		log_lotfrontage
		overallcond
		overallqual
		log_grlivarea
		totrmsabvgrd
		log_lotarea
		garagearea
		bsmtfinsf1
		x2ndflrsf
		totalbsmtsf
		x1stflrsf
		grlivarea
		yearbuilt
		yearremodadd;		
   priors "BrkTil" = 0.100
			"CBlock" = 0.434
			"PConc" = 0.443
			"Slab" = 0.016
			"Stone" = 0.004
			"Wood" = 0.002;
run;

proc print;
   run;