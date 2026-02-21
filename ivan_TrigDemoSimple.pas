program TrigDemoSimple;
uses Math;
var
  x: real;
begin
  writeln('ДЕМОНСТРАЦИЯ: sin²(x) + cos²(x) ≡ 1');
  writeln('===================================');
  writeln;
  
  writeln('Проверим для нескольких значений:');
  writeln;
  writeln('x (рад)     sin(x)      cos(x)      sin²(x)     cos²(x)     Сумма');
  writeln('────────── ─────────── ─────────── ─────────── ─────────── ───────');
  
  { Проверяем для нескольких значений }
  x := 0;
  while x <= 2*Pi do
  begin
    writeln(x:6:4, '    ', 
            sin(x):10:8, ' ', 
            cos(x):10:8, ' ', 
            sqr(sin(x)):10:8, ' ', 
            sqr(cos(x)):10:8, ' ', 
            (sqr(sin(x)) + sqr(cos(x))):10:8);
    
    x := x + Pi/4;  { Увеличиваем на π/4 }
  end;
  
  writeln;
  writeln('Проверим также для некоторых особых случаев:');
  writeln;
  
  { Особые случаи }
  const cases: array[1..6] of string = 
    ('x = π/2', 'x = π', 'x = 3π/2', 'x = 2π', 'x = 1000', 'x = 0.0001');
  const values: array[1..6] of real = 
    (Pi/2, Pi, 3*Pi/2, 2*Pi, 1000, 0.0001);
  
  for var i := 1 to 6 do
  begin
    x := values[i];
    writeln(cases[i]:10, ': sin²+cos² = ', 
            (sqr(sin(x)) + sqr(cos(x))):0:15);
  end;
  
  readln;
end.