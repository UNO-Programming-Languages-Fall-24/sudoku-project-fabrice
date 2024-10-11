% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...
x(1..9).
y(1..9).
n(1..9).

subgrid(X,Y,G) :- x(X), y(Y), G = 3*((X-1)/3) + ((Y-1)/3) + 1.
% achieved defining subgrids

1 { sudoku(X,Y,N) : n(N) } 1 :- x(X), y(Y).
% achieved generating a value for each cell

:- initial(X,Y,N), not sudoku(X,Y,N).
% achieved constraining to initial setup

:- x(X), n(N), not 1 { sudoku(X,Y,N) : y(Y) } 1.
:- y(Y), n(N), not 1 { sudoku(X,Y,N) : x(X) } 1.
% achieved constraining rows and columns to exactly one of each digit

:- n(N), G = 1..9, not 1 { sudoku(X,Y,N) : subgrid(X,Y,G) } 1.
% achieved constraining values in subgrids  


% #show subgrid/3.
#show sudoku/3.
