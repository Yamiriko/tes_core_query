unit TescCoreQuery;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure bersih_memo;
  end;

var
  Form1: TForm1;
  namatabel,namafield,valuefield,kondisipk,kondisiurut : string;

implementation

{$R *.dfm}

{
Programmer Delphi/PHP Native/Node JS/React JS/Android Java Jean Riko Kurniawan Putra
WA/Telegram : 0823 8694 4596
Grup Diskusi : https://t.me/delphipekanbaru
}

//Pemanggilan Fungsi dari file 'Core_Query.dll'

function simpan(nama_tabel, nama_field, value_field : string): string;
stdcall; external 'Core_Query.dll';

function ubah(nama_tabel, nama_field, kondisi_pk : string): string;
stdcall; external 'Core_Query.dll';

function hapus(nama_tabel, kondisi_pk : string): string;
stdcall; external 'Core_Query.dll';

function cari_data_bintang(nama_tabel, kondisi_pk, kondisi_urut : string): string;
stdcall; external 'Core_Query.dll';

procedure TForm1.bersih_memo;
begin
  //Prosedur bersihkan Memo1
  with Memo1 do begin
    Lines.Clear;
    Clear;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  //Query Simpan Data
  namatabel:='tabel1';
  namafield:='field1,field2';
  valuefield:='"Isi Satu","Isi Dua"';
  bersih_memo;
  Memo1.Lines.Add(simpan(namatabel,namafield,valuefield));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  //Query Ubah Data
  namatabel:='tabel1';
  namafield:='field2="Value 2", field3="Value 3"';
  kondisipk:='field1="Value 1"';
  bersih_memo;
  Memo1.Lines.Add(ubah(namatabel,namafield,kondisipk));
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  //Query Hapus Data
  namatabel:='tabel1';
  kondisipk:='field1="Value 1"';
  bersih_memo;
  Memo1.Lines.Add(hapus(namatabel,kondisipk));
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  //Query Cari Data
  namatabel:='tabel1';
  kondisipk:='field1="Value 1"';
  kondisiurut:='field1 ASC';
  bersih_memo;
  Memo1.Lines.Add(cari_data_bintang(namatabel,kondisipk,kondisiurut));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  bersih_memo;
end;

end.
