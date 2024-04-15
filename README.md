FNGBS
======
**This is an implementation of  A Fast Neighborhood Grouping Method for Hyperspectral Band Selection.**
  
Dataset
------
**Four public datasets, i.e., [Indian Pines](http://www.ehu.eus/ccwintco/index.php?title=Hyperspectral_Remote_Sensing_Scenes "Indian Pines"), [Botswana](http://www.ehu.eus/ccwintco/index.php?title=Hyperspectral_Remote_Sensing_Scenes "Botswana"), [Pavia University](http://www.ehu.eus/ccwintco/index.php?title=Hyperspectral_Remote_Sensing_Scenes "Pavia University"), and [Salinas](http://www.ehu.eus/ccwintco/index.php?title=Hyperspectral_Remote_Sensing_Scenes "Salinas"), are employed to verify the effectiveness of the  proposed FNGBS.**

Requirement
---------
**MATLAB, libsvm, cruve fitting tool**

Implementation
--------
**With respect to FNGBS algorithm, to run the code, please perform 'main.m'. As for obtained recommended bands, we need to conduct 'main_recomBand.m'. Note that the hyperparameters of each dataset is set as follows**

| Dataset | k | Z |
| :------------: | :------------: | :------------: |
| Indian Pines | 2  |10%|
| Botswana | 2  |1%|
| Pavia University | 3  |1%|
| Salinas | 3  |1%|

Result
--------
**To qualitatively measure the proposed FNGBS, KNN and SVM classifiers are employed to verify the effectiveness of the algorithm.**

Recommended Bands Comparison:
---------
![Image text](https://raw.githubusercontent.com/qianngli/Images/master/FNGBS/recom.png)


Classification Performance Comparison:
----------
![Image text](https://raw.githubusercontent.com/qianngli/Images/master/FNGBS/indian_pines.png)
![Image text](https://raw.githubusercontent.com/qianngli/Images/master/FNGBS/Bot.png)
![Image text](https://raw.githubusercontent.com/qianngli/Images/master/FNGBS/PU.png)
![Image text](https://raw.githubusercontent.com/qianngli/Images/master/FNGBS/Salinas.png)

Computational Time Comparison
-------
| Dataset  |  E-FDPC |  WaLuDi |  SNNC | TOF | FNGBS (1%)| FNGBS (100%) |
| :------------: | :------------: | :------------: | :------------: | :------------: | :------------: | :------------: | 
|  Indian Pines (6 bands) | 0.121 | 7.430 | 0.4411 | 0.4165 | 0.2542 | 0.2995 | 
|  Botswana (8 bands)|   0.661 | 99.281 | 3.738 | 1.843 | 0.892 | 3.442 |   
|  Pavia University (13 bands) | 0.282 | 27.930 | 1.201 | 0.925 | 0.336 | 1.421 |
|  Salinas (6 bands) | 0.381 | 40.382 | 1.61 | 1.276 | 0.465 | 1.464 |

Citation 
--------
**Please consider cite this paper if you find it helpful.**

@article{wang2020afast,

	title={A Fast Neighborhood Grouping Method for Hyperspectral Band Selection},
	author={Q. Wang, Q. Li and X. Li},
	journal={IEEE Transactions on Geoscience and Remote Sensing},
	year={2020},
	doi={10.1109/TGRS.2020.3011002}
	}
	
	
--------
If you has any questions, please send e-mail to liqmges@gmail.com.
