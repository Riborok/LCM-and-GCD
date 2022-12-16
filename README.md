# LCM and GCD
---
### Task:
![The task](https://i.imgur.com/N0Zlb7W.png)

>Point a) finds GCD, point b) find LCM

#### Language: Delphi

### Algorithm scheme for point a): 

![Algorithm scheme for point a)](https://i.imgur.com/wzEfHVA.png)

### Code for point a):
``` pascal
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
```
---

### Algorithm scheme for point b): 

![Algorithm scheme for point a)](https://i.imgur.com/WafnHBd.png)

### Code for point b):
``` pascal
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
```

