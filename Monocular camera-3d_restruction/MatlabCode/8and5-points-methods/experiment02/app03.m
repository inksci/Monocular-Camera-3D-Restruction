% Purpose: here we mainly adjust the V, to let det(V)>0

if det(V)<0
    V(:,3) = -1*V(:,3);
end

S=diag([1 1 0]);

t_u=[U(1,3), U(2,3), U(3,3)]';
D=[0 1 0; -1 0 0; 0 0 1];
R_a=U*D*V';
R_b=U*D'*V';

P_A=[R_a, t_u];
P_B=[R_a, -t_u];
P_C=[R_b, t_u];
P_D=[R_b, -t_u];