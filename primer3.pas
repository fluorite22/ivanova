program CheckRain;

var
  answer: char;

begin
  Write('Идет ли дождь? (д/н): ');
  Readln(answer);
  
  // Неполный условный оператор
  if (answer = 'д') or (answer = 'Д') or (answer = 'y') or (answer = 'Y') then
    Writeln('А зонта-то у тебя нет!');
  
  Write('Нажмите Enter для выхода...');
  Readln;
end.

