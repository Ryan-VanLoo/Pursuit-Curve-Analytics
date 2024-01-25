function [x_vec,y_vec] = getAnalyticPosition(n,v,x0,y0,t_vec)

theta_0 = atan2(y0,x0);

r0=sqrt(x0^2+y0^2);
r = @(t) r0 -v*t*sin(pi/n);
theta = @(t) -((v*cos(pi/n))/(v*sin(pi/n)))*log(r0-t*v*sin(pi/n)) + (log(r0)/(v*sin(pi/n)))+theta_0;

%t_vec = linspace(0,r0/(v*sin(pi/n))-0.01,300);
r_vec = r(t_vec);
theta_vec = theta(t_vec);

x_vec = r_vec.*cos(theta_vec);
y_vec = r_vec.*sin(theta_vec);

%plot(x_vec,y_vec);

end
