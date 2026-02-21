program ComparePlots;

var
  // Первый участок
  A1, B1, Length1, Width1: real;
  Area1: real;
  
  // Второй участок
  A2, B2, Length2, Width2: real;
  Area2: real;
  
  // Временные переменные
  temp: real;

begin
  // Ввод данных для первого участка
  writeln('Введите стороны первого участка:');
  write('A1 = ');
  readln(A1);
  write('B1 = ');
  readln(B1);
  
  // Ввод данных для второго участка
  writeln('Введите стороны второго участка:');
  write('A2 = ');
  readln(A2);
  write('B2 = ');
  readln(B2);
  
  // Вычисляем площади
  Area1 := A1 * B1;
  Area2 := A2 * B2;
  
  // Для первого участка: определяем длину и ширину (длина ≥ ширина)
  if A1 >= B1 then
  begin
    Length1 := A1;
    Width1 := B1;
  end
  else
  begin
    Length1 := B1;
    Width1 := A1;
  end;
  
  // Для второго участка: определяем длину и ширину (длина ≥ ширина)
  if A2 >= B2 then
  begin
    Length2 := A2;
    Width2 := B2;
  end
  else
  begin
    Length2 := B2;
    Width2 := A2;
  end;
  
  // Выводим информацию об участках
  writeln;
  writeln('Первый участок:');
  writeln('  Длина: ', Length1:0:2, ', Ширина: ', Width1:0:2);
  writeln('  Площадь: ', Area1:0:2);
  
  writeln('Второй участок:');
  writeln('  Длина: ', Length2:0:2, ', Ширина: ', Width2:0:2);
  writeln('  Площадь: ', Area2:0:2);
  
  writeln;
  
  // Сравниваем площади и выводим результат
  if Area1 > Area2 then
  begin
    writeln('Первый участок больше по площади.');
    writeln('Его размеры: Длина = ', Length1:0:2, ', Ширина = ', Width1:0:2);
  end
  else if Area2 > Area1 then
  begin
    writeln('Второй участок больше по площади.');
    writeln('Его размеры: Длина = ', Length2:0:2, ', Ширина = ', Width2:0:2);
  end
  else
  begin
    writeln('Участки равны по площади.');
    writeln('Размеры первого: Длина = ', Length1:0:2, ', Ширина = ', Width1:0:2);
    writeln('Размеры второго: Длина = ', Length2:0:2, ', Ширина = ', Width2:0:2);
  end;
end.