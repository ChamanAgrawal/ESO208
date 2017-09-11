clear;
fprintf("Give your augmented matrix in a file named 'input1.txt'\n");
fprintf("FORMAT: Size of augmented matrix int the first line and matrix from the next line\n");
fprintf("Press ENTER to continue\n\n");
fid = fopen("input1.txt");
line =fgetl(fid);
size = sscanf(line, '%f ');
A = zeros(size,size+1);
for i=1:1:size
  line = fgetl(fid);
  A(i,1:1:size+1) = sscanf(line, '%f ');
end;
fprintf("Enter the method you want to use\n");
fprintf("1. Guass Elimination(without pivoting)\n2. Guass Elimination(with pivoting)\n3. LU decomposition by Doolittle method (without pivoting)\n4. LU decomposition by Crout method (without pivoting)\n5. Cholesky decomposition (for symmetric positive definite matrix)\n");
method = input("");

if method == 1
 for i=1:1:size-1
  if A(i,i)~=0
    for j=i+1:1:size
      A(j,:) = A(j,:)-(A(j,i)/A(i,i))*A(i,:);
    end;
  else
    for k=i+1:1:size
      if A(k,i)~=0
        B = A(k,:);
        A(k,:) = A(i,:);
        A(i,:) = B;
        break;
      end;
    end;
    for j=i:1:size
      A(j,:) = A(j,:)-(A(j,i)/A(i,i))*A(i,:);
    end;
  end;
 end;
 X = zeros(size,1);
 X(size,1) = A(size,size+1)/A(size,size);
 for i=size-1:-1:1
   for j=size:-1:i+1
     X(i,1) = A(i,size+1)-X(j,1)*A(i,j);
   end;
   X(i,1) = X(i,1)/A(i,i);
 end;
 X
 filename = "output1.txt";
 outf = fopen (filename, "w");
 fdisp(outf , "Guass Elimination(without pivoting)\nX\n");
 fdisp(outf , X);
 fclose(outf);
end;

if method == 2
  for i=1:1:size-1
    if A(i,i)~=0
      A(i,:) = A(i,:)/A(i,i);
      for j=i+1:1:size
        A(j,:) = A(j,:)-A(j,i)*A(i,:);
      end;
    else
      for k=i+1:1:size
        if A(k,i)~=0
          B = A(k,:);
          A(k,:) = A(i,:);
          A(i,:) = B;
          break;
        end;
      end;
      A(i,:) = A(i,:)/A(i,i);
      for j=i:1:size
        A(j,:) = A(j,:)-A(j,i)*A(i,:);
      end;
    end;
  end;
  X = zeros(size,1);
  X(size,1) = A(size,size+1)/A(size,size);
  for i=size-1:-1:1 
    for j=size:-1:i+1
      X(i,1) = A(i,size+1)-X(j,1)*A(i,j);
    end;
    X(i,1) = X(i,1)/A(i,i);
  end;
  X
  filename = "output1.txt";
  outf = fopen (filename, "w");
  fdisp(outf , "Guass Elimination(with pivoting)\nX\n");
  fdisp(outf , X);
  fclose(outf);
end;

if method == 3
  L = eye(size);
  U = zeros(size,size);
  for j=1:1:size
    U(1,j)=A(1,j);
  end
  for i=2:1:size
    for j=1:1:size
      for k=1:1:i-1
        s1=0;
        if k==1
          s1=0;
        else
          for p=1:1:k-1
            s1=s1+L(i,p)*U(p,k);
          end
        end
        L(i,k)=(A(i,k)-s1)/U(k,k);
      end
      for k=i:1:size
        s2=0;
        for p=1:1:i-1
          s2=s2+L(i,p)*U(p,k);
        end
        U(i,k)=A(i,k)-s2;
      end
    end
  end;
  Y = zeros(size,1)
  Y(1,1) = A(1,size+1);
  for i=2:1:size
    for j=1:1:i-1
      Y(i,1) = A(i,size+1)-Y(j,1)*L(i,j);
    end;
    Y(i,1) = Y(i,1)/L(i,i);
  end;
  X = zeros(size,1);
  X(size,1) = Y(size,1)/U(size,size);
  for i=size-1:-1:1
    for j=size:-1:i+1
      X(i,1) = Y(i,1)-X(j,1)*U(i,j);
    end;
    X(i,1) = X(i,1)/U(i,i);
  end;
  L
  U
  X
  filename = "output1.txt";
  outf = fopen(filename, "w");
  fputs(outf ,"Doolittle Method\nL\n");
  fdisp(outf ,L);
  fputs(outf ,"\nU\n");
  fdisp(outf, U);
  fputs(outf ,"\nX\n");
  fdisp(outf, X);
  fclose(outf);
end;

if method == 4
  U = zeros(size,size);
  L = zeros(size,size);
  for j=1:1:size
    L(j,1)=A(j,1);
  end
  U(1,:)=A(1,1:size)/L(1,1);
  U(1,1)=1;
  for k=2:size
    for j=2:size
      for i=j:size
        s1=0;
        for l = 1:j-1;
          s1 = s1 + L(i,l)*U(l,j);
        end;
        L(i,j)=A(i,j)- s1;
      end
      s2=0;
      for l = 1:k-1;
        s2 = s2 + L(k,l)*U(l,j);
      end;
      U(k,j)=(A(k,j)- s2)/L(k,k);
    end
  end
  Y = zeros(size,1)
  Y(1,1) = A(1,size+1)/L(1,1);
  for i=2:1:size
    for j=1:1:i-1
      Y(i,1) = A(i,size+1)-Y(j,1)*L(i,j);
    end;
    Y(i,1) = Y(i,1)/L(i,i);
  end;
  X = zeros(size,1);
  X(size,1) = Y(size,1)/U(size,size);
  for i=size-1:-1:1
    for j=size:-1:i+1
      X(i,1) = Y(i,1)-X(j,1)*U(i,j);
    end;
    X(i,1) = X(i,1)/U(i,i);
  end;
  L
  U
  X
  filename = "output1.txt";
  outf = fopen(filename, "w");
  fputs(outf ,"Crout Method\nL\n");
  fdisp(outf ,L);
  fputs(outf ,"\nU\n");
  fdisp(outf, U);
  fputs(outf ,"\nX\n");
  fdisp(outf, X);
  fclose(outf);
end;

if method == 5
  L = zeros(size,size);
  L(1,1) =sqrt(A(1,1));
  L(2:size,1) = A(2:size,1)/L(1,1);

  for j=2:size
    s1=0;
    for l = 1:j-1;
      s1 = s1 + L(j,l)*L(j,l);
    end;
    L(j,j)=sqrt((A(j,j)- s1));
    for i=j+1:size
      s1=0;
      for l = 1:j-1;
        s1 = s1 + L(i,l)*L(j,l);
      end;
      L(i,j)=(A(i,j)- s1)/L(j,j);
    end
  end
  Y = zeros(size,1)
  Y(1,1) = A(1,size+1)/L(1,1);
  for i=2:1:size
    for j=1:1:i-1
      Y(i,1) = A(i,size+1)-Y(j,1)*L(i,j);
    end;
    Y(i,1) = Y(i,1)/L(i,i);
  end;
  X = zeros(size,1);
  X(size,1) = Y(size,1)/L(size,size)';
  for i=size-1:-1:1
    for j=size:-1:i+1
      X(i,1) = Y(i,1)-X(j,1)*L(j,i)';
    end;
    X(i,1) = X(i,1)/L(i,i)';
  end;
  L
  L'
  X
  filename = "output1.txt";
  outf = fopen(filename, "w");
  fputs(outf ,"Cholesky Method\nL\n");
  fdisp(outf ,L);
  fputs(outf ,"\nX\n");
  fdisp(outf, X);
  fclose(outf);
end;
fprintf("Output is in output1.txt\n");
