#define MyAppName "TS2 Redux"
#define MyAppVersion "0.2"
#define MyAppPublisher "Redux Tech Team"
#define MyAppURL "https://github.com/HFTSRedux/TS2Redux"
#define HomefrontMD5 "0326ea202fcd7ceb3760d14bc8d07f63"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{8794E279-3728-49C7-BF1E-0AD9B04014BD}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName=C:\Steam\steamapps\common\Homefront_The_Revolution
DisableDirPage=no
AlwaysShowDirOnReadyPage=yes
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=Setup-Files\license.txt
InfoBeforeFile=Setup-Files\install-notes.txt
InfoAfterFile=Setup-Files\install-thanks.txt
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=commandline
OutputDir=Builds
OutputBaseFilename=ts2redux
SetupIconFile=..\Launcher-Icons\App-Icons\ts2r-multi.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
WizardImageFile=Setup-Files\images\installer_image-*.bmp
WizardImageStretch=yes
WizardSmallImageFile=Setup-Files\images\installer_smallimage.bmp
DisableWelcomePage=no
DirExistsWarning=no
DisableProgramGroupPage=yes
UninstallFilesDir={app}\Bin64\TS2Redux\Setup

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Types]
Name: "main"; Description: "Standard Installation"
Name: "main"; Description: "Standard Installation + Extra Mods"
Name: "custom"; Description: "Customize"; Flags: iscustom

[Components]
Name: "appdlls"; Description: "Bugfixes and Patches"; Flags: disablenouninstallwarning checkablealone;  Types:  main
Name: "launcher"; Description: "TS2 Launcher"; Flags: disablenouninstallwarning;  Types:  main
Name: "textures"; Description: "High-Resolution Textures"; Flags: disablenouninstallwarning;  Types: main
Name: "ripper"; Description: "Homefront Ripper"; Flags: disablenouninstallwarning;  Types: main
Name: "patcher"; Description: "Fix NeoTokyo Cutscenes"; Flags: disablenouninstallwarning;  Types: main
Name: "mods"; Description: "Enable Extra Mods"; Flags: disablenouninstallwarning;  Types: main

[Registry]
Root: HKLM; Subkey: "Software\TS2Redux\Installer"; ValueType: string; ValueName: "Installed"; ValueData: "true";
; default settings
Root: HKLM; Subkey: "Software\TS2Redux"; Flags: uninsdeletekeyifempty
Root: HKLM; Subkey: "Software\TS2Redux"; Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\TS2Redux"; ValueType: string; ValueName: "GamePath"; ValueData: "Test";
Root: HKLM; Subkey: "Software\TS2Redux"; ValueType: string; ValueName: "TitleBar"; ValueData: "TS2 Redux Installer";

[Files]
Source: "App-DLLs\dinput8.dll"; DestDir: "{app}\Bin64"; Flags: ignoreversion; Components: appdlls
Source: "App-DLLs\TS2Redux\*"; DestDir: "{app}\Bin64\TS2Redux"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: appdlls
Source: "EXE-Appearence\Win-TileIcons\TimeSplitters2.VisualElementsManifest.xml"; DestDir: "{app}\Bin64"; Flags: ignoreversion; Components: launcher
Source: "EXE-Appearence\Win-TileIcons\tileicons\*"; DestDir: "{app}\Bin64\tileicons"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: launcher
Source: "Texture-Mods\ts2_redux.pak"; DestDir: "{app}\gamehf2"; Flags: ignoreversion; Components: textures
Source: "Setup-Files\jptch.exe"; DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall; Components: launcher patcher
Source: "NeoTokyo-PatchV2\NeoTokyo-PatchV2.data"; DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall; Components: launcher
Source: "EXE-Appearence\TS2-EXE-Appearence-Patch.pat"; DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall; Components: patcher
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[UninstallDelete]
Type: files; Name: "{app}\Bin64\TimeSplitters2.exe"; Components: launcher
Type: files; Name: "{app}\gamehf2\ts2_neotokyo_fix.pak"; Components: patcher

[Icons]
Name: "{group}\TimeSplitters 2"; Filename: "{app}\Bin64\TimeSplitters2.exe"; WorkingDir: "{app}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Run]
Filename: "{tmp}\jptch.exe"; Parameters:" ""{app}\Bin64\Homefront2_Release.exe"" ""{tmp}\TS2-EXE-Appearence-Patch.pat"" ""{app}\Bin64\TimeSplitters2.exe"" "; StatusMsg: "Creating TS2 Launcher..."; Flags: skipifsilent; Components: launcher;
Filename: "{tmp}\jptch.exe"; Parameters:" ""{app}\gamehf2\lsao_cached.pak"" ""{tmp}\NeoTokyo-PatchV2.data"" ""{app}\gamehf2\ts2_neotokyo_fix.pak"" "; StatusMsg: "Fixing NeoTokyo..."; Flags: skipifsilent; Components: patcher;

[Messages]
BeveledLabel=Redux Tech Team
WelcomeLabel1=[name] Setup Wizard
WelcomeLabel2=This will install [name/ver] for Homefront: The Revolution.%n%nTS2 Redux is a fan-made project which aims to fix and enhance the port of TimeSplitters 2 (TS2) contained in Homefront: The Revolution. This project does NOT allow you to play Homefront or TS2 without owning a copy of Homefront: The Revolution. If you do not have Homefront yet, you must purchase it before using this installer.
FinishedHeadingLabel=Thanks for using [name]!
FinishedLabelNoIcons=Setup has finished installing [name] into your installed copy of Homefront.
FinishedLabel=Setup has finished installing [name] into your installed copy of Homefront: The Revolution. The mod will be active the next time you launch Homefront.%n%nTo launch straight into TS2 (bypassing Homefront's menus), use the TimeSplitters 2 launcher in your start menu.
ClickFinish=Click Finish to exit Setup.
LicenseLabel=TS2 Redux is an open-source project. The agreement below defines how the software provided can be used.
WizardSelectDir=Select Homefront Game Folder
SelectDirDesc=This setup wizard will try to find your Hoemfront game folder automatically, but please double-check that the path below is accurate before continuing.