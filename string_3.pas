Program Stroka;
Var 
  n: byte; 
  s, s1, s2: string;
Begin
  WriteLn('Введите исходную строку:');
  ReadLn(s);
  WriteLn('Введите заменяемое слово:');
  ReadLn(s1);
  WriteLn('Введите заменяющее слово:');
  ReadLn(s2);
  
  n := Pos(s1, s); {определяем вхождение заменяемого сочетания}
  
  while n > 0 do 
  begin
    Delete(s, n, Length(s1)); {удаляем заменяемое сочетание}
    Insert(s2, s, n); {вставляем заменяющее сочетание}
    n := Pos(s1, s); {определяем следующее вхождение}
  end;
  
  WriteLn('Результат: ', s);
  ReadLn;
End.