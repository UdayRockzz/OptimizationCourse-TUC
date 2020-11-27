%% Lesson 1: Explore the MATLAB interface
%
% You can see three different windows.
%
% COMMAND WINDOW: This is the main window. This is where you will type all 
% commands.
%
% Try typing 
% >> 2+3 
%
% CURRENT FOLDER: Shows the files and folders in the current directory.
%
% WORKSPACE: Lists all the variables you have generated in the current
% session. It shows the type and size of variables, and can be used to 
% inspect the values of variables.
%

%% Lesson 2: Calculator
%
% Try typing in some basic mathematical operations as in the following
% examples.
%
% >> 23+19
% >> 3*4
% >> 18.4/5
% >> 2^5
%

%% Lesson 3: Variables
%
% It is often useful to store data in variables.
% >> a = 3*4;
% >> b = 6
% >> c = a/b,
% >> c
% >> c;
%
% There are some predefined variables:
% >> pi 
%
% Discover the meaning of , ; at the end of a command. What happens? 
% Take also a look at the WORKSPACE. What can you see?
%

%% Lesson 4: Predefined Functions & Where to find help?
%
% There a numerous predefined functions in MATLAB such as sin, cos, exp, log.
% They can be used as follows:
% >> sin(pi/4)
% >> cos(0)
% >> log(1)
%
% Suppose you need to calculate the square root of 2.
% If you do not know which command to use, try
% >> lookfor root
% 
% Maybe you know the command sqrt but you are in doubt how to use it. Try
% >> help sqrt
% or, for more details,
% >> doc sqrt
%
% Exercise:
% Calculate the root of 2.
%

%% Lesson 5: Vectors
%
% Row and column vectors can be defined as follows.
% >> x = [-2, 2, 3]
% >> y = [1;0;-1]
%
% Try the following commands. Be sure to understand what is being calculated.
% >> sum(x)
% >> x+2
% >> sum(x+2)
% >> norm(y)
% >> y'
% >> x*y
% >> x'*y
% >> x*y'
% >> x' + 3*y
% >> x + 3*y
%
% What is the meaning of the following?
% >> 1:6
% >> 1:2:6
%

%% Lesson 6: Matrices
%
% Matrices can be defined as follows.
% >> A = [1,2;3,4]
% >> B = [1,0,-1;0,1,4]
%

% Try different matrix operations and make sure you understand what is
% being calculated.
% >> B*A
% >> B'*A
% >> A*B
% >> A^2
% >> C = [3,2;-1,3]
% >> A.*C
% >> x = [1;-3;4]
% >> B*x
% >> B.^2
% >> [m,n] = size(B)
%

%% Lesson 7: Special Matrices
% 
% >> E = eye(2)
% >> O = ones(3,2)
% >> Z = zeros(1,3)
% >> diag([1,3,5])
% >> diag([1,2],1)
%
% Try the following. What happens?
% >> A+2*E
% >> [A,B;B,E]
%
% Exercise:
% Try to implement the following matrix using the commands eye, ones, diag.
% [ 1 0 0 0 2 0 1 1 
%   0 1 0 0 0 1 1 1
%   0 0 1 0 0 0 1 1]

%% Lesson 8: Matrices and the : (Colon Operator)
%
% Sometimes we are interested in using only part of a matrix.
% Determine one entry (which one is it?) by
% >> B(2,3) 
%
% Take the entire row or column by
% >> B(1,:)
% >> B(:,2)
%
% What happens here? 
% >> B(:,[1,3])
%
% Exercise:
% Take the matrix
% M = [1 2
%      0 5
%      2 1]
% and change it into the matrix
% M = [1 3
%      0 4
%      5 0]
%

%% Lesson 9: Anonymous Functions
% 
% You can define a function yourself. One way to do this is using anonymous
% functions. For example, we may define the function f(x) = x^2 + sin(x) + e^x
% and calculate its value f(3) as follows.
%
% >> f = @(x) x^2 + sin(x) + exp(x)
% >> f(3)
%
% The name 'x' is arbitrary and can be replaced by other symbols:
% >> f = @(car) car^2 + sin(car) + exp(car)
% >> f(3)
%
% Also multiple arguments are allowed in anonymous functions.
% >> g = @(x,y) x^2 - y^2
% >> g(0,1)
%
% Exercise: 
% Write an anonymous function which implements h(x,y,z) = 2*x - cos(y)*e^(z).
% Evaluate it at the points (0,2,-1) and (3,0,0) 
%


%% Lesson 10: .m Files
%

% So far all the commands we typed were executed in the COMMAND WINDOW immediately.
% This is nice to try out and experiment with commands interactively.
% However if you want to execute commands repeatedly it is useful to store them 
% in a MATLAB .m file:
%
% 1. Create a file test.m with a list of commands (File -> New -> M-file).
% 2. Save the file.
% 3. Run the file by typing test into the COMMAND WINDOW.
%
% Exercise:
% Create a file example1.m and write some statements in the file like
% a = 3+4
% M = [1,2;4,5]
% M = a*M
% Save the file and run it by typing example1 into the COMMAND WINDOW.
%
% Observe what happens with the variables in the WORKSPACE.
%

%% Lesson 11: More Complicated Functions
%
% If functions are getting more complex, it is useful to implement them in
% an individual file (rather than as an anonymous function).
% As an example we implement the function f(x,y) = (x+y, 2*x).
%
% 1. Open a new file, call it func1.m
% 2. Define the function by
%
% function [a,b] = func1(x,y)
%  a = x + y;
%  b = 2*x;
%
% Save the file, and calculate f(3,4) by typing [a,b] = func1(3,4) in the
% COMMAND WINDOW
%

%% Exercise:
%
% 1. Implement the following function in a separate .m file:
% f(x,y,z) = (x*y-z, cos(y), z^2+x)
%
% 2. Calculate in the COMMAND WINDOW f(0,0,1), f(1,2,-3)
%

%% Lesson 12: if Statement
%
% The if, else statement in MATLAB provides a method of controlling 
% which parts of your code should execute based on whether certain
% conditions are true or false
%
% Example:
% > function z = absolute_value(x)
% > if x < 0       % condition
% >     z = -x;    % statement
% > else
% >     z = x;     % statement
% > end

%% Exercise:
%
% 1. Implement the following function in a separate .m file.
% f(x) = 3*x^2 if x >= 3
%      = -x    if x < 3
% 2. Evaluate f(5), f(-1), f(3).
%

%% Lesson 13: while & for Loops
%
% A for loop is used to repeat a command a fixed number of times
% 
% > function z = adding(n)
% > z = 0;
% > for x = 1:n         % counter
% >     z = z + x;      % statement
% > end
%
% A while loop is similar to a for loop in that it is used to repeat a command.
% The key difference between a for loop and a while loop is that the while loop 
% will continue to execute until a specified condition becomes false.
%
% > function z = adding(n)
% > z = 0;
% > x = 0;
% > while x <= n       % condition   
% >     z = z + x;     % statement
% >     x = x + 1;
% > end
%


%% Exercise:
% 
% 1. Implement a function which recognizes whether or not a number is prime.
%    It should return 1 if the number is prime, otherwise 0.
%    Test your function for the inputs n=2, n=16, n=7.
%
% 2. Implement a function which calculates the n-th Fibonacci number.
%    Use it to calculate the 5th, 10th and 25th Fibonacci numbers.  
%

