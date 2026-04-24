; UnSubD — RustDesk Installer
; Wraps the official RustDesk MSI with a silent install experience.
;
; To build: open this file in Inno Setup and press Ctrl+F9
; Output: Output\UnSubD-RustDesk-Setup.exe

#define AppName "RustDesk"
#define AppVersion "1.4.6"
#define AppPublisher "UnSubD"
#define AppURL "https://unsubd.app"
#define RustDeskMSI "rustdesk-" + AppVersion + "-x86_64.msi"
#define RustDeskURL "https://github.com/rustdesk/rustdesk/releases/download/" + AppVersion + "/" + RustDeskMSI

[Setup]
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
DefaultDirName={autopf}\RustDesk
DisableDirPage=yes
DisableProgramGroupPage=yes
OutputDir=Output
OutputBaseFilename=UnSubD-RustDesk-Setup
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
english.WelcomeLabel1=Free remote desktop — replaces TeamViewer
english.WelcomeLabel2=RustDesk lets you remote into any computer from anywhere.%n%nNo subscriptions. No nagware. Saves you ~$180/year.%n%nThis will install RustDesk on your computer. It may take a moment to download.

[Code]
var
  DownloadPage: TDownloadWizardPage;

procedure InitializeWizard;
begin
  DownloadPage := CreateDownloadPage(
    'Downloading RustDesk',
    'Saving you ~$180/year. Please wait...',
    nil
  );
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  if CurPageID = wpReady then begin
    DownloadPage.Clear;
    DownloadPage.Add('{#RustDeskURL}', '{#RustDeskMSI}', '');
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
    MSIPath := ExpandConstant('{tmp}\{#RustDeskMSI}');
    if not Exec('msiexec.exe',
      '/i "' + MSIPath + '" /quiet /qn /norestart',
      '', SW_HIDE, ewWaitUntilTerminated, ResultCode) then
    begin
      MsgBox('Installation failed. Please try running the installer again.', mbError, MB_OK);
    end else if ResultCode <> 0 then
    begin
      MsgBox('RustDesk installation returned code ' + IntToStr(ResultCode) + '. It may still have installed — check your Start menu.', mbInformation, MB_OK);
    end;
  end;
end;
