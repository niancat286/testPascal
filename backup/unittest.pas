unit unitTEST;

{$mode objfpc}{$H+}

interface


uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

Type TQuestion = record
       Multtype: boolean;
       questImage: Ansistring;
       masOfQuestion: array [-1..4] of ansistring;  //all question = question[-1] + 5 variants [0..4]
       masofAns: array [0..4] of ansistring;       //correct answers positions
     end;
     TarrQ = array [0..100] of TQuestion;



  { TForm1 }

  TForm1 = class(TForm)
    ButtonLoad: TButton;
    ButtonStart: TButton;
    CheckGroup1: TCheckGroup;
    EditRes: TEdit;
    LabelName: TLabel;
    OpenDialog1: TOpenDialog;
    Image1: TImage;
    RadioGroup1: TRadioGroup;
    procedure ButtonLoadClick(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
    procedure SwapStr(var aArr: string; var aBrr: string);
    procedure SwapTQuest(var aArr: TQuestion; var aBrr: TQuestion);
    procedure randomQuestionArr(var aArr: array of string);
    procedure randomQuestions(var aArr: array of TQuestion);
    procedure GeneratingAns(num: word);
    function Ans_Check(Question: TQuestion): byte;
    procedure LoadData();
    procedure InitFormItems();
    procedure FinishForm();










  public

  end;




var
  Form1: TForm1;
  res: real = 0;
  maxres: real;
  numQuest: word;
  fin: text;
  curnum: word = 0;
  startflag: boolean = false;

  arr: TarrQ;


implementation

{$R *.lfm}


{ TForm1 }






procedure TForm1.ButtonLoadClick(Sender: TObject);
begin
   OpenDialog1.Execute;
   ButtonStart.Visible := True;
end;





procedure TForm1.SwapStr(var aArr: string; var aBrr: string);
var temp: string;
begin
  temp := aArr;
  aArr := aBrr;
  aBrr := temp;
end;




procedure TForm1.SwapTQuest(var aArr: TQuestion; var aBrr: TQuestion);
var temp: TQuestion;
begin
  temp := aArr;
  aArr := aBrr;
  aBrr := temp;
end;




procedure TForm1.randomQuestionArr(var aArr: array of string);
var i, temp: word;
begin
  for i := 0 to numQuest do begin
     temp := random(numQuest);
     swapStr(aArr[i], aArr[temp]);
  end;

end;


procedure TForm1.randomQuestions(var aArr: array of TQuestion);
var i: word;
begin
  for i := 0 to (numQuest-1) do begin
     SwapTQuest(aArr[i], aArr[random(numQuest)]);
  end;

end;



procedure TForm1.GeneratingAns(num: word);
var i: word;
begin
   InitFormItems();
   //randomQuestionArr(arr[num].masOfQuestion);

   if arr[num].Multtype then
      CheckGroup1.Visible := true
   else
       RadioGroup1.Visible := true;

   if not(arr[num].Multtype) then begin
      for i := 0 to 4 do begin

           if pos('*', arr[num].masOfQuestion[i]) = 1 then begin
             arr[num].masOfAns[i] := '1';
             delete(arr[num].masOfQuestion[i], 1, 1);
             end;

           Form1.RadioGroup1.Items.Add(arr[num].masOfQuestion[i]);

      end;
      Form1.RadioGroup1.Caption := arr[num].masOfQuestion[-1];

      Form1.RadioGroup1.Visible := True;
   end
   else begin
       for i := 0 to 4 do begin

         if pos('*', arr[num].masOfQuestion[i]) = 1 then begin
           arr[num].masOfAns[i] := '1';
           delete(arr[num].masOfQuestion[i], 1, 1);
         end;

         Form1.CheckGroup1.Items.Add(arr[num].masOfQuestion[i]);
       end;

       Form1.CheckGroup1.Caption := arr[num].masOfQuestion[-1];
       Form1.CheckGroup1.Visible := True;

   end;
   if arr[num].questImage <> 'None' then begin
        //Form1.Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + arr[num].questImage);
        //picture breaks my MacBook((
        Form1.Image1.Visible := True;
   end
   else
       Form1.Image1.Visible := False;



end;


function TForm1.Ans_Check(Question: TQuestion): byte;
var i, tempres: byte;
begin
   tempres := 0;
   if not Question.Multtype then begin
      for i := 0 to 4 do begin
          if RadioGroup1.ItemIndex <> -1 then begin
             if Question.masOfAns[i] = '1' then
                inc(tempres);
          end;
      end;
   end
   else begin
        for i := 0 to 4 do begin
            if CheckGroup1.Checked[i] then begin
               if Question.masOfAns[i] = '1' then
                  inc(tempres)
               else
                   tempres := 0;
            end;
        end;
   end;
   Ans_Check := tempres;
end;


procedure TForm1.LoadData();
var str: ansistring;
  i, j: longint;
begin
     randomize;
     AssignFile(fin, OpenDialog1.FileName);
     reset(fin);
     Readln(fin, numQuest);
     Readln(fin, maxres);

     for i := 0 to (numQuest-1) do begin

         readln(fin, str);

         if str = 'Radio' then
            arr[i].Multtype := false
         else
           arr[i].Multtype := true;

         for j := -1 to 4 do
             readln(fin, arr[i].masOfQuestion[j]);


         readln(fin, arr[i].questImage);
     end;

     closefile(fin);
     randomQuestions(arr);
     ButtonLoad.Visible := false;

end;

procedure TForm1.InitFormItems();
begin
     CheckGroup1.Items.Clear();
     RadioGroup1.Items.Clear();
     CheckGroup1.Caption := '';
     RadioGroup1.Caption := '';
     CheckGroup1.Visible := false;
     RadioGroup1.Visible := false;
end;

procedure TForm1.FinishForm();
var temp: real;
begin
     temp := res / maxres * 100;
     EditRes.Visible := True;

     CheckGroup1.Visible := false;
     RadioGroup1.Visible := false;

     EditRes.Text := 'Your score: ' + FloatToStr(temp) + '%';
     ButtonStart.visible := false;

     Form1.Image1.Visible := False;
end;

procedure TForm1.ButtonStartClick(Sender: TObject);

begin

  if not startflag then begin
     LoadData();
     startflag := true;
     ButtonStart.Caption := 'NEXT';
     GeneratingAns(0);
     inc(curnum);
  end
  else begin
      res := res + Ans_Check(arr[curnum - 1]);
      if (curnum < numQuest) then begin
        GeneratingAns(curnum);
      end;

     if curnum = numQuest-1 then begin
        ButtonStart.Caption := 'FINISH';
     end;


     if curnum = numQuest then begin
       FinishForm()
     end;
     inc(curnum);

  end;



end;









end.

