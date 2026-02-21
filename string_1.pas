Program ex;
Var st:string[40];
k:byte; 

Begin
  WriteLn('Введите строку длиной <=40 символов');
  ReadLn(st);
  Write('Введенная строка: ');
  WriteLn(st);
  
  k := pos('  ', st); {проверяем, есть ли сдвоенные пробелы?}
  
  while k <> 0 do {пока есть сдвоенные пробелы}
  begin
    delete(st, k, 1); {удаляем первый пробел}
    k := pos('  ', st); {проверяем, есть ли сдвоенные пробелы?}
  end;
  
  if st[1] = ' ' then delete(st, 1, 1); {удалили пробел в начале}
  
  k := length(st);
  if st[k] = ' ' then delete(st, k, 1); {удалили пробел в конце}
  
  WriteLn('Результат: ');
  
  if length(st) <> 0 then
    WriteLn(st)
  else 
    WriteLn('Строка содержала только пробелы.');
End.