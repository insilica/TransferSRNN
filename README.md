# TransferSRNN

Here is an explanation of the files in this repo.

Discrete Survival Demo.ipynb - Notebook that shows whole process of building and running survival models. Can be run in new environment after pip installing requirements.txt. Takes a couple hours to run. In the end, it generates a plot similar to lossdiff_boxplot2.svg

lossdiff_boxplot.svg - Plot of difference between loss of respective fold and disease of baseline model and transfer model

baseline_losses.csv - Loss values for each fold and disease for baseline models

transfer_losses.csv - Loss values for each fold and disease for transfer models

transfer_feature_importance.csv - Feature importance table for transfer models across all diseases. Generated by iterating across all features and randomly shuffling one feature while holding all others constant. The more that the loss increases when shuffling a particular feature, the more important we can assume that feature to be.

global_feature_importance.csv - Feature importance table for global model.

specific_disease_feature_importance.csv - Feature importance table for each specific disease

requirements.txt - Python dependencies to be installed in new environment

nnet_survival.py - Python file containing survival model functions



To run Discrete Survival Demo.ipynb, run the following command to install dependencies in your environment:

`pip install -r requirements.txt`

Next, in Discrete Survival Demo.ipynb's 2nd cell, cd to TransferSRNN directory which you git cloned.

Now you can run all the cells
