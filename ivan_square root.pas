program SqrtVisualization;
var
  A, sum, n, odd_num: integer;
  i: integer;
begin
  writeln('╔══════════════════════════════════════════════════════════╗');
  writeln('║   ВЫЧИСЛЕНИЕ √A (целая часть) через сумму нечетных чисел║');
  writeln('╚══════════════════════════════════════════════════════════╝');
  writeln;
  writeln('Математическое обоснование:');
  writeln('1 = 1²');
  writeln('1 + 3 = 4 = 2²');
  writeln('1 + 3 + 5 = 9 = 3²');
  writeln('1 + 3 + 5 + 7 = 16 = 4²');
  writeln('1 + 3 + 5 + ... + (2n-1) = n²');
  writeln;
  
  { Ввод данных }
  write('Введите число A: ');
  readln(A);
  
  if A < 0 then
  begin
    writeln('Ошибка: квадратный корень из отрицательного числа не определен!');
    readln;
    exit;
  end;
  
  { Алгоритм }
  sum := 0;
  n := 0;
  odd_num := 1;
  
  writeln;
  writeln('╔══════════════════════════════════════════════════════════╗');
  writeln('║                    ПРОЦЕСС ВЫЧИСЛЕНИЯ                   ║');
  writeln('╚══════════════════════════════════════════════════════════╝');
  writeln;
  
  writeln('Начинаем с суммы = 0');
  writeln('Нечетное число = 1');
  writeln;
  
  while true do
  begin
    writeln('----------------------------------------');
    writeln('Проверяем, можно ли добавить ', odd_num, ':');
    writeln('Текущая сумма: ', sum);
    writeln('Будущая сумма: ', sum + odd_num);
    writeln('Число A: ', A);
    
    if sum + odd_num > A then
    begin
      writeln('Стоп! ', sum + odd_num, ' > ', A);
      break;
    end;
    
    { Добавляем нечетное число }
    sum := sum + odd_num;
    n := n + 1;
    
    writeln;
    writeln('Добавляем ', odd_num);
    writeln('Новая сумма: ', sum);
    writeln('n = ', n, ' (так как сумма = ', n, '²)');
    writeln;
    
    { Вывод текущей формулы }
    write('Формула: 1');
    for i := 3 to odd_num do
      if i mod 2 = 1 then
        write(' + ', i);
    writeln(' = ', sum, ' = ', n, '²');
    
    { Следующее нечетное число }
    odd_num := odd_num + 2;
    
    { Пауза для наглядности }
    writeln('Нажмите Enter для продолжения...');
    readln;
  end;
  
  { Результат }
  writeln;
  writeln('╔══════════════════════════════════════════════════════════╗');
  writeln('║                        РЕЗУЛЬТАТ                        ║');
  writeln('╚══════════════════════════════════════════════════════════╝');
  writeln;
  writeln('√', A, ' (целая часть) = ', n);
  writeln;
  writeln('Объяснение:');
  writeln('Мы сложили первые ', n, ' нечетных чисел:');
  
  { Вывод формулы }
  if n > 0 then
  begin
    write('1');
    for i := 1 to n-1 do
      write(' + ', 2*i + 1);
    writeln(' = ', n, '² = ', sum, ' ≤ ', A);
  end;
  
  writeln('Следующая сумма была бы: ', sum + odd_num, ' = ', n+1, '² > ', A);
  writeln;
  writeln('Следовательно: ', n, ' ≤ √', A, ' < ', n+1);
  
  readln;
end.