function plotEigenVector(m,j_p)
    v = zeros(m,1);
    for i = 1:m
        v(i) = sin(i*j_p*(pi)/(m+1));
    end
    x = [1:32];
    y = v;
    plot(x,y);

    tit = num2str(j_p);
    title("v"+tit);
    xlabel("entry number")
    ylabel("entries of eigenvector")
end