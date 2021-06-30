// dllmain.cpp : Defines the entry point for the DLL application.
#include "pch.h"
#include "hf2_addrs.h"
#include <stdio.h>
#include <tchar.h>
#include <inttypes.h>

extern "C"
void* _ReturnAddress(void);
#pragma intrinsic(_ReturnAddress)

#define printf(...) printf2(__VA_ARGS__)
#define logf(...) printf("%s:%d:%s() - ", __FILE__, __LINE__, __func__); printf(__VA_ARGS__)
#define PROFILE_FILENAME "TS2Save.bin"
#define LOG_FILENAME "Redux.log"

struct ts2Page reduxProfileSaveLoadPage = { 0 };

static bool gEnd = false;

int printf2(const char* format, ...) {
    char str[4096];
    static HANDLE logFile = NULL;

    if (logFile == NULL) {
		logFile = CreateFile2(_T(LOG_FILENAME), GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE, CREATE_ALWAYS, NULL);
    }

    va_list argptr;
    va_start(argptr, format);
    int ret = vsnprintf(str, sizeof(str), format, argptr);

    DWORD bytesWritten;
    if (!WriteFile(logFile, str, ret, &bytesWritten, NULL)) {
        MessageBox(NULL, _T("Failed to write to log!"), NULL, MB_OK | MB_ICONERROR);
    }

    FlushFileBuffers(logFile);

    return ret;
}


void __fastcall testFunc0(void* param_1, uint64_t param_2) {
    logf("(%" PRIXPTR ", %" PRIX64 "), called from %" PRIXPTR "\n", param_1, param_2, _ReturnAddress());
}

void __fastcall testFunc1(void* param_1, uint64_t param_2, uint64_t param_3) {
    logf("(%" PRIXPTR ", %" PRIX64 ", %" PRIX64 "), called from %" PRIXPTR "\n", param_1, param_2, param_3,  _ReturnAddress());
}

void __fastcall testFunc2(void* param_1, uint64_t param_2, uint64_t param_3) {
    logf("(%" PRIXPTR ", %" PRIX64 ", %" PRIX64 "), called from %" PRIXPTR "\n", param_1, param_2, param_3,  _ReturnAddress());
}

void __fastcall testFunc3(void* param_1, uint64_t param_2, uint64_t param_3, uint64_t param_4) {
    logf("(%" PRIXPTR ", %" PRIX64 ", %" PRIX64 ", %" PRIX64 "), called from %" PRIXPTR "\n", param_1, param_2, param_3, param_4,    _ReturnAddress());
}

void __fastcall testFunc4(void* param_1, uint64_t param_2, uint64_t param_3, uint64_t param_4) {
    logf("(%" PRIXPTR ", %" PRIX64 ", %" PRIX64 ", %" PRIX64 "), called from %" PRIXPTR "\n", param_1, param_2, param_3, param_4,    _ReturnAddress());
}



struct ts2NetworkFunctions netFuncs = {
    testFunc0, testFunc1, testFunc2, testFunc3, testFunc4,
};

struct ts2NetworkFunctions * pnetFuncs = &netFuncs;



void initAddrs(void *baseAddress) {
    void** walker = &CustomRelocStart;

    while (walker < &CustomRelocEnd) {
        if (walker != 0) {
			*walker = (void *)((uint64_t)*walker + (uint64_t)baseAddress);
        }
        walker++;
    }
}

void saveTs2Profile() {
    if (*ts2Profiles == NULL) {
        logf("*ts2Profiles == NULL\n");
        return;
    }

    HANDLE profileFile = CreateFile2(_T(PROFILE_FILENAME), GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE, CREATE_ALWAYS, NULL);

    if (profileFile == INVALID_HANDLE_VALUE) {
        logf("profileFile == INVALID_HANDLE_VALUE\n");
        return;
    }

    DWORD bytesWritten;

    if (!WriteFile(profileFile, *ts2Profiles, TS2_PROFILE_SIZE, &bytesWritten, NULL)) {
        logf("Something went wrong writing file!\n");
    }
}

void loadTs2Profile() {
    if (*ts2Profiles == NULL) {
        logf("*ts2Profiles == NULL\n");
        return;
    }

    OFSTRUCT ofStruct = { 0 };
    HFILE profileFile = OpenFile(PROFILE_FILENAME, &ofStruct, OF_READ);

    if (profileFile == HFILE_ERROR) {
        logf("Something went wrong opening the file!\n");
    }

    DWORD bytesWritten;

    if (!ReadFile((HANDLE)profileFile, *ts2Profiles, TS2_PROFILE_SIZE, &bytesWritten, NULL)) {
        logf("Something went wrong writing the file!\n");
    }

    if (bytesWritten != TS2_PROFILE_SIZE) {
        printf("Only wrote %d / %d bytes!\n", bytesWritten, TS2_PROFILE_SIZE);
    }

    CloseHandle((HANDLE)profileFile);
}


void ts2AlternateGotoOptionsPage(void) {
    ts2SetNextPage(ts2OptionsPage);
}

void ts2GotoSelectProfilePage(void) {
    ts2SetNextPage(ts2SelectProfilePage);
}

void ts2GotoMapmakerPage(void) {
    ts2SetNextPage(ts2MapmakerPage);
}

button_menu_entry* reduxNewMenuEntry(
    menu_struct* menuPtr, int unk1, int unk2, uint32_t font_details, const char* label,
    int unk3, int unk4, void (*button_action)(void)) {
    button_menu_entry *menu_entry = ts2CreateMenuEntry(menuPtr, unk1, unk2);
    menu_entry->font_details = font_details;
    menu_entry->label = label;
    menu_entry->field_0x40 = unk3;
    menu_entry->field_0x58 = ts2UnknownMenuFunc1(menu_entry);
    menu_entry->field_0x5c = unk4;
    menu_entry->button_action = button_action;

    return menu_entry;
}

void reduxGotoProfileSaveLoadPage(void) {
    ts2SetNextPage(&reduxProfileSaveLoadPage);
}

void reduxProfileSaveLoadMenu(astruct_2* param_1) {
    param_1->menu_name = "Redux Profile Save/Load";
    param_1->field_0x660 = 0x21;
    param_1->field_0x658 = 0xf2;
    param_1->field_0x65c = 0x3E0;

    menu_struct* menuPtr = ts2CreateMenu(param_1, 600);

    button_menu_entry* saveProfile = reduxNewMenuEntry(menuPtr, 0x49, 0x100, 0x15, "Save Profile", 3, 5, saveTs2Profile);
    button_menu_entry* loadProfile = reduxNewMenuEntry(menuPtr, 0x49, 0x100, 0x15, "Load Profile", 3, 5, loadTs2Profile);

    menuPtr->field_0x2c = 0;
    menuPtr->field_0x28 = menuPtr->field_0x1c;
    menuPtr->field_0x30 = menuPtr->field_0x1c;
    menuPtr->field_0x34 = 0x5a;
    menuPtr->field_0x38 = 0x36;
    menuPtr->x_coord = (float)ts2UnknownMenuFunc2(menuPtr);
    menuPtr->field_0x64 = 0.2;
    menuPtr->y_coord = (float)ts2UnknownMenuFunc3(menuPtr);

    strcpy_s(menuPtr->field_0x19c, "\v2 Select");
    strcpy_s(menuPtr->field_0x21c, "\v1 Back");

    menuPtr->field_0x198 = 2;
    menuPtr->field_0x194 = param_1->field_0x65c + 10.54688;
    ts2UnknownMenuFunc4(menuPtr);
    ts2UnknownMenuFunc5(menuPtr, 0);
    ts2UnknownMenuFunc6(menuPtr);
    param_1->field_0x10 = param_1->field_0x10 | 0x10;

    ts2UnknownMenuFunc7(param_1, 0);
}

void alternateTs2MainMenu(astruct_2* param_1) {
    static bool firstCall = true;

    if (firstCall) {
        // Do things only on the first call to main menu.
        // Intended to interact after RadicalProc has started and intialization is done.
        firstCall = false;

        printf("ts2NetworkRecv == %" PRIXPTR "\n", ts2NetworkRecv);
        printf("*ts2NetworkRecv == %" PRIXPTR "\n", *ts2NetworkRecv);
        printf("ts2NetworkSend == %" PRIXPTR "\n", ts2NetworkSend);
        printf("*ts2NetworkSend == %" PRIXPTR "\n", *ts2NetworkSend);
        printf("*ts2MysteryNetworkStruct == %" PRIXPTR "\n", *ts2MysteryNetworkStruct);
        printf("ts2Tmp == %" PRIXPTR "\n", ts2Tmp);
        printf("*ts2Tmp == %" PRIX32"\n", *ts2Tmp);
        *ts2Tmp = 4;
        printf("*ts2Tmp == %" PRIX32"\n", *ts2Tmp);

        *ts2MysteryNetworkStruct = &pnetFuncs;
        *bMultiplayer = '\x01';
    }

    // Unknown chunk
    param_1->menu_name = NULL;
    param_1->field_0x660 = 0xb;
    param_1->field_0x658 = 0x00;
    param_1->field_0x65c = 0x3E0;

    menu_struct* menuPtr = ts2CreateMenu(param_1, 0x294);

    // Story
    button_menu_entry* storyButton = reduxNewMenuEntry(menuPtr, 0x49, 0x100, 0x15, "Story", 3, 5, ts2LoadStoryPage);

    // Arcade
    button_menu_entry* arcadeButton = reduxNewMenuEntry(menuPtr, 0x49, 0x100, 0x15, "Arcade", 3, 5, ts2GotoArcadePage);

    // Challenge
    button_menu_entry* challengeButton = reduxNewMenuEntry(menuPtr, 0x49, 0x100, 0x15, "Challenge", 3, 5, ts2GotoChallengePage);

    // Network
    button_menu_entry* networkButton = reduxNewMenuEntry(menuPtr, 0x49, 0x100, 0x15, "Network", 3, 5, ts2GotoNetworkPage);

    // Options
    button_menu_entry* optionsButton = reduxNewMenuEntry(menuPtr, 0x49, 0x100, 0x15, "Options", 3, 5, ts2AlternateGotoOptionsPage);

    // Redux Profile Save/Load
    button_menu_entry* saveLoadButton = reduxNewMenuEntry(menuPtr, 0x49, 0x100, 0x15, "Save/Load", 3, 5, reduxGotoProfileSaveLoadPage);

    // Select Profile
    //button_menu_entry* selectProfileButton = reduxNewMenuEntry(menuPtr, 0x49, 0x100, 0x15, "Select Profile", 3, 5, ts2GotoSelectProfilePage);

    // Mapmaker
    //button_menu_entry* mapmakerButton = reduxNewMenuEntry(menuPtr, 0x49, 0x100, 0x15, "Mapmaker", 3, 5, ts2GotoMapmakerPage);

    // Quit
    button_menu_entry* quitButton = reduxNewMenuEntry(menuPtr, 0x49, 0x100, 0x15, "Quit", 3, 5, ts2Quit);

    menuPtr->field_0x2c = 0;
    menuPtr->field_0x28 = menuPtr->field_0x1c;
    menuPtr->field_0x30 = menuPtr->field_0x1c;
    menuPtr->field_0x34 = 0x5a;
    menuPtr->field_0x38 = 0x36;
    menuPtr->x_coord = (float)ts2UnknownMenuFunc2(menuPtr);
    menuPtr->field_0x64 = 0.2;
    menuPtr->y_coord = (float)ts2UnknownMenuFunc3(menuPtr) + 158.2031;

    strcpy_s(menuPtr->field_0x19c, "\v2 Select");
    strcpy_s(menuPtr->field_0x21c, "\v1 Back");

    menuPtr->field_0x198 = 2;
    menuPtr->field_0x194 = param_1->field_0x65c + 10.54688;
    ts2UnknownMenuFunc4(menuPtr);
    ts2UnknownMenuFunc5(menuPtr, 0);
    ts2UnknownMenuFunc6(menuPtr);
    param_1->field_0x10 = param_1->field_0x10 | 0x10;

    ts2UnknownMenuFunc7(param_1, 0);
}

void hexdump(void* addr, uint len) {
    char ascii[17] = { 0 };
    BYTE* walker = (BYTE*)addr;

    while (len > 0 ) {
		printf("%08X: ", walker);
		for (uint i = 0; i < 16; i++) {
			if (i % 8 == 0) {
				printf(" ");
			}
			if (i < len) {
				printf("%02X ", walker[i]);
				char c = walker[i];
				if (c >= 0x20 && c <= 0x7f) {
					ascii[i] = c;
				}
				else {
					ascii[i] = '.';
				}
			}
			else {
				printf("  ");
				ascii[i] = ' ';
			}
		}
		printf("%s\n", ascii);

        if (len >= 16) {
            len -= 16;
        }
        else {
            len = 0;
        }
		walker = &walker[16];
	}
}

BOOL APIENTRY DllMain( HMODULE hModule, DWORD  ul_reason_for_call, LPVOID lpReserved) {
    switch (ul_reason_for_call) {
    case DLL_THREAD_ATTACH:
    case DLL_THREAD_DETACH:
    case DLL_PROCESS_DETACH:
        gEnd = true;
        return TRUE;
    case DLL_PROCESS_ATTACH:
        break;
    }

    AllocConsole();
    printf("Redux: DllMain\n");

    HINSTANCE rootModule = GetModuleHandle(NULL);

    printf("Base Address: %" PRIXPTR "\n", rootModule);

    initAddrs(rootModule);

    reduxProfileSaveLoadPage.unk1_func = ts2PageStructFunc1;
    reduxProfileSaveLoadPage.unk2_func = ts2PageStructFunc2;
    reduxProfileSaveLoadPage.menu_func = reduxProfileSaveLoadMenu;

    hexdump(&reduxProfileSaveLoadPage, sizeof(reduxProfileSaveLoadPage));

    *ts2MainMenuHijack = (uint64_t)alternateTs2MainMenu;

    return TRUE;
}

