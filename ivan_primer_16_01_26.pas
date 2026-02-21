program ex;
var x, y: real;
begin
  writeln('Введите значение аргумента');
  readln(x);
  if abs(x)<=1 then y:=abs(x) {первый отрезок}
  else
    if abs(x)<=2 then
      y:= sqr(x) {второй отрезок}
    else y:=4; {третий отрезок}
    writeln('При х=', x:8:5, 'y=', y:8:5);
end.