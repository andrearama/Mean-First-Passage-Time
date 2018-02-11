% Compute the Average Trapping Time of a node j, given a Network with adjacency matrix A
% The variables are named according to the paper “Mean first-passage time for random walks on undirected networks"

function T = ComputeATT(A,j)

    N = size(A,2); 
    degree = sum(A);
    K = sum(degree);
    D = diag(degree);
    S = D^(-1/2) * A * D^(-1/2) ;
    
    %Compute stationary probabilities:
    pi_ = degree/K;
    
    %Extract eigenvectors and eigenvalues, sorting them in decrescent order:
    [psi,lambda] = eig(S);
    lambda = rot90(lambda,2);
    lambda = diag(lambda);
    psi = fliplr(psi);
    
    %Compute ATT:
    F = 1/(1-pi_(j));
    F = F*K/degree(j);
    summa = 0;
    for k = 2:N
        firstTerm = 1/(1-lambda(k));
        secondTerm = psi(j,k)^2;
        summa = summa + firstTerm*secondTerm;
    end
    T = F*summa;
    
end
