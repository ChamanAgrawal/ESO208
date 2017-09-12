clear;
fprintf("Enter the method you want to use\n");
fprintf("1. Power method\n2. Inverse power method\n3. Inverse power method with shift\n4. QR method\n");
method = input("");

if method == 1
  fprintf("Give your input in a file named 'input2.txt'\n");
  fprintf("FORMAT: Size of matrix \n matrix \n Maximum iterations \n Maximum approximate relative error \n ");
  fprintf("Press ENTER to continue\n\n");
  pause;
  fid = fopen("input2.txt");
  line =fgetl(fid);
  size = sscanf(line, '%f ');
  A = zeros(size,size);
  for i=1:1:size
    line = fgetl(fid);
    A(i,1:1:size) = sscanf(line, '%f ');
  end;
  line = fgetl(fid);
  miter = sscanf(line, '%f ');
  line = fgetl(fid);
  merror = sscanf(line, '%f ');
  z = zeros(size,1);
  y = zeros(size,1);
  z(1,1) = 1;
  zmod = 1;
  iter = 1;
  value(iter,1) =100;
  error =100;
  value(iter,2) = 1;
  while (iter<miter && error>merror)
    y = A*z;
    ymod=0;
    for i=1:size
      ymod = ymod + y(i,1)^2;
    end;
    ymod = sqrt(ymod);
    y = y./ymod;
    curerror=0;
    cureigenvec = A*y;
    cureigenval = 0;
    for i=1:1:size
      cureigenval = cureigenval + cureigenvec(i,1)^2 ;
    end;
    cureigenval = sqrt(cureigenval);
    for i=1:1:size
        curerror = max (curerror,(abs((z(i,1)-y(i,1))/y(i,1))*100));
    end;
    value(iter,2) = cureigenval;
    value(iter,1) = curerror;
    error = curerror;
    zmod = ymod;
    z = y;
    iter = iter+1;
  end;
  z
  fprintf("  (Error,Eigenvalue) is \n");
  value
  y=A*z;
  ymod = 0;
  for i=1:size
    ymod = ymod + y(i,1)^2;
  end;
  eigenvalue = sqrt(ymod)
  filename = "output2.txt";
  outf = fopen (filename, "w");
  fdisp(outf, "")
  fdisp(outf , "Power Method\n\n");
  fdisp(outf, "(Error,Eigenvalue) is\n");
  fdisp(outf, value);
  fdisp(outf, "\nEigenvalue\n");
  fdisp(outf ,eigenvalue);
  fdisp(outf,"\nEigenvector\n");
  fdisp(outf,z);
  fdisp(outf,"\nIterations\n");
  fdisp(outf,iter-1);
  fclose(outf);
end;

if method == 2
  fprintf("Give your input in a file named 'input2.txt'\n");
  fprintf("FORMAT: Size of matrix \n matrix \n Maximum iterations \n Maximum approximate relative error \n ");
  fprintf("Press ENTER to continue\n\n");
  pause;
  fid = fopen("input2.txt");
  line =fgetl(fid);
  size = sscanf(line, '%f ');
  A = zeros(size,size);
  for i=1:1:size
    line = fgetl(fid);
    A(i,1:1:size) = sscanf(line, '%f ');
  end;
  line = fgetl(fid);
  miter = sscanf(line, '%f ');
  line = fgetl(fid);
  merror = sscanf(line, '%f ');
  B = inv(A);
  z = zeros(size,1);
  y = zeros(size,1);
  z(1,1) = 1;
  zmod = 1;
  iter = 1;
  error =100;
  value(iter,1) =100;
  value(iter,2) =1;
  while (iter<miter && error>merror)
    y = B*z;
    ymod=0;
    for i=1:size
      ymod = ymod + y(i,1)^2;
    end;
    ymod = sqrt(ymod);
    y = y./ymod;
    curerror=0;
    cureigenvec = A*y;
    cureigenval = 0;
    for i=1:1:size
      cureigenval = cureigenval + cureigenvec(i,1)^2 ;
    end;
    cureigenval = sqrt(cureigenval);
    for i=1:1:size
        curerror = max (curerror,(abs((z(i,1)-y(i,1))/y(i,1))*100));
    end;
    value(iter,2) = cureigenval;
    value(iter,1) = curerror;
    error = curerror;
    zmod = ymod;
    z = y;
    iter = iter+1;
  end;
  z
  fprintf("  (Error,Eigenvalue) is \n");
  value
  y=A*z;
  ymod = 0;
  for i=1:size
    ymod = ymod + y(i,1)^2;
  end;
  eigenvalue = sqrt(ymod)
  filename = "output2.txt";
  outf = fopen (filename, "w");
  fdisp(outf , "Inverse Power Method\n");
  fdisp(outf, "(Error,Eigenvalue) is\n");
  fdisp(outf, value);
  fdisp(outf, "\nEigenvalue\n");
  fdisp(outf ,eigenvalue);
  fdisp(outf,"\nEigenvector\n");
  fdisp(outf,z);
  fdisp(outf,"\nIterations\n");
  fdisp(outf,iter-1);
  fclose(outf);
end;

if method == 3
  fprintf("Give your input in a file named 'input2.txt'\n");
  fprintf("FORMAT: Size of matrix \n matrix \n Maximum iterations \n Maximum approximate relative error \n The scalar value to which the eigenvalue should be closest\n ");
  fprintf("\nPress ENTER to continue\n\n");
  pause;
  fid = fopen("input2.txt");
  line =fgetl(fid);
  size = sscanf(line, '%f ');
  A = zeros(size,size);
  for i=1:1:size
    line = fgetl(fid);
    A(i,1:1:size) = sscanf(line, '%f ');
  end;
  line = fgetl(fid);
  miter = sscanf(line, '%f ');
  line = fgetl(fid);
  merror = sscanf(line, '%f ');
  line = fgetl(fid);
  theta = sscanf(line, '%f ');
  B = inv(A-(theta.*eye(size)));
  z = zeros(size,1);
  y = zeros(size,1);
  z(1,1) = 1;
  zmod = 1;
  iter = 1;
  value(iter,1) =100;
  value(iter,2) = 1;
  error = 100;
  while (iter<miter && error>merror)
    y = B*z;
    ymod=0;
    for i=1:size
      ymod = ymod + y(i,1)^2;
    end;
    ymod = sqrt(ymod);
    y = y./ymod;
    curerror=0;
    for i=1:1:size
        curerror = max (curerror,(abs((z(i,1)-y(i,1))/y(i,1))*100));
    end;
    cureigenval = 0;
    cureigenvec = A*y;
    for l=1:1:size
      cureigenval = cureigenval + cureigenvec(l,1)^2;
    end;
    cureigenval = sqrt(cureigenval);
    value(iter,2) = cureigenval;
    value(iter,1) = curerror;
    error = curerror;
    zmod = ymod;
    z = y;
    iter = iter+1;
  end;
  z
  fprintf("  (Error,Eigenvalue) is \n");
  value
  y=A*z;
  ymod = 0;
  for i=1:size
    ymod = ymod + y(i,1)^2;
  end;
  eigenvalue = sqrt(ymod)
  filename = "output2.txt";
  outf = fopen (filename, "w");
  fdisp(outf , "Inverse Power Method with shift\n");
  fdisp(outf, "(Error,Eigenvalue) is\n");
  fdisp(outf, value);
  fdisp(outf, "\nEigenvalue\n");
  fdisp(outf ,eigenvalue);
  fdisp(outf,"\nEigenvector\n");
  fdisp(outf,z);
  fdisp(outf,"\nIterations\n");
  fdisp(outf,iter-1);
  fclose(outf);
end;

if method == 4
  fprintf("Give your input in a file named 'input2.txt'\n");
  fprintf("FORMAT: Size of matrix \n matrix \n Maximum iterations \n Maximum approximate relative error \n");
  fprintf("\nPress ENTER to continue\n\n");
  pause;
  fid = fopen("input2.txt");
  line =fgetl(fid);
  size = sscanf(line, '%f ');
  A = zeros(size,size);
  for i=1:1:size
    line = fgetl(fid);
    A(i,1:1:size) = sscanf(line, '%f ');
  end;
  line = fgetl(fid);
  miter = sscanf(line, '%f ');
  line = fgetl(fid);
  merror = sscanf(line, '%f ');
  iter = 1;
  value(iter,1) =100;
  value(iter,2) = 1;
  error = 100;
  while (iter<miter && error>merror)
    Q = zeros(size,size);
    for i=1:1:size
      if i==1
        ymod=0;
        for j=1:size
          ymod = ymod + A(j,1)^2;
        end;
        ymod = sqrt(ymod);
        Q(:,1) = A(:,1)./ymod;
      else
        Q(:,i) = A(:,i);
        for k = k=1:i-1
          Q(:,i) = Q(:,i) - ((A(:,i)')*Q(:,k)).*Q(:,k);
        end;
        ymod=0;
        for j=1:1:size
          ymod = ymod + Q(j,i)^2;
        end;
        ymod = sqrt(ymod);
        Q(:,i) = Q(:,i)./ymod;
      end;
    end;
    R = Q'*A;
    B = R*Q;
    curerror=0;
    for i=1:1:size
        curerror = max (curerror,(abs((A(i,i)-B(i,i))/B(i,i))*100));
    end;
    A = B;
    error = curerror;
    value(iter,1) = iter;
    value(iter , 2) = error;
    for i=3:1:size+2
      value(iter, i) = A(i-2,i-2);
    end;
    iter = iter+1;
  end;
  for i=1:size
    eigenvalue(1,i) = A(i,i);
  end;
  fprintf("       (Iterations,Error,Eigenvalues) is \n");
  value
  eigenvalue
  filename = "output2.txt";
  outf = fopen (filename, "w");
  fdisp(outf , "QR Method\n");
  fdisp(outf, "(Error,Eigenvalue) is\n");
  fdisp(outf, value);
  fdisp(outf, "\nEigenvalue\n");
  fdisp(outf ,eigenvalue);
  fdisp(outf,"\nIterations\n");
  fdisp(outf,iter-1);
  fclose(outf);

end;
fprintf("Output is in output2.txt\n");