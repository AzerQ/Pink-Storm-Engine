
unit Engine;

interface

uses System.Net, System, Vars;

function GetLastRelease(): string;
procedure GenerateRelease();//Generate Release File
procedure SetGenerate(IsGenerate: boolean);
implementation



procedure GenerateRelease();
begin
  IO.File.WriteAllText('Release.txt', String.Format(ReleaseStr, Ver, Date, Feature, GetLastRelease, C.website, C.email, C.vk, C.tumblr, Date.Year.ToString));
end;



function GetLastRelease(): string;
begin
  var W := new WebClient();
  var b := w.DownloadData(sourcestr);
  result := Encoding.UTF8.GetString(b);
end;



procedure SetGenerate(IsGenerate: boolean);
begin
  IsGenerated := IsGenerate;
  IO.File.WriteAllText('IS_GENERATED.txt', IsGenerated.ToString);
end;


begin
  SetGenerate(false);
  Feature.Add('AutoRelease','Automatic release info generation.');
  Feature.Add('LoadRelease','Loading preRelease time from server.');
  if not IsGenerated then GenerateRelease();


end.