function discuss(A)
    iterTime = 10^(9);
    Ywilk = [];
    YQR = [];
    for i = 1:10
        Thres = 10^(-i);
        [ret,TotalIter1]=WilkShift(A,Thres,iterTime);
        [ret,TotalIter2]=QRalgo(A,Thres,iterTime);
        Ywilk = [Ywilk,TotalIter1];
        YQR = [YQR, TotalIter2];
    end
    figure();
    plot([1:10],Ywilk);
    %plot([10:10:100],Ywilk);
    hold on;
    plot([1:10],YQR);
    legend("QR iteration with Wilk shift","QR iteration");
    ylabel("iterations");
    xlabel("$-log_{10}(Threshold)$",'Interpreter','latex');
end