clear;
fprintf("Give your no. of data and data points in a file named 'input2.txt'\n");
fprintf("Press ENTER to continue\n\n");
fid = fopen("input1.txt");
line =fgetl(fid);
n = sscanf(line, '%f ');
B = zeros(n,2);
for i=1:1:n
  line = fgetl(fid);
  B(i,1:1:2) = sscanf(line, '%f ');
end;
