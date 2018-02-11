function T=ComputeHeatMPFT(A)

    N=size(A,2);
    T = zeros(N);

    for i =1:N
        for j = 1:N
            T(i,j) = ComputeSingleMFPT(A, i,j);
        end
    end
    
    image(T/5);
end