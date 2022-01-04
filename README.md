# Diabetes Dataset--- Linear Discriminant Analysis(LDA) &amp; Quadratic Discriminant Analysis(QDA)

## Setting Up: 
data(Diabetes, package="heplots")

#### Variables: 
relwt: relative weight, expressed as the ratio of actual weight to expected weight, given the person’s height <br/>
glufast: fasting plasma glucose level <br/>
glutest: test plasma glucose level, a measure of glucose intolerance, <br/>
instest: plasma insulin during test, a measure of insulin response to oral glucose, <br/>
sspg: steady state plasma glucose, a measure of insulin resistance <br/>
group: diagnostic group <br/>

## Libraries:
-- ISLR <br/>
-- corrplot <br/>
-- MASS <br/>
-- klaR <br/>
-- leaps <br/>
-- lattice <br/>
-- ggplot2 <br/>
-- corrplot <br/>
-- car <br/>
-- caret <br/>
-- class <br/>
-- heplots <br/>

## Pairwise-Scatter Plots:

![pairwise_scatter_ques3](https://user-images.githubusercontent.com/46763031/148006145-c7cf80ea-22e2-4797-92ae-c116e41f4e1a.png)

Here, almost most of the variables are correlated and has elliptical shape. So none of the feature has multivariate normal. glufast and glutest has similar spread but it’s not
multivariate normal. glutest and sspg also has similar spread but it’s not multivariate spread either. Just to be confirm, I did Multivariate Normality Test that’s done by MVN package in R. After the test it was confirmed that classes are not Multivariate Normal.

## LDA:

Linear Discriminant analysis is a true decision boundary discovery algorithm. It assumes that the class has common covariance and it’s decision boundary is linear
separating the class.

#### LDA Results:

Prior Probabilities of being in Normal category is 51%, being in Chemical Diabetic category is 25% and being in Overt Diabetic category is 23%.

The Accuracy for LDA model is 73%.

## QDA:
Quadratic discriminant analysis (QDA) is closely related to linear discriminant analysis (LDA), where it is assumed that the measurements from each class are normally distributed. Unlike LDA however, in QDA there is no assumption that the covariance of each of the classes is identical.

#### QDA Results:

So, Prior Probabilities of being in Normal category is 51%, being in Chemical Diabetic category is 25% and being in Overt Diabetic category is 23%.

The Accuracy for QDA model is 97%

## Conclusion:

So, after fitting the model on both LDA and QDA, QDA turned out to have the better performance than LDA. This was expected as our data is not in multivariate normal form,
so LDA won’t work properly in this dataset.




