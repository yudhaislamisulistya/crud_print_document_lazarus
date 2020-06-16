unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, mysql56conn, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, DBGrids, Menus, Printers, PrintersDlgs;

type

  { TFormUtama }

  TFormUtama = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ENama: TEdit;
    EBerat: TEdit;
    EGolonganDarah: TEdit;
    EKampus: TEdit;
    EWargaNegara: TEdit;
    ESD: TEdit;
    ESMP: TEdit;
    ESMA: TEdit;
    ETTL: TEdit;
    EAlamat: TEdit;
    EEmail: TEdit;
    ENoTelp: TEdit;
    EJenisKelamin: TEdit;
    EAgama: TEdit;
    EStatus: TEdit;
    ETinggi: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MOrganisasi: TMemo;
    MySQL56Connection1: TMySQL56Connection;
    Panel1: TPanel;
    Panel2: TPanel;
    PopupMenu1: TPopupMenu;
    PrintDialog1: TPrintDialog;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private
  public

  end;

var
  FormUtama: TFormUtama;
  id_cv: Integer;

implementation
uses
  Unit2;

{$R *.lfm}

{ TFormUtama }

procedure TFormUtama.MenuItem2Click(Sender: TObject);
begin
  try
    SQLQuery2.Close;
    SQLQuery2.Clear;
    SQLQuery2.SQL.Text:='DELETE FROM cv WHERE id_cv = :id_cv';
    SQLQuery2.Params.ParamByName('id_cv').AsInteger:=id_cv;
    SQLQuery2.ExecSQL;
    SQLTransaction1.Commit;
    SQLQuery1.Open;
    SQLQuery1.Refresh;
    MessageDlg('Status', 'Data Berhasil Dihapus', mtInformation, [mbOK], 0, mbOK);
  except
    MessageDlg('Status', 'Data Gagal Dihapus', mtError, [mbOK], 0, mbOK);
  end;
end;

procedure TFormUtama.DBGrid1CellClick(Column: TColumn);
begin
  id_cv:=SQLQuery1.FieldByName('id_cv').AsInteger;
  ENama.Text:=SQLQuery1.FieldByName('nama').AsString;
  ETTL.Text:=SQLQuery1.FieldByName('ttl').AsString;
  EAlamat.Text:=SQLQuery1.FieldByName('alamat').AsString;
  EEmail.Text:=SQLQuery1.FieldByName('email').AsString;
  ENoTelp.Text:=SQLQuery1.FieldByName('notelp').AsString;
  EJenisKelamin.Text:=SQLQuery1.FieldByName('jenis_kelamin').AsString;
  EAgama.Text:=SQLQuery1.FieldByName('agama').AsString;
  EStatus.Text:=SQLQuery1.FieldByName('status').AsString;
  ETinggi.Text:=SQLQuery1.FieldByName('tinggi').AsString;
  EBerat.Text:=SQLQuery1.FieldByName('berat').AsString;
  EGolonganDarah.Text:=SQLQuery1.FieldByName('golongan_darah').AsString;
  EWargaNegara.Text:=SQLQuery1.FieldByName('warga_negara').AsString;
  ESD.Text:=SQLQuery1.FieldByName('sd').AsString;
  ESMP.Text:=SQLQuery1.FieldByName('smp').AsString;
  ESMA.Text:=SQLQuery1.FieldByName('sma').AsString;
  EKampus.Text:=SQLQuery1.FieldByName('kampus').AsString;
  MOrganisasi.Text:=SQLQuery1.FieldByName('organisasi').AsString;
end;

procedure TFormUtama.MenuItem1Click(Sender: TObject);
begin
  FormPrint.LName.Caption:=SQLQuery1.FieldByName('nama').AsString;
  FormPrint.LTTL.Caption:=SQLQuery1.FieldByName('ttl').AsString;
  FormPrint.LAlamat.Caption:=SQLQuery1.FieldByName('alamat').AsString;
  FormPrint.LEmail.Caption:=SQLQuery1.FieldByName('email').AsString;
  FormPrint.LNoTelp.Caption:=SQLQuery1.FieldByName('notelp').AsString;
  FormPrint.LKelamin.Caption:=SQLQuery1.FieldByName('jenis_kelamin').AsString;
  FormPrint.LAgama.Caption:=SQLQuery1.FieldByName('agama').AsString;
  FormPrint.LTinggi.Caption:=SQLQuery1.FieldByName('tinggi').AsString;
  FormPrint.LBerat.Caption:=SQLQuery1.FieldByName('berat').AsString;
  FormPrint.LDarah.Caption:=SQLQuery1.FieldByName('golongan_darah').AsString;
  FormPrint.LNegara.Caption:=SQLQuery1.FieldByName('warga_negara').AsString;
  FormPrint.LSD.Caption:=SQLQuery1.FieldByName('sd').AsString;
  FormPrint.LSMP.Caption:=SQLQuery1.FieldByName('smp').AsString;
  FormPrint.LSMA.Caption:=SQLQuery1.FieldByName('sma').AsString;
  FormPrint.LKampus.Caption:=SQLQuery1.FieldByName('kampus').AsString;
  FormPrint.MOrganisasi.Text:=SQLQuery1.FieldByName('organisasi').AsString;
  FormPrint.ShowModal;

end;

procedure TFormUtama.Button1Click(Sender: TObject);
begin
  try
    SQLQuery2.Close;
    SQLQuery2.Clear;
    SQLQuery2.SQL.Text:='INSERT INTO `cv` (`id_cv`, `nama`, `ttl`, `alamat`, `email`, `notelp`, `jenis_kelamin`, `agama`, `status`, `tinggi`, `berat`, `golongan_darah`, `warga_negara`, `sd`, `smp`, `sma`, `kampus`, `organisasi`, `created_at`, `updated_at`) VALUES (NULL, :nama, :ttl, :alamat, :email, :notelp, :jenis_kelamin, :agama, :status, :tinggi, :berat, :golongan_darah, :warga_negara, :sd, :smp, :sma, :kampus, :organisasi, current_timestamp(), current_timestamp());';
    SQLQuery2.Params.ParamByName('nama').AsString:=ENama.Text;
    SQLQuery2.Params.ParamByName('ttl').AsString:=ETTL.Text;
    SQLQuery2.Params.ParamByName('alamat').AsString:=EAlamat.Text;
    SQLQuery2.Params.ParamByName('email').AsString:=EEmail.Text;
    SQLQuery2.Params.ParamByName('notelp').AsString:=ENoTelp.Text;
    SQLQuery2.Params.ParamByName('jenis_kelamin').AsString:=EJenisKelamin.Text;
    SQLQuery2.Params.ParamByName('agama').AsString:=EAgama.Text;
    SQLQuery2.Params.ParamByName('status').AsString:=EStatus.Text;
    SQLQuery2.Params.ParamByName('tinggi').AsString:=ETinggi.Text;
    SQLQuery2.Params.ParamByName('berat').AsString:=EBerat.Text;
    SQLQuery2.Params.ParamByName('golongan_darah').AsString:=EGolonganDarah.Text;
    SQLQuery2.Params.ParamByName('warga_negara').AsString:=EWargaNegara.Text;
    SQLQuery2.Params.ParamByName('sd').AsString:=ESD.Text;
    SQLQuery2.Params.ParamByName('smp').AsString:=ESMP.Text;
    SQLQuery2.Params.ParamByName('sma').AsString:=ESMA.Text;
    SQLQuery2.Params.ParamByName('kampus').AsString:=EKampus.Text;
    SQLQuery2.Params.ParamByName('organisasi').AsString:=MOrganisasi.Text;
    SQLQuery2.ExecSQL;
    SQLTransaction1.Commit;
    SQLQuery1.Open;
    SQLQuery1.Refresh;
    MessageDlg('Status', 'Data Berhasil Ditambahkan', mtInformation, [mbOK], 0, mbOK);
  except
    MessageDlg('Status', 'Data Gagal Ditambahkan', mtError, [mbOK], 0, mbOK);
  end;
end;

procedure TFormUtama.Button2Click(Sender: TObject);
begin
  try
    SQLQuery2.Close;
    SQLQuery2.Clear;
    SQLQuery2.SQL.Text:='UPDATE cv SET nama = :nama, ttl = :ttl, alamat = :alamat, email = :email, notelp = :notelp, jenis_kelamin = :jenis_kelamin, agama = :agama, status = :status, tinggi = :tinggi, berat = :berat, golongan_darah = :golongan_darah, warga_negara = :warga_negara, sd = :sd, smp = :smp, sma = :sma, kampus = :kampus, organisasi = :organisasi WHERE id_cv = :id';
    SQLQuery2.Params.ParamByName('id').AsInteger:=id_cv;
    SQLQuery2.Params.ParamByName('nama').AsString:=ENama.Text;
    SQLQuery2.Params.ParamByName('ttl').AsString:=ETTL.Text;
    SQLQuery2.Params.ParamByName('alamat').AsString:=EAlamat.Text;
    SQLQuery2.Params.ParamByName('email').AsString:=EEmail.Text;
    SQLQuery2.Params.ParamByName('notelp').AsString:=ENoTelp.Text;
    SQLQuery2.Params.ParamByName('jenis_kelamin').AsString:=EJenisKelamin.Text;
    SQLQuery2.Params.ParamByName('agama').AsString:=EAgama.Text;
    SQLQuery2.Params.ParamByName('status').AsString:=EStatus.Text;
    SQLQuery2.Params.ParamByName('tinggi').AsString:=ETinggi.Text;
    SQLQuery2.Params.ParamByName('berat').AsString:=EBerat.Text;
    SQLQuery2.Params.ParamByName('golongan_darah').AsString:=EGolonganDarah.Text;
    SQLQuery2.Params.ParamByName('warga_negara').AsString:=EWargaNegara.Text;
    SQLQuery2.Params.ParamByName('sd').AsString:=ESD.Text;
    SQLQuery2.Params.ParamByName('smp').AsString:=ESMP.Text;
    SQLQuery2.Params.ParamByName('sma').AsString:=ESMA.Text;
    SQLQuery2.Params.ParamByName('kampus').AsString:=EKampus.Text;
    SQLQuery2.Params.ParamByName('organisasi').AsString:=MOrganisasi.Text;
    SQLQuery2.ExecSQL;
    SQLTransaction1.Commit;
    SQLQuery1.Open;
    SQLQuery1.Refresh;
    MessageDlg('Status', 'Data Berhasil Diubah', mtInformation, [mbOK], 0, mbOK);
  except
    MessageDlg('Status', 'Data Gagal Diubah', mtError, [mbOK], 0, mbOK);
  end;
end;



end.

