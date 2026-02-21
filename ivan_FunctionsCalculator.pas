program FunctionsCalculator;

var
  x, y: real;
  functionCode: integer;
  isValidCode: boolean;

begin
  writeln('Программа вычисления значений функций');
  writeln('=====================================');
  writeln('Доступные функции:');
  writeln('  1 - sin(x)');
  writeln('  2 - cos(x)');
  writeln('  3 - exp(x)');
  writeln;

  // Ввод кода функции
  write('Введите код функции (1-3): ');
  readln(functionCode);
  
  // Ввод аргумента
  write('Введите значение аргумента x: ');
  readln(x);
  
  isValidCode := true; // признак правильности кода
  
  // Вычисление выбранной функции
  case functionCode of
    1: y := sin(x);
    2: y := cos(x);
    3: y := exp(x);
  else
    isValidCode := false; // код не соответствует доступным функциям
  end;
  
  // Вывод результата или сообщения об ошибке
  if isValidCode then
  begin
    writeln;
    writeln('Результат вычисления:');
    writeln('Функция: ', functionCode);
    writeln('x = ', x:12:6);
    writeln('y = ', y:12:6);
  end
  else
  begin
    writeln;
    writeln('Ошибка: введен неверный код функции!');
    writeln('Допустимые значения: 1, 2 или 3.');
  end;
  
  writeln;
  writeln('Нажмите Enter для выхода...');
  readln;
end.