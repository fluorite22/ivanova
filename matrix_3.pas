Program ex;
Var 
  a: array[1..15, 1..15] of integer;
  s, n, p, k, i, j: integer;
Begin
  WriteLn('Введите размер матрицы n <= 15'); 
  ReadLn(n);
  
  WriteLn('Введите ', n, ' строк(и) по ', n, ' элемента(ов):');
  for i := 1 to n do 
    for j := 1 to n do 
      Read(a[i, j]);
  ReadLn;
  
  WriteLn('Введите индексы элемента p, k (1..', n, '):');
  ReadLn(p, k);
  
  {Проверка корректности введенных индексов}
  if (p < 1) or (p > n) or (k < 1) or (k > n) then
  begin
    WriteLn('Ошибка: индексы должны быть в диапазоне 1..', n);
    Exit;
  end;
  
  WriteLn('Исходный массив:');
  for i := 1 to n do 
  begin
    for j := 1 to n do 
      Write(a[i, j]:4);
    WriteLn;
  end;
  
  s := 0;
  
  {Суммируем все элементы, кроме строки p и столбца k}
  for i := 1 to n do 
  begin
    if i = p then continue; {пропускаем строку p}
    
    for j := 1 to n do 
    begin
      if j = k then continue; {пропускаем столбец k}
      s := s + a[i, j];
    end;
  end;
  
  WriteLn('Сумма элементов (без строки ', p, ' и столбца ', k, ') равна ', s);
End.