#define MyAppName "TS2 Redux"
#define MyAppVersion "0.2.4"
#define MyAppPublisher "Redux Tech Team"
#define GitHubURL "https://github.com/HFTSRedux/TS2Redux"
#define DiscordURL "https://discord.gg/fBnFZBYht5"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{8794E279-3728-49C7-BF1E-0AD9B04014BD}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#GitHubURL}
AppSupportURL={#GitHubURL}
AppUpdatesURL={#GitHubURL}
DefaultDirName={reg:HKLM64\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 223100,InstallLocation}
AppendDefaultDirName=no
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
OutputDir=../Releases
OutputBaseFilename=TS2-Redux-Installer-v{#MyAppVersion}
SetupIconFile=..\Launcher-Icons\App-Icons\ts2r-multi.ico
;Compression=none
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
Name: "extended"; Description: "Extended Installation (Cheats + Unlocks Enabled)"
Name: "custom"; Description: "Customize"; Flags: iscustom

[Components]
; general
Name: "core"; Description: "Core Mods"; Flags: fixed; Types: main extended custom
Name: "core\loader"; Description: "Install DLL Loader"; Flags: fixed dontinheritcheck;  Types:  main extended custom
Name: "core\anypak"; Description: "Custom PAK Support"; Flags: fixed dontinheritcheck;  Types:  main extended custom
; menus
Name: "menu"; Description: "Unlock Main Menu Items"; Flags:; Types: main
Name: "menu\archal"; Description: "Enable Arcade and Challenge Menus"; Flags: checkablealone;  Types:  main extended
Name: "menu\optsave"; Description: "Enable Options Menu and Progress Save/Load"; Flags: checkablealone;  Types:  main extended
; EXE + theme
Name: "theme"; Description: "Game Executable Mods"; Flags:; Types: main extended
Name: "theme\launcher"; Description: "Create TS2 Launcher"; Flags:;  Types:  main extended
Name: "theme\ripper"; Description: "Remove Homefront Game Files (saves 42.5GB)"; Flags: disablenouninstallwarning;
; UI
Name: "ui"; Description: "User Interface Enhancements"; Flags:; Types: main extended
Name: "ui\menu"; Description: "Menu Layout Fixes"; Flags: checkablealone;  Types:  main extended
Name: "ui\display"; Description: "UI Display Fixes"; Flags: checkablealone;  Types:  main extended
Name: "ui\textures"; Description: "Install High-Resolution Textures"; Flags:;  Types: main extended
; bugfixes
Name: "fix"; Description: "Bugfixes"; Flags:; Types: main extended
Name: "fix\reaprain"; Description: "ReaperSplitter Spawn + Rain-on-Camera Fixes"; Flags: checkablealone;  Types:  main extended
Name: "fix\invisible"; Description: "Invisibility Glitch Fix"; Flags: checkablealone;  Types:  main extended
Name: "fix\breathe"; Description: "Disable Character Breathing Effect"; Flags: checkablealone;  Types:  main extended
Name: "fix\neopatch"; Description: "NeoTokyo Cutscene Fix"; Flags:;  Types: main extended
;Name: "theme\compress"; Description: "Compress TS2 Game Files (saves 1.1GB)"; Flags:;  Types: main extended
; mods + cheats
Name: "mod"; Description: "Game Mods and Cheats"; Flags:; Types: extended
Name: "mod\ddkcheats"; Description: "DDK Cheats - Experimental cheats and tweaks"; Flags: checkablealone;  Types:  extended
Name: "mod\yosremix"; Description: "Yossarian's Remix Mod - Story overhaul, provides a new experience in story missions"; Flags:;  Types: extended
Name: "mod\yosmods"; Description: "Yossarian's Cheats - Cheats + mods, press SHIFT+F1 in-game for list of commands"; Flags:;  Types: extended
Name: "mod\minigames"; Description: "Minigames Unlock - Unlocks 3 arcade games in Temporal Uplink weapon"; Flags:;  Types: extended

;[Tasks]
;Name: "task"; Description: "Task";

;[Registry]
;Root: HKLM; Subkey: "Software\TS2Redux\Installer"; ValueType: string; ValueName: "Installed"; ValueData: "true";
;default settings
;Root: HKLM; Subkey: "Software\TS2Redux"; Flags: uninsdeletekeyifempty
;Root: HKLM; Subkey: "Software\TS2Redux"; ValueType: string; ValueName: "GamePath"; ValueData: "Test";

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
; DLLs
Source: "App-DLLs\dinput8.dll"; DestDir: "{app}\Bin64"; Flags: ignoreversion; Components: core\loader
Source: "App-DLLs\TS2Redux\DDK.dll"; DestDir: "{app}\Bin64\TS2Redux"; Flags: ignoreversion; Components: mod\ddkcheats
Source: "App-DLLs\TS2Redux\DevilDwarfMenu.dll"; DestDir: "{app}\Bin64\TS2Redux"; Flags: ignoreversion; Components: ui\menu
Source: "App-DLLs\TS2Redux\DevilDwarfUI.dll"; DestDir: "{app}\Bin64\TS2Redux"; Flags: ignoreversion; Components: ui\display
Source: "App-DLLs\TS2Redux\DisableBreathingByDevilDwarf.dll"; DestDir: "{app}\Bin64\TS2Redux"; Flags: ignoreversion; Components: fix\breathe
Source: "App-DLLs\TS2Redux\DisablePreferences.dll"; DestDir: "{app}\Bin64\TS2Redux"; Flags: ignoreversion; Components: menu\optsave
Source: "App-DLLs\TS2Redux\FanotoMenu.dll"; DestDir: "{app}\Bin64\TS2Redux"; Flags: ignoreversion; Components: menu\optsave
Source: "App-DLLs\TS2Redux\GameFixesByFanotoAndDevilDwarf.dll"; DestDir: "{app}\Bin64\TS2Redux"; Flags: ignoreversion; Components: fix\reaprain
Source: "App-DLLs\TS2Redux\InvisibleFixByDevilDwarf.dll"; DestDir: "{app}\Bin64\TS2Redux"; Flags: ignoreversion; Components: fix\invisible
Source: "App-DLLs\TS2Redux\MinigamesByDevilDwarf.dll"; DestDir: "{app}\Bin64\TS2Redux"; Flags: ignoreversion; Components: mod\minigames
Source: "App-DLLs\TS2Redux\mods.dll"; DestDir: "{app}\Bin64\TS2Redux"; Flags: ignoreversion; Components: core\anypak
Source: "App-DLLs\TS2Redux\StraightIntoTS2byDevilDwarf.dll"; DestDir: "{app}\Bin64\TS2Redux"; Flags: ignoreversion; Components: theme\launcher
Source: "App-DLLs\TS2Redux\UnlockArcadeAndChallengeByFanoto.dll"; DestDir: "{app}\Bin64\TS2Redux"; Flags: ignoreversion; Components: menu\archal
Source: "App-DLLs\TS2Redux\YossarianRemix.dll"; DestDir: "{app}\Bin64\TS2Redux"; Flags: ignoreversion; Components: mod\yosremix
Source: "App-DLLs\TS2Redux\YossariansMods.dll"; DestDir: "{app}\Bin64\TS2Redux"; Flags: ignoreversion; Components: mod\yosmods
; EXE
Source: "EXE-Appearence\Win-TileIcons\TimeSplitters2.VisualElementsManifest.xml"; DestDir: "{app}\Bin64"; Flags: ignoreversion; Components: theme\launcher
Source: "EXE-Appearence\Win-TileIcons\tileicons\*"; DestDir: "{app}\Bin64\tileicons"; Flags: ignoreversion; Components: theme\launcher
Source: "Setup-Files\homefront_ripper.bat"; DestDir: "{tmp}"; Flags: ignoreversion; Components: theme\ripper
; textures PAK
Source: "Texture-Mods\ts2_redux.pak"; DestDir: "{app}\gamehf2"; Flags: ignoreversion; Components: ui\textures
; Jdiff - jojodiff.sourceforge.net
Source: "Setup-Files\jptch.exe"; DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall; Components: theme\launcher fix\neopatch
; patch data
Source: "NeoTokyo-PatchV2\NeoTokyo-PatchV2.data"; DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall; Components: fix\neopatch
Source: "EXE-Appearence\TS2-EXE-Appearence-Patch.pat"; DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall; Components: theme\launcher

[UninstallDelete]
Type: files; Name: "{app}\Bin64\TimeSplitters2.exe"; Components: theme\launcher
Type: files; Name: "{app}\gamehf2\ts2_neotokyo_fix.pak"; Components: fix\neopatch

[Icons]
Name: "{group}\TimeSplitters 2"; Filename: "{app}\Bin64\TimeSplitters2.exe"; WorkingDir: "{app}"; Flags: createonlyiffileexists;
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Run]
Filename: "{#DiscordURL}"; Description: "Join TimeSplitters Online Discord Server"; Flags: postinstall shellexec runasoriginaluser;
Filename: "{tmp}\jptch.exe"; Parameters:" ""{app}\Bin64\Homefront2_Release.exe"" ""{tmp}\TS2-EXE-Appearence-Patch.pat"" ""{app}\Bin64\TimeSplitters2.exe"" "; StatusMsg: "Creating TS2 Launcher..."; Flags: skipifsilent; Components: theme\launcher;
Filename: "{tmp}\jptch.exe"; Parameters:" ""{app}\gamehf2\lsao_cached.pak"" ""{tmp}\NeoTokyo-PatchV2.data"" ""{app}\gamehf2\ts2_neotokyo_fix.pak"" "; StatusMsg: "Fixing NeoTokyo..."; Flags: skipifsilent; Components: fix\neopatch;
Filename: "{tmp}\homefront_ripper.bat"; Parameters:" ""{app}"" "; StatusMsg: "Running Homefront Ripper..."; Flags: skipifsilent; Components: theme\ripper;
Filename: "{cmd}"; Parameters:"/c rd /s /q ""{app}\ripped"""; Description: "Delete Ripped Homefront files"; Flags: postinstall; Components: theme\ripper;

[UninstallRun]
;Filename: "{cmd}"; Parameters:"/c move ""{app}\ripped\*"" ""{app}"" "; Components: theme\ripper;

[Code]
const
  MD5_Expected = '0326ea202fcd7ceb3760d14bc8d07f63';

var
  MD5_Calc: string;

function NextButtonClick(PageId: Integer): Boolean;
begin
    Result := True;
    if (PageId = wpSelectDir) then begin
        if not FileExists(ExpandConstant('{app}\Bin64\Homefront2_Release.exe')) then begin
          MsgBox('Warning: Could not find Homefront game EXE within the selected folder. Please check your install path and try again.', mbCriticalError, MB_OK);
          Result := False;
        end else begin
          MD5_Calc := GetMD5OfFile(ExpandConstant('{app}\Bin64\Homefront2_Release.exe'));
          if Result and (MD5_Calc <> MD5_Expected) then begin
            if MsgBox('Warning: MD5 Check Failed! The game EXE you are using is different than what was expected. Proceed anyway?', mbConfirmation, MB_YESNO) = IDNO then begin
              Result := False;
            end;
          end;
        end;
    end;
end;


function FileReplaceString(const FileName, SearchString, ReplaceString: string):boolean;
var
  MyFile : TStrings;
  MyText : string;
begin
  MyFile := TStringList.Create;

  try
    result := true;

    try
      MyFile.LoadFromFile(FileName);
      MyText := MyFile.Text;

      { Only save if text has been changed. }
      if StringChangeEx(MyText, SearchString, ReplaceString, True) > 0 then
      begin;
        MyFile.Text := MyText;
        MyFile.SaveToFile(FileName);
      end;
    except
      result := false;
    end;
  finally
    MyFile.Free;
  end;
end;


var
  supersampling: String;
  CFGFile: String;

function PrepareToInstall(var NeedsRestart: Boolean): String;
begin
  CFGFile := ExpandConstant('{usersavedgames}') + '\homefront2\game.cfg';
  if (FileExists(CFGFile)) then begin
    Log('Config file found at: ' + CFGFile);
    FileReplaceString(CFGFile, '-- [Game-Configuration]', '[Game-Configuration]'); // workaround to make the cfg file use INI syntax
    
    supersampling := GetIniString('Game-Configuration', 'r_supersampling', '0', CFGFile);
    
    Log('r_supersampling current value: ' + supersampling);
    
    if StrToFloat(supersampling) > 1 then begin
      if MsgBox('Warning: Your graphics settings have Supersampling enabled, which causes problems when playing TS2. Would you like the installer to disable Supersampling for you now?', mbConfirmation, MB_YESNO) = IDYES then begin
        if SetIniString('Game-Configuration', 'r_supersampling', ' 1', CFGFile) = True then Log('r_supersampling value changed to 1') else Log('r_supersampling value was not changed')
      end;
    end else begin;
      Log('r_supersampling does not exceed 1. No change needed.');
    end;
    
    FileReplaceString(CFGFile, '[Game-Configuration]', '-- [Game-Configuration]'); // we don't have to change this back, but just to be safe...
  end else begin;
    Log('Warning: Homefront CFG file not found. Cannot check supersampling value.');
  end;
  
  Result := '';
end;

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
SelectDirDesc=This setup wizard will try to find your Homefront game folder automatically for you. If the box below is blank, click Browse and select your Homefront game folder.