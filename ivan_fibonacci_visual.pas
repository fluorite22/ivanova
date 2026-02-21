program FibonacciVisual;
var
  prev1, prev2, current: integer;
  i: integer;
begin
  writeln('ВИЗУАЛИЗАЦИЯ ВЫЧИСЛЕНИЯ ЧИСЕЛ ФИБОНАЧЧИ');
  writeln('======================================');
  writeln;
  writeln('Последовательность Фибоначчи определяется как:');
  writeln('F(1) = 0');
  writeln('F(2) = 1');
  writeln('F(n) = F(n-1) + F(n-2) для n > 2');
  writeln;
  writeln('Вычисление первых 10 чисел:');
  writeln('---------------------------');
  
  prev1 := 0;  // F(1)
  prev2 := 1;  // F(2)
  
  writeln('F(1) = ', prev1);
  writeln('F(2) = ', prev2);
  
  for i := 3 to 10 do
  begin
    current := prev1 + prev2;
    writeln('F(', i, ') = F(', i-1, ') + F(', i-2, ') = ', 
            prev2, ' + ', prev1, ' = ', current);
    
    // Сдвиг значений для следующей итерации
    prev1 := prev2;
    prev2 := current;
  end;
  
  writeln;
  writeln('Последовательность: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34');
  readln;
end.