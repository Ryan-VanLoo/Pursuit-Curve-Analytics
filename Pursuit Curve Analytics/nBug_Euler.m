numBugs = 10;
numSteps = 1000;
radius = 1;

h = 0.001;
s = 1;

Bugs = zeros(2*numBugs, numSteps);
for i = 1:numBugs
  Bugs(2*i -1, 1) = radius * cos((i-1)* (2*pi)/numBugs);
  Bugs(2*i, 1) = radius * sin((i-1) * (2*pi)/numBugs);
  endfor

for i = 1:numSteps
  for j = 1:numBugs-1
    curT = Bugs((2*j+1):2*j+2, i);
    curP = Bugs((2*j-1):2*j, i);
    curVec = curT-curP;
    normVec = curVec/norm(curVec);
    Bugs(2*j-1:2*j, i+1) = Bugs(2*j-1:2*j, i) + h * s * normVec;
  endfor
  curT = Bugs(1:2, i);
  curP = Bugs((2*numBugs - 1):2*numBugs, i);
  curVec = curT - curP;
  normVec = curVec/norm(curVec);
  Bugs((2*numBugs - 1):2*numBugs, i+1) = Bugs((2*numBugs - 1):2*numBugs, i) + h * s * normVec;
endfor

hold on
for i=1:numBugs
  plot(Bugs(2*i-1, :), Bugs(2*i, :))
endfor
hold off