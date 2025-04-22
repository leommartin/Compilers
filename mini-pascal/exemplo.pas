program exemplo;

var
  x, y: integer;
  z: real;

function soma(a, b: integer): integer;
begin
  soma := a + b; // verificar depois sem o ;
end;

begin
  x := 10;
  y := 20;
  if x > y then
    z := x / y
  else
    z := y / x;
end.
