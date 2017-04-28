# home_prices
Ask a home buyer to describe their dream house, and they probably won't begin with the height of the basement ceiling or the proximity to an east-west railroad. But this playground competition's dataset proves that much more influences price negotiations than the number of bedrooms or a white-picket fence.  With 79 explanatory variables describing (almost) every aspect of residential homes in Ames, Iowa, this competition challenges you to predict the final price of each home.
   
### Tip : to render the .html pages that are referenced on this repo ...  
go to this site : http://htmlpreview.github.io/?  
and copy/paste the .html link from this page into the text box  


***  
  
    
#### __Purpose__  

Build the most predictive model for sales prices of homes in all of Ames Iowa.  This includes all neighborhoods.  Your group is limited to only the techniques we have learned in 6371 (no random forests or other methods we have not yet covered.)  Specifically, you should produce 4 models:  
* one from forward selection, one from backwards elimination, one from stepwise selection and one that you build custom.  The custom model could be one of the three preceding models or one that you build by adding or subtracting variables at your will.  
* Generate an adjusted R2, CV Press and Kaggle Score for each of these models and clearly describe which model you feel is the best in terms of being able to predict future sale prices of homes in Ames, Iowa.  


#### __Outline of files / procedure__  


    1 - data cleaning & prep : home_prices_data_prep.Rmd  

        produces SAS input data training set  
        also created file 'homes_train_plots.pdf' ... which is a bunch of plots from which I made visual judgements about what is candidate for regression model.  


    2 - SAS input file : /data/training_set_cleaned.csv  

    3 - SAS procedures can be found in : question_2_summary.Rmd  

    4 - create kaggle input file : sas_kaggle_submit.Rmd  


I did all of the data manip/cleaning in R and just used SAS for the regression analysis.  

