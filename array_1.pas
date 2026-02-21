Program ex;
Var 
  a: array[1..10] of integer; 
  kol, i, j, n: integer;
Begin
  WriteLn('Введите количество элементов массива <=10'); 
  ReadLn(n); {вводим количество элементов}
  
  WriteLn('Введите ', n, ' элементов массива:'); 
  for i := 1 to n do 
    Read(a[i]); {вводим массив}
    
  WriteLn('Введенный массив:');
  for i := 1 to n do 
    Write(a[i]:3); 
  WriteLn; {выводим исходный массив} 
    
  kol := 0; {обнуляем количество отрицательных элементов} 
for i := 2 to n do
  if (i mod 2 = 0) and (a[i] < 0) then
    kol := kol + 1;
      
  if kol = 0 then
    WriteLn('Отрицательных элементов на четных местах нет') 
  else
    WriteLn('Количество отрицательных элементов на четных местах kol = ', kol:3);
End.