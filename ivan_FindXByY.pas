program FindXByY_Algorithm;
uses Math;
var
  y_target, epsilon, x1, x2, xt, y_calc: real;
  iteration_count: integer;

{ Функция: y = ((x+1)^2 - 1)/x }
{ Упрощается до: y = x + 2 при x ≠ 0 }
function f(x: real): real;
begin
  if abs(x) < 1e-15 then // Защита от деления на 0
  begin
    if x >= 0 then
      f := 1e308 // Большое положительное число
    else
      f := -1e308; // Большое отрицательное число
  end
  else
    f := ((x + 1) * (x + 1) - 1) / x;
end;

begin
  writeln('=============================================');
  writeln('  ПОИСК X ПО ЗАДАННОМУ Y (метод бисекции)');
  writeln('  Функция: y = ((x+1)^2 - 1)/x');
  writeln('=============================================');
  writeln;
  
  { Ввод данных согласно алгоритму }
  write('Введите значение y: ');
  readln(y_target);
  
  write('Введите точность eps: ');
  readln(epsilon);
  
  { Инициализация согласно алгоритму }
  x1 := 1;
  x2 := 1;
  iteration_count := 0;
  
  writeln;
  writeln('ШАГ 1: Находим x1 такое, что f(x1) <= y');
  writeln('----------------------------------------');
  
  { Находим x1: f(x1) > y, поэтому уменьшаем x1 }
  while f(x1) > y_target do
  begin
    writeln('x1 = ', x1:0:10, ', f(x1) = ', f(x1):0:10, ' > ', y_target:0:10);
    x1 := x1 / 2;
    iteration_count := iteration_count + 1;
    
    { Защита от бесконечного цикла }
    if iteration_count > 100 then
    begin
      writeln('Предупреждение: достигнут предел итераций при поиске x1');
      break;
    end;
  end;
  
  writeln('Найдено: x1 = ', x1:0:10, ', f(x1) = ', f(x1):0:10);
  
  writeln;
  writeln('ШАГ 2: Находим x2 такое, что f(x2) >= y');
  writeln('----------------------------------------');
  
  iteration_count := 0;
  
  { Находим x2: f(x2) < y, поэтому уменьшаем x2 }
  while f(x2) < y_target do
  begin
    writeln('x2 = ', x2:0:10, ', f(x2) = ', f(x2):0:10, ' < ', y_target:0:10);
    x2 := x2 / 2;
    iteration_count := iteration_count + 1;
    
    { Защита от бесконечного цикла }
    if iteration_count > 100 then
    begin
      writeln('Предупреждение: достигнут предел итераций при поиске x2');
      break;
    end;
  end;
  
  writeln('Найдено: x2 = ', x2:0:10, ', f(x2) = ', f(x2):0:10);
  
  { Проверка: x1 должно быть меньше x2 и f(x1) <= y <= f(x2) }
  if x1 > x2 then
  begin
    { Меняем местами, чтобы x1 < x2 }
    xt := x1;
    x1 := x2;
    x2 := xt;
  end;
  
  writeln;
  writeln('ШАГ 3: Уточнение решения методом бисекции');
  writeln('----------------------------------------');
  writeln('Начальный интервал: [', x1:0:10, ', ', x2:0:10, ']');
  writeln('f(x1) = ', f(x1):0:10, ', f(x2) = ', f(x2):0:10);
  writeln('Целевое y = ', y_target:0:10);
  
  iteration_count := 0;
  
  { Метод бисекции согласно алгоритму }
  while (x2 - x1) > epsilon do
  begin
    iteration_count := iteration_count + 1;
    xt := (x1 + x2) / 2;
    y_calc := f(xt);
    
    writeln('Итерация ', iteration_count:3, ':');
    writeln('  x1 = ', x1:0:10, ', x2 = ', x2:0:10);
    writeln('  xt = ', xt:0:10, ', f(xt) = ', y_calc:0:10);
    
    if y_calc > y_target then
    begin
      x2 := xt;
      writeln('  f(xt) > y, поэтому новый x2 = ', x2:0:10);
    end
    else
    begin
      x1 := xt;
      writeln('  f(xt) <= y, поэтому новый x1 = ', x1:0:10);
    end;
    
    writeln('  Текущая длина интервала: ', (x2 - x1):0:10);
    
    { Защита от бесконечного цикла }
    if iteration_count > 1000 then
    begin
      writeln('Предупреждение: достигнут предел итераций в методе бисекции');
      break;
    end;
  end;
  
  { Финальное значение xt }
  xt := (x1 + x2) / 2;
  y_calc := f(xt);
  
  writeln;
  writeln('=============================================');
  writeln('               РЕЗУЛЬТАТЫ');
  writeln('=============================================');
  writeln('Найденное значение x: ', xt:0:10);
  writeln('Значение функции в найденной точке: ', y_calc:0:10);
  writeln('Целевое значение y: ', y_target:0:10);
  writeln('Погрешность по y: ', abs(y_calc - y_target):0:10);
  writeln('Длина конечного интервала: ', (x2 - x1):0:10);
  writeln('Количество итераций в методе бисекции: ', iteration_count);
  
  { Аналитическое решение для сравнения }
  writeln;
  writeln('Для сравнения (аналитическое решение):');
  writeln('y = ((x+1)^2 - 1)/x = x + 2  (при x ≠ 0)');
  writeln('Следовательно: x = y - 2');
  writeln('Аналитическое решение: x = ', (y_target - 2):0:10);
  
  { Проверка }
  if abs(xt - (y_target - 2)) > 10 * epsilon then
    writeln('Внимание: численное решение значительно отличается от аналитического!')
  else
    writeln('Численное решение близко к аналитическому.');
  
  readln;
end.