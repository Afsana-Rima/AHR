close all;
clear all;
clc;
% data
zdata=[0 1 0 0.2
0 2 0 0.4
1 2 0 0.8
1 3 0 0.4
2 3 0 0.4];
% construct bus Admittance Matrix
nl=zdata(:,1); nr=zdata(:,2); r=zdata(:,3); x=zdata(:,4);
nbr=length(zdata(:,1)); nbus = max(max(nl), max(nr));
z = r + i*x; %branch impedance
y= ones(nbr,1)./z; %branch admittance
ybus=zeros(nbus,nbus); % initialize Ybus to zero
for k = 1:nbr; % formation of the off diagonal elements
if nl(k) > 0 & nr(k) > 0
ybus(nl(k),nr(k)) = ybus(nl(k),nr(k)) - y(k)
ybus(nr(k),nl(k)) = ybus(nl(k),nr(k))
end
end
for n = 1:nbus % formation of the diagonal elements
for k = 1:nbr
if nl(k) == n | nr(k) == n
ybus(n,n) = ybus(n,n) + y(k)
else, end
end
end
% Z- bus calculation
zbus = inv(ybus)
% fault calculation
zf = j*.16;
v0=[1; 1; 1];
i3f = v0(1)/(zbus(3,3)+zf)
vf = v0-i3f*zbus(:,3)
i12 = (vf(1) - vf(2))/(j*0.8)
i13 = (vf(1) - vf(3))/(j*0.4)