program ex;

type
  setChar = set of char; { тип "множество символов" }
  str80 = string;        { в PascalABC.NET string не имеет фиксированной длины }
  pTop = ^Top;           { тип "указатель на вершину" }
  
  Top = record           { тип "вершина" }
    oper: string[5];     { знак операции }
    value: real;         { значение константы }
    left, right: pTop;   { указатели на левое и правое поддерево }
  end;

var
  st: str80;             { строка - запись выражения }
  Root: pTop;            { корень дерева выражения }
  key: boolean;          { признак существования значения в заданной точке }
  xn, xe, dx, x, y: real; { начальное, конечное значения и шаг аргумента, значение аргумента и функции }
  n, i: integer;         { количество точек и номер текущей точки }

{ рекурсивная функция конструирования поддерева выражения с корнем r из строки st }
procedure Constr_Tree(r: pTop; st: str80);

var
  po, code: integer;
  st1, str1: str80;
  c: real;
  
  { внутренняя функция поиска разделительного знака в строке st }
  function PosOp(st: str80; ops: setChar): integer;
  var
    i, j, k, p: integer;
  begin
    j := 0; 
    k := 0; 
    p := 0; 
    i := 1;
    while (i <= length(st)) and (p = 0) do 
    begin
      if st[i] = '(' then 
        inc(j)
      else if st[i] = ')' then 
        inc(k)
      else if (j = k) and (st[i] in ops) then 
        p := i;
      inc(i);
    end;
    PosOp := p;
  end;

begin
  po := PosOp(st, ['+', '-']); { ищем разделительный знак операции + или - }
  if po = 0 then 
    po := PosOp(st, ['*', '/']); { ищем разделительный знак операции * или / }
  if po = 0 then 
    po := PosOp(st, ['^']); { ищем разделительный знак операции ^ }
  
  if po <> 0 then { разделяющий знак найден }
  begin
    r^.oper := st[po]; { записываем знак операции в вершину }
    st1 := copy(st, 1, po-1); { копируем подстроку первого операнда }
    
    if (length(st1) > 0) and (st1[1] = '(') and (PosOp(st1, ['*', '/', '+', '-', '^']) = 0) then
      st1 := copy(st1, 2, length(st1)-2); { убираем скобки }
    
    str1 := copy(st, po+1, length(st)-po); { копируем подстроку второго операнда }
    
    if (length(str1) > 0) and (str1[1] = '(') and (PosOp(str1, ['*', '/', '+', '-', '^']) = 0) then
      str1 := copy(str1, 2, length(str1)-2); { убираем скобки }
    
    new(r^.left); { создаем левое поддерево }
    Constr_Tree(r^.left, st1); { конструируем левый операнд }
    
    new(r^.right); { создаем правое поддерево }
    Constr_Tree(r^.right, str1); { конструируем правый операнд }
  end
  else if (length(st) > 0) and (st[1] = 'x') then { аргумент }
  begin
    r^.oper := 'x';
    r^.left := nil; 
    r^.right := nil;
  end
  else
  begin
    val(st, c, code); { пытаемся получить число }
    if code = 0 then { константа }
    begin
      r^.oper := 'o';
      r^.left := nil; 
      r^.right := nil;
      r^.value := c;
    end
    else { функция }
    begin
      po := Pos('(', st);
      if po > 0 then
      begin
        r^.oper := copy(st, 1, po-1); { выделяем имя функции }
        r^.right := nil;
        st1 := copy(st, po+1, length(st)-po-1); { выделяем подстроку параметра }
        new(r^.left);
        Constr_Tree(r^.left, st1); { конструируем параметр }
      end
      else
      begin
        r^.oper := 'error';
        r^.left := nil;
        r^.right := nil;
      end;
    end;
  end;
end;

{ рекурсивное вычисление значения функции: если Key=false, то значение не существует }
function Count(r: pTop; x: real; var key: boolean): real;
var
  s, s1: real;
begin
  if not key then { значение функции не существует }
  begin
    Count := 0;
    exit;
  end;
  
  if r^.oper = 'o' then
    Count := r^.value { константа }
  else if r^.oper = 'x' then
    Count := x { переменная x }
  else
    case r^.oper[1] of
      '+': Count := Count(r^.left, x, key) + Count(r^.right, x, key);
      '-': Count := Count(r^.left, x, key) - Count(r^.right, x, key);
      '*': Count := Count(r^.left, x, key) * Count(r^.right, x, key);
      '/': begin
        s := Count(r^.right, x, key);
        if abs(s) < 1e-10 then { практический ноль }
        begin
          Count := 0;
          key := false;
        end
        else 
          Count := Count(r^.left, x, key) / s;
      end;
      '^': begin
        s := Count(r^.left, x, key);
        s1 := Count(r^.right, x, key);
        if s <> 0 then
          Count := exp(s1 * ln(abs(s)))
        else if s1 = 0 then 
          Count := 1
        else 
          Count := 0;
      end;
      's': Count := sin(Count(r^.left, x, key));
      'c': Count := cos(Count(r^.left, x, key));
    else { неопределенная операция }
      begin
        Count := 0;
        key := false;
      end
    end;
end;

{ основная программа }
begin
  Writeln('Введите выражение (например: sin(x)+2*x^3): ');
  ReadLn(st);
  
  Write('Введите xn, xe, n: ');
  ReadLn(xn, xe, n);
  
  if n <= 1 then
  begin
    Writeln('Ошибка: n должно быть больше 1');
    exit;
  end;
  
  new(Root);
  Constr_Tree(Root, st);
  
  dx := (xe - xn) / (n - 1);
  
  Writeln('   x          y');
  Writeln('-------------------');
  x := xn;
  
  for i := 1 to n do 
  begin
    key := true;
    y := Count(Root, x, key);
    
    if key then
      Writeln(x:8:3, y:15:3)
    else
      Writeln(x:8:3, ' не существует');
      
    x := x + dx;
  end;
end.