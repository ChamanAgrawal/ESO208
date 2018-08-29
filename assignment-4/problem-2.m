clear;
clear;
fprintf("");
str = input('Give the function in t and y :','s');
f= inline(str);
fprintf("Enter initial value of t0\n");
t0=input('');
fprintf("Enter initial value of y0\n");
y0=input('');
fprintf("Final value of tf\n");
tf=input('');
fprintf("interval size\n");
h=input('');
fprintf("Enter the method you want to use\n");
fprintf("1. Forward Euler\n2.2nd order RK method (Midpoint method)\n3.4th order RK method");
op =input('');
feval(f,1,2)
n=(tf-t0)/h;

switch op

	case 1
		t(1)= t0 + h;
		y(1)= y0 + h*f(t0,y0);

		for i=2:n
			t(i)= t(i-1) + h;
			y(i)= y(i-1) + h*f(t(i-1),y(i-1));
		end

	case 2
		t(1)= t0 + h;	
		y(1)= y0+ h*f(t0 + h/2,y0 + h/2*f(t0,y0));

		for i=2:n
			t(i)= t(i-1) + h;
			y(i)= y(i-1) + h*f(t(i-1) + h/2,y(i-1) + h/2*f(t(i-1),y(i-1)));
		end

	case 3
		t(1)= t0 + h;	
		y(1)= y0+ h/6*(f(t0,y0) + 2*f(t0 + h/2, y0 + h/2*f(t0,y0)) + 2*f(t0 + h/2, y0 + h/2*f(t0 + h/2, y0 + h/2*f(t0,y0))) + f(t0 + h, y0 + h*f(t0 + h/2, y0 + h/2*f(t0 + h/2, y0 + h/2*f(t0,y0)))));

		for i=2:n
			t(i)= t(i-1) + h;
		y(i)= y(i-1)+ h/6*(f(t(i-1),y(i-1)) + 2*f(t(i-1) + h/2, y(i-1) + h/2*f(t(i-1),y(i-1))) + 2*f(t(i-1) + h/2, y(i-1) + h/2*f(t(i-1) + h/2, y(i-1) + h/2*f(t(i-1),y(i-1)))) + f(t(i-1) + h, y(i-1) + h*f(t(i-1) + h/2, y(i-1) + h/2*f(t(i-1) + h/2, y(i-1) + h/2*f(t(i-1),y(i-1))))));
		end	
end		

plot(t,y,'o','color','r'); grid on; hold on
plot(t0,y0,'o','color','r');
fileId = fopen('answer.txt','w');
	fprintf(fileId,'t, y \n');
	fprintf(fileId,'%f %f \n',t0,y0);
	for i=1:n
		fprintf(fileId,'%f %f \n',t(i),y(i));
	end
fclose(fileId);