clear;
fprintf("Give your no. of data and data points in a file named 'input2.txt'\n");
m= input("Please enter the degree of the polynomial for regression \n");
fid = fopen("input2.txt");
line =fgetl(fid);
n = sscanf(line, '%f ');
B = zeros(n,2);
for i=1:1:n
  line = fgetl(fid);
  B(i,1:1:2) = sscanf(line, '%f ');
end;
A=ones(m,m);

function [s] = sum(B,k,n,p)
	s=0;
	for i=1:n
		s=s+(B(i,k).^p);
	end
end

for i=1:m+1
	k=i-1;
	for j=1:m+1
		[s]=sum(B,1,n,k+j-1);
		A(i,j)=s;
	end
end
R = ones(m+1,1);
for i=1:m+1
	k=i-1;
  s2=0;
	for j=1:n
		s2=s2+(B(j,1).^k)*B(j,2);
	end
	R(i,1)=s2;
end

C = A\R;

poly=@(t) 0;
for i=1:m+1
	poly=@(t) poly(t) + C(i)*(t.^(i-1));
end
fplot(poly,[B(1,1),B(n,1)+0.1],'color','b'); hold on;
plot(B(:,1),B(:,2),'x','color','r')

for i=1:n
	yeval(i)= feval(poly,B(i,1));
end

[fbar] = sum(B,2,n,0)/n;
s3=0;
for i=1:n
	s3=s3+(B(i,2)-fbar).^2;
end
St=s3;
s3=0;
for i=1:n
	s3=s3+(B(i,2)-yeval(i)).^2;
end
Sr=s3;
r = ((St-Sr)/St);

fileId = fopen('output2.txt','w');
  fprintf(fileId,"Coefficient are :\n");
	fprintf(fileId,'%f \n',C);
	fprintf(fileId,'R-sq is : %f',r);
fclose(fileId);