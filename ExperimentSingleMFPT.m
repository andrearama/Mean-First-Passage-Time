function ET = ExperimentSingleMFPT(A,startP,endP,nIterations)
    
    ET = zeros(nIterations,1);
    for iter=1:nIterations

        actualP = startP;
            while actualP ~= endP
                possibleP = find(A(actualP,:) ==1);
                index = randi(length(possibleP));
                actualP = possibleP(index);
                ET(iter) = ET(iter)+1;
            end 
    end
    ET= mean(ET);
    
end