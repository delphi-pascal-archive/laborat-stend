//Deamolit

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, ExtCtrls, Math, Unit_S1, TeeProcs, TeEngine, Chart, Series;

type
  TForm1 = class(TForm)
    Image1: TImage;
    StringGrid1: TStringGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label5: TLabel;
    Button3: TButton;
    Button4: TButton;
    Label6: TLabel;
    Edit6: TEdit;
    Button5: TButton;
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    flow:TStat;
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var t:integer;
begin

  if (silly_story(edit1.Text)='stop') or (silly_story(edit2.Text)='stop') then begin

    MessageDlg('ѕроверте праильность данных!', mtWarning, [mbOK], 0);

  end else begin
    edit1.Text:=silly_story(edit1.Text);
    edit2.Text:=silly_story(edit2.Text);

    flow.attack_angle:=strtofloat(silly_story(edit1.Text));
    flow.refraction:=strtofloat(silly_story(edit2.Text));

    flow.length:=150;

    if (flow.attack_angle<=0) or (flow.attack_angle>=90) then begin
      MessageDlg('Ќе допустимое значение параметра угла!', mtWarning, [mbOK], 0);
      exit;
    end;

    if (flow.refraction<=0) then begin
      MessageDlg('Ќе допустимое значение показателz преломлени€!', mtWarning, [mbOK], 0);
      exit;
    end;

    stringgrid1.Cells[0,0]:='параметр угла падани€';
    stringgrid1.Cells[1,0]:='угол преломлени€';
    stringgrid1.ColWidths[0]:=130;
    stringgrid1.ColWidths[1]:=130;

    image1.Canvas.Brush.Color:=rgb(255,255,255);
    image1.Canvas.Pen.Color:=rgb(255,255,255);
    image1.Canvas.Pen.Width:=1;
    image1.Canvas.Rectangle(0,0,image1.Width,image1.Height);

    image1.Canvas.Brush.Color:=rgb(235,255,255);
    image1.Canvas.Rectangle(0,round(image1.Height/2),image1.Width,image1.Height);

    image1.Canvas.Pen.Color:=rgb(0,0,100);
    image1.Canvas.MoveTo(round(image1.Width/2),0);
    image1.Canvas.LineTo(round(image1.Width/2),image1.Height);

    for t := -13 to 13 do begin
      image1.Canvas.MoveTo(round(image1.Width/2)-t*15,round(image1.Height/2));
      image1.Canvas.LineTo(round(image1.Width/2)-15-t*15,round(image1.Height/2)+15);
    end;

    image1.Canvas.Pen.Width:=2;
    image1.Canvas.MoveTo(0,round(image1.Height/2));
    image1.Canvas.LineTo(image1.Width,round(image1.Height/2));

    image1.Canvas.Pen.Width:=1;

    image1.Canvas.TextOut(round(image1.Width/2)-10,round(image1.Height/2)+10,'O');
    image1.Canvas.Brush.Color:=rgb(255,255,255);
    image1.Canvas.TextOut(round(image1.Width/2)-10,0,'C');

    //falling_line
    image1.Canvas.Pen.Color:=rgb(250,0,0);

    image1.Canvas.Polygon([
    Point(round((image1.Width/2)-flow.length/1.6*sin((flow.attack_angle+3)/Rad)),round((image1.Height/2)-flow.length/1.6*cos((flow.attack_angle+3)/Rad))),
    Point(round((image1.Width/2)-flow.length/2*sin(flow.attack_angle/Rad)),round((image1.Height/2)-flow.length/2*cos(flow.attack_angle/Rad))),
    Point(round((image1.Width/2)-flow.length/1.6*sin((flow.attack_angle-3)/Rad)),round((image1.Height/2)-flow.length/1.6*cos((flow.attack_angle-3)/Rad)))
    ]);

    image1.Canvas.Brush.Color:=rgb(250,0,0);
    image1.Canvas.FloodFill(round((image1.Width/2)-flow.length/1.8*sin(flow.attack_angle/Rad)),round((image1.Height/2)-flow.length/1.8*cos(flow.attack_angle/Rad)),rgb(250,0,0),fsBorder);

    image1.Canvas.MoveTo(round(image1.Width/2),round(image1.Height/2));
    image1.Canvas.LineTo(round((image1.Width/2)-flow.length*sin(flow.attack_angle/Rad)),round((image1.Height/2)-flow.length*cos(flow.attack_angle/Rad)));

    image1.Canvas.Brush.Color:=rgb(255,255,255);
    image1.Canvas.TextOut(round((image1.Width/2)-flow.length*sin(flow.attack_angle/Rad))+10,round((image1.Height/2)-flow.length*cos(flow.attack_angle/Rad)),'A');

    image1.Canvas.Arc(
      round(image1.Width/2+flow.length/2.2),round(image1.Height/2+flow.length/2.2),
      round(image1.Width/2-flow.length/2.2),round(image1.Height/2-flow.length/2.2),
      round(image1.Width/2),round(image1.Height/2)-100,
      round((image1.Width/2)-flow.length*sin(flow.attack_angle/Rad)),round((image1.Height/2)-flow.length*cos(flow.attack_angle/Rad))
    );

    image1.Canvas.TextOut(round(image1.Width/2)+5,round(image1.Height/2-flow.length/2.2)-5,floattostr(cutter(flow.attack_angle))+' град');

    //falling_conter_line
    image1.Canvas.Pen.Color:=rgb(255,100,100);

    image1.Canvas.Polygon([
      Point(round((image1.Width/2)+flow.length/2*sin((flow.attack_angle+4)/Rad)),round((image1.Height/2)-flow.length/2*cos((flow.attack_angle+4)/Rad))),
      Point(round((image1.Width/2)+flow.length/1.6*sin(flow.attack_angle/Rad)),round((image1.Height/2)-flow.length/1.6*cos(flow.attack_angle/Rad))),
      Point(round((image1.Width/2)+flow.length/2*sin((flow.attack_angle-4)/Rad)),round((image1.Height/2)-flow.length/2*cos((flow.attack_angle-4)/Rad)))
    ]);

    image1.Canvas.Brush.Color:=rgb(255,100,100);
    image1.Canvas.FloodFill(round((image1.Width/2)+flow.length/1.8*sin(flow.attack_angle/Rad)),round((image1.Height/2)-flow.length/1.8*cos(flow.attack_angle/Rad)),rgb(255,100,100),fsBorder);

    image1.Canvas.MoveTo(round(image1.Width/2),round(image1.Height/2));
    image1.Canvas.LineTo(round((image1.Width/2)+flow.length*sin(flow.attack_angle/Rad)),round((image1.Height/2)-flow.length*cos(flow.attack_angle/Rad)));

    //refraction_line
    image1.Canvas.Pen.Color:=rgb(255,50,50);

    flow.deffence_angle:=arcsin(sin(flow.attack_angle/Rad)/flow.refraction)*Rad;

    image1.Canvas.MoveTo(round(image1.Width/2),round(image1.Height/2));
    image1.Canvas.LineTo(round((image1.Width/2)+flow.length*sin(flow.deffence_angle/Rad)),round((image1.Height/2)+flow.length*cos(flow.deffence_angle/Rad)));

    image1.Canvas.Polygon([
      Point(round((image1.Width/2)+flow.length/2*sin((flow.deffence_angle+4)/Rad)),round((image1.Height/2)+flow.length/2*cos((flow.deffence_angle+4)/Rad))),
      Point(round((image1.Width/2)+flow.length/1.6*sin(flow.deffence_angle/Rad)),round((image1.Height/2)+flow.length/1.6*cos(flow.deffence_angle/Rad))),
      Point(round((image1.Width/2)+flow.length/2*sin((flow.deffence_angle-4)/Rad)),round((image1.Height/2)+flow.length/2*cos((flow.deffence_angle-4)/Rad)))
    ]);

    image1.Canvas.Brush.Color:=rgb(235,255,255);

    image1.Canvas.TextOut(round((image1.Width/2)+flow.length*sin(flow.deffence_angle/Rad)),round((image1.Height/2)+flow.length*cos(flow.deffence_angle/Rad)),'B');

    image1.Canvas.Arc(
      round(image1.Width/2+flow.length/2.2),round(image1.Height/2+flow.length/2.2),
      round(image1.Width/2-flow.length/2.2),round(image1.Height/2-flow.length/2.2),
      round(image1.Width/2),round(image1.Height/2)+100,
      round((image1.Width/2)+flow.length*sin(flow.deffence_angle/Rad)),round((image1.Height/2)+flow.length*cos(flow.deffence_angle/Rad))
    );

    image1.Canvas.TextOut(
    round((image1.Width/2)+flow.length/2.2*sin(flow.deffence_angle/Rad))+10,
    round((image1.Height/2)+flow.length/2.2*cos(flow.deffence_angle/Rad))-10,
    floattostr(cutter(flow.deffence_angle))+' град');

    stringgrid1.Cells[0,stringgrid1.RowCount-1]:=floattostr(flow.attack_angle);
    stringgrid1.Cells[1,stringgrid1.RowCount-1]:=floattostr(cutter(flow.deffence_angle));

    stringgrid1.RowCount:=stringgrid1.RowCount+1;
    stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var t:integer;
begin

  stringgrid1.Cells[0,0]:='параметр угла падани€';
  stringgrid1.Cells[1,0]:='угол преломлени€';
  stringgrid1.ColWidths[0]:=130;
  stringgrid1.ColWidths[1]:=130;

  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;

  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  edit6.Clear;

  image1.Canvas.Brush.Color:=rgb(255,255,255);
  image1.Canvas.Pen.Color:=rgb(255,255,255);
  image1.Canvas.Pen.Width:=1;
  image1.Canvas.Rectangle(0,0,image1.Width,image1.Height);

  image1.Canvas.Brush.Color:=rgb(235,255,255);
  image1.Canvas.Rectangle(0,round(image1.Height/2),image1.Width,image1.Height);

  image1.Canvas.Pen.Color:=rgb(0,0,100);
  image1.Canvas.MoveTo(round(image1.Width/2),0);
  image1.Canvas.LineTo(round(image1.Width/2),image1.Height);

  for t := -13 to 13 do begin
    image1.Canvas.MoveTo(round(image1.Width/2)-t*15,round(image1.Height/2));
    image1.Canvas.LineTo(round(image1.Width/2)-15-t*15,round(image1.Height/2)+15);
  end;

  image1.Canvas.Pen.Width:=2;
  image1.Canvas.MoveTo(0,round(image1.Height/2));
  image1.Canvas.LineTo(image1.Width,round(image1.Height/2));

  image1.Canvas.Pen.Width:=1;

  image1.Canvas.TextOut(round(image1.Width/2)-10,round(image1.Height/2)+10,'O');
  image1.Canvas.Brush.Color:=rgb(255,255,255);
  image1.Canvas.TextOut(round(image1.Width/2)-10,0,'C');
end;

procedure TForm1.Button3Click(Sender: TObject);
var t:integer;
  s:real;
begin

  if (silly_story(edit3.Text)='stop') or (silly_story(edit4.Text)='stop') or
    (silly_story(edit5.Text)='stop') or (silly_story(edit6.Text)='stop')
   then begin

    MessageDlg('ѕроверте праильность данных!', mtWarning, [mbOK], 0);

  end else begin

    edit3.Text:=silly_story(edit3.Text);
    edit4.Text:=silly_story(edit4.Text);
    edit5.Text:=silly_story(edit5.Text);
    edit6.Text:=silly_story(edit6.Text);

    flow.attack_angle:=strtofloat(silly_story(edit3.Text));
    flow.border:=strtofloat(silly_story(edit4.Text));
    flow.step:=strtofloat(silly_story(edit5.Text));
    flow.refraction:=strtofloat(silly_story(edit6.Text));

    flow.length:=150;

    if (flow.attack_angle<=0) or (flow.attack_angle>=90) then begin
      MessageDlg('Ќе допустимое значение в интервале!', mtWarning, [mbOK], 0);
      exit;
    end;

    if (flow.border<=0) or (flow.border>=90) then begin
      MessageDlg('Ќе допустимое значение в интервале!', mtWarning, [mbOK], 0);
      exit;
    end;

    if (flow.border<=flow.attack_angle) then begin
      MessageDlg('Ќе допустимое значение в интервале!', mtWarning, [mbOK], 0);
      exit;
    end;

    if (flow.border-flow.attack_angle)<=flow.step then begin
      MessageDlg('Ќе допустимое значение в интервале!', mtWarning, [mbOK], 0);
      exit;
    end;

    if (flow.refraction<=0) then begin
      MessageDlg('Ќе допустимое значение показателz преломлени€!', mtWarning, [mbOK], 0);
      exit;
    end;

    //

    stringgrid1.Cells[0,0]:='параметр угла падани€';
    stringgrid1.Cells[1,0]:='угол преломлени€';
    stringgrid1.ColWidths[0]:=130;
    stringgrid1.ColWidths[1]:=130;

    stringgrid1.RowCount:=2; 
    stringgrid1.Rows[1].Clear;


    s:=flow.attack_angle;
    while s<=flow.border do begin

      stringgrid1.Cells[0,0]:='параметр угла падани€';
      stringgrid1.Cells[1,0]:='угол преломлени€';
      stringgrid1.ColWidths[0]:=130;
      stringgrid1.ColWidths[1]:=130;

      flow.deffence_angle:=arcsin(sin(s/Rad)/flow.refraction)*Rad;

      stringgrid1.Cells[0,stringgrid1.RowCount-1]:=floattostr(s);
      stringgrid1.Cells[1,stringgrid1.RowCount-1]:=floattostr(cutter(flow.deffence_angle));

      stringgrid1.RowCount:=stringgrid1.RowCount+1;
      stringgrid1.Rows[stringgrid1.RowCount-1].Clear;

      s:=s+flow.step;
    end;
    //*

    if stringgrid1.RowCount>2 then begin
      stringgrid1.Row:=1;
      Form1.StringGrid1Click(Self);
    end;

  end;

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Form1.Button2Click(Self);
end;

procedure TForm1.Button5Click(Sender: TObject);
var  s, t: TLineSeries;
w:integer;
begin
  if stringgrid1.RowCount>2 then begin

      form2.Chart1.Title.Text.Clear;
      form2.Chart1.Title.Text.Add('«ависимость угла преломлени€ от параметра угла.');

      form2.Series1.Clear; 
      for w:=1 to Stringgrid1.RowCount-2 do
      form2.Series1.AddXY(Strtofloat(Stringgrid1.Cells[0,w]),Strtofloat(Stringgrid1.Cells[1,w]));


    form2.visible:=true;
  end else begin
    MessageDlg('Ќедостаточно данных дл€ построени€ графика!', mtWarning, [mbOK], 0);
    exit;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var t:integer;

begin

stringgrid1.Cells[0,0]:='параметр угла падани€';
stringgrid1.Cells[1,0]:='угол преломлени€';
stringgrid1.ColWidths[0]:=130;
stringgrid1.ColWidths[1]:=130;

edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
edit5.Clear;
edit6.Clear;

image1.Canvas.Brush.Color:=rgb(255,255,255);
image1.Canvas.Pen.Color:=rgb(255,255,255);
image1.Canvas.Pen.Width:=1;
image1.Canvas.Rectangle(0,0,image1.Width,image1.Height);

image1.Canvas.Brush.Color:=rgb(235,255,255);
image1.Canvas.Rectangle(0,round(image1.Height/2),image1.Width,image1.Height);

image1.Canvas.Pen.Color:=rgb(0,0,100);
image1.Canvas.MoveTo(round(image1.Width/2),0);
image1.Canvas.LineTo(round(image1.Width/2),image1.Height);

for t := -13 to 13 do begin
image1.Canvas.MoveTo(round(image1.Width/2)-t*15,round(image1.Height/2));
image1.Canvas.LineTo(round(image1.Width/2)-15-t*15,round(image1.Height/2)+15);
end;

image1.Canvas.Pen.Width:=2;
image1.Canvas.MoveTo(0,round(image1.Height/2));
image1.Canvas.LineTo(image1.Width,round(image1.Height/2));

image1.Canvas.Pen.Width:=1;

image1.Canvas.TextOut(round(image1.Width/2)-10,round(image1.Height/2)+10,'O');
image1.Canvas.Brush.Color:=rgb(255,255,255);
image1.Canvas.TextOut(round(image1.Width/2)-10,0,'C');

end;

procedure TForm1.StringGrid1Click(Sender: TObject);
var t:integer;
begin

if Stringgrid1.Row<>Stringgrid1.RowCount-1 then begin

  flow.attack_angle:=StrToFloat(Stringgrid1.Cells[0,Stringgrid1.Row]);

  edit1.Text:=Stringgrid1.Cells[0,Stringgrid1.Row];

  flow.length:=150;

  image1.Canvas.Brush.Color:=rgb(255,255,255);
  image1.Canvas.Pen.Color:=rgb(255,255,255);
  image1.Canvas.Pen.Width:=1;
  image1.Canvas.Rectangle(0,0,image1.Width,image1.Height);

  image1.Canvas.Brush.Color:=rgb(235,255,255);
  image1.Canvas.Rectangle(0,round(image1.Height/2),image1.Width,image1.Height);

  image1.Canvas.Pen.Color:=rgb(0,0,100);
  image1.Canvas.MoveTo(round(image1.Width/2),0);
  image1.Canvas.LineTo(round(image1.Width/2),image1.Height);

  for t := -13 to 13 do begin
    image1.Canvas.MoveTo(round(image1.Width/2)-t*15,round(image1.Height/2));
    image1.Canvas.LineTo(round(image1.Width/2)-15-t*15,round(image1.Height/2)+15);
  end;

  image1.Canvas.Pen.Width:=2;
  image1.Canvas.MoveTo(0,round(image1.Height/2));
  image1.Canvas.LineTo(image1.Width,round(image1.Height/2));

  image1.Canvas.Pen.Width:=1;

  image1.Canvas.TextOut(round(image1.Width/2)-10,round(image1.Height/2)+10,'O');
  image1.Canvas.Brush.Color:=rgb(255,255,255);
  image1.Canvas.TextOut(round(image1.Width/2)-10,0,'C');

  //falling_line
  image1.Canvas.Pen.Color:=rgb(250,0,0);

  image1.Canvas.Polygon([
    Point(round((image1.Width/2)-flow.length/1.6*sin((flow.attack_angle+3)/Rad)),round((image1.Height/2)-flow.length/1.6*cos((flow.attack_angle+3)/Rad))),
    Point(round((image1.Width/2)-flow.length/2*sin(flow.attack_angle/Rad)),round((image1.Height/2)-flow.length/2*cos(flow.attack_angle/Rad))),
    Point(round((image1.Width/2)-flow.length/1.6*sin((flow.attack_angle-3)/Rad)),round((image1.Height/2)-flow.length/1.6*cos((flow.attack_angle-3)/Rad)))
  ]);

  image1.Canvas.Brush.Color:=rgb(250,0,0);
  image1.Canvas.FloodFill(round((image1.Width/2)-flow.length/1.8*sin(flow.attack_angle/Rad)),round((image1.Height/2)-flow.length/1.8*cos(flow.attack_angle/Rad)),rgb(250,0,0),fsBorder);

  image1.Canvas.MoveTo(round(image1.Width/2),round(image1.Height/2));
  image1.Canvas.LineTo(round((image1.Width/2)-flow.length*sin(flow.attack_angle/Rad)),round((image1.Height/2)-flow.length*cos(flow.attack_angle/Rad)));

  image1.Canvas.Brush.Color:=rgb(255,255,255);
  image1.Canvas.TextOut(round((image1.Width/2)-flow.length*sin(flow.attack_angle/Rad))+10,round((image1.Height/2)-flow.length*cos(flow.attack_angle/Rad)),'A');

  image1.Canvas.Arc(
    round(image1.Width/2+flow.length/2.2),round(image1.Height/2+flow.length/2.2),
    round(image1.Width/2-flow.length/2.2),round(image1.Height/2-flow.length/2.2),
    round(image1.Width/2),round(image1.Height/2)-100,
    round((image1.Width/2)-flow.length*sin(flow.attack_angle/Rad)),round((image1.Height/2)-flow.length*cos(flow.attack_angle/Rad))
  );

  image1.Canvas.TextOut(round(image1.Width/2)+5,round(image1.Height/2-flow.length/2.2)-5,floattostr(cutter(flow.attack_angle))+' град');

  //falling_conter_line
  image1.Canvas.Pen.Color:=rgb(255,100,100);

  image1.Canvas.Polygon([
    Point(round((image1.Width/2)+flow.length/2*sin((flow.attack_angle+4)/Rad)),round((image1.Height/2)-flow.length/2*cos((flow.attack_angle+4)/Rad))),
    Point(round((image1.Width/2)+flow.length/1.6*sin(flow.attack_angle/Rad)),round((image1.Height/2)-flow.length/1.6*cos(flow.attack_angle/Rad))),
    Point(round((image1.Width/2)+flow.length/2*sin((flow.attack_angle-4)/Rad)),round((image1.Height/2)-flow.length/2*cos((flow.attack_angle-4)/Rad)))
  ]);

  image1.Canvas.Brush.Color:=rgb(255,100,100);
  image1.Canvas.FloodFill(round((image1.Width/2)+flow.length/1.8*sin(flow.attack_angle/Rad)),round((image1.Height/2)-flow.length/1.8*cos(flow.attack_angle/Rad)),rgb(255,100,100),fsBorder);

  image1.Canvas.MoveTo(round(image1.Width/2),round(image1.Height/2));
  image1.Canvas.LineTo(round((image1.Width/2)+flow.length*sin(flow.attack_angle/Rad)),round((image1.Height/2)-flow.length*cos(flow.attack_angle/Rad)));

  //refraction_line
  image1.Canvas.Pen.Color:=rgb(255,50,50);

  flow.deffence_angle:=arcsin(sin(flow.attack_angle/Rad)/flow.refraction)*Rad;

  image1.Canvas.MoveTo(round(image1.Width/2),round(image1.Height/2));
  image1.Canvas.LineTo(round((image1.Width/2)+flow.length*sin(flow.deffence_angle/Rad)),round((image1.Height/2)+flow.length*cos(flow.deffence_angle/Rad)));

  image1.Canvas.Polygon([
    Point(round((image1.Width/2)+flow.length/2*sin((flow.deffence_angle+4)/Rad)),round((image1.Height/2)+flow.length/2*cos((flow.deffence_angle+4)/Rad))),
    Point(round((image1.Width/2)+flow.length/1.6*sin(flow.deffence_angle/Rad)),round((image1.Height/2)+flow.length/1.6*cos(flow.deffence_angle/Rad))),
    Point(round((image1.Width/2)+flow.length/2*sin((flow.deffence_angle-4)/Rad)),round((image1.Height/2)+flow.length/2*cos((flow.deffence_angle-4)/Rad)))
  ]);

  image1.Canvas.Brush.Color:=rgb(235,255,255);

  image1.Canvas.TextOut(round((image1.Width/2)+flow.length*sin(flow.deffence_angle/Rad)),round((image1.Height/2)+flow.length*cos(flow.deffence_angle/Rad)),'B');

  image1.Canvas.Arc(
    round(image1.Width/2+flow.length/2.2),round(image1.Height/2+flow.length/2.2),
    round(image1.Width/2-flow.length/2.2),round(image1.Height/2-flow.length/2.2),
    round(image1.Width/2),round(image1.Height/2)+100,
    round((image1.Width/2)+flow.length*sin(flow.deffence_angle/Rad)),round((image1.Height/2)+flow.length*cos(flow.deffence_angle/Rad))
  );

  image1.Canvas.TextOut(
  round((image1.Width/2)+flow.length/2.2*sin(flow.deffence_angle/Rad))+10,
  round((image1.Height/2)+flow.length/2.2*cos(flow.deffence_angle/Rad))-10,
  floattostr(cutter(flow.deffence_angle))+' град');

  //*
end;

end;

end.
