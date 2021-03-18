unit TescCoreQuery;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure bersih_memo;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function simpan(nama_tabel, nama_field, value_field : string): string;
stdcall; external 'Core_Query.dll';

procedure TForm1.bersih_memo;
begin
  with Memo1 do begin
    Lines.Clear;
    Clear;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  namatabel,namafield,valuefield : string;
begin
  namatabel:='tabel1';
  namafield:='field1,field2';
  valuefield:='"Isi Satu","Isi Dua"';
  bersih_memo;
  Memo1.Lines.Add(simpan(namatabel,namafield,valuefield));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  bersih_memo;
end;

end.
