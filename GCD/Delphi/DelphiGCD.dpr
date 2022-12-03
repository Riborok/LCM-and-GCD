Program DelphiGCD;
{find greatest common divisor of two or more numbers}

{$APPTYPE CONSOLE}

uses
  System.SysUtils;

Const
  ExtremePoint = 50;
  //ExtremePoint - last valid amount of numbers.

Var
  Num: array[1..ExtremePoint] of integer;
  i, Amount, a, b, gcd : integer;
  Error : boolean;
  {Num - an array of numbers for which need to find the GCD
   i - cycle counter
   Amount - amount of numbers
   a, b - numbers between which you need to find GCD
   gcd - greatest common divisor of two numbers
   Error - if the user entered for finding GCD 0 then there will be an error}

Begin

  writeln('Enter amount of numbers (must be >=2 and <=',ExtremePoint,')');
  readln(Amount);
  if (Amount<2) or (Amount>50) then
    Writeln('Amount must be >=2 and <=',ExtremePoint,'. Restart the programm')

  else
  begin

    writeln('Enter ', Amount,' numbers (numbers must be >0');

    //Cycle to let user enter all numbers
    for i := 1 to Amount do
    begin

      Write(i,' number = ');
      readln(Num[ i ]);

      //If the user entered for finding LCM <0 then there will be an error
      if Num[i] <= 0 then
        Error:= True;
    end;

    //Checking for an error
    if (Error=True) then
      writeln('Numbers must be <>0. Restart the programm')

    else
    begin

      //For the first iteration, the GCD will be equal to the first number
      gcd:= Num[1];

      //To find the GCD of all numbers, need go to Amount-1
      //Need look for the GCD in stages, by 2 numbers
      for i := 1 to (Amount-1) do
      begin

        //Find the GCD between 2 numbers.
        //The first number is the GCD of the previous numbers,
        //and the second is the next number in the array
        a:= gcd;
        b:= Num[i+1];

        //GCD is found using the Euclid algorithm
        while (a<>0) and (b<>0) do
        begin
          if a > b then
            a:= a mod b
          else
            b:= b mod a;
        end;
        gcd:= a + b;

      end;

      //Write the greatest common divisor
      Writeln('The greatest common divisor numbers is ', gcd);
    end;
  end;

  Readln;
End.
