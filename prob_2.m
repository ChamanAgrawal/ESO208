str = input('Give a nonlinear equation in x:','s');
f= inline(str);
syms x
c = coeffs(f,'all')
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
  c = coeffs(f(x),'All')
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

clear
