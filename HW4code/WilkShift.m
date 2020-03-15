function [ret,TotalIter]=WilkShift(A,Thres,iterTime)
    %iterTime = 100;
    [m,n] = size(A);
    I = eye(m);
    TotalIter = 0;
    for i=1:iterTime
        TotalIter = TotalIter+1;
        s = A(m,n);
        [Q,R] = qr(A-s*I);
        A2 = R*Q + s*I;
        if(norm(A2-A)<Thres)
            break;
        end
        A = A2;
    end
    ret = diag(A);
end