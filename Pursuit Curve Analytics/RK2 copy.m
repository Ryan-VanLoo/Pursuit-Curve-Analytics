s = 1;

t = 0;
h = 0.01;

numSteps = 100;

P_0 = [2,2];
P = zeros(2, numSteps + 1);
P(:,1) = P_0;

Q_0 = [0;2];
Q = zeros(2, numSteps + 1);
Q(:,1) = Q_0;

R_0 = [0;0];
R = zeros(2, numSteps + 1);
R(:,1) = R_0;

S_0 = [2;0];
S = zeros(2, numSteps + 1);
S(:,1) = S_0;





for i = 1:numSteps
  v = Q(:,i) - P(:,i);
  v = v/norm(v);
  temp_P = P(:,i) + (h/2) * v;
  v = (Q(:, i)*h + (h/2)) - temp_P;
  v = v/norm(v);
  P(:, i+1) = P(:,i) + h * v;
  
  
  v = R(:,i) - Q(:,i);
  v = v/norm(v);
  temp_Q = Q(:,i) + (h/2) * v;
  v = (R(:,i)*h +(h/2)) - temp_Q;
  v = v/norm(v);
  Q(:, i+1) = Q(:,i) + h * v;

  
  v = S(:,i) - R(:,i);
  v = v/norm(v);
  temp_R = R(:,i) + (h/2) * v;
  v = (S(:,i)*h +(h/2)) - temp_R;
  v = v/norm(v);
  R(:, i+1) = R(:,i) + h * v;


  v = P(:,i) - S(:,i);
  v = v/norm(v);
  temp_S = S(:,i) + (h/2) * v;
  v = (P(:,i)*h +(h/2)) - temp_S;
  v = v/norm(v);
  S(:, i+1) = S(:,i) + h * v;
endfor


hold on
plot(P(1,:),P(2,:))
plot(Q(1,:),Q(2,:))
plot(R(1,:),R(2,:))
plot(S(1,:),S(2,:))
hold off









