fprintf('Enter the degree of your polynomial\n');
n = input('');
coeff=zeros(1,n+1);
for k=1:1:n+1
  fprintf('Enter the coeffiecient of x^%d : ',k-1);
  coeff(1,k)=input('');
end;
fprintf('Enter the method you want to use for :\n1: Muller\n2: Bairstow\n');
way = input('');
if way == 1,
  fprintf('Enter the smaller point\n');
  x3 = input('');
  fprintf('Enter the middle point\n');
  x2 = input('');
  fprintf('Enter the larger point\n');
  x1 = input('');
  fprintf('Maximum iterations you want for the method:\n');
  miter=input('');
  fprintf('Maximum relative approximate error you want for the method:\n')
  merror = input('');
  xrange = (x3-2*(x1-x3)):0.1:(x1+2*(x1-x3));
  figure;
  for val=1:1:size(xrange,2)
    y(val) = f(n,coeff,xrange(val));
  end;
  plot(xrange,y)
  xlabel('x');
  ylabel('f(x)');
  y1=f(n,coeff,x1);
  y2=f(n,coeff,x2);
  y3=f(n,coeff,x3);
  a=(((y1-y2)/(x1-x2))-((y2-y3)/(x2-x3)))/(x1-x3);
  b=((y1-y2)/(x1-x2))+a*(x1-x2);
  c=y1;
  error=100;
  iter=0;
  lastx1=111;
  flag=0;
  delta=0;
  while (flag==0 )|| ((error>merror) && (iter<miter) && (y1~=0))
    
    delta1 = -2*c/(b+sqrt(b^2-4*a*c));
    delta2 = -2*c/(b-sqrt(b^2-4*a*c));
    if abs(delta1)<abs(delta2)
      delta = delta1;
    else
      delta = delta2;
    end;
    x3=x2;
    x2=x1;
    x1= x1+delta;
    if flag==1
      error=abs((lastx1-x1)*100/x1);
    end;
    lastx1=x1;
    y1=f(n,coeff,x1);
    y2=f(n,coeff,x2);
    y3=f(n,coeff,x3);
    a=(((y1-y2)/(x1-x2))-((y2-y3)/(x2-x3)))/(x1-x3);
    b=((y1-y2)/(x1-x2))+a*(x1-x2);
    c=y1;
    iter= iter + 1;
    flag=1;
    
  end;  
  x1
end;


if way == 2,
  
  fprintf('Enter alpha0\n');
  alpha0 = input('');
  fprintf('Enter alpha1\n');
  alpha1 = input('');
  fprintf('Maximum iterations you want for the method:\n');
  miter=input('');
  fprintf('Maximum relative approximate error you want for the method:\n')
  merror = input('');
  xrange = min(alpha0,alpha1)-10*abs(alpha0-alpha1):0.1:max(alpha0,alpha1)+10*abs(alpha0-alpha1);
  figure;
  for val=1:1:size(xrange,2)
    y(val) = f(n,coeff,xrange(val));
  end;
  plot(xrange,y)
  xlabel('x');
  ylabel('f(x)');
  error=100;
  iter=0;
  d=zeros(1,n+1);
  delta=zeros(1,n);
  while (error>merror) && (iter<miter)
    d(1,n+1)=coeff(1,n+1);
    d(1,n)=coeff(1,n)+alpha1*d(1,n+1);
    for i=n-1:-1:1
      d(1,i) = coeff(1,i)+alpha1*d(1,i+1)+alpha0*d(1,i+2);
    end;
    delta(1,n) = d(1,n+1);
    delta(1,n-1) = d(1,n)+alpha1*delta(1,n);
    for j=n-2:-1:1
      delta(1,j) = d(1,j+1)+alpha1*delta(1,j+1)+alpha0*delta(1,j+2);
    end;
    delta_alpha0 = (delta(1,1)*d(1,2)-delta(1,2)*d(1,1))/(delta(1,2)*delta(1,2)-delta(1,1)*delta(1,3));
    delta_alpha1 = (delta(1,3)*d(1,1)-delta(1,2)*d(1,2))/(delta(1,2)*delta(1,2)-delta(1,1)*delta(1,3));
    alpha0=alpha0+delta_alpha0;
    alpha1=alpha1+delta_alpha1;
    if abs(delta_alpha0) > abs(delta_alpha1)
      error = delta_alpha1/alpha1;
    else
      error = delta_alpha0/alpha0;
    end;   
    error = abs(error)*100;
    iter= iter + 1;
    flag=1;
  end;  
  root1 = 0.5*(alpha1+sqrt(alpha1*alpha1+4*alpha0));
  root2 = 0.5*(alpha1-sqrt(alpha1*alpha1+4*alpha0));
  root1
  root2
end;
clear

