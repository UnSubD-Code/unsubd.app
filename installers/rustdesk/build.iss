; UnSubD — RustDesk Installer
; Wraps the official RustDesk MSI with a silent install experience.
;
; To build: open this file in Inno Setup and press Ctrl+F9
; Output: Output\UnSubD-RustDesk-Setup.exe

#define AppName "RustDesk"
#define AppVersion "1.3.8"
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
; Uncomment and set path to sign the installer:
; SignTool=signtool sign /fd SHA256 /tr http://timestamp.sectigo.com /td sha256 /f "cert.pfx" /p "password" $f

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[CustomMessages]
english.WelcomeLabel1=Free remote desktop — replaces TeamViewer
english.WelcomeLabel2=RustDesk lets you remote into any computer from anywhere.%n%nNo subscriptions. No nagware. Saves you ~$180/year.%n%nThis will install RustDesk on your computer. It may take a moment to download.

[Code]

// Download and silently install RustDesk MSI
function DownloadAndInstall(): Boolean;
var
  TempDir: String;
  MSIPath: String;
  ResultCode: Integer;
begin
  Result := True;
  TempDir := ExpandConstant('{tmp}');
  MSIPath := TempDir + '\{#RustDeskMSI}';

  // Show progress page
  WizardForm.StatusLabel.Caption := 'Downloading RustDesk...';

  // Download the official MSI from GitHub
  if not DownloadTemporaryFile('{#RustDeskURL}', '{#RustDeskMSI}', '', WizardForm.ProgressGauge) then
  begin
    MsgBox('Download failed. Please check your internet connection and try again.', mbError, MB_OK);
    Result := False;
    Exit;
  end;

  WizardForm.StatusLabel.Caption := 'Installing RustDesk...';

  // Run the MSI silently
  if not Exec('msiexec.exe',
    '/i "' + MSIPath + '" /quiet /qn /norestart',
    '', SW_HIDE, ewWaitUntilTerminated, ResultCode) then
  begin
    MsgBox('Installation failed (error ' + IntToStr(ResultCode) + '). Please try running the installer again.', mbError, MB_OK);
    Result := False;
    Exit;
  end;

  if ResultCode <> 0 then
  begin
    MsgBox('RustDesk installation returned an error (' + IntToStr(ResultCode) + '). It may still have installed correctly — check your Start menu.', mbInformation, MB_OK);
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssInstall then
  begin
    DownloadAndInstall();
  end;
end;

// Required for DownloadTemporaryFile
function InitializeSetup(): Boolean;
begin
  Result := True;
end;
