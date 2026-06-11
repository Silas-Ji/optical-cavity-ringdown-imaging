%直接二维迭代法的结果
%clc,clear,close all


RM=max(max(R1));
A=99.9955-R1;A(A<0)=0;
%A=100-R;

[n1,n2]=size(A);
p=0.4;
x0=(n1-1)/2*p;
x=-x0:p:x0;
y=x;
w=0.06;
h=Gaussian2(x,y,w);
s=A;
dy=iterative22(s,h,n1,n2);

dy(dy<0)=0;

figure,mesh(dy),title('Deconvolution of A')
figure,mesh(A),title('measure A')
figure,plot(dy(:,2),'r--'),hold on,plot(A(:,2),'g')

R0=99.9955-dy;
for i=1:n1
    for j=1:n2
        if R0(i,j)==99.9955
            R0(i,j)=R1(i,j);
        end
    end
end
figure,mesh(R1),title('measure R')
figure,mesh(R0),title('Deconvolution of R')
figure,plot(R0(:,2),'r--'),hold on,plot(R1(:,2),'g')


% ============================================================
% Local function from: iterative22.m
% ============================================================

%%%%%%%%%%%%%%%%%%%%二维迭代法%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% s为2维矩阵，h为高斯光束，[n1,n2]=size(s)
function dy=iterative22(s,h,n1,n2)
p=0.4;
y=s;
xk=y;
xk1=xk;
SM=0;k1=1;k2=1;
now_er=1;
er=eye(3);
while now_er>0.00001
    rk=1-2*abs(xk-0.5);
      sk=conv2(h,xk,'same')*p*p;
   %sk=conv2(h,xk,'same');
   %  [l1,l2]=size(sk);

   % m1=floor(l1/2);m2=floor(n1/2);
   % sk=sk1(m1-m2:m1+m2+1,m1-m2:m1+m2+1);
   for i=1:n1  %wenti
       for j=1:n2
        %xk1(i,j)=xk(i,j)+rk(i,j)*(y(i,j)-sk(i,j));
        xk1(i,j)=xk(i,j)+(y(i,j)-sk(i,j));
        SM=SM+(y(i,j)-sk(i,j)).^2;
       end       
   end
    er(k1,k2)=(mean(sum((xk1-xk).^2)))^0.5;
     now_er=er(k1,k2);
     xk=xk1;
     k1=k1+1;k2=k2+1;
end  
save error er
er0=diag(er);
figure(3)
plot(er0,'-');
dy=xk1;


% ============================================================
% Local function from: ggiterative22.m
% ============================================================

%%%%%%%%%%%%%%%%%%%%二维迭代法%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [dy,er0]=ggiterative22(s,h,N,q)
[m1,n1]=size(s);
y11=s(ceil(m1/2)-N/2:ceil(m1/2)+N/2,ceil(n1/2)-N/2:ceil(n1/2)+N/2);
f11=h(ceil(m1/2)-N/2:ceil(m1/2)+N/2,ceil(n1/2)-N/2:ceil(n1/2)+N/2);
%Z20=Z2(ceil(m1/2)-N/2:ceil(m1/2)+N/2,ceil(n1/2)-N/2:ceil(n1/2)+N/2);
s0=y11;h0=f11/max(max(f11));
y=s0/max(max(s0));


xk=y;
xk1=xk;
SM=0;k1=1;k2=1;
now_er=1;
er=eye(3);
while now_er>1e-6
    rk=1-2*abs(abs(xk)/max(max(abs(xk)))-0.5);
    
   % rk=1-2*abs(xk-0.5);
      sk1=conv2(h0,xk,'same')*q*q;
      
  % sk1=conv2(h,xk,'same');
   sk1=sk1/max(max(sk1));
   %  [l1,l2]=size(sk);

   % m1=floor(l1/2);m2=floor(n1/2);
   % sk=sk1(m1-m2:m1+m2+1,m1-m2:m1+m2+1);
   for i=1:N  
       for j=1:N
        xk1(i,j)=xk(i,j)+rk(i,j)*(y(i,j)-sk1(i,j));
        % xk1(i,j)=xk(i,j)+rk0(i,j)*(y(i,j)-sk1(i,j));
        %xk1(i,j)=xk(i,j)+(y(i,j)-sk1(i,j));
        SM=SM+(y(i,j)-sk1(i,j)).^2;
       
       end       
   end
   
   while max(max(xk1))>1e10
      xk1=xk1./10;
   end
   
    er(k1,k2)=(mean(sum(sum((xk1-xk).^2))))^0.5;
     now_er=er(k1,k2);
     %xk=xk1/max(max(xk1));
     xk=xk1;
     %ER(k1,k2)=(SM/n1)^0.5;
     k1=k1+1;k2=k2+1;
end  
save error22 er
er0=diag(er);
%figure(3)
%plot(er0,'-');
%plot(diag(er));
dy=xk.*0.9999;


% ============================================================
% Local function from: ggiterative11.m
% ============================================================

%%%%%%%%%%%%%%%%%%%%二维迭代法%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [dy,er1]=ggiterative11(s,h,N,q,K)
[m1,n1]=size(s);
y11=s(ceil(m1/2)-N/2:ceil(m1/2)+N/2,ceil(n1/2)-N/2:ceil(n1/2)+N/2);
f11=h(ceil(m1/2)-N/2:ceil(m1/2)+N/2,ceil(n1/2)-N/2:ceil(n1/2)+N/2);
s0=y11;h0=f11/max(max(f11));
y=s0/max(max(s0));


xk=y;
xk1=ones(N+1,N+1);
SM=0;k1=1;k2=1;
%now_er=1;
er=eye(3);
for k=1:K
    rk=1-2*abs(xk-0.5);
   % rk=1-2*abs(abs(xk)/max(abs(xk))-0.5);
    sk1=conv2(h0,xk,'same')*q*q;
      sk1=sk1/max(max(sk1));
  for i=1:N  
    for j=1:N
        xk1(i,j)=xk(i,j)+rk(i,j)*(y(i,j)-sk1(i,j));
        % xk1(i,j)=xk(i,j)+rk0(i,j)*(y(i,j)-sk1(i,j));
        %xk1(i,j)=xk(i,j)+(y(i,j)-sk1(i,j));
        %SM=SM+(y(i,j)-sk1(i,j)).^2;
       
       end       
   end
   

    er(k1,k2)=(mean(sum(sum((xk1-xk).^2))))^0.5;
     %now_er=er(k1,k2);
     xk=xk1/max(max(xk1));
   %  xk=xk1;
     %ER(k1,k2)=(SM/n1)^0.5;
     k1=k1+1;k2=k2+1;
end  
save error11 er
er0=diag(er);er1=er0';
dy=xk.*99.99;


% ============================================================
% Local function generated: Gaussian2
% ============================================================

function h = Gaussian2(x,y,w)
% Gaussian2  Generate a 2-D Gaussian beam / point-spread function.
%
% x and y are coordinate vectors. w is the Gaussian beam radius parameter.
% The output h is discretely normalized so that sum(h(:))*dx*dy is close to 1.
% This matches the later convolution step conv2(h,xk,'same')*p*p, where p*p
% represents the sampled pixel area.

[X,Y] = meshgrid(x,y);
h = exp(-2*(X.^2 + Y.^2)/(w.^2));

if numel(x) > 1
    dx = abs(x(2)-x(1));
else
    dx = 1;
end

if numel(y) > 1
    dy = abs(y(2)-y(1));
else
    dy = dx;
end

normalization = sum(h(:))*dx*dy;
if normalization ~= 0 && isfinite(normalization)
    h = h/normalization;
end
end
