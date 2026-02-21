program ex_large_mas;

uses
  System;

const
  nn = 16000; // максимальное количество строк

var
  n, m: integer;
  s: real;
  matrix: array of array of real; // динамический массив вместо указателей
  i, j: integer;
  totalElements: int64;

begin
  Randomize;
  
  try
    WriteLn('Введите размеры матрицы (n x m)');
    Write('n (количество строк, не более ', nn, ') = ');
    ReadLn(n);
    Write('m (количество столбцов) = ');
    ReadLn(m);
    
    // Проверка корректности введенных данных
    if (n <= 0) or (m <= 0) then
    begin
      WriteLn('Ошибка: размеры матрицы должны быть положительными числами!');
      Exit;
    end;
    
    if n > nn then
    begin
      WriteLn('Ошибка: количество строк не может превышать ', nn, '!');
      Exit;
    end;
    
    // Выделение памяти под матрицу
    WriteLn('Выделение памяти для матрицы ', n, 'x', m, '...');
    SetLength(matrix, n, m);
    WriteLn('Память успешно выделена!');
    
    // Инициализация матрицы случайными значениями
    Write('Заполнение матрицы случайными значениями... ');
    for i := 0 to n - 1 do
      for j := 0 to m - 1 do
        matrix[i, j] := Random * 100;
    WriteLn('Готово!');
    
    // Вычисление суммы всех элементов
    Write('Вычисление суммы элементов... ');
    s := 0;
    totalElements := n * m;
    
    for i := 0 to n - 1 do
      for j := 0 to m - 1 do
        s := s + matrix[i, j];
    
    WriteLn('Готово!');
    WriteLn;
    
    // Вывод результатов
    WriteLn('=== РЕЗУЛЬТАТЫ ===');
    WriteLn('Размер матрицы: ', n, ' x ', m);
    WriteLn('Всего элементов: ', totalElements);
    WriteLn('Сумма всех элементов: ', s:0:10);
    WriteLn('Среднее значение: ', (s / totalElements):0:10);
    
    // Дополнительная статистика
    if totalElements > 0 then
    begin
      // Находим минимальное и максимальное значения
      var minVal := matrix[0, 0];
      var maxVal := matrix[0, 0];
      
      for i := 0 to n - 1 do
        for j := 0 to m - 1 do
        begin
          if matrix[i, j] < minVal then minVal := matrix[i, j];
          if matrix[i, j] > maxVal then maxVal := matrix[i, j];
        end;
      
      WriteLn('Минимальное значение: ', minVal:0:4);
      WriteLn('Максимальное значение: ', maxVal:0:4);
      WriteLn('Размах значений: ', (maxVal - minVal):0:4);
    end;
    
    // Память освобождается автоматически при выходе из блока
    WriteLn;
    WriteLn('Память будет автоматически освобождена.');
    
  except
    on e: OutOfMemoryException do
      WriteLn('Ошибка: Не хватает памяти для создания матрицы такого размера!');
    on e: Exception do
      WriteLn('Произошла ошибка: ', e.Message);
  end;
  
  WriteLn('Программа завершена. Нажмите Enter для выхода...');
  ReadLn;
end.