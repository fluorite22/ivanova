Program ex;
Var 
  st: string; 
  key: boolean; 
  i: integer;
Begin
  WriteLn('Введите строку:');
  ReadLn(st);
  
  if (st[1] in ['A'..'Z', 'a'..'z']) then {проверка первого символа} 
  begin 
    i := 2;
    key := true;
    
    while (i <= length(st)) and key do {проверка остальных символов} 
      if st[i] in ['A'..'Z', 'a'..'z', '0'..'9', '_'] then 
        inc(i)
      else 
        key := false;
    
    if key then 
      WriteLn('Строка "', st, '" - идентификатор.')
    else 
      WriteLn('Строка "', st, '" содержит недопустимые символы.');
  end 
  else
    WriteLn('Строка "', st, '" начинается с недопустимого символа.');
End.