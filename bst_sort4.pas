Program Sort4;

Type 
  topjptr = ^top; { тип "указатель на вершину дерева" }
  top = record { тип вершины дерева }
    value: integer; { целое число }
    left, right: topjptr; { указатели на левое и правое поддеревья }
  end;

Var 
  next_number: integer;
  r, pass: topjptr; { корень бинарного дерева }

{ процедура добавления вершины к дереву }
Procedure Add(Var r: topjptr; pass: topjptr);
begin
  if r = nil then 
    r := pass { если место свободно, то добавляем }
  else { иначе идем налево или направо }
    if (pass^.value < r^.value) then 
      Add(r^.left, pass)
    else 
      Add(r^.right, pass);
end;

{ процедура сортировки - обход дерева }
procedure Tree(r: topjptr);
begin
  if r <> nil then
  begin { если есть поддерево }
    Tree(r^.left);    { обход левого поддерева }
    Write(r^.value:4); { вывод значения из корня }
    Tree(r^.right);   { обход правого поддерева }
  end;
end;

{ основная программа }
begin
  { формирование исходного дерева }
  WriteLn('Вводите числа:');
  r := nil;
  
  while not EOF do 
  begin
    Read(next_number);
    new(pass); { выделяем память для нового элемента }
    
    { заносим значения }
    pass^.value := next_number;
    pass^.left := nil;
    pass^.right := nil;
    
    Add(r, pass); { добавляем элемент к дереву }
  end;
  
  WriteLn;
  WriteLn('Сортированная последовательность:');
  Tree(r);
  WriteLn;
end.