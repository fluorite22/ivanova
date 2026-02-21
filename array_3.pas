Program ex;
Var 
  a, b: array[1..40] of integer; 
  i, k, n: integer;
Begin
  WriteLn('Введите количество элементов массива <= 40'); 
  ReadLn(n);
  
  WriteLn('Введите ', n, ' элементов массива А:'); 
  for i := 1 to n do 
    Read(a[i]);
  ReadLn;
  
  WriteLn('Исходный массив А:'); 
  for i := 1 to n do 
    Write(a[i]:4);
  WriteLn;
  
  k := 0; {начальное значение индекса формируемого массива} 
  for i := 1 to n do
    if a[i] > 0 then {если элемент > 0} 
    begin
      k := k + 1; {изменение индекса формируемого массива} 
      b[k] := a[i]; {перепись найденного элемента} 
    end;
  
  if k = 0 then
    WriteLn('В массиве А нет положительных элементов.')
  else
  begin
    WriteLn('Массив-результат В:'); 
    for i := 1 to k do 
      Write(b[i]:4);
    WriteLn;
  end;
End.