% ========================
% VECTORS
% ========================

A1 = [12 23 34 44 59 70 98]			% 1-dimensional row vector
A2 = [12; 23; 34; 44; 59; 70; 98] 	% 1-dimensional column vector

% ACCESSING VECTOR ELEMENTS
A1(1)	  % 1st element of the vector (here: 12)
A1(2:end) % from second element to the end




% ========================
% MATRICES
% ========================

B1 = [12 23 34; 44 59 70]	% 3x2 matrix

%{ B1 =

   12   23   34
   44   59   70
%}

% ACCESSING MATRIX ELEMENTS
% B1(row_index, col_index)
B1(1,2) % cell in row1, column2 (here: 23)
B1(:,2) % whole second column

% CELL OPERATIONS
B1.*2		% multiply each cell by factor 2
%{ans =

    24    46    68
    88   118   140
%}




% ========================
% BASIC STATISTICS
% ========================


% MEAN
mean(A1)

% STANDARD DEVIATION
std(A1)	 % uses Bessel's correction n-1 for sample data
std(A1,1) % for population data

% VARIANCE
var(A1)   % uses Bessel's correction n-1 for sample data
var(A1,1) % for population data
