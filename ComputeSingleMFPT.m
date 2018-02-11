% Compute the Mean First Passage Time from a node i to a node j, given a Network with adjacency matrix A
% The variables are named according to the paper “Mean first-passage time for random walks on undirected networks"

function T = ComputeSingleMFPT(A, i,j)

    N = size(A,2);
    degree = sum(A);
    K = sum(degree);
    D = diag(degree);
    S = D^(-1/2) * A * D^(-1/2) ;
    
    %Extract eigenvectors and eigenvalues, sorting them in decrescent order:
    [psi,lambda] = eig(S);
    lambda = rot90(lambda,2);
    lambda = diag(lambda);
    psi = fliplr(psi);

    %Compute the MFPT:
    summa = 0;
    for k = 2:N
        firstTerm = 1/(1-lambda(k));
        secondTerm = (psi(j,k)^2)/degree(j);
        thirdTerm = psi(i,k)*psi(j,k)/sqrt(degree(i)*degree(j)) ;
        
        summa = summa + firstTerm*(secondTerm-thirdTerm);
    end
    T = K * summa;
end
