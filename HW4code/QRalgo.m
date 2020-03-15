function [ret,TotalIter]=QRalgo(A,Thres,iterTime)
    %iterTime = 100;
    Toplot = [];
    it = 0;
    TotalIter = 0;
    for i=1:iterTime
        TotalIter = TotalIter+1;
        it = it + 1;
        D = diag(A);
        Toplot = [Toplot,D];
        [Q,R] = qr(A);
        A2 = Q'*A*Q;
        if(norm(A2-A)<Thres)
            break;
        end
        A = A2;
    end
    %{
    Toplot;
    figure();
    for i=1:15
        plot([1:it],Toplot(i,[1:it]))
        hold on
    end
    leg = string([1:15])
    for i=1:15
        leg(i) = "entry" + leg(i);
    end
    legend(leg);
    xlabel("QR iterations");
    ylabel("diagonal entries");
    %}
    ret = diag(A)
end