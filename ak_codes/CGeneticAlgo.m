clc;
close all;
clear all;

populationSize = 10;
iterations = 200; 
chromosomesToBeCross = 0.75;
chromosomesToBeMutated = chromosomesToBeCross/100;
calculatedBits = 18;
syms x1 x2;
dimension = 2;
functionRange = [-1 1];
randomPopulation = rand(populationSize, calculatedBits*dimension)>0.5;
disp('Population Generated');
%disp(randomPopulation); uncomment to view


upperBound = zeros(iterations, 1); 
lowerBound = zeros(iterations, 1);
average = zeros(iterations, 1);
figure

i = 1;
while i < iterations
    funnctionValue = evaluationSelect(randomPopulation, calculatedBits, functionRange);
    
    lowerBound(i) = min(funnctionValue);
    upperBound(i) = max(funnctionValue);
    average(i) = mean(funnctionValue);
    
    plot(i, upperBound(i), 'o', i, average(i), 'x', i, lowerBound(i), '*');
    hold on;
    pause(0.01);
    randomPopulation = CrossMuta(randomPopulation, funnctionValue, chromosomesToBeCross, chromosomesToBeMutated);

    i = i+1;
end


[populationStrength, stringLength] = size(randomPopulation);
x = bit2num(randomPopulation(1, 1:calculatedBits), functionRange)
y = bit2num(randomPopulation(1, calculatedBits+1:stringLength), functionRange)


disp('Optimal level set: ');disp(vpa(((-1)*((y-x)^4 + 12*(x*y) - x + y - 3)),2));

