unit Vars;
//Some variables about Engine
interface

type
  Contact = record
    website, email, vk, tumblr: string;
  end;

type
  Features = class
    Ft: list<String> := new List<String>;
    Descr: list<String> := new List<String>;
    procedure Add(Feat, Des: string);
    begin
      Ft.Add(Feat);
      Descr.Add(Des);
    end;
    
    function GetDescr(key: string): string;
    begin
      result := Descr[Ft.FindIndex(x -> x = key)];
    end;
    
    public function ToString(): string; override;
    begin
      if Ft.Count > 0 then
      begin
        var tmp := '    {0}: {1} - {2}' + System.Environment.NewLine;
        for i: integer := 0 to Ft.Count - 1 do
          result += String.Format(tmp, i + 1, Ft[i], Descr[i]);
      end
      else result := '    Nothing';
    end;
  end;

var
  EL := System.Environment.NewLine;
  Ver := '1.0b';
  C: contact := (website: 'http://it-osnov.simplesite.com'; email: 'xxxvorobej71@gmail.com'; vk: 'vk.com/azerQ'; tumblr: 'NOT');
  Date := DateTime.Now;
  ReleaseStr := 'The Pink Storm Engine v {0} (from {1})' + EL + ' *New features that have been added: ' + EL + '{2}' + EL + ' *PreLast release - {3}' + EL + ' *Contact us: ' + EL + '    1) Web Site: {4} ' + EL + '    2) E - mail: {5} ' + EL + '    3) VK.COM: {6} ' + EL + '    4) Tumblr: {7} ' + EL + 'Qazarus inc (c) {8} ';
  SourceStr := 'https://docs.google.com/document/export?format=txt&id=1gNP-ceePOjJImIUTpD6LWNLNSs8dcoIPinNQ3nuL6u0&token=AC4w5VhAjKkagH7VOMvYw6mQflSU0Ki5iA%3A1546072463513&includes_info_params=true';
  IsGenerated := boolean.Parse(System.IO.File.ReadAllText('IS_GENERATED.txt'));
  Feature := new Features;

implementation

end.