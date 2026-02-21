program ex;
var A,B,C,P,S: real;
begin
  write('Введите длины сторон треугольника: ');
  readln(A,B,C);
  if (A<=0)or(B<=0)or(C<=0) then
    Writeln('Числа должны быть положительными')
  else
    if (A+B<=C)or(A+C<=B)or(B+C<=A) then
      Writeln('Треугольник с такими сторонами не существуетю')
  else
  begin
    if(A=B)and(B=C) then
      Writeln('Треугольинк равносторонний')
    else
      if (A=B)or(A=C)or(B=C) then
        Writeln('треугольник равнобедренный,')
      else Writeln('Треугольник разносторонний');
      P:=(A+B+C)/2;
      S:=sqrt(P*(P-A)*(P-B)*(P-C));
      Writeln(' площадь треугольника: ', S:8:2, 'единиц');
      
  end;
end.