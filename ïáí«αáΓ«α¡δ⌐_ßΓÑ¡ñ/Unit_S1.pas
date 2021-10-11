unit Unit_S1;

interface

type

  TStat = record
    attack_angle:real;
    length:integer;
    refraction:real;
    deffence_angle:real;
    border:real;
    step:real;
  end;

const Rad=57.2957795;

function silly_story(ar1:string):string;//фильтрация данных
function cutter(ar1:real):real;//округление да заданной точности

implementation

function silly_story(ar1:string):string;
var t,r:integer;
found:boolean;

begin
found:=false;
if ar1='' then ar1:='0';
for t:=1 to length(ar1) do begin
if ar1[t]='.' then ar1[t]:=',';

if not(found) and (ar1[t]=',') then found:=true else
  if found and (ar1[t]=',') then begin
    silly_story:='stop';
    exit;
  end;

end;

silly_story:=ar1;
for t:=1 to length(ar1) do
if not(((ar1[t]>='0') and (ar1[t]<='9')) or (ar1[t]=',') or (ar1[t]='-')) then silly_story:='stop';

end;

function cutter(ar1:real):real;
var cut:real;
begin
cut:=trunc(ar1*10000)/10000;
cutter:=(round(cut*1000))/1000;
end;


end.
