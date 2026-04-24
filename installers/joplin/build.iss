; UnSubD — Joplin Installer
; Wraps the official Joplin NSIS installer with a silent install experience.
;
; To build: open this file in Inno Setup and press Ctrl+F9
; Output: Output\UnSubD-Joplin-Setup.exe

#define AppName "Joplin"
#define AppVersion "3.5.13"
#define AppPublisher "UnSubD"
#define AppURL "https://unsubd.app"
#define JoplinEXE "Joplin-Setup-" + AppVersion + ".exe"
#define JoplinURL "https://github.com/laurent22/joplin/releases/download/v" + AppVersion + "/" + JoplinEXE

[Setup]
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
DefaultDirName={autopf}\Joplin
DisableDirPage=yes
DisableProgramGroupPage=yes
OutputDir=Output
OutputBaseFilename=UnSubD-Joplin-Setup
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
english.WelcomeLabel1=Free note-taking — replaces Evernote
english.WelcomeLabel2=Joplin lets you write and organize notes without paying monthly — and you actually own your data.%n%nNo subscriptions. No price hikes. Saves you ~$130/year.%n%nThis will download and install Joplin (~243 MB). Please stay connected to the internet.

[Code]
var
  DownloadPage: TDownloadWizardPage;

procedure InitializeWizard;
begin
  DownloadPage := CreateDownloadPage(
    'Downloading Joplin',
    'Saving you ~$130/year. This may take a minute (~243 MB)...',
    nil
  );
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  if CurPageID = wpReady then begin
    DownloadPage.Clear;
    DownloadPage.Add('{#JoplinURL}', '{#JoplinEXE}', '');
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
  ExePath: String;
  ResultCode: Integer;
begin
  if CurStep = ssInstall then begin
    ExePath := ExpandConstant('{tmp}\{#JoplinEXE}');
    if not Exec(ExePath, '/S /allusers', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) then
    begin
      MsgBox('Installation failed. Please try running the installer again.', mbError, MB_OK);
    end else if ResultCode <> 0 then
    begin
      MsgBox('Joplin installation returned code ' + IntToStr(ResultCode) + '. It may still have installed — check your Start menu.', mbInformation, MB_OK);
    end;
  end;
end;
