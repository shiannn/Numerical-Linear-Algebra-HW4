function EigenVector = InverseIter(A,mu)
    [m,n] = size(A);
    x = rand(n,1);
    iterTime = 30;

    [V,D] = eig(A);
    truth = V(:,size(D,1));
    Y = [];
    for i=1:iterTime
        err = norm(abs(x)-abs(truth),2);
        Y = [Y,err];
        x = inv(A-mu*eye(m))*x;
        x = x/norm(x);
    end
    EigenVector = x;
    plot([1:iterTime],Y);
    xlabel("iterations")
    ylabel("2-norm of error vector")
end