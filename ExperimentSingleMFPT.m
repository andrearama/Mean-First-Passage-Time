% Estimate the MFPT between two nodes, given a Network with adjacency matrix A

function T = ExperimentSingleMFPT(A,startP,endP,nIterations)
    
    %Initialize the vector containing the number of steps needed to reach the target in each simulation:
    ET = zeros(nIterations,1);
    
    for iter=1:nIterations
    
        % Simulate Random Walk throughout the network until the end point is reached:
        actualP = startP;
            while actualP ~= endP
                possibleP = find(A(actualP,:) ==1);
                index = randi(length(possibleP));
                actualP = possibleP(index);
                ET(iter) = ET(iter)+1;
            end 
            
    end
    
    %Estimate the MFPT as the average of the experimental results:
    T= mean(ET);
    
end
