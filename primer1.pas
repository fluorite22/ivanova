program PrintAddress;

var
  city, street: string;
  house, flat: integer;

begin
  Write('Введите город: ');
  Readln(city);
  
  Write('Введите улицу: ');
  Readln(street);
  
  Write('Введите номер дома: ');
  Readln(house);
  
  Write('Введите номер квартиры: ');
  Readln(flat);
  
  Write('Город: ', city);
  Write(' Улица: ', street);
  Write(' Дом: ', house);
  Write(' Квартира: ', flat);
  
  Writeln; // Переход на новую строку
  
  Write('Нажмите Enter для выхода...');
  Readln;
end.