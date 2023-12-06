function muller
 % t2=1e-6;
p0 = 10;
p1 = 20;
p2 = 30;
TOL = 10^-9;
N0 = 100;
format long;
h1 = p1 - p0;
h2 = p2 - p1;
DELTA1 = (f(p1) - f(p0))/h1;
DELTA2 = (f(p2) - f(p1))/h2;
d = (DELTA2 - DELTA1)/(h2 + h1);
i=3;
while i <= N0
      b = DELTA2 + h2*d;
      D = (b.^2 - 4*f(p2).*d).^(1/2);
      if abs(b-D) < abs(b+D)
          E = b + D;
      else
          E = b - D;
      end
      h = -2*f(p2)/E;
      p = p2 + h;
      
     
      if abs(h) < TOL
          p
          
         disp(p) 
          break
      end
      p0 = p1;
      p1 = p2;
      p2 = p;
      h1 = p1 - p0;
     h2 = p2 - p1;
     DELTA1 = (f(p1) - f(p0))/h1;
      DELTA2 = (f(p2) - f(p1))/h2;
     d = (DELTA2 - DELTA1)/(h2 + h1);
     i = i + 1;
     disp(p) 
     
     %disp([imag(p) t2]) 
     %plot(t2,real(p))
  
end
if i > N0
      formatSpec = string('The method failed after N0 iterations,N0= %d \n');
      fprintf(formatSpec,N0);
  end
 
function y=f(x)
   y=x^2+1 ;
 
   
    
    
end
end