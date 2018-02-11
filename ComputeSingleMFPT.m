function T = ComputeSingleMFPT(A, i,j)

    N = size(A,2);
    degree = sum(A);
    K = sum(degree);
    D = diag(degree);
    
    S = D^(-1/2) * A * D^(-1/2) ;
    
    [psi,lambda] = eig(S);
    
    lambda = rot90(lambda,2);
    lambda = diag(lambda);
    psi = fliplr(psi);


    summa = 0;
    for k = 2:N
        firstTerm = 1/(1-lambda(k));
        secondTerm = (psi(j,k)^2)/degree(j);
        thirdTerm = psi(i,k)*psi(j,k)/sqrt(degree(i)*degree(j)) ;
        
        summa = summa + firstTerm*(secondTerm-thirdTerm);
    end
        
    T = K * summa;
end