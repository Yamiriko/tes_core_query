program Tes_Core_Query;

uses
  Vcl.Forms,
  TescCoreQuery in 'TescCoreQuery.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
