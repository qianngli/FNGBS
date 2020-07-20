FNGBS
======
**This is an implementation of  A Fast Neighborhood Grouping Method for Hyperspectral Band Selection.**

Citation 
--------
**Please consider cite this paper if you find it helpful.**

@article{wang2020afast,

	title={A Fast Neighborhood Grouping Method for Hyperspectral Band Selection},
	author={Q. Wang, Q. Li and X. Li},
	journal={IEEE Transactions on Geoscience and Remote Sensing},
	year={2020}}
  
Dataset
------
**Four public datasets, i.e., [Indian Pines](http://www.ehu.eus/ccwintco/index.php?title=Hyperspectral_Remote_Sensing_Scenes "Indian Pines"), [Botswana](http://www.ehu.eus/ccwintco/index.php?title=Hyperspectral_Remote_Sensing_Scenes "Botswana"), [Pavia University](http://www.ehu.eus/ccwintco/index.php?title=Hyperspectral_Remote_Sensing_Scenes "Pavia University")， [Salinas](http://www.ehu.eus/ccwintco/index.php?title=Hyperspectral_Remote_Sensing_Scenes "Salinas"), are employed to verify the effectiveness of the  proposed FNGBS.

Requirement
---------
**MATLAB, libsvm, cruve fitting tool**

Implementation
--------
**The ADAM optimizer with beta_1 = 0.9, beta _2 = 0.999 is employed to train our network.  The learning rate is initialized as 10^-4 for all layers, which decreases by a half at every 35 epochs.**

Result
--------
**To qualitatively measure the proposed FNGBS, KNN and SVM classifiers are employed to verify the effectiveness of the algorithm.**

Recommended Bands Comparison:
---------
![Image text](https://raw.githubusercontent.com/qianngli/Images/master/recom.png)


Classification Performance Comparison:
----------
![Image text](https://raw.githubusercontent.com/qianngli/Images/master/indian_pines.png)
![Image text](https://raw.githubusercontent.com/qianngli/Images/master/Bot.png)
![Image text](https://raw.githubusercontent.com/qianngli/Images/master/PU.png)
![Image text](https://raw.githubusercontent.com/qianngli/Images/master/Slinas.png)

Computational Time Comparison
-------
| Scale  |  CAVE |  Harvard |  Foster |
| :------------: | :------------: | :------------: | :------------: | 
|  x2 |  45.102 / 0.9738 / 2.241 | 46.263 / 0.9827 / 1.883  | 58.878 / 0.9988 / 4.061 | 
|  x3 |  41.031 / 0.9526 / 2.809  |  42.681 / 0.9627 / 2.214 | 55.017 / 0.9970 / 5.126  |   
|  x4 | 39.026 / 0.9319 / 3.292 |  40.081 / 0.9367 / 2.410 | 52.225 / 0.9941 / 5.685  | 
