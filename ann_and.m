% 1.Írjon  programot,  amely  egy  perceptronnak  megtanítja  az  AND  függvényt.
%Rajzolja  ki  a  tanítás során a döntési felület alakulását. 

clear all; close all; clc

input = [...
        1 1 1; ...
        0 1 1; ...
        1 0 1; ...
        0 0 1];
    
output = [1, 0, 0, 0];
w = PerceptronLearning(input,output)
