program houghdemoproject;

{$MODE Delphi}

uses
  interfaces,
  Forms,
  Unit_HoughDEMO in 'Unit_HoughDEMO.pas' {HoughDemoForm},
  Unit_HoughTransformation in 'Unit_HoughTransformation.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(THoughDemoForm, HoughDemoForm);
  Application.Run;
end.
