close all;
clear all;
clc;

x(1)=0;
rel_err(1)=100;
i=1;
while(rel_err(i)>0.001)
    fx=3*x(i)+sin(x(i))-exp(x(i));
    diff_fx=3+cos(x(i))-exp(x(i));
    x(i+1)=x(i)-(fx/diff_fx);
    if i>1
        rel_err(i+1)=abs((x(i+1)-x(i))/x(i))*100;
    else
        rel_err(i+1)=rel_err(i);
    end
    i=i+1;
end
rel_err'
x'