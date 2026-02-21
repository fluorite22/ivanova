Program ex;
Var 
  n: longint; 
  st: string;
  mnoj: set of '0'..'9';
  i: integer; 
  j: char;
Begin
  WriteLn('Введите число:');
  ReadLn(n);
  
  Str(abs(n), st);
  
  mnoj := []; {в исходном состоянии множество пусто} 
  
  for i := 1 to length(st) do
    mnoj := mnoj + [st[i]]; {формируем множество}
  
  WriteLn('Запись числа ', n, ' содержит следующие цифры:');
  
  for j := '0' to '9' do {выводим цифры, вошедшие во множество}
    if j in mnoj then 
      Write(j, ' ');
  
  WriteLn; {переход на новую строку после вывода цифр}
End.