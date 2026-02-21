Program ex;
Var 
  MasStr: array[1..100] of string[22];
  n, k, l: integer; 
  st: string[22]; 
  key: boolean;
Begin
  n := 1;
  WriteLn('Введите до 100 строк. Завершение ввода - пустая строка'); 
  ReadLn(MasStr[n]); 
  
  while (MasStr[n] <> '') and (n < 100) do 
  begin 
    n := n + 1;
    ReadLn(MasStr[n]);
  end;
  
  if MasStr[n] = '' then 
    n := n - 1; {если последняя строка пустая, уменьшаем счетчик}
  
  {Сортировка массива для бинарного поиска}
  for i := 1 to n-1 do
    for j := i+1 to n do
      if MasStr[i] > MasStr[j] then
      begin
        temp := MasStr[i];
        MasStr[i] := MasStr[j];
        MasStr[j] := temp;
      end;
  
  WriteLn('Введите строку для поиска:');
  ReadLn(st); 
  k := 1; 
  key := false;
  
  while (n - k >= 0) and not key do {пока диапазон положителен и запись не найдена}
  begin
    l := (n - k) div 2 + k; {определяем среднее значение индекса} 
    if st = MasStr[l] then 
      key := true {запись найдена} 
    else {уменьшаем диапазон индексов}
      if st > MasStr[l] then 
        k := l + 1 {смещаем левую границу}
      else 
        n := l - 1; {смещаем правую границу}
  end;
  
  if key then
    WriteLn('Строка найдена. Номер равен ', l)
  else 
    WriteLn('Строка не найдена.');
End.