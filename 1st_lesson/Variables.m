% Standard "clean slate" combination at tyhe beginning of every script

clear; % Removes all variables from the Workspace memory. This is the most important one, 
% as it prevents old data from accidentally bleeding into your current code run.

close all; % Closes all pop-up figure windows.

clc; % Clears all the text history from the standard Command Window (if you need!).
%%
% Double-precision format (double) can correctly be handled with 15 decimal numbers

a = pi
%%
% Show the list of variables in the workspace with sizes and class

whos
%%
% Long format that displays numbers with 15 digits after the decimal

format long

pi
%%
% Short format that displays numbers with 15 digits after the decimal


format short
pi
%%
% Display

fprintf('Pi value is %.10f \n', pi)
%%
fprintf('Pi value is %.8f \n', pi)
%%
% Specify another type of the value 

single(pi)
%%
% Display

fprintf('Pi value is %.15f \n', single(pi))
%%
% Vectors

a = [1, 2, 3]

b = [1; 2; 3]
%%
% Matrix multiplication

a*b
%%
% Matrix slicing

a(1, :)
%%
a(:, 1)
%%
% Cell arrays

c = {1, 'Hi', [1;2;3]}
%%
c{1,2}
%%
% Check the type

class(c{1,2})
%%
c{1,2}(2)
%%
% Subcell

c(1,2)
%%
% NB! formatting

I = imread('peppers.png')
%%
imshow(I);
%%
img = im2double(I)

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
