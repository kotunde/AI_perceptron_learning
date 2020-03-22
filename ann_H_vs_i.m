% 2.Írjon programot, amely egy perceptronnak megtanítja a H, I bet  ̋ut (3x3-as felbontású kép esetén)
clear all; close all; clc


input = [...
        1 0 1  ...
        1 1 1  ...
        1 0 1 1 ;...
        
        0 1 0  ...
        0 1 0  ...
        0 1 0 1 ;...
        
        1 1 1  ...
        0 1 0  ...
        0 1 0 1 ;...
        
        1 1 1  ...
        1 0 1  ...
        1 1 1 1 ...
        ];
    
output = [-1,-0.5,0,0.5];
w = PerceptronLearning2(input,output)

disp("testing:....")


disp("H betu, elvart eredmeny: -1");
yi = tanh([1 0 1 1 1 1 1 0 1 1] * w);
s = sprintf("Eredmeny: %f\n",yi);
disp(s);

disp(" I betu, elvart eredmeny: -0.5");
yi = tanh([0 1 0  ...
        0 1 0  ...
        0 1 0 1 ] * w);
s = sprintf("Eredmeny: %f\n",yi);
disp(s);

disp("T betu, elvart eredmeny: -0");
yi = tanh([1 1 1  ...
        0 1 0  ...
        0 1 0 1 ] * w);
s = sprintf("Eredmeny: %f\n",yi);
disp(s);

disp("O betu, elvart eredmeny: 0.5");
yi = tanh([1 1 1  ...
        1 0 1  ...
        1 1 1 1] * w);
s = sprintf("Eredmeny: %f\n",yi);
disp(s);
   