function EigenValue = powerIter(A)
    [m,n] = size(A);
    x = rand(n,1);
    iterTime = 30;
    Y = [];
    [V,D] = eig(A);
    for i=1:iterTime
        x = A*x;
        x = x/norm(x);
        x;
        EigenValue = (x'*A*x) / (x'*x);
        %EigenValue = (x'*A*x);
        Y = [Y, EigenValue];
    end
    %eig(A)
    %EigenValue
    D(15,15);
    V(:,size(D,1));
    plot([1:iterTime],Y);
    xlabel("iterations")
    ylabel("estimated eigenvalue")
end