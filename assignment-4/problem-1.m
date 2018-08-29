clear;
fprintf("");
str = input('Give the function in x :','s');
f= inline(str);
fprintf("Enter lower limit of integration\n");
a=input('');
fprintf("Enter upper limit of integration\n");
b=input('');
fprintf("Enterhe maximum allowable approximate relative error\n");
emax=input('');
fprintf("Enter the method you want to use\n");
fprintf("1. Romberg Integration\n2. Guass-Legendre quadrature\n");
way = input("");

if way==1
  h=(b-a);
  I=[];
  rom=0;
  err=100;
  I(1,1)=h*(f(a)/2 +f(b)/2);
  h=h/2;
  n=(b-a)/h +1;
  iter=0;
  while(err>emax)
    iter++;
    total=0;
    h1=h;
    n1=n;
    i=1;
    while h1<= b-a
      total=0;
      if n1>2
        for j=2:1:n1-1
          total+=f(a+(j-1)*h1);
        end;
      end;
      I(1,i)=h*(total+f(a)/2 +f(b)/2);
      h1=h1*2;
      i+=1;
      n1=n1/2 +1;
    end;
    berg=zeros(1,n);
    if n>2
      rom = romberg(I,n-1,2,berg);
    else
      rom = I(1,1);
    end;
    h/=2;
    n=(b-a)/h+1;
    rom;
    err = (100*abs(rom-I(1,1)))/I(1,1);
    I(1,1);
  end;
  I(1,1)
  err
  iter
  
end;

if way==2
  iter=0;
  P=[0,1;1,0];
  err =inf;
  h=b-a;
  iter=1;
  last=0;
  Pnew = [P(2,:).*(2-1/2),0] - [0,P(2-1,:).*(1-1/2)];
    P=[zeros(2,1),P;Pnew];
    Z=roots(P(2+1,:));
    z=roots(P(1+2,:));
    m=1;
      W(1)=2*(1-z(1)^2)/((m+1)*polyval(P(m+1,:),z(1)))^2;
    Iz=0;
      z(1)=z(1)*(b-a)/2+(b+a)/2;
      Iz=Iz+f(z(1))*W(1);
    last=(b-a)/2*Iz;
    
  
  while err>emax
    iter=iter+1;
    n=iter+1;
    Pnew=[P(n,:).*(2 -1/n),0] - [0,P(n-1,:).*(1 -1/n)];
    P=[zeros(n,1),P;Pnew];
    Z=roots(P(n+1,:));
    z=roots(P(iter+2,:));
    m=iter;
    for i=1:n
      W(i)=2*(1-z(i)^2)/((m+1)*polyval(P(m+1,:),z(i)))^2;
    end
    Iz=0;
    for i=1:n
      z(i)=z(i)*(b-a)/2+(b+a)/2;
      Iz=Iz+f(z(i))*W(i);
    end
    Ix=(b-a)/2*Iz;
    err=100*abs(last-Ix)/Ix;
    last=Ix;
    disp(Ix);
  end
  y=z.';
  for i=1:iter+1
    funct(i)=feval(f,y(i));
  end
  plot(z,funct,'o'); hold on; grid on
  xlabel('x'); ylabel('y');
  title('Gauss-Legendre Quadrature');
  Ix
  iter
  err
end