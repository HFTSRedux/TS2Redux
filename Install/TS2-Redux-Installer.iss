#define MyAppName "TS2 Redux"
#define MyAppVersion "0.2.7"
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
SetupLogging=yes

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
Name: "theme\shortcut1"; Description: "Add TS2 Shortcut to Start Menu"; Types:  main extended
Name: "theme\shortcut2"; Description: "Add TS2 Shortcut to Desktop";
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
Name: "fix\neopatch"; Description: "NeoTokyo Cutscene Fix"; Flags:;  Types: main extended
;Name: "theme\compress"; Description: "Compress TS2 Game Files (saves 1.1GB)"; Flags:;  Types: main extended
; mods + cheats
Name: "mod"; Description: "Game Mods and Cheats"; Flags:; Types: extended
Name: "mod\ddkcheats"; Description: "DDK Cheats - Experimental cheats and tweaks"; Flags: checkablealone;  Types:  extended
Name: "mod\yosremix"; Description: "Yossarian's Remix Mod - Story overhaul, provides a new experience in story missions"; Flags:;  Types: extended
Name: "mod\yosmods"; Description: "Yossarian's Cheats - Cheats + mods, press SHIFT+F1 in-game for list of commands"; Flags:;  Types: extended
Name: "mod\minigames"; Description: "Minigames Unlock - Unlocks 3 arcade games in Temporal Uplink weapon"; Flags:;  Types: extended
Name: "mod\haunted"; Description: "Yossarian's Haunted Mod (DONT USE WITH REMIX)"; Flags:;  Types: extended
Name: "mod\ts1guns"; Description: "Yossarian's TS1 Guns Mod"; Flags:checkablealone;  Types: extended
Name: "mod\vattic"; Description: "Yossarian's John Vattic Playable Mod"; Flags:checkablealone;  Types: extended
Name: "mod\breathe"; Description: "Disable Character Breathing Effect"; Flags: checkablealone;  Types:  main extended

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
Source: "App-DLLs\dinput8.dll"; DestDir: "{app}\Bin64"; Components: core\loader
Source: "App-DLLs\TS2Redux\DDK.dll"; DestDir: "{app}\Bin64\TS2Redux"; Components: mod\ddkcheats
Source: "App-DLLs\TS2Redux\DevilDwarfMenu.dll"; DestDir: "{app}\Bin64\TS2Redux"; Components: ui\menu
Source: "App-DLLs\TS2Redux\DevilDwarfUI.dll"; DestDir: "{app}\Bin64\TS2Redux"; Components: ui\display
Source: "App-DLLs\TS2Redux\DisableBreathingByDevilDwarf.dll"; DestDir: "{app}\Bin64\TS2Redux"; Components: mod\breathe
Source: "App-DLLs\TS2Redux\DisablePreferences.dll"; DestDir: "{app}\Bin64\TS2Redux"; Components: menu\optsave
Source: "App-DLLs\TS2Redux\FanotoMenu.dll"; DestDir: "{app}\Bin64\TS2Redux"; Components: menu\optsave
Source: "App-DLLs\TS2Redux\GameFixesByFanotoAndDevilDwarf.dll"; DestDir: "{app}\Bin64\TS2Redux"; Components: fix\reaprain
Source: "App-DLLs\TS2Redux\InvisibleFixByDevilDwarf.dll"; DestDir: "{app}\Bin64\TS2Redux"; Components: fix\invisible
Source: "App-DLLs\TS2Redux\MinigamesByDevilDwarf.dll"; DestDir: "{app}\Bin64\TS2Redux"; Components: mod\minigames
Source: "App-DLLs\TS2Redux\mods.dll"; DestDir: "{app}\Bin64\TS2Redux"; Components: core\anypak
Source: "App-DLLs\TS2Redux\StraightIntoTS2byDevilDwarf.dll"; DestDir: "{app}\Bin64\TS2Redux"; Components: theme\launcher
Source: "App-DLLs\TS2Redux\UnlockArcadeAndChallengeByFanoto.dll"; DestDir: "{app}\Bin64\TS2Redux"; Components: menu\archal
Source: "App-DLLs\TS2Redux\YossarianRemix.dll"; DestDir: "{app}\Bin64\TS2Redux"; Components: mod\yosremix
Source: "App-DLLs\TS2Redux\YossariansMods.dll"; DestDir: "{app}\Bin64\TS2Redux"; Components: mod\yosmods
Source: "App-DLLs\TS2Redux\YossariansHauntedMod.dll"; DestDir: "{app}\Bin64\TS2Redux"; Components: mod\haunted
; EXE
Source: "EXE-Appearence\Win-TileIcons\TimeSplitters2.VisualElementsManifest.xml"; DestDir: "{app}\Bin64"; Components: theme\launcher
Source: "EXE-Appearence\Win-TileIcons\tileicons\*"; DestDir: "{app}\Bin64\tileicons"; Components: theme\launcher
Source: "Setup-Files\homefront_ripper.bat"; DestDir: "{tmp}"; Flags: deleteafterinstall; Components: theme\ripper
; textures PAK
Source: "Texture-Mods\ts2_redux.pak"; DestDir: "{app}\gamehf2"; Components: ui\textures
; Jdiff - jojodiff.sourceforge.net
Source: "Setup-Files\jptch.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall; Components: theme\launcher fix\neopatch
; patch data
Source: "NeoTokyo-PatchV2\NeoTokyo-PatchV2.data"; DestDir: "{tmp}"; Flags: deleteafterinstall; Components: fix\neopatch
Source: "NeoTokyo-PatchV2\TS2Vattic.Patch"; DestDir: "{tmp}"; Flags: deleteafterinstall; Components: mod\vattic
Source: "NeoTokyo-PatchV2\TS1Guns.Patch"; DestDir: "{tmp}"; Flags: deleteafterinstall; Components: mod\ts1guns
Source: "NeoTokyo-PatchV2\Haunted.Patch"; DestDir: "{tmp}"; Flags: deleteafterinstall; Components: mod\haunted
Source: "EXE-Appearence\TS2-EXE-Appearence-Patch.pat"; DestDir: "{tmp}"; Flags: deleteafterinstall; Components: theme\launcher

[UninstallDelete]
Type: files; Name: "{app}\Bin64\TimeSplitters2.exe"; Components: theme\launcher
Type: files; Name: "{app}\gamehf2\ts2_neotokyo_fix.pak"; Components: fix\neopatch

[Icons]
Name: "{group}\TimeSplitters 2"; Filename: "{app}\Bin64\TimeSplitters2.exe"; WorkingDir: "{app}"; Components: theme\shortcut1;
Name: "{group}\TimeSplitters Online Discord Server"; Filename: "{#DiscordURL}"; Components: theme\shortcut1;
Name: "{group}\TS2 Redux GitHub Page"; Filename: "{#GitHubURL}"; Components: theme\shortcut1;
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"; Components: theme\shortcut1;
Name: "{commondesktop}\TimeSplitters 2"; Filename: "{app}\Bin64\TimeSplitters2.exe"; WorkingDir: "{app}"; Flags: createonlyiffileexists; Components: theme\shortcut2;

[Run]
Filename: "{#DiscordURL}"; Description: "Join TimeSplitters Online Discord Server"; Flags: postinstall shellexec runasoriginaluser;
Filename: "{tmp}\jptch.exe"; Parameters:" ""{app}\Bin64\Homefront2_Release.exe"" ""{tmp}\TS2-EXE-Appearence-Patch.pat"" ""{app}\Bin64\TimeSplitters2.exe"" "; StatusMsg: "Creating TS2 Launcher..."; Flags: skipifsilent; Components: theme\launcher;
Filename: "{tmp}\jptch.exe"; Parameters:" ""{app}\gamehf2\lsao_cached.pak"" ""{tmp}\NeoTokyo-PatchV2.data"" ""{app}\gamehf2\ts2_neotokyo_fix.pak"" "; StatusMsg: "Fixing NeoTokyo..."; Flags: skipifsilent; Components: fix\neopatch;
Filename: "{tmp}\jptch.exe"; Parameters:" ""{app}\gamehf2\lsao_cached.pak"" ""{tmp}\Haunted.Patch"" ""{app}\gamehf2\TS2HauntedEdition.pak"" "; StatusMsg: "Creating Haunted Edition pak..."; Flags: skipifsilent; Components: mod\haunted;
Filename: "{tmp}\jptch.exe"; Parameters:" ""{app}\gamehf2\lsao_cached.pak"" ""{tmp}\TS1Guns.Patch"" ""{app}\gamehf2\TS2TS1ClassicGuns.pak"" "; StatusMsg: "Creating TS1Guns pak..."; Flags: skipifsilent; Components: mod\ts1guns;
Filename: "{tmp}\jptch.exe"; Parameters:" ""{app}\gamehf2\lsao_cached.pak"" ""{tmp}\TS2Vattic.Patch"" ""{app}\gamehf2\TS2Vattic.pak"" "; StatusMsg: "Creating Vattic pak..."; Flags: skipifsilent; Components: mod\vattic;
Filename: "{tmp}\homefront_ripper.bat"; Parameters:" ""{app}"" "; StatusMsg: "Running Homefront Ripper..."; Components: theme\ripper;
Filename: "{cmd}"; Parameters:"/c rd /s /q ""{app}\ripped"""; Description: "Delete Ripped Homefront files"; Flags: postinstall; Components: theme\ripper;

[UninstallRun]
;Filename: "{cmd}"; Parameters:"/c move ""{app}\ripped\*"" ""{app}"" "; Components: theme\ripper;

[Code]
const
  MD5_HomefrontStock = '0326ea202fcd7ceb3760d14bc8d07f63';
  MD5_LsaoStock = '8a92c275b504c96092d2398a169c0433';

var
  MD5_HomefrontTarget: string;
  MD5_LsaoTarget: string;

function NextButtonClick(PageId: Integer): Boolean;
begin
    Result := True;
    
    if (PageId = wpSelectDir) then begin
        if not FileExists(ExpandConstant('{app}\Bin64\Homefront2_Release.exe')) then begin
          MsgBox('Warning: Could not find Homefront game EXE within the selected folder. Please check your install path and try again.', mbCriticalError, MB_OK);
          Result := False;
        end;
    end;
    
    if (PageId = wpSelectComponents) then begin
      if IsComponentSelected('fix\neopatch') then begin
        if not FileExists(ExpandConstant('{app}\gamehf2\lsao_cached.pak')) then begin
            MsgBox('Warning: Could not find file "lsao_cached.pak" within the given folder. This file contains important TS2 game files and is required in order to continue. Please check your install path and try again.', mbCriticalError, MB_OK);
            Result := False;
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
  Result := '';
  
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
  
  
  MD5_HomefrontTarget := GetMD5OfFile(ExpandConstant('{app}\Bin64\Homefront2_Release.exe'));
  if (Result = '') and (MD5_HomefrontTarget <> MD5_HomefrontStock) then begin
    if MsgBox('Warning: The game EXE you are using is different than what was expected. Proceed anyway? Generated checksum: ' + MD5_HomefrontTarget, mbConfirmation, MB_YESNO) = IDNO then begin
      Result := 'MD5 Check Failed for "Homefront2_Release.exe". Generated checksum: ' + MD5_HomefrontTarget;
      Log('User chose to cancel setup due to incompatible Homefront2_Release.exe file. Generated checksum: ' + MD5_HomefrontTarget);
    end;
  end else begin;
    Log('Homefront2_Release.exe checksum verification passed.');
  end;
  
  
  if IsComponentSelected('fix\neopatch') then begin
    MD5_LsaoTarget := GetMD5OfFile(ExpandConstant('{app}\gamehf2\lsao_cached.pak'));
    if (Result = '') and (MD5_LsaoTarget <> MD5_LsaoStock) then begin
      Log('lsao_cached.pak checksum verification did NOT pass.');
      if MsgBox('Warning: The game data file "lsao_cached.pak" you are using is different than what was expected. Proceed anyway? Generated checksum: ' + MD5_LsaoTarget, mbConfirmation, MB_YESNO) = IDNO then begin
        Result := 'MD5 Check Failed for "lsao_cached.pak". Generated checksum: ' + MD5_LsaoTarget;
        Log('User chose to cancel setup due to incompatible laso_cached.pak file. Generated checksum: ' + MD5_LsaoTarget);
      end;
    end else begin;
      Log('lsao_cached.pak checksum verification passed.');
    end;
  end;
end;


procedure CurStepChanged(CurStep: TSetupStep);
begin
  if (CurStep = ssInstall) then begin
    
  end;
end;


// Credit: Martin Prikryl - via stackoverflow.com
procedure DeinitializeSetup();
var
  logfilepathname, logfilename, newfilepathname: string;
begin
  logfilepathname := ExpandConstant('{log}');
  logfilename := ExtractFileName(logfilepathname);
  // Set the new target path as the directory where the installer is being run from
  newfilepathname := ExpandConstant('{src}\') + 'TS2-Redux-' + logfilename;

  FileCopy(logfilepathname, newfilepathname, false);
end; 


[Messages]
BeveledLabel=Redux Tech Team
WelcomeLabel1=[name] Setup Wizard
WelcomeLabel2=This will install [name/ver] for Homefront: The Revolution.%n%nTS2 Redux is a fan-made project which aims to fix and enhance the port of TimeSplitters 2 (TS2) contained in Homefront: The Revolution. This project does NOT allow you to play Homefront or TS2 without owning a copy of Homefront: The Revolution. If you do not have Homefront yet, you must purchase it before using this installer.%n%nThis project was built using the Steam version of Homefront. If you are using a version other than the Steam version, you may continue, but TS2 Redux may or may not work properly.
FinishedHeadingLabel=Thanks for using [name]!
FinishedLabelNoIcons=Setup has finished installing [name] into your installed copy of Homefront.
FinishedLabel=Setup has finished installing [name] into your installed copy of Homefront: The Revolution. The mod will be active the next time you launch Homefront.%n%nTo launch straight into TS2 (bypassing Homefront's menus), use the TimeSplitters 2 launcher in your start menu (if chosen during installation).
ClickFinish=Click Finish to exit Setup.
LicenseLabel=TS2 Redux is an open-source project. The agreement below defines how the software provided can be used.
WizardSelectDir=Select Homefront Game Folder
SelectDirDesc=This setup wizard will try to find your Homefront game folder automatically for you. If the box below is blank, click Browse and select your Homefront game folder.