Program DelphiLCM;
{find LCM of two or more numbers}

{$APPTYPE CONSOLE}

uses
  System.SysUtils;

Const
  ExtremePoint = 50;
  //ExtremePoint - last valid amount of numbers.

Var
  Num: array[1..ExtremePoint] of integer;
  i, Amount, a, b, aRem, bRem, gcd: integer;
  lcm: real;
  Error : boolean;
  {Num - an array of numbers for which need to find the LCM
   i - cycle counter
   Amount - amount of numbers
   a, b - numbers between which you need to find LCM
   aRem, bRem - numbers to find the GCD using the Euclid algorithm
   gcd - greatest common divisor of two numbers (next in array and previous lcm)
   lcm - least common multiple of numbers
   Error - if the user entered for finding LCM 0 then there will be an error}

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
      readln(Num[i]);

      //If the user entered for finding LCM <0 then there will be an error
      if Num[i] <= 0 then
        Error:= True;
    end;

    //Checking for an error
    if (Error=True) then
      writeln('Numbers must be <>0. Restart the programm')

    else
    begin

      //For the first iteration, the LCM will be equal to the first number
      lcm:= Num[1];

      //To find the LCM, need go to Amount-1
      //Need look for the LCM in stages, by 2 numbers
      for i := 1 to (Amount-1) do
      begin

        //Find the LCM between 2 numbers.
        //The first number is the LCM of the previous numbers,
        //and the second is the next number in the array
        a:= Round(lcm);
        b:= Num[i+1];

        //GCD is found using the Euclid algorithm
        aRem:= a;
        bRem:=b;
        while (aRem<>0) and (bRem<>0) do
        begin
          if aRem > bRem then
            aRem:= aRem mod bRem
          else
            bRem:= bRem mod aRem;
        end;
        gcd:= aRem + bRem;

        //Find LCM between 2 numbers using the formula.
        //The first number is the LCM of the previous numbers,
        //multiply by the second, it is the next number in the array,
        //and divide by GCD between these numbers
        lcm:= a/gcd*b;

      end;

      //Write the least common multiple of numbers
      Writeln('Least common multiple of numbers is ', Round(lcm));
    end;
  end;

  Readln;
End.
