; UnSubD — Stirling PDF Installer
; Wraps the official Stirling PDF MSI with a silent install experience.
;
; To build: open this file in Inno Setup and press Ctrl+F9
; Output: Output\UnSubD-StirlingPDF-Setup.exe

#define AppName "Stirling PDF"
#define AppVersion "2.10.0"
#define AppPublisher "UnSubD"
#define AppURL "https://unsubd.app"
#define StirlingMSI "Stirling-PDF-windows-x86_64.msi"
#define StirlingURL "https://github.com/Stirling-Tools/Stirling-PDF/releases/download/v" + AppVersion + "/" + StirlingMSI

[Setup]
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
DefaultDirName={autopf}\Stirling-PDF
DisableDirPage=yes
DisableProgramGroupPage=yes
OutputDir=Output
OutputBaseFilename=UnSubD-StirlingPDF-Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
WizardImageFile=..\assets\wizard-side.png
WizardSmallImageFile=..\assets\wizard-small.png
; Uncomment and set path to sign the installer:
; SignTool=signtool sign /fd SHA256 /tr http://timestamp.sectigo.com /td sha256 /f "cert.pfx" /p "password" $f

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[CustomMessages]
english.WelcomeLabel1=Free PDF tools — replaces Adobe Acrobat
english.WelcomeLabel2=Stirling PDF lets you merge, split, compress, convert, and edit PDFs — everything Acrobat does, without the subscription.%n%nYour files never leave your computer.%n%nNo subscriptions. No cloud uploads. Saves you ~$240/year.%n%nThis will download and install Stirling PDF. Please stay connected to the internet.

[Code]
var
  DownloadPage: TDownloadWizardPage;

procedure InitializeWizard;
begin
  DownloadPage := CreateDownloadPage(
    'Downloading Stirling PDF',
    'Saving you ~$240/year. Please wait...',
    nil
  );
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  if CurPageID = wpReady then begin
    DownloadPage.Clear;
    DownloadPage.Add('{#StirlingURL}', '{#StirlingMSI}', '');
    DownloadPage.Show;
    try
      try
        DownloadPage.Download;
        Result := True;
      except
        SuppressibleMsgBox(AddPeriod(GetExceptionMessage), mbCriticalError, MB_OK, IDOK);
        Result := False;
      end;
    finally
      DownloadPage.Hide;
    end;
  end else
    Result := True;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  MSIPath: String;
  ResultCode: Integer;
begin
  if CurStep = ssInstall then begin
    MSIPath := ExpandConstant('{tmp}\{#StirlingMSI}');
    if not Exec('msiexec.exe',
      '/i "' + MSIPath + '" /quiet /qn /norestart',
      '', SW_HIDE, ewWaitUntilTerminated, ResultCode) then
    begin
      MsgBox('Installation failed. Please try running the installer again.', mbError, MB_OK);
    end else if ResultCode <> 0 then
    begin
      MsgBox('Stirling PDF installation returned code ' + IntToStr(ResultCode) + '. It may still have installed — check your Start menu.', mbInformation, MB_OK);
    end;
  end;
end;
