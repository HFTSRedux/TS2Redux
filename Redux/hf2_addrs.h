#pragma once

#include "hf2_structs.h"


#define PRE_SECTION_NAME	".reloc2$a"
#define SECTION_NAME		".reloc2$m"
#define POST_SECTION_NAME	".reloc2$z"

#define NOP ((BYTE) 0x90)

#pragma section(PRE_SECTION_NAME)
#pragma section(SECTION_NAME)
#pragma section(POST_SECTION_NAME)

#define SECTION(name) __declspec(allocate(name))

SECTION(PRE_SECTION_NAME) void * CustomRelocStart = 0;
SECTION(POST_SECTION_NAME) void * CustomRelocEnd = 0;

#define RELOC_PTR(name, type, offset) SECTION(SECTION_NAME) type volatile name = (type)offset;
#define RELOC_FUNC(name, return_type, params, offset) \
	typedef return_type (__fastcall *volatile name##_type)params; \
	SECTION(SECTION_NAME) name##_type name = (name##_type) offset;


RELOC_PTR(ts2MainMenuHijack, uint64_t *, 0x24f2db0);
//menu_struct* (*ts2CreateMenu)(astruct_2*, int) = (void*)0x10dadf8;
RELOC_FUNC(ts2CreateMenu, menu_struct *, (astruct_2 *, int), 0x10dadf8);
RELOC_FUNC(ts2CreateMenuEntry, button_menu_entry*, (menu_struct*, uint, uint), 0x10e05c4);
RELOC_FUNC(ts2LoadStoryPage, void, (void), 0x10c817c);
RELOC_FUNC(ts2GotoArcadePage, void, (void), 0x10c8194);
RELOC_FUNC(ts2GotoChallengePage, void, (void), 0x10c81a0);
RELOC_FUNC(ts2GotoNetworkPage, void, (void), 0x10c0d74);
RELOC_FUNC(ts2GotoOptionsPage, void, (void), 0x10c3c48);
RELOC_FUNC(ts2Quit, void, (void), 0x10c0d80);
RELOC_FUNC(ts2UnknownMenuFunc1, ULONGLONG, (button_menu_entry *), 0x10de308);
RELOC_FUNC(ts2UnknownMenuFunc2, int, (menu_struct *), 0x10de368);
RELOC_FUNC(ts2UnknownMenuFunc3, int, (menu_struct *), 0x10de378);
RELOC_FUNC(ts2UnknownMenuFunc4, void, (menu_struct *), 0x10deebc);
RELOC_FUNC(ts2UnknownMenuFunc5, void, (menu_struct *, int), 0x10de0ac);
RELOC_FUNC(ts2UnknownMenuFunc6, void, (menu_struct *), 0x10dd97c);
RELOC_FUNC(ts2UnknownMenuFunc7, void, (astruct_2 *, int), 0x10b3ccc);
RELOC_FUNC(ts2SetNextPage, void, (void *), 0x10b4948);
RELOC_PTR(ts2OptionsPage, void *, 0x24f1d78);
RELOC_PTR(hf2SkipIntro, UCHAR *, 0xd9f6c4);
RELOC_PTR(ts2Profiles, UCHAR **, 0x3f2f468);
RELOC_PTR(ts2PageStructFunc1, void*, 0x10c6e74);
RELOC_PTR(ts2PageStructFunc2, void*, 0x10c1e9c);
RELOC_PTR(ts2NetworkRecv, void **, 0x3f1d610);
RELOC_PTR(ts2NetworkSend, void **, 0x3f1d708);
RELOC_PTR(ts2MysteryNetworkStruct, struct ts2NetworkFunctions ***, 0x2479228);
RELOC_PTR(ts2Tmp, uint32_t *, 0x3f2f94c);
RELOC_PTR(bMultiplayer, UCHAR *, 0x24792c1);
RELOC_FUNC(ts2DisplayBanner1, uint32_t, (const char *), 0x121cd00);
RELOC_FUNC(ts2SetFontDetails, uint32_t, (int), 0x121bb24);
RELOC_PTR(ts2SelectProfilePage, void *, 0x24f2dc0);
RELOC_PTR(ts2MapmakerPage, void *, 0x24f1a50);

// EXE Patches
RELOC_PTR(ts2InExtrasCheck, BYTE *, 0x15EDB5);

/*
TS2 Page Notes:
{
   funcptr tick/status/?; // Called 10 times per second, can be used to dynamically update / change page
*/

#define TS2_PROFILE_SIZE 0x20e4
#define TS2_NUM_PROFILES 16
