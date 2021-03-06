

# ...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#  ...	directories
# ...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

home_dir <- "~/_smu/_src/home_prices/"
data_dir <- "./data"
lda_dir <- "./stats_ii/lda"
sas_analysis_dir <- "./stats_i/sas_analysis"
sas_dir <- "~/sas/SASUniversityEdition/myfolders/stats_ii"

setwd(home_dir)

# ...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#  ...	read in test data set
# ...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

	setwd(data_dir)
	test_homes <- read.csv("test.csv", stringsAsFactors = FALSE)
	setwd(home_dir)
	
	names(test_homes) <- tolower(names(test_homes))
	
	for (i in 2:(length(test_homes)))
	{
		if (class(test_homes[,i]) == "character")
		{
			test_homes[,i] <- factor (test_homes[,i])
		}
	}
	
	ncol <- length(test_homes)
	n_imp <- 0
	for (i in 1 : (length(test_homes)))
	{
		if(class(test_homes[,i]) == "integer"
		   			|| class(test_homes[,i]) == "numeric"
		   			|| class(test_homes[,i]) == "matrix")
		{
			n_imp <- n_imp + 1
			test_homes[ncol+n_imp] <- 0
			test_homes[, (ncol+n_imp)][is.na (test_homes[,i])] <- 1
			
			new_name <- paste0("imp_", names(test_homes)[i])
			names(test_homes)[ncol+n_imp] <- new_name
			
			test_homes[,i][is.na (test_homes[,i])] <- mean(test_homes[,i], na.rm = TRUE)
		}
	}
	
	for (i in 1 : (length(test_homes)))
	{
		if(class(test_homes[,i]) == "factor")
		{
			levels <- levels(test_homes[,i])
			levels[length(levels) + 1] <- "None"
			test_homes[,i] <- factor(test_homes[,i], levels = levels)
			test_homes[,i][is.na (test_homes[,i])] <- "None"
		}
	}
	
	test_homes$log_lotfrontage <- log(test_homes$lotfrontage)
	test_homes$log_lotarea <- log(test_homes$lotarea)
	test_homes$log_grlivarea <- log(test_homes$grlivarea)
	
# ...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# ...	keep same columns as training data set
# ...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	
	test_homes_sas_keep <- subset(test_homes,
			select = c(
			id,
			bsmtfinsf1,
			bsmtfintype1,
			bsmtfullbath,
			bsmtqual,
			centralair,
			electrical,
			exterior1st,
			exterior2nd,
			exterqual,
			fireplacequ,
			fireplaces,
			foundation,
			fullbath,
			garagearea,
			garagecars,
			garagefinish,
			garagetype,
			halfbath,
			heatingqc,
			housestyle,
			kitchenqual,
			log_grlivarea,
			log_lotarea,
			log_lotfrontage,
			lotshape,
			masvnrtype,
			mszoning,
			neighborhood,
			overallcond,
			overallqual,
			saletype,
			totalbsmtsf,
			totrmsabvgrd,
			x1stflrsf,
			x2ndflrsf,
			yearbuilt,
			yearremodadd))

	
	
	write.csv(test_homes_sas_keep, file = "test_set_cleaned.csv", row.names = FALSE)
	
	setwd(sas_dir)
	write.csv (test_homes_sas_keep, file = "test_set_cleaned.csv", row.names = FALSE)
	

# ...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# ...	read in predicted sale prices
# ...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

	setwd(home_dir)
	setwd(sas_analysis_dir)
	test_pred <- read.csv("submit_test_pred_sas_stp_selection.csv", stringsAsFactors = FALSE)
	
	setwd(home_dir)
	names(test_pred) <- tolower(names(test_pred))
	test_homes_w_pred <- merge(test_homes, test_pred, by = "id")
	
# ...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# ...	Columns to retain for LDA - based on visual inspection of histograms / boxplots
# ...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	
		test_homes_w_pred$log_saleprice <- log(test_homes_w_pred$saleprice)
		
		test_homes_lda_keep <- subset(test_homes_w_pred,
			select = c(
				foundation,
				log_saleprice,
				lotfrontage, # ... wood
				overallqual,
				overallcond,
				yearbuilt,	# !!!
				yearremodadd, # !!!
				masvnrarea,	# BrkTil
				bsmtfinsf1,
				bsmtunfsf,
				totalbsmtsf,
				x2ndflrsf,	# stone & wood
				grlivarea,
				bedroomabvgr,
				kitchenabvgr,	# stone & slab
				totrmsabvgrd,	# stone
				garageyrblt,	# !!!
				garagecars,	# P Conc
				garagearea,	# Pconc $& wood
				openporchsf,	# pconc & impute 0s to median
				miscval,	# maybe wood & impute 0s to median
				yrsold))	# stone .. maybe by chance

# ...	--> 	saleprice #	impute in test set based on regression ??

	setwd(home_dir)
	setwd(lda_dir)
	write.csv(test_homes_lda_keep, file = "lda_test_set_cleaned.csv", row.names = FALSE)
	setwd(home_dir)
	
	setwd(sas_dir)
	write.csv (test_homes_lda_keep, file = "lda_test_set_cleaned.csv", row.names = FALSE)
	setwd(home_dir)


