function eigenValue = Rayleigh(A,b)
    [m,n] = size(A);
    iterTime = 100;
    mu = rand(1,1)
    Y = [mu];
    ct = 1;
    for i=1:iterTime
        b = inv(A-mu*eye(m))*b;
        mu2 = (b'*A*b) / (b'*b)
        Y = [Y,mu2];
        ct = ct+1;
        if(norm(mu2-mu)<1e-10)
            break;
        end
        mu = mu2
    end
    eigenValue = mu;
    Y
    plot([1:ct],Y);
    xlabel("iterations")
    ylabel("estimated eigenvalue")
    set(gca,'XTick',[1:1:ct]) %改变x轴坐标间隔显示 这里间隔为2
end