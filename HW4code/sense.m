function generate_matrix(m)
    J = zeros(m,m);
    la = 3;
    for i = 1:m
        for j = 1:m
            if(i==j)
                J(i,j)=la;
            elseif(i==(j-1))
                J(i,j)=1;
            end
        end
    end
    J
    Calculate_sense(J)
    A = rand(m,m);
    Calculate_sense(A);
end
function Calculate_sense(A)
    [lambda,x,y]=getxy(A);
    Y_delta_lambda = []
    Y_delta_A = []
    X_norm = []
    for len = 1:20
        delta_A = len*rand(16,16);
        A_plus_delta = A+delta_A;

        kappa = 1 / abs(y*x);
        delta_A_norm = norm(delta_A);
        X_norm = [X_norm, delta_A_norm];

        [lambda_2,x_2,y_2]=getxy(A_plus_delta);
        delta_lambda = abs(lambda_2-lambda);

        Y_delta_lambda = [Y_delta_lambda,delta_lambda];
        Y_delta_A = [Y_delta_A,kappa*delta_A_norm];
    end
    figure();
    plot(X_norm,Y_delta_A);
    hold on
    plot(X_norm,Y_delta_lambda)
    legend("\kappa(\lambda,A)||\deltaA||_2","|\delta\lambda|",'latex')
    xlabel("$||\delta A||_2$",'interpreter','latex');

    X_norm
    Y_delta_lambda
    Y_delta_A
    
end
function [lambda,x,y]=getxy(A)
    [Vr,Dr] = eig(A);
    [Vl,Dl] = eig(A');
    Dr(1,1);
    Vr(:,1);
    Dl(1,1);
    Vl(:,1);

    x = Vr(:,1);
    y = Vl(:,1)';
    lambda = Dr(1,1);
end