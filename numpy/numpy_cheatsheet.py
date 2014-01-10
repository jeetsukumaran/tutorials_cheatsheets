import numpy as np

###################################
# Matrix
###################################

A = np.array([[1.1, 2.2, 3.3],[4.4, 5.5, 6.6]], float) # sublist = row
print("element in row2, col3:", A[1,2])
# element in row2, col3: 6.6

print("matrix dimensions:", A.shape)  
# matrix dimensions: (2, 3)

print("number of rows:", len(A))    
# matrix dimensions: (2, 3)

A_transp = A.transpose()
# [[ 1.1  4.4]
# [ 2.2  5.5]
# [ 3.3  6.6]]

a_1 = A.reshape(6,1)  # reshape 2D matrix into a 1D column vector
# [[ 1.1]
# [ 2.2]
# [ 3.3]
# [ 4.4]
# [ 5.5]
# [ 6.6]]

a_2 = A.reshape(1,6)  # reshape 2D matrix into a 1D row vector
# [[ 1.1  2.2  3.3  4.4  5.5  6.6]]

a_3 = A.flatten()     # make an 1-dimensional array, (row vector)
# [ 1.1  2.2  3.3  4.4  5.5  6.6]


