Program ex;
Var 
  a: array[1..10] of integer;
  B, i, k, n: integer;
Begin
  WriteLn('Введите количество элементов n <= 10');
  ReadLn(n);
  
  WriteLn('Введите ', n, ' элементов массива:'); 
  for i := 1 to n do 
    Read(a[i]);
  ReadLn; {вводим массив}
  
  WriteLn('Введите B:');
  ReadLn(B); {вводим B}
  
  WriteLn('Исходный массив:'); 
  for i := 1 to n do 
    Write(a[i]:5);
  WriteLn; {выводим исходный массив}
  
  k := 0; {количество элементов в результирующем массиве}
  
  {Формирование нового массива: оставляем только элементы >= B}
  for i := 1 to n do 
  begin
    if a[i] >= B then {если элемент удовлетворяет условию}
    begin
      k := k + 1; {увеличиваем счетчик}
      a[k] := a[i]; {записываем элемент в новую позицию}
    end
  end;
  
  if k = 0 then 
    WriteLn('Все элементы вычеркнуты. Массив пуст.') 
  else
  begin
    WriteLn('Результирующий массив из ', k, ' элементов:');
    for i := 1 to k do 
      Write(a[i]:5);
    WriteLn;
  end;
End.