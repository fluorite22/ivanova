Program ex;
Var 
  a: array[1..10, 1..10] of integer;
  B, max, n, m, k, i, j: integer;
Begin
  WriteLn('Введите размеры матрицы n,m <= 10');
  ReadLn(n, m);
  
  WriteLn('Введите ', n:4, ' строк по ', m:4, ' элементов:');
  for i := 1 to n do 
  begin
    for j := 1 to m do 
      Read(a[i, j]);
    ReadLn;
  end;
  
  WriteLn('Введите значение В:');
  ReadLn(B);
  
  WriteLn('Исходный массив:');
  for i := 1 to n do 
  begin
    for j := 1 to m do 
      Write(a[i, j]:4);
    WriteLn;
  end;
  
  k := 0; {количество остающихся строк}
  
  for i := 1 to n do {цикл по строкам}
  begin
    max := a[i, 1]; {исходное значение максимума строки}
    
    {цикл поиска максимума строки}
    for j := 1 to m do 
      if a[i, j] > max then 
        max := a[i, j];
    
    if max <> B then {если максимум строки не равен В}
    begin {то оставляем строку}
      k := k + 1; {увеличиваем количество остающихся строк}
      
      {копируем строку на новое место}
      for j := 1 to m do 
        a[k, j] := a[i, j];
    end;
  end;
  
  if k <> 0 then {если в матрице осталась хоть одна строка}
  begin
    WriteLn('Сформированная матрица:');
    for i := 1 to k do 
    begin
      for j := 1 to m do 
        Write(a[i, j]:4);
      WriteLn;
    end;
  end
  else
    WriteLn('Все строки матрицы удалены');
End.