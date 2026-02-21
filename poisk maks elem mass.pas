Program ex;
Var 
  a: array[1..5] of real; 
  amax: real; 
  i, imax: byte;
Begin
  {запрос на ввод массива}
  WriteLn('Введите 5 чисел:');
  
  {ввод элементов массива}
  for i := 1 to 5 do 
    Read(a[i]);
  ReadLn;
  
  {поиск максимального элемента}
  amax := a[1]; 
  imax := 1; 
  for i := 2 to 5 do 
    if a[i] > amax then 
    begin
      amax := a[i];
      imax := i;
    end;
  
  {вывод массива}
  WriteLn('Исходные данные:'); 
  for i := 1 to 5 do 
    Write(a[i]:7:2, ' ');
  WriteLn;
  
  {вывод результата}
  WriteLn('Максимальный элемент равен ', amax:5:2, ', его номер равен ', imax);
End.