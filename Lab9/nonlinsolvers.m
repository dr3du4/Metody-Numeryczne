function C = nonlinsolvers(f, fp, a, b, solver, iter)
C = zeros(1,iter); % kolejne oszacowania miejsca zerowego
c = a; % pierwsze oszacowanie
tol=10^-9;
for i = 1 : iter
fa = feval(f,a); fb=feval(f,b); fc=feval(f,c); fpc=feval(fp,c); % oblicz
switch(solver)
case 'bisection',
    if( fa*fc<0 ) b=c; else a=c; end
    c = (a+b)/2;
case 'regula-falsi',
    if( fa*fc<0 ) b=c; else a=c; end
    c = b-fb*(b-a)/(fb-fa);
case 'newton-raphson',
    c = c-fc/fpc;
case 'sieczne',
    %if f(a)*f(b)>0 
    %disp('Enter valid interval !!!');
    %return
    %else
    err=abs(b-a);
    %fprintf('\n x0 \t\t x1 \t\t f(x0) \t\t f(x1)');
    %fprintf('\n %0.4f \t %0.4f \t %0.4f \t %0.4f',x0,x1,f(x0),f(x1));
    %while err > tol
        c=(a*f(b)-b*f(a))/(f(b)-f(a));
        a=b;        
        b=c;
        err=abs(b-a);
        root=c; 
        %fprintf('\n %0.4f \t %0.4f \t %0.4f \t %0.4f',x0,x1,f(x0),f(x1));
    %end
        
        c=root
        
case 'Muller',
        h1 = b - a;
        h2 = c - b;
        delta1 = (fb - fa) / h1;
        delta2 = (fc - fb) / h2;
        
        A = (delta2 - delta1) / (h2 + h1);
        B = A * h2 + delta2;
        C = fc;
        
        D = sqrt(B^2 - 4 * A * C);
        
        if abs(B - D) < abs(B + D)
            E = B + D;
        else
            E = B - D;
        end
        
        h = -2 * C / E;
        p = b + h
        
        if abs(h) < tol
            return;
        end
        
        fa = feval(f, a);
        fb = feval(f, b);
        fc = feval(f, c);
        fp = feval(f, p);
        
        if fp > 0
            a = b;
            b = p;
        elseif fp < 0
            c = b;
            b = p;
        else
            return;
        end
      
        C(i) = p; % zapamiętaj
    
otherwise,
    error('Brak metody');
    end
C(i)=c; % zapamietaj
end