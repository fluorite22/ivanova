program BrickPassesGeneral;

var
  A, B: real;           // Стороны отверстия
  X, Y, Z: real;        // Ребра кирпича
  HoleMin, HoleMax: real;  // Меньшая и большая стороны отверстия
  BrickMin, BrickMid, BrickMax: real;  // Упорядоченные стороны кирпича
  temp: real;           // Временная переменная для сортировки

begin
  // Ввод размеров отверстия
  writeln('Введите размеры прямоугольного отверстия:');
  write('Сторона 1 = ');
  readln(A);
  write('Сторона 2 = ');
  readln(B);
  
  // Определяем меньшую и большую стороны отверстия
  if A < B then
  begin
    HoleMin := A;
    HoleMax := B;
  end
  else
  begin
    HoleMin := B;
    HoleMax := A;
  end;
  
  // Ввод размеров кирпича
  writeln('Введите размеры кирпича:');
  write('Ребро 1 = ');
  readln(X);
  write('Ребро 2 = ');
  readln(Y);
  write('Ребро 3 = ');
  readln(Z);
  
  // Сортируем стороны кирпича по возрастанию (пузырьковая сортировка)
  BrickMin := X;
  BrickMid := Y;
  BrickMax := Z;
  
  // Сначала находим минимальное
  if BrickMin > BrickMid then
  begin
    temp := BrickMin;
    BrickMin := BrickMid;
    BrickMid := temp;
  end;
  
  if BrickMin > BrickMax then
  begin
    temp := BrickMin;
    BrickMin := BrickMax;
    BrickMax := temp;
  end;
  
  // Теперь находим среднее
  if BrickMid > BrickMax then
  begin
    temp := BrickMid;
    BrickMid := BrickMax;
    BrickMax := temp;
  end;
  
  // Теперь BrickMin ≤ BrickMid ≤ BrickMax
  
  // Вывод упорядоченных размеров (опционально)
  writeln('Упорядоченные размеры отверстия: ', HoleMin:0:2, ' x ', HoleMax:0:2);
  writeln('Упорядоченные размеры кирпича: ', BrickMin:0:2, ' ≤ ', 
          BrickMid:0:2, ' ≤ ', BrickMax:0:2);
  
  // Проверка возможности прохождения кирпича
  // Кипич пройдет, если две меньшие стороны кирпича поместятся в отверстие
  if (BrickMin <= HoleMin) and (BrickMid <= HoleMax) then
    writeln('Кирпич ПРОЙДЕТ в отверстие')
  else
    writeln('Кирпич НЕ ПРОЙДЕТ в отверстие');
end.