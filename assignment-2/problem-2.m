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
  error =100;
  while (iter<miter && error>merror)
    y = A*z;
    ymod=0;
    for i=1:size
      ymod = ymod + y(i,1)^2;
    end;
    ymod = sqrt(ymod);
    error = abs((ymod - zmod)/ymod)*100;
    zmod = ymod;
    z = y./ymod;
    iter = iter+1;
  end;
  z
  y=A*z;
  ymod = 0;
  for i=1:size
    ymod = ymod + y(i,1)^2;
  end;
  eigenvalue = sqrt(ymod)
  filename = "output2.txt";
  outf = fopen (filename, "w");
  fdisp(outf , "Power Method\nEigenvalue\n");
  fdisp(outf ,eigenvalue);
  fdisp(outf,"\nEigenvector\n");
  fdisp(outf,z);
  fdisp(outf,"\nIterations\n");
  fdisp(outf,iter);
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
  while (iter<miter && error>merror)
    y = B*z;
    ymod=0;
    for i=1:size
      ymod = ymod + y(i,1)^2;
    end;
    ymod = sqrt(ymod);
    error = abs((ymod - zmod)/ymod)*100;
    zmod = ymod;
    z = y./ymod;
    iter = iter+1;
  end;
  z
  y=A*z;
  ymod = 0;
  for i=1:size
    ymod = ymod + y(i,1)^2;
  end;
  eigenvalue = sqrt(ymod)
  filename = "output2.txt";
  outf = fopen (filename, "w");
  fdisp(outf , "Inverse Power Method\nEigenvalue\n");
  fdisp(outf ,eigenvalue);
  fdisp(outf,"\nEigenvector\n");
  fdisp(outf,z);
  fdisp(outf,"\nIterations\n");
  fdisp(outf,iter);
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
  error =100;
  while (iter<miter && error>merror)
    y = B*z;
    ymod=0;
    for i=1:size
      ymod = ymod + y(i,1)^2;
    end;
    ymod = sqrt(ymod);
    error = abs((ymod - zmod)/ymod)*100;
    zmod = ymod;
    z = y./ymod;
    iter = iter+1;
  end;
  z
  y=A*z;
  ymod = 0;
  for i=1:size
    ymod = ymod + y(i,1)^2;
  end;
  eigenvalue = sqrt(ymod)
  filename = "output2.txt";
  outf = fopen (filename, "w");
  fdisp(outf , "Inverse Power Method with shift\nEigenvalue\n");
  fdisp(outf ,eigenvalue);
  fdisp(outf,"\nEigenvector\n");
  fdisp(outf,z);
  fdisp(outf,"\nIterations\n");
  fdisp(outf,iter);
  fclose(outf);
end;

fprintf("Output is in output2.txt\n");