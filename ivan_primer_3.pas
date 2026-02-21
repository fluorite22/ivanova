program ex;
var a,b,c, x1, x2, e, d:real;
begin
  writeln('Введите коэффициенты уравнения');
  Readln(a,b,c);
  d:= b*b - 4*a*c;
  e:= b/(2*a);
  x1:= -e+sqrt(d)/(2*a);
  x2:= -e-sqrt(d)/(2*a);
  Writeln('x1=', x1:6:2, ' x2=', x2:6:2);
end.