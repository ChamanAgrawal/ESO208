clear;
fprintf("Give your augmented matrix in a file named 'input.txt'\n");
fprintf("FORMAT: Size of augmented matrix int the first line and matrix from the next line\n");
fprintf("Press ENTER to continue\n\n");
fid = fopen("input.txt");
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
 filename = "output.txt";
 outf = fopen (filename, "w");
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
  filename = "output.txt";
  outf = fopen (filename, "w");
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
  filename = "output.txt";
  outf = fopen(filename, "w");
  fputs(outf ,"\nL is\n");
  fdisp(outf ,L);
  fputs(outf ,"\nU is\n");
  fdisp(outf, U);
  fputs(outf ,"\nX is\n");
  fdisp(outf, X);
  fclose(outf);
end;

if method == 4

end;
fprintf("Output is in output.txt\n");
