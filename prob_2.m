str = input('Give a nonlinear equation in x:','s');
f= inline(str);
fprintf('Enter the method you want to use for :\n1: Muller\n2: Bairstow\n');
way = input('');
if way == 1,
  fprintf('Enter the smaller point\n');
  x3 = input('');
  fprintf('Enter the middle point\n');
  x2 = input('');
  fprintf('Enter the larger point\n');
  x1 = input('');
  
  %fprintf('Enter the initial guess for the root:\n');
  %x0 = input('');
  fprintf('Maximum iterations you want for the method:\n');
  miter=input('');
  fprintf('Maximum relative approximate error you want for the method:\n')
  merror = input('');
  xrange = (x3-5*(x1-x3)):0.1:(x1+5*(x1-x3));
  %xrange = 1:0.1:10
  figure;
  %size(xrange)
  for val=1:1:size(xrange,2)
    y(val) = f(xrange(val));
  end;
  %size(val)
  %size(y)
  plot(xrange,y)
  xlabel('x');
  ylabel('f(x)');
  y1=f(x1);
  y2=f(x2);
  y3=f(x3);
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
    y1=f(x1);
    y2=f(x2);
    y3=f(x3);
    a=(((y1-y2)/(x1-x2))-((y2-y3)/(x2-x3)))/(x1-x3);
    b=((y1-y2)/(x1-x2))+a*(x1-x2);
    c=y1;
    iter= iter + 1;
    flag=1;
    
  end;  
  x1
  %iterations = 2:1:iter;
  %error =error(1,2:iter);
  %figure;
  %plot(iterations, error)
  %xlabel('Number of iterations');
  %ylabel('Relative approximate error');
  
end;


if way == 2,
  syms x
  c = coeffs(f(x),x)
  n=size(c,2);
  fprintf('Enter alpha0\n');
  alpha0 = input('');
  fprintf('Enter alpha1\n');
  alpha1 = input('');
  
  %fprintf('Enter the initial guess for the root:\n');
  %x0 = input('');
  fprintf('Maximum iterations you want for the method:\n');
  miter=input('');
  fprintf('Maximum relative approximate error you want for the method:\n')
  merror = input('');
  xrange = (-10):0.1:(10);
  %xrange = 1:0.1:10
  figure;
  %size(xrange)
  for val=1:1:size(xrange,2)
    y(val) = f(xrange(val));
  end;
  %size(val)
  %size(y)
  plot(xrange,y)
  xlabel('x');
  ylabel('f(x)');
  error=100;
  iter=0;
  %lastx1=111;
  flag=0;
  d=zeros(1,n)
  delta=zeros(1,n-1);
  while (flag==0 )|| ((error>merror) && (iter<miter) && (y1~=0) && (delta_alpha0~=0))
    
    d(1,n)=c(1,n);
    d(1,n-1)=c(1,n-1)+alpha1*d(1,n);
    for i=n-2:1
      d(1,i) = c(1,i)+alpha1*d(1,i+1)+alpha0*d(1,i+2);
    end;
    delta(n-1) = d(n);
    delta(n-2) = d(n-1)+alpha1*delta(n-1);
    for i=n-3:1
      delta(i) = d(i+1)+alpha1*delta(i+1)+alpha0*d(i+2);
    end;
    delta_alpha0 = (delta(1)*d(2)-delta(2)*d(1))/(delta(2)*delta(2)-delta(1)*delta(3));
    delta_alpha1 = (delta(3)*d(1)-delta(2)*d(2))/(delta(2)*delta(2)-delta(1)*delta(3));
    alpha0=alpha0+delta_alpha0;
    alpha1=alpha1+delta_alpha1;
    if flag==1
      error=abs((lastx1-x1)*100/x1);
    end;
    %lastx1=x1;
    
    iter= iter + 1;
    flag=1;
    
  end;  
  root1 = 0.5*(alpha1+sqrt(alpha1*alpha1+4*alpha0));
  root2 = 0.5*(alpha1-sqrt(alpha1*alpha1+4*alpha0));
  root1
  root2
  %iterations = 2:1:iter;
  %error =error(1,2:iter);
  %figure;
  %plot(iterations, error)
  %xlabel('Number of iterations');
  %ylabel('Relative approximate error');
  
end;

clear

