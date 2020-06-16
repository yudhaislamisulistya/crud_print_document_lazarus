unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Printers, PrintersDlgs;

type

  { TFormPrint }

  TFormPrint = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LName: TLabel;
    LTTL: TLabel;
    LNegara: TLabel;
    LSD: TLabel;
    LSMP: TLabel;
    LSMA: TLabel;
    LKampus: TLabel;
    LAlamat: TLabel;
    LEmail: TLabel;
    LNoTelp: TLabel;
    LKelamin: TLabel;
    LAgama: TLabel;
    LTinggi: TLabel;
    LBerat: TLabel;
    LDarah: TLabel;
    MOrganisasi: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    PrintDialog1: TPrintDialog;
    procedure Button1Click(Sender: TObject);
  private
    procedure PrintForm(aForm: TForm);
  public

  end;

var
  FormPrint: TFormPrint;

implementation

{$R *.lfm}

{ TFormPrint }

procedure TFormPrint.Button1Click(Sender: TObject);
begin
  PrintForm(FormPrint);
end;

procedure TFormPrint.PrintForm(aForm: TForm);
var
  bmp : TBitMap;
begin
  if not PrintDialog1.Execute then
    Exit;
  bmp := TBitMap.Create;
  try
    bmp.LoadFromDevice(aForm.Canvas.Handle);
    bmp.SaveToFile('FORM.bmp');
    Printer.BeginDoc;
    try
      Printer.Canvas.CopyRect(Rect(0,0,Printer.PageWidth,Printer.PageHeight),
                              bmp.Canvas,
                              Rect(0,0,bmp.Width,bmp.Height));
    finally
      Printer.EndDoc;
    end;
  finally
    bmp.Free;
  end;
end;

end.

