program BrickPassesKnown;

var
  A, B: real;    // Стороны отверстия (A < B)
  X, Y, Z: real; // Ребра кирпича (X < Y < Z)

begin
  // Ввод размеров отверстия
  writeln('Введите размеры прямоугольного отверстия (A < B):');
  repeat
    write('A = ');
    readln(A);
    write('B = ');
    readln(B);
    if A >= B then
      writeln('Ошибка: A должно быть меньше B. Повторите ввод.');
  until A < B;
  
  // Ввод размеров кирпича
  writeln('Введите размеры кирпича (X < Y < Z):');
  repeat
    write('X = ');
    readln(X);
    write('Y = ');
    readln(Y);
    write('Z = ');
    readln(Z);
    if (X >= Y) or (Y >= Z) then
      writeln('Ошибка: должно выполняться X < Y < Z. Повторите ввод.');
  until (X < Y) and (Y < Z);
  
  // Проверка возможности прохождения кирпича
  // Кипич пройдет, если две меньшие стороны (X и Y) поместятся в отверстие
  if (X <= A) and (Y <= B) then
    writeln('Кирпич ПРОЙДЕТ в отверстие')
  else
    writeln('Кирпич НЕ ПРОЙДЕТ в отверстие');
end.