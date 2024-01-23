unit unitTEST;

{$mode objfpc}{$H+}

interface


uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

Type arrayString = array [0..5] of string;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonRes: TButton;
    ButtonStart: TButton;
    CheckBox1_g1: TCheckBox;
    CheckBox1_g2: TCheckBox;
    CheckBox2_g2: TCheckBox;
    CheckBox3_g2: TCheckBox;
    CheckBox4_g2: TCheckBox;
    CheckBox5_g1: TCheckBox;
    CheckBox2_g1: TCheckBox;
    CheckBox3_g1: TCheckBox;
    CheckBox4_g1: TCheckBox;
    CheckBox5_g2: TCheckBox;
    CheckGroup1: TCheckGroup;
    CheckGroup2: TCheckGroup;
    EditRes: TEdit;
    LabelName: TLabel;
    RadioButton1_g1: TRadioButton;
    RadioButton5_g2: TRadioButton;
    RadioButton1_g3: TRadioButton;
    RadioButton2_g3: TRadioButton;
    RadioButton3_g3: TRadioButton;
    RadioButton4_g3: TRadioButton;
    RadioButton5_g3: TRadioButton;
    RadioButton2_g1: TRadioButton;
    RadioButton3_g1: TRadioButton;
    RadioButton4_g1: TRadioButton;
    RadioButton5_g1: TRadioButton;
    RadioButton1_g2: TRadioButton;
    RadioButton2_g2: TRadioButton;
    RadioButton3_g2: TRadioButton;
    RadioButton4_g2: TRadioButton;
    Image1: TImage;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    procedure ButtonResClick(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
    procedure randomArr(var aArr: arrayString);





  public

  end;




var
  Form1: TForm1;
  res: real = 0;
  masOfQuastion1, masOfQuastion2, masOfQuastion3, masOfQuastion4, masOfQuastion5: arrayString;
  flag1, flag2, flag3: word;
  flag4, flag5: string;

implementation

{$R *.lfm}


{ TForm1 }



procedure TForm1.ButtonResClick(Sender: TObject);
var tempRes: real;
begin
  res := 0;

  If (RadioButton1_g1.Checked = True) and (flag1 = 1) then
     res := res + 1
  else if (RadioButton2_g1.Checked = True) and (flag1 = 2) then
     res := res + 1
  else if (RadioButton3_g1.Checked = True) and (flag1 = 3) then
     res := res + 1
  else if (RadioButton4_g1.Checked = True) and (flag1 = 4) then
     res := res + 1
  else if (RadioButton5_g1.Checked = True) and (flag1 = 5) then
     res := res + 1;


  If (RadioButton1_g2.Checked = True) and (flag2 = 1) then
     res := res + 1
  else if (RadioButton2_g2.Checked = True) and (flag2 = 2) then
     res := res + 1
  else if (RadioButton3_g2.Checked = True) and (flag2 = 3) then
     res := res + 1
  else if (RadioButton4_g2.Checked = True) and (flag2 = 4) then
     res := res + 1
  else if (RadioButton5_g2.Checked = True) and (flag2 = 5) then
     res := res + 1;



  If (RadioButton1_g3.Checked = True) and (flag3 = 1) then
     res := res + 1
  else if (RadioButton2_g3.Checked = True) and (flag3 = 2) then
     res := res + 1
  else if (RadioButton3_g3.Checked = True) and (flag3 = 3) then
     res := res + 1
  else if (RadioButton4_g3.Checked = True) and (flag3 = 4) then
     res := res + 1
  else if (RadioButton5_g3.Checked = True) and (flag3 = 5) then
     res := res + 1;


  if ((CheckBox1_g1.Checked = True) and (pos(1, flag4) <> 0)) or ((CheckBox1_g1.Checked = false) and (pos(1, flag4) = 0)) then
     if ((CheckBox2_g1.Checked = True) and (pos(2, flag4) <> 0)) or ((CheckBox2_g1.Checked = false) and (pos(2, flag4) = 0)) then
        if ((CheckBox3_g1.Checked = True) and (pos(3, flag4) <> 0)) or ((CheckBox3_g1.Checked = false) and (pos(3, flag4) = 0)) then
           if ((CheckBox4_g1.Checked = True) and (pos(4, flag4) <> 0)) or ((CheckBox4_g1.Checked = false) and (pos(4, flag4) = 0)) then
              if ((CheckBox5_g1.Checked = True) and (pos(5, flag4) <> 0)) or ((CheckBox5_g1.Checked = false) and (pos(5, flag4) = 0)) then
                 res := res + 3;




  if ((CheckBox1_g2.Checked = True) and (pos(1, flag5) <> 0)) or ((CheckBox1_g2.Checked = false) and (pos(1, flag5) = 0)) then
     if ((CheckBox2_g2.Checked = True) and (pos(2, flag5) <> 0)) or ((CheckBox2_g2.Checked = false) and (pos(2, flag5) = 0)) then
        if ((CheckBox3_g2.Checked = True) and (pos(3, flag5) <> 0)) or ((CheckBox3_g2.Checked = false) and (pos(3, flag5) = 0)) then
           if ((CheckBox4_g2.Checked = True) and (pos(4, flag5) <> 0)) or ((CheckBox4_g2.Checked = false) and (pos(4, flag5) = 0)) then
              if ((CheckBox5_g2.Checked = True) and (pos(5, flag5) <> 0)) or ((CheckBox5_g2.Checked = false) and (pos(5, flag5) = 0)) then
                 res := res + 4;


  tempRes := res / 10 * 100;
  EditRes.Text := 'Your score: ' + FloatToStr(tempRes) + '%';
end;

procedure TForm1.randomArr(var aArr: arrayString);
var ran1, ran2, ran3, ran4, ran5, i: word;
    temparr: arrayString;
begin
  ran1 := random(5) + 1;
  temparr[1] := aArr[ran1];

  repeat
     ran2 := random(5) + 1;
  until ran2 <> ran1;
  temparr[2] := aArr[ran2];

  repeat
     ran3 := random(5) + 1;
  until (ran3 <> ran2) and (ran3 <> ran1);
  temparr[3] := aArr[ran3];

  repeat
     ran4 := random(5) + 1;
  until (ran4 <> ran3) and (ran4 <> ran2) and (ran4 <> ran1);
  temparr[4] := aArr[ran4];

  ran5 := 15 - ran1 - ran2 - ran3 - ran4;
  temparr[5] := aArr[ran5];

  for i := 1 to 5 do begin
    aArr[i] := temparr[i];
  end;


end;

procedure TForm1.ButtonStartClick(Sender: TObject);
var i: word;
begin
  flag4 := '';
  flag5 := '';
  masOfQuastion1[0] := 'Multiply 7 and 8';
  masOfQuastion1[1] := '*56';
  masOfQuastion1[2] := '72';
  masOfQuastion1[3] := '42';
  masOfQuastion1[4] := '90';
  masOfQuastion1[5] := '15';

  masOfQuastion2[0] := 'Who is on picture?';
  masOfQuastion2[1] := '*a cow';
  masOfQuastion2[2] := 'a salmon';
  masOfQuastion2[3] := 'a pineapple';
  masOfQuastion2[4] := 'a fly';
  masOfQuastion2[5] := 'a seagull';

  masOfQuastion3[0] := 'Divide 144/12';
  masOfQuastion3[1] := '132';
  masOfQuastion3[2] := '156';
  masOfQuastion3[3] := '1728';
  masOfQuastion3[4] := '*12';
  masOfQuastion3[5] := '14412';

  masOfQuastion4[0] := 'Find strong acids';
  masOfQuastion4[1] := '*HCl';
  masOfQuastion4[2] := '*H2SO4';
  masOfQuastion4[3] := 'H2S';
  masOfQuastion4[4] := '*HI';
  masOfQuastion4[5] := 'H2CO3';

  masOfQuastion5[0] := 'Formula of Power';
  masOfQuastion5[1] := '*U * I';
  masOfQuastion5[2] := '*U^2 / R';
  masOfQuastion5[3] := '*I^2 * R';
  masOfQuastion5[4] := '*A / t';
  masOfQuastion5[5] := 'm * a';



  RadioGroup1.Caption := masOfQuastion1[0];
  randomArr(masOfQuastion1);

  for i := 1 to 5 do begin
    if pos('*', masOfQuastion1[i]) = 1 then begin
       delete(masOfQuastion1[i], 1, 1);
       flag1 := i;
    end;
  end;

  RadioButton1_g1.Caption := masOfQuastion1[1];
  RadioButton2_g1.Caption := masOfQuastion1[2];
  RadioButton3_g1.Caption := masOfQuastion1[3];
  RadioButton4_g1.Caption := masOfQuastion1[4];
  RadioButton5_g1.Caption := masOfQuastion1[5];



  RadioGroup2.Caption := masOfQuastion2[0];
  randomArr(masOfQuastion2);

  for i := 1 to 5 do begin
    if pos('*', masOfQuastion2[i]) = 1 then begin
       delete(masOfQuastion2[i], 1, 1);
       flag2 := i;
    end;
  end;
  RadioButton1_g2.Caption := masOfQuastion2[1];
  RadioButton2_g2.Caption := masOfQuastion2[2];
  RadioButton3_g2.Caption := masOfQuastion2[3];
  RadioButton4_g2.Caption := masOfQuastion2[4];
  RadioButton5_g2.Caption := masOfQuastion2[5];


  RadioGroup3.Caption := masOfQuastion3[0];
  randomArr(masOfQuastion3);

  for i := 1 to 5 do begin
    if pos('*', masOfQuastion3[i]) = 1 then begin
       delete(masOfQuastion3[i], 1, 1);
       flag3 := i;
    end;
  end;

  RadioButton1_g3.Caption := masOfQuastion3[1];
  RadioButton2_g3.Caption := masOfQuastion3[2];
  RadioButton3_g3.Caption := masOfQuastion3[3];
  RadioButton4_g3.Caption := masOfQuastion3[4];
  RadioButton5_g3.Caption := masOfQuastion3[5];

  CheckGroup1.Caption := masOfQuastion4[0];
  randomArr(masOfQuastion4);

  for i := 1 to 5 do begin
    if pos('*', masOfQuastion4[i]) = 1 then begin
       delete(masOfQuastion4[i], 1, 1);
       flag4 := flag4 + FloatToStr(i);
    end;
  end;
  CheckBox1_g1.Caption := masOfQuastion4[1];
  CheckBox2_g1.Caption := masOfQuastion4[2];
  CheckBox3_g1.Caption := masOfQuastion4[3];
  CheckBox4_g1.Caption := masOfQuastion4[4];
  CheckBox5_g1.Caption := masOfQuastion4[5];

  CheckGroup2.Caption := masOfQuastion5[0];
  randomArr(masOfQuastion5);

  for i := 1 to 5 do begin
    if pos('*', masOfQuastion5[i]) = 1 then begin
       delete(masOfQuastion5[i], 1, 1);
       flag5 := flag5 + FloatToStr(i);
    end;
  end;
  CheckBox1_g2.Caption := masOfQuastion5[1];
  CheckBox2_g2.Caption := masOfQuastion5[2];
  CheckBox3_g2.Caption := masOfQuastion5[3];
  CheckBox4_g2.Caption := masOfQuastion5[4];
  CheckBox5_g2.Caption := masOfQuastion5[5];

  Image1.Visible := True;



end;



end.

