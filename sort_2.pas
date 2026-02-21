Program sortl;
Var 
  a: array[1..20] of real; 
  j, i, n, imin: integer; 
  min: real;
Begin
  Writeln('Введите количество чисел n <= 20:');
  Readln(n);
  
  Writeln('Введите массив:');
  for i := 1 to n do 
    Read(a[i]);
  Readln;
  
  for j := 1 to n-1 do {цикл поиска минимальных элементов массива}
  begin
    min := a[j]; {начальное значение для поиска минимума}
    imin := j; {начальное значение индекса минимального элемента}
    
    for i := j+1 to n do {цикл поиска минимума и его индекса}
      if a[i] < min then {если элемент меньше уже найденного минимального}
      begin
        min := a[i]; {запоминаем элемент}
        imin := i; {запоминаем его индекс}
      end;
    
    {меняем местами найденный минимум и первый элемент текущего массива}
    a[imin] := a[j];
    a[j] := min;
  end;
  
  Writeln('Отсортированный массив:');
  for i := 1 to n do 
    Write(a[i]:6:2);
  Writeln;
End.