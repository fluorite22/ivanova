program CoinToss;

var
  M1, M2, M3: Boolean;
  Expression1, Expression2, Expression3, Expression4, Expression5: Boolean;

begin
  // Ввод данных (в данном примере зададим значения)
  M1 := True;   // TRUE - орёл, FALSE - решка
  M2 := False;
  M3 := False;

  // Вычисление выражений
  Expression1 := M1 and M2 and M3;
  Expression2 := not M1 and not M2 and not M3;
  Expression3 := (M1 = M2) and (M2 = M3);
  Expression4 := not M1 and M2 and M3;
  Expression5 := M1 and (M2 = M3);

  // Вывод результатов
  writeln('M1 = ', M1, ', M2 = ', M2, ', M3 = ', M3);
  writeln('1. Все орлы: ', Expression1);
  writeln('2. Все решки: ', Expression2);
  writeln('3. Все одинаково: ', Expression3);
  writeln('4. Первая решка, остальные орлы: ', Expression4);
  writeln('5. Первая орёл, остальные одинаково: ', Expression5);
end.