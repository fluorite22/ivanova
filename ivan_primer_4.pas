program ex;
var y, y1, y2, y3, y4, y5, y6, p:real;

begin
  y:=1;
  y1:= y/3;
  WriteLn('y1=', y1:16:14);
  y2:= sqrt(y1);
  y3:= sqrt(y2);
  y4:= y3/14;
  y5:= y4*14;
  y6:= y5*3;
  WriteLn('y6=', y6:16:14);
  WriteLn('y =', y:16:14);
end.