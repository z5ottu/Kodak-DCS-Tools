cameraTaskMamiya
00013B90-566C=E524
00013B90 94 21 FF 40                 stwu      r1, -0xC0(r1)
00013B94 7C 08 02 A6                 mflr      r0
00013B98 BD C1 00 78                 stmw      r14, 0xC0+var_48(r1)
00013B9C 90 01 00 C4                 stw       r0, 0xC0+arg_4(r1)
00013BA0 4B FF CE F5                 bl        cameraRegisterSettings 
00013BA4 3C 60 00 01                 lis       r3, mamiyaProperties@h
00013BA8 38 63 25 70                 addi      r3, r3, mamiyaProperties@l
00013BAC 38 80 00 02                 li        r4, 2
00013BB0 48 06 93 A1                 bl        propertyRegister 
00013BB4 3C 80 00 01                 lis       r4, cameraMamiyaMainMenu@h
00013BB8 60 84 28 DC                 ori       r4, r4, cameraMamiyaMainMenu@l
00013BBC 38 60 00 28                 li        r3, MAIN_MENU_SHOW
00013BC0 48 02 AB 61                 bl        eventHook 
00013BC4 4B FF D8 B1                 bl        cameraPinSetup 
00013BC8 3A C0 00 00                 li        r22, 0
00013BCC 3B 60 00 00                 li        r27, 0
00013BD0 39 60 00 00 loc_13BD0:      li        r11, 0
00013BD4 99 60 21 9F                 stb       r11, backState
00013BD8 3F E0 20 00                 lis       r31, IMMR@h
00013BDC 3B FF 00 00                 addi      r31, r31, IMMR@l
00013BE0 3A E0 7D 00                 li        r23, 0x7D00
00013BE4 81 80 21 AC                 lwz       r12, shutterMode
00013BE8 2C 0C 00 00                 cmpwi     r12, 0
00013BEC 40 82 00 0C                 bne       loc_13BF8
00013BF0 3E E0 00 03                 lis       r23, loc_30D40@h
00013BF4 62 F7 0D 40                 ori       r23, rTimeDelay, loc_30D40@l
00013BF8 7C C0 00 A6 loc_13BF8:      mfmsr     r6
00013BFC 7C 11 13 A6                 mtspr     eid, r0 # External interrupt disable
00013C00 4C 00 01 2C                 isync
00013C04 3C A0 00 01                 lis       r5, byte_8000@ha
00013C08 38 A5 80 00                 addi      r5, r5, byte_8000@l
00013C0C 7C C6 28 38                 and       r6, r6, r5
00013C10 7C 70 42 A6                 mfsprg0   r3
00013C14 54 63 08 3E                 rotlwi    r3, r3, 1     # r3 = (r3 << 1) | (r3 >> 31)
00013C18 7C 63 28 78                 andc      r3, r3, r5
00013C1C 7C 63 33 78                 or        r3, r3, r6
00013C20 7C 70 43 A6                 mtsprg0   r3
00013C24 81 9F 0A C4                 lwz       r12, (IMMR.PBDAT - IMMR)(r31)
00013C28 61 8C 00 01                 ori       r12, r12, 1
00013C2C 91 9F 0A C4                 stw       r12, (IMMR.PBDAT - IMMR)(r31)
00013C30 81 7F 0A C0                 lwz       r11, (IMMR.PBODR - IMMR)(r31)
00013C34 55 6B 00 3C                 clrrwi    r11, r11, 1   # r11 = r11 & 0xFFFFFFFE
00013C38 91 7F 0A C0                 stw       r11, (IMMR.PBODR - IMMR)(r31)
00013C3C 81 5F 0A B8                 lwz       r10, (IMMR.PBDIR - IMMR)(r31)
00013C40 61 4A 00 01                 ori       r10, r10, 1
00013C44 91 5F 0A B8                 stw       r10, (IMMR.PBDIR - IMMR)(r31)
00013C48 81 9F 0A BC                 lwz       r12, (IMMR.PBPAR - IMMR)(r31)
00013C4C 55 8C 00 3C                 clrrwi    r12, r12, 1   # r12 = r12 & 0xFFFFFFFE
00013C50 91 9F 0A BC                 stw       r12, (IMMR.PBPAR - IMMR)(r31)
00013C54 7C 90 42 A6                 mfsprg0   r4
00013C58 54 83 F8 3E                 rotrwi    r3, r4, 1     # r3 = (r4 << 31) | (r4 >> 1)
00013C5C 7C 70 43 A6                 mtsprg0   r3
00013C60 70 84 80 00                 andi.     r4, r4, 0x8000
00013C64 41 82 00 08                 beq       loc_13C6C
00013C68 7C 10 13 A6                 mtspr     eie, r0 # External interrupt enable
00013C6C 4C 00 01 2C loc_13C6C:      isync
00013C70 7C C0 00 A6                 mfmsr     r6
00013C74 7C 11 13 A6                 mtspr     eid, r0 # External interrupt disable
00013C78 4C 00 01 2C                 isync
00013C7C 3C A0 00 01                 lis       r5, byte_8000@ha
00013C80 38 A5 80 00                 addi      r5, r5, byte_8000@l
00013C84 7C C6 28 38                 and       r6, r6, r5
00013C88 7C 70 42 A6                 mfsprg0   r3
00013C8C 54 63 08 3E                 rotlwi    r3, r3, 1     # r3 = (r3 << 1) | (r3 >> 31)
00013C90 7C 63 28 78                 andc      r3, r3, r5
00013C94 7C 63 33 78                 or        r3, r3, r6
00013C98 7C 70 43 A6                 mtsprg0   r3
00013C9C A1 9F 09 60                 lhz       r12, (IMMR.PCDIR - IMMR)(r31)
00013CA0 55 8C 06 2C                 rlwinm    r12, r12, 0,24,22 # r12 = r12 & 0xFFFFFEFF
00013CA4 B1 9F 09 60                 sth       r12, (IMMR.PCDIR - IMMR)(r31)
00013CA8 A1 7F 09 64                 lhz       r11, (IMMR.PCSO - IMMR)(r31)
00013CAC 55 6B 06 2C                 rlwinm    r11, r11, 0,24,22 # r11 = r11 & 0xFFFFFEFF
00013CB0 B1 7F 09 64                 sth       r11, (IMMR.PCSO - IMMR)(r31)
00013CB4 A1 5F 09 66                 lhz       r10, (IMMR.PCDAT - IMMR)(r31)
00013CB8 55 4A 06 2C                 rlwinm    r10, r10, 0,24,22 # r10 = r10 & 0xFFFFFEFF
00013CBC B1 5F 09 66                 sth       r10, (IMMR.PCDAT - IMMR)(r31)
00013CC0 A1 9F 09 62                 lhz       r12, (IMMR.PCPAR - IMMR)(r31)
00013CC4 55 8C 06 2C                 rlwinm    r12, r12, 0,24,22 # r12 = r12 & 0xFFFFFEFF
00013CC8 B1 9F 09 62                 sth       r12, (IMMR.PCPAR - IMMR)(r31)
00013CCC 7C 90 42 A6                 mfsprg0   r4
00013CD0 54 83 F8 3E                 rotrwi    r3, r4, 1     # r3 = (r4 << 31) | (r4 >> 1)
00013CD4 7C 70 43 A6                 mtsprg0   r3
00013CD8 70 84 80 00                 andi.     r4, r4, 0x8000
00013CDC 41 82 00 08                 beq       loc_13CE4
00013CE0 7C 10 13 A6                 mtspr     eie, r0 # External interrupt enable
00013CE4 4C 00 01 2C loc_13CE4:      isync
00013CE8 89 60 21 9F loc_13CE8:      lbz       r11, backState
00013CEC 2C 0B 00 00                 cmpwi     r11, 0
00013CF0 40 82 02 1C                 bne       loc_13F0C
00013CF4 89 80 21 E9                 lbz       r12, camAwake
00013CF8 2C 0C 00 00                 cmpwi     r12, 0
00013CFC 40 82 00 34                 bne       loc_13D30
00013D00 89 80 21 E5                 lbz       r12, camSet
00013D04 2C 0C 00 00                 cmpwi     r12, 0
00013D08 40 82 00 28                 bne       loc_13D30
00013D0C 89 80 21 E6                 lbz       r12, camGet
00013D10 2C 0C 00 00                 cmpwi     r12, 0
00013D14 40 82 00 1C                 bne       loc_13D30
00013D18 89 80 21 48                 lbz       r12, takePicture
00013D1C 2C 0C 00 00                 cmpwi     r12, 0
00013D20 40 82 00 10                 bne       loc_13D30
00013D24 89 80 22 28                 lbz       r12, cameraWake
00013D28 2C 0C 00 00                 cmpwi     r12, 0
00013D2C 41 82 00 1C                 beq       loc_13D48
00013D30 38 60 FF FF loc_13D30:      li        r3, -1
00013D34 38 80 00 01                 li        r4, 1
00013D38 38 A0 03 E8                 li        r5, 1000
00013D3C 38 C0 00 00                 li        r6, 0
00013D40 48 06 53 D9                 bl        osEvPend 
00013D44 48 00 00 1C                 b         loc_13D60
00013D48 38 60 FF FF loc_13D48:      li        r3, -1
00013D4C 38 80 00 01                 li        r4, 1
00013D50 3C A0 00 4C                 lis       r5, 0x4C # 0x4C4B40 # 'L'
00013D54 60 A5 4B 40                 ori       r5, r5, 0x4B40 # 0x4C4B40
00013D58 38 C0 00 00                 li        r6, 0
00013D5C 48 06 53 BD                 bl        osEvPend 
00013D60 48 00 47 0D loc_13D60:      bl        cameraDialogCheck 
00013D64 38 7B 00 00                 addi      r3, r27, 0
00013D68 4B FF F5 19                 bl        cameraMessageSetupMamiya 
00013D6C 8B A0 21 A0                 lbz       r29, cameraReqCmd
00013D70 2C 1D 00 00                 cmpwi     r29, 0
00013D74 41 82 FF 74                 beq       loc_13CE8
00013D78 89 60 21 9F                 lbz       r11, backState
00013D7C 2C 0B 00 00                 cmpwi     r11, 0
00013D80 40 82 01 8C                 bne       loc_13F0C
00013D84 89 80 21 E9                 lbz       r12, camAwake
00013D88 2C 0C 00 00                 cmpwi     r12, 0
00013D8C 40 82 00 20                 bne       loc_13DAC
00013D90 48 08 59 8D                 bl        timeUsec 
00013D94 81 80 21 D0                 lwz       r12, bodySleepTime
00013D98 7C 6C 18 50                 subf      r3, r12, r3
00013D9C 3D 60 00 07                 lis       r11, loc_7A120@h
00013DA0 61 6B A1 20                 ori       r11, r11, loc_7A120@l
00013DA4 7C 03 58 40                 cmplw     r3, r11
00013DA8 41 81 00 10                 bgt       loc_13DB8
00013DAC 81 80 21 E0 loc_13DAC:      lwz       r12, backMessageCount
00013DB0 28 0C 00 02                 cmplwi    r12, 2
00013DB4 41 80 FF 34                 blt       loc_13CE8
00013DB8 48 08 59 65 loc_13DB8:      bl        timeUsec 
00013DBC 7C 76 18 50                 subf      r3, r22, r3
00013DC0 7C 03 B8 40                 cmplw     r3, r23
00013DC4 40 81 FF 24                 ble       loc_13CE8
00013DC8 89 80 21 EF                 lbz       r12, camReplyDelay
00013DCC 2C 0C 00 00                 cmpwi     r12, 0
00013DD0 41 82 00 18                 beq       loc_13DE8
00013DD4 48 08 59 49                 bl        timeUsec 
00013DD8 81 80 21 C4                 lwz       r12, lastMessageTime
00013DDC 7C 6C 18 50                 subf      r3, r12, r3
00013DE0 7C 03 B8 40                 cmplw     r3, r23
00013DE4 40 81 FF 04                 ble       loc_13CE8
00013DE8 38 BD 00 00 loc_13DE8:      addi      r5, r29, 0
00013DEC 38 60 00 C7                 li        r3, 0xC7 # 'Ã'
00013DF0 38 80 00 00                 li        r4, 0
00013DF4 48 02 9B 85                 bl        eventPost 
00013DF8 3A 40 00 01                 li        r18, 1
00013DFC 7C C0 00 A6                 mfmsr     r6
00013E00 7C 11 13 A6                 mtspr     eid, r0 # External interrupt disable
00013E04 4C 00 01 2C                 isync
00013E08 3C A0 00 01                 lis       r5, byte_8000@ha
00013E0C 38 A5 80 00                 addi      r5, r5, byte_8000@l
00013E10 7C C6 28 38                 and       r6, r6, r5
00013E14 7C 70 42 A6                 mfsprg0   r3
00013E18 54 63 08 3E                 rotlwi    r3, r3, 1     # r3 = (r3 << 1) | (r3 >> 31)
00013E1C 7C 63 28 78                 andc      r3, r3, r5
00013E20 7C 63 33 78                 or        r3, r3, r6
00013E24 7C 70 43 A6                 mtsprg0   r3
00013E28 A1 3F 09 66                 lhz       r9, (IMMR.PCDAT - IMMR)(r31)
00013E2C 61 29 01 00                 ori       r9, r9, 0x100
00013E30 B1 3F 09 66                 sth       r9, (IMMR.PCDAT - IMMR)(r31)
00013E34 A1 9F 09 64                 lhz       r12, (IMMR.PCSO - IMMR)(r31)
00013E38 55 8C 06 2C                 rlwinm    r12, r12, 0,24,22 # r12 = r12 & 0xFFFFFEFF
00013E3C B1 9F 09 64                 sth       r12, (IMMR.PCSO - IMMR)(r31)
00013E40 A1 7F 09 60                 lhz       r11, (IMMR.PCDIR - IMMR)(r31)
00013E44 61 6B 01 00                 ori       r11, r11, 0x100
00013E48 B1 7F 09 60                 sth       r11, 0x960(r31)
00013E4C A1 5F 09 62                 lhz       r10, 0x962(r31)
00013E50 55 4A 06 2C                 rlwinm    r10, r10, 0,24,22 # r10 = r10 & 0xFFFFFEFF
00013E54 B1 5F 09 62                 sth       r10, 0x962(r31)
00013E58 7C 90 42 A6                 mfsprg0   r4
00013E5C 54 83 F8 3E                 rotrwi    r3, r4, 1     # r3 = (r4 << 31) | (r4 >> 1)
00013E60 7C 70 43 A6                 mtsprg0   r3
00013E64 70 84 80 00                 andi.     r4, r4, 0x8000
00013E68 41 82 00 08                 beq       loc_13E70
00013E6C 7C 10 13 A6                 mtspr     eie, r0 # External interrupt enable
00013E70 4C 00 01 2C loc_13E70:      isync
00013E74 38 60 0B B8                 li        r3, 3000
00013E78 48 08 5A 41                 bl        waitUsec 
00013E7C 7C C0 00 A6                 mfmsr     r6
00013E80 7C 11 13 A6                 mtspr     eid, r0 # External interrupt disable
00013E84 4C 00 01 2C                 isync
00013E88 3C A0 00 01                 lis       r5, byte_8000@ha
00013E8C 38 A5 80 00                 addi      r5, r5, byte_8000@l
00013E90 7C C6 28 38                 and       r6, r6, r5
00013E94 7C 70 42 A6                 mfsprg0   r3
00013E98 54 63 08 3E                 rotlwi    r3, r3, 1     # r3 = (r3 << 1) | (r3 >> 31)
00013E9C 7C 63 28 78                 andc      r3, r3, r5
00013EA0 7C 63 33 78                 or        r3, r3, r6
00013EA4 7C 70 43 A6                 mtsprg0   r3
00013EA8 A1 7F 09 60                 lhz       r11, 0x960(r31)
00013EAC 55 6B 06 2C                 rlwinm    r11, r11, 0,24,22 # r11 = r11 & 0xFFFFFEFF
00013EB0 B1 7F 09 60                 sth       r11, 0x960(r31)
00013EB4 A1 5F 09 64                 lhz       r10, 0x964(r31)
00013EB8 55 4A 06 2C                 rlwinm    r10, r10, 0,24,22 # r10 = r10 & 0xFFFFFEFF
00013EBC B1 5F 09 64                 sth       r10, 0x964(r31)
00013EC0 A1 9F 09 66                 lhz       r12, 0x966(r31)
00013EC4 55 8C 06 2C                 rlwinm    r12, r12, 0,24,22 # r12 = r12 & 0xFFFFFEFF
00013EC8 B1 9F 09 66                 sth       r12, 0x966(r31)
00013ECC A1 7F 09 62                 lhz       r11, 0x962(r31)
00013ED0 55 6B 06 2C                 rlwinm    r11, r11, 0,24,22 # r11 = r11 & 0xFFFFFEFF
00013ED4 B1 7F 09 62                 sth       r11, 0x962(r31)
00013ED8 7C 90 42 A6                 mfsprg0   r4
00013EDC 54 83 F8 3E                 rotrwi    r3, r4, 1     # r3 = (r4 << 31) | (r4 >> 1)
00013EE0 7C 70 43 A6                 mtsprg0   r3
00013EE4 70 84 80 00                 andi.     r4, r4, 0x8000
00013EE8 41 82 00 08                 beq       loc_13EF0
00013EEC 7C 10 13 A6                 mtspr     eie, r0 # External interrupt enable
00013EF0 4C 00 01 2C loc_13EF0:      isync
00013EF4 38 60 03 E8                 li        r3, 1000
00013EF8 48 08 59 C1                 bl        waitUsec 
00013EFC 48 08 58 21                 bl        timeUsec 
00013F00 3A C3 00 00                 addi      r22, r3, 0
00013F04 3B 7B 00 01                 addi      r27, r27, 1
00013F08 4B FF FD E0                 b         loc_13CE8
00013F0C 48 08 58 11 loc_13F0C:      bl        timeUsec 
00013F10 3A C3 00 00                 addi      r22, r3, 0
00013F14 3B 60 00 00                 li        r27, 0
00013F18 38 61 00 08                 addi      r3, r1, 0xC0+var_B8
00013F1C 38 80 00 00                 li        r4, 0
00013F20 38 A0 00 2C                 li        r5, 0x2C # ','
00013F24 48 09 73 D1                 bl        memset 
00013F28 38 61 00 34                 addi      r3, r1, 0xC0+var_8C
00013F2C 38 80 00 00                 li        r4, 0
00013F30 38 A0 00 2C                 li        r5, 0x2C # ','
00013F34 48 09 73 C1                 bl        memset 
00013F38 39 20 00 AA                 li        r9, 0xAA # '¬'
00013F3C 99 21 00 33                 stb       r9, 0xC0+var_8D(r1)
00013F40 89 60 21 9F loc_13F40:      lbz       r11, backState
00013F44 2C 0B 00 01                 cmpwi     r11, 1
00013F48 40 82 00 1C                 bne       loc_13F64
00013F4C 38 60 FF FF                 li        r3, -1
00013F50 38 80 00 01                 li        r4, 1
00013F54 38 A0 03 E8                 li        r5, 0x3E8
00013F58 38 C0 00 00                 li        r6, 0
00013F5C 48 06 51 BD                 bl        osEvPend 
00013F60 4B FF FF E0                 b         loc_13F40
00013F64 89 60 21 9F loc_13F64:      lbz       r11, backState
00013F68 2C 0B 00 02                 cmpwi     r11, 2
00013F6C 40 82 FC 64                 bne       loc_13BD0
00013F70 8B 80 21 9C                 lbz       r28, cameraRxBytes
00013F74 8B 00 21 9D                 lbz       r24, msgHeaderLength
00013F78 38 61 00 08                 addi      r3, r1, 0xC0+var_B8
00013F7C 3C 80 20 00                 lis       r4, cameraRxBuffer@h
00013F80 60 84 20 20                 ori       r4, r4, cameraRxBuffer@l
00013F84 38 BC 00 00                 addi      r5, r28, 0
00013F88 48 09 72 29                 bl        memcpy 
00013F8C 38 61 00 34                 addi      r3, r1, 0xC0+var_8C
00013F90 3C 80 20 00                 lis       r4, cameraTxBuffer@h
00013F94 60 84 20 60                 ori       r4, r4, cameraTxBuffer@l
00013F98 38 BC 00 00                 addi      r5, r28, 0
00013F9C 48 09 72 15                 bl        memcpy 
00013FA0 39 60 00 00                 li        r11, 0
00013FA4 99 60 21 9F                 stb       r11, backState
00013FA8 38 61 00 08                 addi      r3, r1, 0xC0+var_B8
00013FAC 7C 63 E2 14                 add       r3, r3, r28
00013FB0 89 83 FF FF                 lbz       r12,
00013FB4 2C 0C 00 AA                 cmpwi     r12, 0xAA
00013FB8 40 82 00 18                 bne       loc_13FD0
00013FBC 89 83 FF FE                 lbz       r12,
00013FC0 2C 0C 00 00                 cmpwi     r12, 0
00013FC4 41 82 00 0C                 beq       loc_13FD0
00013FC8 39 80 00 01                 li        r12, 1
00013FCC 99 80 22 2A                 stb       r12, mamiyaSerialV1
00013FD0 38 61 00 08 loc_13FD0:      addi      r3, r1, 0xC0+var_B8
00013FD4 7C 63 C2 14                 add       r3, r3, r24
00013FD8 38 81 00 34                 addi      r4, r1, 0xC0+var_8C
00013FDC 7C 84 C2 14                 add       r4, r4, r24
00013FE0 4B FF EA 49                 bl        cameraMessageMamiya 
00013FE4 89 40 20 8C                 lbz       r10, cameraWatch
00013FE8 2C 0A 00 00                 cmpwi     r10, 0
00013FEC 40 82 00 10                 bne       loc_13FFC
00013FF0 89 80 21 B1                 lbz       r12, cameraLogWatch
00013FF4 2C 0C 00 00                 cmpwi     r12, 0
00013FF8 41 82 FB D8                 beq       loc_13BD0
00013FFC 38 61 00 08 loc_13FFC:      addi      r3, r1, 0xC0+var_B8
00014000 38 81 00 34                 addi      r4, r1, 0xC0+var_8C
00014004 38 BC 00 00                 addi      r5, r28, 0
00014008 38 C0 00 01                 li        r6, 1
0001400C 4B FF D2 E1                 bl        cameraSpiLog 
00014010 4B FF FB C0                 b         loc_13BD0
00014014 B9 C1 00 78                 lmw       r14, 0xC0+var_48(r1)
00014018 80 01 00 C4                 lwz       r0, 0xC0+arg_4(r1)
0001401C 7C 08 03 A6                 mtlr      r0
00014020 38 21 00 C0                 addi      r1, r1, 0xC0
00014024 4E 80 00 20                 blr
