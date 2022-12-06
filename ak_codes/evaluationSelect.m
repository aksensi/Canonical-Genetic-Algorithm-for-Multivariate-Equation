function evaluation = evaluationSelect(popu, bitNumber, range)
[popu_s, stringLength] = size(popu);
for i=1:popu_s
    x = bit2num(popu(i, 1:bitNumber), range);
    y = bit2num(popu(i, bitNumber+1:stringLength), range);
    evaluation(i) = vpa(((-1)*((y-x)^4 + 12*(x*y) - x + y - 3)),2);
end
end