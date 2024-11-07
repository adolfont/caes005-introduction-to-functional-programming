program ExponentCalculation;
uses Math;

function PowerSum(x, y, z: Real): Real;
begin
  PowerSum := Power(x, y + z);
end;

var
  x, y, z, result: Real;

begin
  writeln('Enter values for x, y, and z:');
  readln(x);
  readln(y);
  readln(z);

  result := PowerSum(x, y, z);
  writeln('Result of ', x:0:2, ' ^ (', y:0:2, ' + ', z:0:2, ') is ', result:0:2);
end.
