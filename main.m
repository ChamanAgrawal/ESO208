%check if we have to find all the roots of the equation
str = input('Give a nonlinear equation in x:','s');
f= inline(str);
fprintf('Enter the method you want to use for :\n1: Bisection\n2: False-position\n3: Fixed-Point\n4: Newton-Raphson\n5: Secant\n');
way = input('');
if way == 1,
  fprintf('Enter the lower bracket for the root\n');
  x1 = input('');
  fprintf('Enter the upper bracket for the root\n');
  x2 = input('');
  
  if x1>=x2,
    fprintf('Please enter proper bracket\n');
    return;
  end;
  
  %fprintf('Enter the initial guess for the root:\n');
  %x0 = input('');
  fprintf('Maximum iterations you want for the method:\n');
  miter=input('');
  fprintf('Maximum relative approximate error you want for the method:\n')
  merror = input('');
  xrange = (x1-(x2-x1)):0.1:(x2+(x2-x1));
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
  error(1)=100;
  iter=0;
  ym=1;
  lastxm=111;
  flag=0;
  while (flag==0 )|| ((error(iter)>merror) && (iter<miter) && (ym~=0))
    flag=1;
    xm=(x1+x2)/2;
    ym=f(xm);
    if (ym*y1<0)
      y2=ym;
      x2=xm;
      error(iter+1)=abs((lastxm-xm)*100/xm);
      lastxm=xm;
      iter= iter + 1;
    
    else
      x1=xm;
      y1=ym;
      error(iter+1)=abs((lastxm-xm)*100/xm);
      lastxm=xm;
      iter= iter + 1;
    end;
    
  end;  
  xm
  iterations = 2:1:iter;
  error =error(1,2:iter);
  figure;
  plot(iterations, error)
  xlabel('Number of iterations');
  ylabel('Relative approximate error');
  
end;

if way == 2,
  fprintf('Enter the lower bracket for the root\n');
  x1 = input('');
  fprintf('Enter the upper bracket for the root\n');
  x2 = input('');
  
  if x1>=x2,
    fprintf('Please enter proper bracket\n');
    return;
  end;
  
  %fprintf('Enter the initial guess for the root:\n');
  %x0 = input('');
  fprintf('Maximum iterations you want for the method:\n');
  miter=input('');
  fprintf('Maximum relative approximate error you want for the method:\n')
  merror = input('');
  xrange = (x1-(x2-x1)):0.1:(x2+(x2-x1));
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
  error(1)=100;
  iter=0;
  ym=1;
  lastxm=111;
  flag=0;
  while (flag==0 )|| ((error(iter)>merror) && (iter<miter) && (ym~=0))
    flag=1;
    xm=x2 - y2*((x2-x1)/(y2-y1));
    ym=f(xm);
    if (ym*y1<0)
      y2=ym;
      x2=xm;
      error(iter+1)=abs((lastxm-xm)*100/xm);
      lastxm=xm;
      iter= iter + 1;
    
    else
      x1=xm;
      y1=ym;
      error(iter+1)=abs((lastxm-xm)*100/xm);
      lastxm=xm;
      iter= iter + 1;
    end;
    
  end;  
  xm
  iterations = 2:1:iter;
  error =error(1,2:iter);
  figure;
  plot(iterations, error)
  xlabel('Number of iterations');
  ylabel('Relative approximate error');
  
end;


if way == 3,
  %fprintf('Enter phi(x):\n','s');
  phiInput = input('Enter phi(x):','s');
  phi = inline(phiInput);
  fprintf('Enter the initial guess\n');
  x1 = input('');
  
  %fprintf('Enter the initial guess for the root:\n');
  %x0 = input('');
  fprintf('Maximum iterations you want for the method:\n');
  miter=input('');
  fprintf('Maximum relative approximate error you want for the method:\n')
  merror = input('');
  if x1>=0
    xrange = (-x1-10):0.1:(2*x1+10);
  else
    xrange = (-x1+10):-0.1:(2*x1-10);
  end;
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
  error(1)=200;
  iter=0;
  flag=0;
  xm=x1;
  lastxm =x1;
  while (flag==0 )|| ((error(iter)>merror) && (iter<miter))
    flag=1;
    ym=phi(xm);
    xm=ym;
    error(iter+1)=abs((lastxm-xm)*100/xm);
    lastxm=xm;
    iter= iter + 1;
  end;  
  xm
  iterations = 1:1:iter-1;
  error =error(1,1:iter-1);
  figure;
  plot(iterations, error)
  xlabel('Number of iterations');
  ylabel('Relative approximate error');
  
end;


if way == 4,
  %fprintf('Enter phi(x):\n','s');
  phiInput = input('Enter derivative of f(x):','s');
  phi = inline(phiInput);
  fprintf('Enter the initial guess\n');
  x1 = input('');
  
  %fprintf('Enter the initial guess for the root:\n');
  %x0 = input('');
  fprintf('Maximum iterations you want for the method:\n');
  miter=input('');
  fprintf('Maximum relative approximate error you want for the method:\n')
  merror = input('');
  if x1>=0
    xrange = (-x1-5):0.1:(2*x1+5);
  else
    xrange = (-x1+5):-0.1:(2*x1-5);
  end;
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
  error(1)=100;
  iter=0;
  flag=0;
  xm=x1;
  lastxm =x1;
  while (flag==0 )|| ((error(iter)>merror) && (iter<miter))
    flag=1;
    ym=f(xm);
    xm=xm - (ym/phi(xm));
    error(iter+1)=abs((lastxm-xm)*100/xm);
    lastxm=xm;
    iter= iter + 1;
  end;  
  xm
  iterations = 1:1:iter-1;
  error =error(1,1:iter-1);
  figure;
  plot(iterations, error)
  xlabel('Number of iterations');
  ylabel('Relative approximate error');
  
end;

if way == 5,
  %fprintf('Enter phi(x):\n','s');
  fprintf('Enter the smaller point\n');
  x1 = input('');
  fprintf('Enter the larger point\n');
  x2 = input('');
  
  %fprintf('Enter the initial guess for the root:\n');
  %x0 = input('');
  fprintf('Maximum iterations you want for the method:\n');
  miter=input('');
  fprintf('Maximum relative approximate error you want for the method:\n')
  merror = input('');
  xrange = (x1-4*(x2-x1)):0.1:(x2+4*(x2-x1));
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
  error(1)=100;
  iter=0;
  flag=0;
  y1=f(x1);
  y2=f(x2);
  xm=x1;
  lastxm =x1;
  while (flag==0 )|| ((error(iter)>merror) && (iter<miter))
    flag=1;
    xm=x2 - y2*((x2-x1)/(y2-y1));
    ym=f(xm);
    if y1>y2
      y1=ym;
      x1=xm;
    else
      y2=ym;
      x2=xm;
    end;
    
    error(iter+1)=abs((lastxm-xm)*100/xm);
    lastxm=xm;
    iter= iter + 1;
  end;  
  xm
  iterations = 2:1:iter;
  error =error(1,2:iter);
  figure;
  plot(iterations, error)
  xlabel('Number of iterations');
  ylabel('Relative approximate error');
  
end;
clear