unit Unit_HoughDEMO;

{$MODE Delphi}

///
///
///      a very basic demo of the hough transformation  of lines and circles
///
///
///
///
///
///



interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Menus,
  ExtCtrls, Unit_HoughTransformation, StdCtrls, Spin;

type
  THoughDemoForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    LoadBitMapFile1: TMenuItem;
    Hough1: TMenuItem;
    LineDetection1: TMenuItem;
    Panel1: TPanel;
    Label4: TLabel;
    HoughThresholdSpinEdit: TSpinEdit;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SCRImage: TImage;
    HOUGHImage: TImage;
    OutImage: TImage;
    EXit1: TMenuItem;
    CircleSizeSpinEdit: TSpinEdit;
    CircleDetection1: TMenuItem;
    procedure LoadBitMapFile1Click(Sender: TObject);
    procedure LineDetection1Click(Sender: TObject);
    procedure EXit1Click(Sender: TObject);
    procedure CircleDetection1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
     aHoughResult :  THoughResult;
     aHoughFinal  :  THoughFinal;
  end;

var
  HoughDemoForm: THoughDemoForm;

implementation

{$R *.lfm}

procedure THoughDemoForm.CircleDetection1Click(Sender: TObject);
var
  testRadius: Integer;
  ResultBitmap       : TBitMap;
  ResultFinalBitmap  : TBitmap;
begin

    ResultBitmap := TBitMap.Create;

    ResultFinalBitmap  :=TBitmap.Create;

    testRadius := StrToInt(CircleSizeSpinEdit.Text);

    Hough_CircleDetection(scrimage.Picture.Bitmap, aHoughResult, testRadius);

    HoughresultToBitMap (ResultBitmap , aHoughResult );

    HOUGHImage.Picture.Bitmap.Assign(ResultBitmap);

    ResultBitmap.Free;

    ResultFinalBitmap.Free;

end;

procedure THoughDemoForm.EXit1Click(Sender: TObject);
begin
   Close;
end;

procedure THoughDemoForm.LineDetection1Click(Sender: TObject);
var  ResultBitmap       : TBitMap;
     ResultFinalBitmap  : TBitmap;
     Thres              : Integer;
begin

    ResultBitmap := TBitMap.Create;

    ResultFinalBitmap  :=TBitmap.Create;

    Hough_LineDetection( scrimage.Picture.Bitmap, aHoughResult);

    HoughresultToBitMap (ResultBitmap , aHoughResult );

    HOUGHImage.Picture.Bitmap.Assign(ResultBitmap);

    Thres := HoughThresholdSpinEdit.Value;

    HoughResultToParameterDynamic(aHoughResult, (Thres / 100), aHoughFinal);

    ResultFinalBitmap.Assign(scrimage.Picture.Bitmap);

    HoughResultLineParameterToBitMap(ResultFinalBitmap, aHoughFinal);

    OutImage.Picture.Bitmap.Assign(ResultFinalBitmap);

    ResultBitmap.Free;

    ResultFinalBitmap.Free;

end;

procedure THoughDemoForm.LoadBitMapFile1Click(Sender: TObject);
begin

     scrimage.Picture.Bitmap.LoadFromFile('C:\temp\HOUGH_DEMO\img\DEMO_circle.BMP');

end;

end.










