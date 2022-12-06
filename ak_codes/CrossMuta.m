function Offspring = CrossMuta(randomPopulation, fitness, chromosomesToBeCross, chromosomesToBeMutated)
Offspring = randomPopulation;
popuS = size(randomPopulation, 1);
stringLength = size(randomPopulation, 2);
fitness = fitness - min(fitness);
Fitted = fitness;
[null, index1] = max(Fitted);
Fitted(index1) = min(Fitted);
[null, index2] = max(Fitted);
Offspring([1 2], :) = randomPopulation([index1 index2], :);

total = sum(fitness);
if total==0
    fitness = ones(popuS, 1)/popuS;
end

cumProb = cumsum(fitness)/total;

for i=2:randomPopulation/2
    RandomCutting1 = find(cumProb-rand>0);
    parent1 = randomPopulation(RandomCutting1(1), :);
    RandomCutting1 = find(cumProb-rand>0);
    parent2 = randomPopulation(RandomCutting1(1), :);
    
    if rand<chromosomesToBeCross
        crossOverPoint = ceil(rand*stringLength-1);
        Offspring(i*2-1, :) = [parent1(1:crossOverPoint) parent2(crossOverPoint+1:stringLength)];  % offspring 1
        Offspring(i*2, :) = [parent2(1:crossOverPoint) parent1(crossOverPoint+1:stringLength)]; % offspring 2
    end
end

mask = rand(popuS, stringLength)<chromosomesToBeMutated;
Offspring = xor(Offspring, mask);
Offspring([1 2], :) = randomPopulation([index1 index2], :);

end