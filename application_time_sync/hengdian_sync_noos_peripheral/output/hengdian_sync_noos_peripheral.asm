
========================================================================

** ELF Header Information

    File Name: C:\ING_SDK\app\hengdian_sync_noos_peripheral\output\hengdian_sync_noos_peripheral.axf

    Machine class: ELFCLASS32 (32-bit)
    Data encoding: ELFDATA2LSB (Little endian)
    Header version: EV_CURRENT (Current version)
    Operating System ABI: none
    ABI Version: 0
    File Type: ET_EXEC (Executable) (2)
    Machine: EM_ARM (ARM)

    Image Entry point: 0x00024009
    Flags: EF_ARM_HASENTRY + EF_ARM_ABI_FLOAT_SOFT (0x05000202)

    ARM ELF revision: 5 (ABI version 2)

    Conforms to Soft float procedure-call standard

    Built with
    Component: ARM Compiler 6.16 Tool: armasm [5dfea300]
    Component: ARM Compiler 6.16 Tool: armlink [5dfeaa00]

    Header size: 52 bytes (0x34)
    Program header entry size: 32 bytes (0x20)
    Section header entry size: 40 bytes (0x28)

    Program header entries: 1
    Section header entries: 15

    Program header offset: 83364 (0x000145a4)
    Section header offset: 83396 (0x000145c4)

    Section header string table index: 14

========================================================================

** Program header #0 (PT_LOAD) [PF_X + PF_W + PF_R + PF_ARM_ENTRY]
    Size : 13976 bytes (9680 bytes in file)
    Virtual address: 0x00024000 (Alignment 8)


========================================================================

** Section #1 'ER_IROM1' (SHT_PROGBITS) [SHF_ALLOC + SHF_EXECINSTR]
    Size   : 9504 bytes (alignment 4)
    Address: 0x00024000

    $d.realdata
    RESET
    __Vectors
        0x00024000:    20002710    .'.     DCD    536880912
        0x00024004:    0002401d    .@..    DCD    147485
    $t
    .ARM.Collect$$$$00000000
    .ARM.Collect$$$$00000001
    __main
    _main_stk
        0x00024008:    f8dfd00c    ....    LDR      sp,__lit__00000000 ; [0x24018] = 0x20002710
    .ARM.Collect$$$$00000004
    _main_scatterload
        0x0002400c:    f000f812    ....    BL       __scatterload ; 0x24034
    .ARM.Collect$$$$00000008
    .ARM.Collect$$$$0000000A
    .ARM.Collect$$$$0000000B
    __main_after_scatterload
    _main_clock
    _main_cpp_init
    _main_init
        0x00024010:    4800        .H      LDR      r0,[pc,#0] ; [0x24014] = 0x24025
        0x00024012:    4700        .G      BX       r0
    $d
        0x00024014:    00024025    %@..    DCD    147493
    .ARM.Collect$$$$00002712
    __lit__00000000
    .ARM.Collect$$$$0000000D
    .ARM.Collect$$$$0000000F
    __rt_final_cpp
    __rt_final_exit
        0x00024018:    20002710    .'.     DCD    536880912
    $t
    .text
    Reset_Handler
        0x0002401c:    b502        ..      PUSH     {r1,lr}
        0x0002401e:    4803        .H      LDR      r0,[pc,#12] ; [0x2402c] = 0x24035
        0x00024020:    4700        .G      BX       r0
    $d
        0x00024022:    0000        ..      DCW    0
    $t
    main
        0x00024024:    4802        .H      LDR      r0,[pc,#8] ; [0x24030] = 0x24a0d
        0x00024026:    4780        .G      BLX      r0
        0x00024028:    bd02        ..      POP      {r1,pc}
    $d
        0x0002402a:    0000        ..      DCW    0
        0x0002402c:    00024035    5@..    DCD    147509
        0x00024030:    00024a0d    .J..    DCD    150029
    $t
    .text
    __scatterload
    __scatterload_rt2
        0x00024034:    4c06        .L      LDR      r4,[pc,#24] ; [0x24050] = 0x26500
        0x00024036:    4d07        .M      LDR      r5,[pc,#28] ; [0x24054] = 0x26520
        0x00024038:    e006        ..      B        0x24048 ; __scatterload + 20
        0x0002403a:    68e0        .h      LDR      r0,[r4,#0xc]
        0x0002403c:    f0400301    @...    ORR      r3,r0,#1
        0x00024040:    e8940007    ....    LDM      r4,{r0-r2}
        0x00024044:    4798        .G      BLX      r3
        0x00024046:    3410        .4      ADDS     r4,r4,#0x10
        0x00024048:    42ac        .B      CMP      r4,r5
        0x0002404a:    d3f6        ..      BCC      0x2403a ; __scatterload + 6
        0x0002404c:    f7ffffe0    ....    BL       __main_after_scatterload ; 0x24010
    $d
        0x00024050:    00026500    .e..    DCD    156928
        0x00024054:    00026520     e..    DCD    156960
    $t
    .text
    ___aeabi_memcpy4$move
    ___aeabi_memcpy8$move
    __aeabi_memcpy
    __aeabi_memmove
    __aeabi_memmove4
    __aeabi_memmove8
        0x00024058:    b510        ..      PUSH     {r4,lr}
        0x0002405a:    1a43        C.      SUBS     r3,r0,r1
        0x0002405c:    4293        .B      CMP      r3,r2
        0x0002405e:    d209        ..      BCS      0x24074 ; ___aeabi_memcpy4$move + 28
        0x00024060:    1883        ..      ADDS     r3,r0,r2
        0x00024062:    1888        ..      ADDS     r0,r1,r2
        0x00024064:    e003        ..      B        0x2406e ; ___aeabi_memcpy4$move + 22
        0x00024066:    f8101d01    ....    LDRB     r1,[r0,#-1]!
        0x0002406a:    f8031d01    ....    STRB     r1,[r3,#-1]!
        0x0002406e:    1e52        R.      SUBS     r2,r2,#1
        0x00024070:    d2f9        ..      BCS      0x24066 ; ___aeabi_memcpy4$move + 14
        0x00024072:    bd10        ..      POP      {r4,pc}
        0x00024074:    ea400301    @...    ORR      r3,r0,r1
        0x00024078:    079b        ..      LSLS     r3,r3,#30
        0x0002407a:    d003        ..      BEQ      0x24084 ; ___aeabi_memcpy4$move + 44
        0x0002407c:    e009        ..      B        0x24092 ; ___aeabi_memcpy4$move + 58
        0x0002407e:    c908        ..      LDM      r1!,{r3}
        0x00024080:    1f12        ..      SUBS     r2,r2,#4
        0x00024082:    c008        ..      STM      r0!,{r3}
        0x00024084:    2a04        .*      CMP      r2,#4
        0x00024086:    d2fa        ..      BCS      0x2407e ; ___aeabi_memcpy4$move + 38
        0x00024088:    e003        ..      B        0x24092 ; ___aeabi_memcpy4$move + 58
        0x0002408a:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x0002408e:    f8003b01    ...;    STRB     r3,[r0],#1
        0x00024092:    1e52        R.      SUBS     r2,r2,#1
        0x00024094:    d2f9        ..      BCS      0x2408a ; ___aeabi_memcpy4$move + 50
        0x00024096:    bd10        ..      POP      {r4,pc}
    .text
    __aeabi_memset
    __aeabi_memset4
    __aeabi_memset8
        0x00024098:    b2d2        ..      UXTB     r2,r2
        0x0002409a:    e001        ..      B        0x240a0 ; __aeabi_memset + 8
        0x0002409c:    f8002b01    ...+    STRB     r2,[r0],#1
        0x000240a0:    1e49        I.      SUBS     r1,r1,#1
        0x000240a2:    d2fb        ..      BCS      0x2409c ; __aeabi_memset + 4
        0x000240a4:    4770        pG      BX       lr
    __aeabi_memclr
    __aeabi_memclr4
    __aeabi_memclr8
        0x000240a6:    2200        ."      MOVS     r2,#0
        0x000240a8:    e7f6        ..      B        __aeabi_memset ; 0x24098
    _memset$wrapper
        0x000240aa:    b510        ..      PUSH     {r4,lr}
        0x000240ac:    4613        .F      MOV      r3,r2
        0x000240ae:    460a        .F      MOV      r2,r1
        0x000240b0:    4604        .F      MOV      r4,r0
        0x000240b2:    4619        .F      MOV      r1,r3
        0x000240b4:    f7fffff0    ....    BL       __aeabi_memset ; 0x24098
        0x000240b8:    4620         F      MOV      r0,r4
        0x000240ba:    bd10        ..      POP      {r4,pc}
    .text
    __aeabi_dadd
        0x000240bc:    e92d4ffe    -..O    PUSH     {r1-r11,lr}
        0x000240c0:    4680        .F      MOV      r8,r0
        0x000240c2:    ea810003    ....    EOR      r0,r1,r3
        0x000240c6:    0fc0        ..      LSRS     r0,r0,#31
        0x000240c8:    460c        .F      MOV      r4,r1
        0x000240ca:    9000        ..      STR      r0,[sp,#0]
        0x000240cc:    f0214100    !..A    BIC      r1,r1,#0x80000000
        0x000240d0:    f0234500    #..E    BIC      r5,r3,#0x80000000
        0x000240d4:    ebb80002    ....    SUBS     r0,r8,r2
        0x000240d8:    41a9        .A      SBCS     r1,r1,r5
        0x000240da:    d205        ..      BCS      0x240e8 ; __aeabi_dadd + 44
        0x000240dc:    4640        @F      MOV      r0,r8
        0x000240de:    4621        !F      MOV      r1,r4
        0x000240e0:    4690        .F      MOV      r8,r2
        0x000240e2:    461c        .F      MOV      r4,r3
        0x000240e4:    460b        .F      MOV      r3,r1
        0x000240e6:    4602        .F      MOV      r2,r0
        0x000240e8:    f0234000    #..@    BIC      r0,r3,#0x80000000
        0x000240ec:    4310        .C      ORRS     r0,r0,r2
        0x000240ee:    d047        G.      BEQ      0x24180 ; __aeabi_dadd + 196
        0x000240f0:    0d27        '.      LSRS     r7,r4,#20
        0x000240f2:    f3c7000a    ....    UBFX     r0,r7,#0,#11
        0x000240f6:    f3c3510a    ...Q    UBFX     r1,r3,#20,#11
        0x000240fa:    9002        ..      STR      r0,[sp,#8]
        0x000240fc:    1a40        @.      SUBS     r0,r0,r1
        0x000240fe:    9001        ..      STR      r0,[sp,#4]
        0x00024100:    2840        @(      CMP      r0,#0x40
        0x00024102:    da6b        k.      BGE      0x241dc ; __aeabi_dadd + 288
        0x00024104:    f3c30013    ....    UBFX     r0,r3,#0,#20
        0x00024108:    f4401b80    @...    ORR      r11,r0,#0x100000
        0x0002410c:    9800        ..      LDR      r0,[sp,#0]
        0x0002410e:    4692        .F      MOV      r10,r2
        0x00024110:    b120         .      CBZ      r0,0x2411c ; __aeabi_dadd + 96
        0x00024112:    2300        .#      MOVS     r3,#0
        0x00024114:    ebd20a03    ....    RSBS     r10,r2,r3
        0x00024118:    eb630b0b    c...    SBC      r11,r3,r11
        0x0002411c:    9801        ..      LDR      r0,[sp,#4]
        0x0002411e:    4659        YF      MOV      r1,r11
        0x00024120:    f1c00240    ..@.    RSB      r2,r0,#0x40
        0x00024124:    4650        PF      MOV      r0,r10
        0x00024126:    f000f9a8    ....    BL       __aeabi_llsl ; 0x2447a
        0x0002412a:    4606        .F      MOV      r6,r0
        0x0002412c:    460d        .F      MOV      r5,r1
        0x0002412e:    4650        PF      MOV      r0,r10
        0x00024130:    4659        YF      MOV      r1,r11
        0x00024132:    9a01        ..      LDR      r2,[sp,#4]
        0x00024134:    f000f9c0    ....    BL       __aeabi_lasr ; 0x244b8
        0x00024138:    eb100008    ....    ADDS     r0,r0,r8
        0x0002413c:    4161        aA      ADCS     r1,r1,r4
        0x0002413e:    2400        .$      MOVS     r4,#0
        0x00024140:    ea875211    ...R    EOR      r2,r7,r1,LSR #20
        0x00024144:    ea8473e7    ...s    EOR      r3,r4,r7,ASR #31
        0x00024148:    431a        .C      ORRS     r2,r2,r3
        0x0002414a:    d040        @.      BEQ      0x241ce ; __aeabi_dadd + 274
        0x0002414c:    9a00        ..      LDR      r2,[sp,#0]
        0x0002414e:    b362        b.      CBZ      r2,0x241aa ; __aeabi_dadd + 238
        0x00024150:    9a01        ..      LDR      r2,[sp,#4]
        0x00024152:    2a01        .*      CMP      r2,#1
        0x00024154:    ea4f5207    O..R    LSL      r2,r7,#20
        0x00024158:    dc15        ..      BGT      0x24186 ; __aeabi_dadd + 202
        0x0002415a:    1b00        ..      SUBS     r0,r0,r4
        0x0002415c:    eb610102    a...    SBC      r1,r1,r2
        0x00024160:    f04f4200    O..B    MOV      r2,#0x80000000
        0x00024164:    ea025207    ...R    AND      r2,r2,r7,LSL #20
        0x00024168:    e9cd4200    ...B    STRD     r4,r2,[sp,#0]
        0x0002416c:    1c00        ..      ADDS     r0,r0,#0
        0x0002416e:    f5411180    A...    ADC      r1,r1,#0x100000
        0x00024172:    4632        2F      MOV      r2,r6
        0x00024174:    462b        +F      MOV      r3,r5
        0x00024176:    f000f9c0    ....    BL       _double_epilogue ; 0x244fa
        0x0002417a:    b003        ..      ADD      sp,sp,#0xc
        0x0002417c:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x00024180:    4640        @F      MOV      r0,r8
        0x00024182:    4621        !F      MOV      r1,r4
        0x00024184:    e7f9        ..      B        0x2417a ; __aeabi_dadd + 190
        0x00024186:    1b00        ..      SUBS     r0,r0,r4
        0x00024188:    eb610102    a...    SBC      r1,r1,r2
        0x0002418c:    1c00        ..      ADDS     r0,r0,#0
        0x0002418e:    f5411380    A...    ADC      r3,r1,#0x100000
        0x00024192:    1800        ..      ADDS     r0,r0,r0
        0x00024194:    415b        [A      ADCS     r3,r3,r3
        0x00024196:    1820         .      ADDS     r0,r4,r0
        0x00024198:    f5a21700    ....    SUB      r7,r2,#0x200000
        0x0002419c:    eb470103    G...    ADC      r1,r7,r3
        0x000241a0:    ea4070d5    @..p    ORR      r0,r0,r5,LSR #31
        0x000241a4:    19b6        ..      ADDS     r6,r6,r6
        0x000241a6:    416d        mA      ADCS     r5,r5,r5
        0x000241a8:    e011        ..      B        0x241ce ; __aeabi_dadd + 274
        0x000241aa:    086d        m.      LSRS     r5,r5,#1
        0x000241ac:    ea4f0636    O.6.    RRX      r6,r6
        0x000241b0:    ea4575c0    E..u    ORR      r5,r5,r0,LSL #31
        0x000241b4:    ea4f5207    O..R    LSL      r2,r7,#20
        0x000241b8:    1b00        ..      SUBS     r0,r0,r4
        0x000241ba:    eb610102    a...    SBC      r1,r1,r2
        0x000241be:    1c00        ..      ADDS     r0,r0,#0
        0x000241c0:    f5411180    A...    ADC      r1,r1,#0x100000
        0x000241c4:    0849        I.      LSRS     r1,r1,#1
        0x000241c6:    ea4f0030    O.0.    RRX      r0,r0
        0x000241ca:    1900        ..      ADDS     r0,r0,r4
        0x000241cc:    4151        QA      ADCS     r1,r1,r2
        0x000241ce:    4632        2F      MOV      r2,r6
        0x000241d0:    462b        +F      MOV      r3,r5
        0x000241d2:    b003        ..      ADD      sp,sp,#0xc
        0x000241d4:    e8bd4ff0    ...O    POP      {r4-r11,lr}
        0x000241d8:    f000b980    ....    B.W      __I$use$fp ; 0x244dc
        0x000241dc:    9800        ..      LDR      r0,[sp,#0]
        0x000241de:    2201        ."      MOVS     r2,#1
        0x000241e0:    0040        @.      LSLS     r0,r0,#1
        0x000241e2:    2300        .#      MOVS     r3,#0
        0x000241e4:    ebd00202    ....    RSBS     r2,r0,r2
        0x000241e8:    eb6373e0    c..s    SBC      r3,r3,r0,ASR #31
        0x000241ec:    9800        ..      LDR      r0,[sp,#0]
        0x000241ee:    4621        !F      MOV      r1,r4
        0x000241f0:    ea4f74e0    O..t    ASR      r4,r0,#31
        0x000241f4:    ebb80000    ....    SUBS     r0,r8,r0
        0x000241f8:    eb610104    a...    SBC      r1,r1,r4
        0x000241fc:    e7e9        ..      B        0x241d2 ; __aeabi_dadd + 278
    __aeabi_dsub
        0x000241fe:    f0834300    ...C    EOR      r3,r3,#0x80000000
        0x00024202:    e75b        [.      B        __aeabi_dadd ; 0x240bc
    __aeabi_drsub
        0x00024204:    f0814100    ...A    EOR      r1,r1,#0x80000000
        0x00024208:    e758        X.      B        __aeabi_dadd ; 0x240bc
    .text
    __aeabi_dmul
        0x0002420a:    e92d4ffe    -..O    PUSH     {r1-r11,lr}
        0x0002420e:    ea810403    ....    EOR      r4,r1,r3
        0x00024212:    f0044400    ...D    AND      r4,r4,#0x80000000
        0x00024216:    f0214100    !..A    BIC      r1,r1,#0x80000000
        0x0002421a:    9400        ..      STR      r4,[sp,#0]
        0x0002421c:    f04f0b00    O...    MOV      r11,#0
        0x00024220:    f0234300    #..C    BIC      r3,r3,#0x80000000
        0x00024224:    ea500401    P...    ORRS     r4,r0,r1
        0x00024228:    d05e        ^.      BEQ      0x242e8 ; __aeabi_dmul + 222
        0x0002422a:    ea520403    R...    ORRS     r4,r2,r3
        0x0002422e:    d05b        [.      BEQ      0x242e8 ; __aeabi_dmul + 222
        0x00024230:    f3c3540a    ...T    UBFX     r4,r3,#20,#11
        0x00024234:    f3c1550a    ...U    UBFX     r5,r1,#20,#11
        0x00024238:    442c        ,D      ADD      r4,r4,r5
        0x0002423a:    f2a434f3    ...4    SUB      r4,r4,#0x3f3
        0x0002423e:    9401        ..      STR      r4,[sp,#4]
        0x00024240:    fba05402    ...T    UMULL    r5,r4,r0,r2
        0x00024244:    f3c10113    ....    UBFX     r1,r1,#0,#20
        0x00024248:    f4411180    A...    ORR      r1,r1,#0x100000
        0x0002424c:    f3c30313    ....    UBFX     r3,r3,#0,#20
        0x00024250:    f4431380    C...    ORR      r3,r3,#0x100000
        0x00024254:    fb014402    ...D    MLA      r4,r1,r2,r4
        0x00024258:    fb004e03    ...N    MLA      lr,r0,r3,r4
        0x0002425c:    0a84        ..      LSRS     r4,r0,#10
        0x0002425e:    0a97        ..      LSRS     r7,r2,#10
        0x00024260:    ea445481    D..T    ORR      r4,r4,r1,LSL #22
        0x00024264:    ea475783    G..W    ORR      r7,r7,r3,LSL #22
        0x00024268:    fba46807    ...h    UMULL    r6,r8,r4,r7
        0x0002426c:    9502        ..      STR      r5,[sp,#8]
        0x0002426e:    0a8d        ..      LSRS     r5,r1,#10
        0x00024270:    fb058507    ....    MLA      r5,r5,r7,r8
        0x00024274:    ea4f2c93    O..,    LSR      r12,r3,#10
        0x00024278:    fb04540c    ...T    MLA      r4,r4,r12,r5
        0x0002427c:    0527        '.      LSLS     r7,r4,#20
        0x0002427e:    9d02        ..      LDR      r5,[sp,#8]
        0x00024280:    ea4f5806    O..X    LSL      r8,r6,#20
        0x00024284:    ea473716    G..7    ORR      r7,r7,r6,LSR #12
        0x00024288:    ebb50508    ....    SUBS     r5,r5,r8
        0x0002428c:    eb6e0c07    n...    SBC      r12,lr,r7
        0x00024290:    0e87        ..      LSRS     r7,r0,#26
        0x00024292:    0e92        ..      LSRS     r2,r2,#26
        0x00024294:    ea471781    G...    ORR      r7,r7,r1,LSL #6
        0x00024298:    ea421283    B...    ORR      r2,r2,r3,LSL #6
        0x0002429c:    fba70102    ....    UMULL    r0,r1,r7,r2
        0x000242a0:    ebb6010b    ....    SUBS     r1,r6,r11
        0x000242a4:    eb640400    d...    SBC      r4,r4,r0
        0x000242a8:    0d2b        +.      LSRS     r3,r5,#20
        0x000242aa:    ea43330c    C..3    ORR      r3,r3,r12,LSL #12
        0x000242ae:    185e        ^.      ADDS     r6,r3,r1
        0x000242b0:    eb44501c    D..P    ADC      r0,r4,r12,LSR #20
        0x000242b4:    46da        .F      MOV      r10,r11
        0x000242b6:    4651        QF      MOV      r1,r10
        0x000242b8:    fbe70102    ....    UMLAL    r0,r1,r7,r2
        0x000242bc:    f3c50413    ....    UBFX     r4,r5,#0,#20
        0x000242c0:    ea4f330b    O..3    LSL      r3,r11,#12
        0x000242c4:    ea435314    C..S    ORR      r3,r3,r4,LSR #20
        0x000242c8:    ea4f3204    O..2    LSL      r2,r4,#12
        0x000242cc:    9c01        ..      LDR      r4,[sp,#4]
        0x000242ce:    ea430306    C...    ORR      r3,r3,r6
        0x000242d2:    f1a4040c    ....    SUB      r4,r4,#0xc
        0x000242d6:    9402        ..      STR      r4,[sp,#8]
        0x000242d8:    9c00        ..      LDR      r4,[sp,#0]
        0x000242da:    e9cdb400    ....    STRD     r11,r4,[sp,#0]
        0x000242de:    f000f90c    ....    BL       _double_epilogue ; 0x244fa
        0x000242e2:    b003        ..      ADD      sp,sp,#0xc
        0x000242e4:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x000242e8:    2000        .       MOVS     r0,#0
        0x000242ea:    4601        .F      MOV      r1,r0
        0x000242ec:    e7f9        ..      B        0x242e2 ; __aeabi_dmul + 216
    .text
    __aeabi_ddiv
        0x000242ee:    e92d4df0    -..M    PUSH     {r4-r8,r10,r11,lr}
        0x000242f2:    ea810403    ....    EOR      r4,r1,r3
        0x000242f6:    f0044b00    ...K    AND      r11,r4,#0x80000000
        0x000242fa:    f0214500    !..E    BIC      r5,r1,#0x80000000
        0x000242fe:    4614        .F      MOV      r4,r2
        0x00024300:    f04f0a00    O...    MOV      r10,#0
        0x00024304:    f0234100    #..A    BIC      r1,r3,#0x80000000
        0x00024308:    ea500205    P...    ORRS     r2,r0,r5
        0x0002430c:    d020         .      BEQ      0x24350 ; __aeabi_ddiv + 98
        0x0002430e:    ea540201    T...    ORRS     r2,r4,r1
        0x00024312:    d01d        ..      BEQ      0x24350 ; __aeabi_ddiv + 98
        0x00024314:    f3c5570a    ...W    UBFX     r7,r5,#20,#11
        0x00024318:    4602        .F      MOV      r2,r0
        0x0002431a:    f3c50313    ....    UBFX     r3,r5,#0,#20
        0x0002431e:    f3c10013    ....    UBFX     r0,r1,#0,#20
        0x00024322:    f3c1560a    ...V    UBFX     r6,r1,#20,#11
        0x00024326:    f4401580    @...    ORR      r5,r0,#0x100000
        0x0002432a:    f4431380    C...    ORR      r3,r3,#0x100000
        0x0002432e:    eba70806    ....    SUB      r8,r7,r6
        0x00024332:    1b10        ..      SUBS     r0,r2,r4
        0x00024334:    46d6        .F      MOV      lr,r10
        0x00024336:    f20838fd    ...8    ADD      r8,r8,#0x3fd
        0x0002433a:    eb730005    s...    SBCS     r0,r3,r5
        0x0002433e:    d302        ..      BCC      0x24346 ; __aeabi_ddiv + 88
        0x00024340:    f1080801    ....    ADD      r8,r8,#1
        0x00024344:    e001        ..      B        0x2434a ; __aeabi_ddiv + 92
        0x00024346:    1892        ..      ADDS     r2,r2,r2
        0x00024348:    415b        [A      ADCS     r3,r3,r3
        0x0002434a:    f1b80f00    ....    CMP      r8,#0
        0x0002434e:    da03        ..      BGE      0x24358 ; __aeabi_ddiv + 106
        0x00024350:    2000        .       MOVS     r0,#0
        0x00024352:    4601        .F      MOV      r1,r0
        0x00024354:    e8bd8df0    ....    POP      {r4-r8,r10,r11,pc}
        0x00024358:    2000        .       MOVS     r0,#0
        0x0002435a:    f44f1180    O...    MOV      r1,#0x100000
        0x0002435e:    4606        .F      MOV      r6,r0
        0x00024360:    4684        .F      MOV      r12,r0
        0x00024362:    e00e        ..      B        0x24382 ; __aeabi_ddiv + 148
        0x00024364:    1b17        ..      SUBS     r7,r2,r4
        0x00024366:    eb730705    s...    SBCS     r7,r3,r5
        0x0002436a:    d305        ..      BCC      0x24378 ; __aeabi_ddiv + 138
        0x0002436c:    1b12        ..      SUBS     r2,r2,r4
        0x0002436e:    eb630305    c...    SBC      r3,r3,r5
        0x00024372:    4306        .C      ORRS     r6,r6,r0
        0x00024374:    ea4c0c01    L...    ORR      r12,r12,r1
        0x00024378:    0849        I.      LSRS     r1,r1,#1
        0x0002437a:    ea4f0030    O.0.    RRX      r0,r0
        0x0002437e:    1892        ..      ADDS     r2,r2,r2
        0x00024380:    415b        [A      ADCS     r3,r3,r3
        0x00024382:    ea500701    P...    ORRS     r7,r0,r1
        0x00024386:    d1ed        ..      BNE      0x24364 ; __aeabi_ddiv + 118
        0x00024388:    ea520003    R...    ORRS     r0,r2,r3
        0x0002438c:    d012        ..      BEQ      0x243b4 ; __aeabi_ddiv + 198
        0x0002438e:    ea820004    ....    EOR      r0,r2,r4
        0x00024392:    ea830105    ....    EOR      r1,r3,r5
        0x00024396:    4308        .C      ORRS     r0,r0,r1
        0x00024398:    d005        ..      BEQ      0x243a6 ; __aeabi_ddiv + 184
        0x0002439a:    1b10        ..      SUBS     r0,r2,r4
        0x0002439c:    41ab        .A      SBCS     r3,r3,r5
        0x0002439e:    d206        ..      BCS      0x243ae ; __aeabi_ddiv + 192
        0x000243a0:    2201        ."      MOVS     r2,#1
        0x000243a2:    2300        .#      MOVS     r3,#0
        0x000243a4:    e006        ..      B        0x243b4 ; __aeabi_ddiv + 198
        0x000243a6:    2200        ."      MOVS     r2,#0
        0x000243a8:    f04f4300    O..C    MOV      r3,#0x80000000
        0x000243ac:    e002        ..      B        0x243b4 ; __aeabi_ddiv + 198
        0x000243ae:    f06f0201    o...    MVN      r2,#1
        0x000243b2:    1053        S.      ASRS     r3,r2,#1
        0x000243b4:    eb1a0006    ....    ADDS     r0,r10,r6
        0x000243b8:    eb4c5108    L..Q    ADC      r1,r12,r8,LSL #20
        0x000243bc:    eb10000a    ....    ADDS     r0,r0,r10
        0x000243c0:    eb41010b    A...    ADC      r1,r1,r11
        0x000243c4:    e8bd4df0    ...M    POP      {r4-r8,r10,r11,lr}
        0x000243c8:    f000b888    ....    B.W      __I$use$fp ; 0x244dc
    .text
    __aeabi_i2d
        0x000243cc:    b50e        ..      PUSH     {r1-r3,lr}
        0x000243ce:    0fc1        ..      LSRS     r1,r0,#31
        0x000243d0:    ea8070e0    ...p    EOR      r0,r0,r0,ASR #31
        0x000243d4:    4408        .D      ADD      r0,r0,r1
        0x000243d6:    07ca        ..      LSLS     r2,r1,#31
        0x000243d8:    2100        .!      MOVS     r1,#0
        0x000243da:    f2404333    @.3C    MOV      r3,#0x433
        0x000243de:    e88d000e    ....    STM      sp,{r1-r3}
        0x000243e2:    460a        .F      MOV      r2,r1
        0x000243e4:    460b        .F      MOV      r3,r1
        0x000243e6:    f000f888    ....    BL       _double_epilogue ; 0x244fa
        0x000243ea:    b003        ..      ADD      sp,sp,#0xc
        0x000243ec:    bd00        ..      POP      {pc}
    .text
    __aeabi_ui2d
        0x000243ee:    b50e        ..      PUSH     {r1-r3,lr}
        0x000243f0:    f2404133    @.3A    MOV      r1,#0x433
        0x000243f4:    9102        ..      STR      r1,[sp,#8]
        0x000243f6:    2100        .!      MOVS     r1,#0
        0x000243f8:    e9cd1100    ....    STRD     r1,r1,[sp,#0]
        0x000243fc:    460a        .F      MOV      r2,r1
        0x000243fe:    460b        .F      MOV      r3,r1
        0x00024400:    f000f87b    ..{.    BL       _double_epilogue ; 0x244fa
        0x00024404:    b003        ..      ADD      sp,sp,#0xc
        0x00024406:    bd00        ..      POP      {pc}
    .text
    __aeabi_l2d
        0x00024408:    b53e        >.      PUSH     {r1-r5,lr}
        0x0002440a:    17ca        ..      ASRS     r2,r1,#31
        0x0002440c:    0fcb        ..      LSRS     r3,r1,#31
        0x0002440e:    2400        .$      MOVS     r4,#0
        0x00024410:    4050        P@      EORS     r0,r0,r2
        0x00024412:    4051        Q@      EORS     r1,r1,r2
        0x00024414:    18c0        ..      ADDS     r0,r0,r3
        0x00024416:    4161        aA      ADCS     r1,r1,r4
        0x00024418:    07da        ..      LSLS     r2,r3,#31
        0x0002441a:    f2404333    @.3C    MOV      r3,#0x433
        0x0002441e:    9400        ..      STR      r4,[sp,#0]
        0x00024420:    e9cd2301    ...#    STRD     r2,r3,[sp,#4]
        0x00024424:    4622        "F      MOV      r2,r4
        0x00024426:    4623        #F      MOV      r3,r4
        0x00024428:    f000f867    ..g.    BL       _double_epilogue ; 0x244fa
        0x0002442c:    b003        ..      ADD      sp,sp,#0xc
        0x0002442e:    bd30        0.      POP      {r4,r5,pc}
    .text
    __aeabi_d2lz
        0x00024430:    b570        p.      PUSH     {r4-r6,lr}
        0x00024432:    f3c1520a    ...R    UBFX     r2,r1,#20,#11
        0x00024436:    f0014500    ...E    AND      r5,r1,#0x80000000
        0x0002443a:    2400        .$      MOVS     r4,#0
        0x0002443c:    f3c10113    ....    UBFX     r1,r1,#0,#20
        0x00024440:    f24033ff    @..3    MOV      r3,#0x3ff
        0x00024444:    f4411180    A...    ORR      r1,r1,#0x100000
        0x00024448:    429a        .B      CMP      r2,r3
        0x0002444a:    da02        ..      BGE      0x24452 ; __aeabi_d2lz + 34
        0x0002444c:    2000        .       MOVS     r0,#0
        0x0002444e:    4601        .F      MOV      r1,r0
        0x00024450:    bd70        p.      POP      {r4-r6,pc}
        0x00024452:    f2404333    @.3C    MOV      r3,#0x433
        0x00024456:    429a        .B      CMP      r2,r3
        0x00024458:    f2a24233    ..3B    SUB      r2,r2,#0x433
        0x0002445c:    dc03        ..      BGT      0x24466 ; __aeabi_d2lz + 54
        0x0002445e:    4252        RB      RSBS     r2,r2,#0
        0x00024460:    f000f81a    ....    BL       __aeabi_llsr ; 0x24498
        0x00024464:    e001        ..      B        0x2446a ; __aeabi_d2lz + 58
        0x00024466:    f000f808    ....    BL       __aeabi_llsl ; 0x2447a
        0x0002446a:    432c        ,C      ORRS     r4,r4,r5
        0x0002446c:    d0f0        ..      BEQ      0x24450 ; __aeabi_d2lz + 32
        0x0002446e:    2300        .#      MOVS     r3,#0
        0x00024470:    ebd00003    ....    RSBS     r0,r0,r3
        0x00024474:    eb630101    c...    SBC      r1,r3,r1
        0x00024478:    bd70        p.      POP      {r4-r6,pc}
    .text
    __aeabi_llsl
    _ll_shift_l
        0x0002447a:    2a20         *      CMP      r2,#0x20
        0x0002447c:    db04        ..      BLT      0x24488 ; __aeabi_llsl + 14
        0x0002447e:    3a20         :      SUBS     r2,r2,#0x20
        0x00024480:    fa00f102    ....    LSL      r1,r0,r2
        0x00024484:    2000        .       MOVS     r0,#0
        0x00024486:    4770        pG      BX       lr
        0x00024488:    4091        .@      LSLS     r1,r1,r2
        0x0002448a:    f1c20320    .. .    RSB      r3,r2,#0x20
        0x0002448e:    fa20f303     ...    LSR      r3,r0,r3
        0x00024492:    4319        .C      ORRS     r1,r1,r3
        0x00024494:    4090        .@      LSLS     r0,r0,r2
        0x00024496:    4770        pG      BX       lr
    .text
    __aeabi_llsr
    _ll_ushift_r
        0x00024498:    2a20         *      CMP      r2,#0x20
        0x0002449a:    db04        ..      BLT      0x244a6 ; __aeabi_llsr + 14
        0x0002449c:    3a20         :      SUBS     r2,r2,#0x20
        0x0002449e:    fa21f002    !...    LSR      r0,r1,r2
        0x000244a2:    2100        .!      MOVS     r1,#0
        0x000244a4:    4770        pG      BX       lr
        0x000244a6:    fa21f302    !...    LSR      r3,r1,r2
        0x000244aa:    40d0        .@      LSRS     r0,r0,r2
        0x000244ac:    f1c20220    .. .    RSB      r2,r2,#0x20
        0x000244b0:    4091        .@      LSLS     r1,r1,r2
        0x000244b2:    4308        .C      ORRS     r0,r0,r1
        0x000244b4:    4619        .F      MOV      r1,r3
        0x000244b6:    4770        pG      BX       lr
    .text
    __aeabi_lasr
    _ll_sshift_r
        0x000244b8:    2a20         *      CMP      r2,#0x20
        0x000244ba:    db06        ..      BLT      0x244ca ; __aeabi_lasr + 18
        0x000244bc:    17cb        ..      ASRS     r3,r1,#31
        0x000244be:    3a20         :      SUBS     r2,r2,#0x20
        0x000244c0:    fa41f002    A...    ASR      r0,r1,r2
        0x000244c4:    ea4373e0    C..s    ORR      r3,r3,r0,ASR #31
        0x000244c8:    e006        ..      B        0x244d8 ; __aeabi_lasr + 32
        0x000244ca:    fa41f302    A...    ASR      r3,r1,r2
        0x000244ce:    40d0        .@      LSRS     r0,r0,r2
        0x000244d0:    f1c20220    .. .    RSB      r2,r2,#0x20
        0x000244d4:    4091        .@      LSLS     r1,r1,r2
        0x000244d6:    4308        .C      ORRS     r0,r0,r1
        0x000244d8:    4619        .F      MOV      r1,r3
        0x000244da:    4770        pG      BX       lr
    .text
    .text
    __I$use$fp
    _double_round
        0x000244dc:    b510        ..      PUSH     {r4,lr}
        0x000244de:    1e14        ..      SUBS     r4,r2,#0
        0x000244e0:    f1730400    s...    SBCS     r4,r3,#0
        0x000244e4:    da08        ..      BGE      0x244f8 ; __I$use$fp + 28
        0x000244e6:    1c40        @.      ADDS     r0,r0,#1
        0x000244e8:    f1410100    A...    ADC      r1,r1,#0
        0x000244ec:    1892        ..      ADDS     r2,r2,r2
        0x000244ee:    415b        [A      ADCS     r3,r3,r3
        0x000244f0:    431a        .C      ORRS     r2,r2,r3
        0x000244f2:    d101        ..      BNE      0x244f8 ; __I$use$fp + 28
        0x000244f4:    f0200001     ...    BIC      r0,r0,#1
        0x000244f8:    bd10        ..      POP      {r4,pc}
    _double_epilogue
        0x000244fa:    e92d4df0    -..M    PUSH     {r4-r8,r10,r11,lr}
        0x000244fe:    4692        .F      MOV      r10,r2
        0x00024500:    469b        .F      MOV      r11,r3
        0x00024502:    b111        ..      CBZ      r1,0x2450a ; _double_epilogue + 16
        0x00024504:    fab1f281    ....    CLZ      r2,r1
        0x00024508:    e002        ..      B        0x24510 ; _double_epilogue + 22
        0x0002450a:    fab0f280    ....    CLZ      r2,r0
        0x0002450e:    3220         2      ADDS     r2,r2,#0x20
        0x00024510:    4690        .F      MOV      r8,r2
        0x00024512:    f7ffffb2    ....    BL       __aeabi_llsl ; 0x2447a
        0x00024516:    4604        .F      MOV      r4,r0
        0x00024518:    460f        .F      MOV      r7,r1
        0x0002451a:    ea40000a    @...    ORR      r0,r0,r10
        0x0002451e:    ea41010b    A...    ORR      r1,r1,r11
        0x00024522:    4653        SF      MOV      r3,r10
        0x00024524:    465a        ZF      MOV      r2,r11
        0x00024526:    4308        .C      ORRS     r0,r0,r1
        0x00024528:    d013        ..      BEQ      0x24552 ; _double_epilogue + 88
        0x0002452a:    4611        .F      MOV      r1,r2
        0x0002452c:    ea530001    S...    ORRS     r0,r3,r1
        0x00024530:    d019        ..      BEQ      0x24566 ; _double_epilogue + 108
        0x00024532:    f1c80240    ..@.    RSB      r2,r8,#0x40
        0x00024536:    4650        PF      MOV      r0,r10
        0x00024538:    f7ffffae    ....    BL       __aeabi_llsr ; 0x24498
        0x0002453c:    4605        .F      MOV      r5,r0
        0x0002453e:    460e        .F      MOV      r6,r1
        0x00024540:    4650        PF      MOV      r0,r10
        0x00024542:    4659        YF      MOV      r1,r11
        0x00024544:    4642        BF      MOV      r2,r8
        0x00024546:    f7ffff98    ....    BL       __aeabi_llsl ; 0x2447a
        0x0002454a:    4308        .C      ORRS     r0,r0,r1
        0x0002454c:    d005        ..      BEQ      0x2455a ; _double_epilogue + 96
        0x0002454e:    2001        .       MOVS     r0,#1
        0x00024550:    e004        ..      B        0x2455c ; _double_epilogue + 98
        0x00024552:    4620         F      MOV      r0,r4
        0x00024554:    4639        9F      MOV      r1,r7
        0x00024556:    e8bd8df0    ....    POP      {r4-r8,r10,r11,pc}
        0x0002455a:    2000        .       MOVS     r0,#0
        0x0002455c:    4305        .C      ORRS     r5,r5,r0
        0x0002455e:    ea4676e0    F..v    ORR      r6,r6,r0,ASR #31
        0x00024562:    432c        ,C      ORRS     r4,r4,r5
        0x00024564:    4337        7C      ORRS     r7,r7,r6
        0x00024566:    980a        ..      LDR      r0,[sp,#0x28]
        0x00024568:    0563        c.      LSLS     r3,r4,#21
        0x0002456a:    0ae4        ..      LSRS     r4,r4,#11
        0x0002456c:    eba00008    ....    SUB      r0,r0,r8
        0x00024570:    2200        ."      MOVS     r2,#0
        0x00024572:    0afd        ..      LSRS     r5,r7,#11
        0x00024574:    ea445447    D.GT    ORR      r4,r4,r7,LSL #21
        0x00024578:    300a        .0      ADDS     r0,r0,#0xa
        0x0002457a:    d502        ..      BPL      0x24582 ; _double_epilogue + 136
        0x0002457c:    2000        .       MOVS     r0,#0
        0x0002457e:    4601        .F      MOV      r1,r0
        0x00024580:    e7e9        ..      B        0x24556 ; _double_epilogue + 92
        0x00024582:    0501        ..      LSLS     r1,r0,#20
        0x00024584:    1910        ..      ADDS     r0,r2,r4
        0x00024586:    4169        iA      ADCS     r1,r1,r5
        0x00024588:    e9dd4508    ...E    LDRD     r4,r5,[sp,#0x20]
        0x0002458c:    1900        ..      ADDS     r0,r0,r4
        0x0002458e:    4169        iA      ADCS     r1,r1,r5
        0x00024590:    e8bd4df0    ...M    POP      {r4-r8,r10,r11,lr}
        0x00024594:    e7a2        ..      B        __I$use$fp ; 0x244dc
        0x00024596:    0000        ..      MOVS     r0,r0
    .text
    _drnd
        0x00024598:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x0002459c:    4605        .F      MOV      r5,r0
        0x0002459e:    f0214000    !..@    BIC      r0,r1,#0x80000000
        0x000245a2:    460c        .F      MOV      r4,r1
        0x000245a4:    4328        (C      ORRS     r0,r0,r5
        0x000245a6:    d009        ..      BEQ      0x245bc ; _drnd + 36
        0x000245a8:    f3c4500a    ...P    UBFX     r0,r4,#20,#11
        0x000245ac:    f2404133    @.3A    MOV      r1,#0x433
        0x000245b0:    4288        .B      CMP      r0,r1
        0x000245b2:    dd05        ..      BLE      0x245c0 ; _drnd + 40
        0x000245b4:    4628        (F      MOV      r0,r5
        0x000245b6:    4621        !F      MOV      r1,r4
        0x000245b8:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x000245bc:    4628        (F      MOV      r0,r5
        0x000245be:    e7fb        ..      B        0x245b8 ; _drnd + 32
        0x000245c0:    f24031fe    @..1    MOV      r1,#0x3fe
        0x000245c4:    4288        .B      CMP      r0,r1
        0x000245c6:    dc10        ..      BGT      0x245ea ; _drnd + 82
        0x000245c8:    db0c        ..      BLT      0x245e4 ; _drnd + 76
        0x000245ca:    ea4f3004    O..0    LSL      r0,r4,#12
        0x000245ce:    ea405015    @..P    ORR      r0,r0,r5,LSR #20
        0x000245d2:    ea503105    P..1    ORRS     r1,r0,r5,LSL #12
        0x000245d6:    d005        ..      BEQ      0x245e4 ; _drnd + 76
        0x000245d8:    4810        .H      LDR      r0,[pc,#64] ; [0x2461c] = 0x3ff00000
        0x000245da:    f0044100    ...A    AND      r1,r4,#0x80000000
        0x000245de:    4301        .C      ORRS     r1,r1,r0
        0x000245e0:    2000        .       MOVS     r0,#0
        0x000245e2:    e7e9        ..      B        0x245b8 ; _drnd + 32
        0x000245e4:    2000        .       MOVS     r0,#0
        0x000245e6:    4601        .F      MOV      r1,r0
        0x000245e8:    e7e6        ..      B        0x245b8 ; _drnd + 32
        0x000245ea:    f2a04033    ..3@    SUB      r0,r0,#0x433
        0x000245ee:    4246        FB      RSBS     r6,r0,#0
        0x000245f0:    f1c60240    ..@.    RSB      r2,r6,#0x40
        0x000245f4:    4628        (F      MOV      r0,r5
        0x000245f6:    4621        !F      MOV      r1,r4
        0x000245f8:    f7ffff3f    ..?.    BL       __aeabi_llsl ; 0x2447a
        0x000245fc:    4607        .F      MOV      r7,r0
        0x000245fe:    4688        .F      MOV      r8,r1
        0x00024600:    4628        (F      MOV      r0,r5
        0x00024602:    4621        !F      MOV      r1,r4
        0x00024604:    4632        2F      MOV      r2,r6
        0x00024606:    f7ffff47    ..G.    BL       __aeabi_llsr ; 0x24498
        0x0002460a:    4643        CF      MOV      r3,r8
        0x0002460c:    463a        :F      MOV      r2,r7
        0x0002460e:    f7ffff65    ..e.    BL       __I$use$fp ; 0x244dc
        0x00024612:    4632        2F      MOV      r2,r6
        0x00024614:    e8bd41f0    ...A    POP      {r4-r8,lr}
        0x00024618:    f7ffbf2f    ../.    B.W      __aeabi_llsl ; 0x2447a
    $d
        0x0002461c:    3ff00000    ...?    DCD    1072693248
    $t
    .text
    __aeabi_cdcmpeq
    __aeabi_cdcmple
        0x00024620:    b530        0.      PUSH     {r4,r5,lr}
        0x00024622:    1e04        ..      SUBS     r4,r0,#0
        0x00024624:    f1710400    q...    SBCS     r4,r1,#0
        0x00024628:    db04        ..      BLT      0x24634 ; __aeabi_cdcmpeq + 20
        0x0002462a:    f04f4400    O..D    MOV      r4,#0x80000000
        0x0002462e:    4240        @B      RSBS     r0,r0,#0
        0x00024630:    eb640101    d...    SBC      r1,r4,r1
        0x00024634:    1e14        ..      SUBS     r4,r2,#0
        0x00024636:    f1730400    s...    SBCS     r4,r3,#0
        0x0002463a:    db05        ..      BLT      0x24648 ; __aeabi_cdcmpeq + 40
        0x0002463c:    461c        .F      MOV      r4,r3
        0x0002463e:    f04f4300    O..C    MOV      r3,#0x80000000
        0x00024642:    4252        RB      RSBS     r2,r2,#0
        0x00024644:    eb630304    c...    SBC      r3,r3,r4
        0x00024648:    428b        .B      CMP      r3,r1
        0x0002464a:    bf08        ..      IT       EQ
        0x0002464c:    4282        .B      CMPEQ    r2,r0
        0x0002464e:    bd30        0.      POP      {r4,r5,pc}
    .text
    __aeabi_cdrcmple
        0x00024650:    b530        0.      PUSH     {r4,r5,lr}
        0x00024652:    1e04        ..      SUBS     r4,r0,#0
        0x00024654:    f1710400    q...    SBCS     r4,r1,#0
        0x00024658:    db04        ..      BLT      0x24664 ; __aeabi_cdrcmple + 20
        0x0002465a:    f04f4400    O..D    MOV      r4,#0x80000000
        0x0002465e:    4240        @B      RSBS     r0,r0,#0
        0x00024660:    eb640101    d...    SBC      r1,r4,r1
        0x00024664:    1e14        ..      SUBS     r4,r2,#0
        0x00024666:    f1730400    s...    SBCS     r4,r3,#0
        0x0002466a:    db05        ..      BLT      0x24678 ; __aeabi_cdrcmple + 40
        0x0002466c:    461c        .F      MOV      r4,r3
        0x0002466e:    f04f4300    O..C    MOV      r3,#0x80000000
        0x00024672:    4252        RB      RSBS     r2,r2,#0
        0x00024674:    eb630304    c...    SBC      r3,r3,r4
        0x00024678:    4299        .B      CMP      r1,r3
        0x0002467a:    bf08        ..      IT       EQ
        0x0002467c:    4290        .B      CMPEQ    r0,r2
        0x0002467e:    bd30        0.      POP      {r4,r5,pc}
    $t.1
    GIO_MaskedWrite
        0x00024680:    b083        ..      SUB      sp,sp,#0xc
        0x00024682:    9002        ..      STR      r0,[sp,#8]
        0x00024684:    f88d1007    ....    STRB     r1,[sp,#7]
        0x00024688:    f88d2006    ...     STRB     r2,[sp,#6]
        0x0002468c:    f89d1007    ....    LDRB     r1,[sp,#7]
        0x00024690:    2001        .       MOVS     r0,#1
        0x00024692:    4088        .@      LSLS     r0,r0,r1
        0x00024694:    9000        ..      STR      r0,[sp,#0]
        0x00024696:    9802        ..      LDR      r0,[sp,#8]
        0x00024698:    6800        .h      LDR      r0,[r0,#0]
        0x0002469a:    9900        ..      LDR      r1,[sp,#0]
        0x0002469c:    4388        .C      BICS     r0,r0,r1
        0x0002469e:    f89d1006    ....    LDRB     r1,[sp,#6]
        0x000246a2:    f89d2007    ...     LDRB     r2,[sp,#7]
        0x000246a6:    4091        .@      LSLS     r1,r1,r2
        0x000246a8:    4308        .C      ORRS     r0,r0,r1
        0x000246aa:    9902        ..      LDR      r1,[sp,#8]
        0x000246ac:    6008        .`      STR      r0,[r1,#0]
        0x000246ae:    b003        ..      ADD      sp,sp,#0xc
        0x000246b0:    4770        pG      BX       lr
        0x000246b2:    0000        ..      MOVS     r0,r0
    GIO_SetDirection
        0x000246b4:    b580        ..      PUSH     {r7,lr}
        0x000246b6:    b082        ..      SUB      sp,sp,#8
        0x000246b8:    f88d0007    ....    STRB     r0,[sp,#7]
        0x000246bc:    f88d1006    ....    STRB     r1,[sp,#6]
        0x000246c0:    f89d0006    ....    LDRB     r0,[sp,#6]
        0x000246c4:    2803        .(      CMP      r0,#3
        0x000246c6:    d019        ..      BEQ      0x246fc ; GIO_SetDirection + 72
        0x000246c8:    e7ff        ..      B        0x246ca ; GIO_SetDirection + 22
        0x000246ca:    f89d1007    ....    LDRB     r1,[sp,#7]
        0x000246ce:    f89d2006    ...     LDRB     r2,[sp,#6]
        0x000246d2:    2a00        .*      CMP      r2,#0
        0x000246d4:    bf18        ..      IT       NE
        0x000246d6:    2201        ."      MOVNE    r2,#1
        0x000246d8:    2020                MOVS     r0,#0x20
        0x000246da:    f2c40000    ....    MOVT     r0,#0x4000
        0x000246de:    f7ffffcf    ....    BL       GIO_MaskedWrite ; 0x24680
        0x000246e2:    f89d1007    ....    LDRB     r1,[sp,#7]
        0x000246e6:    f89d0006    ....    LDRB     r0,[sp,#6]
        0x000246ea:    3801        .8      SUBS     r0,#1
        0x000246ec:    fab0f080    ....    CLZ      r0,r0
        0x000246f0:    0942        B.      LSRS     r2,r0,#5
        0x000246f2:    f04f2040    O.@     MOV      r0,#0x40004000
        0x000246f6:    f7ffffc3    ....    BL       GIO_MaskedWrite ; 0x24680
        0x000246fa:    e00f        ..      B        0x2471c ; GIO_SetDirection + 104
        0x000246fc:    f89d1007    ....    LDRB     r1,[sp,#7]
        0x00024700:    2020                MOVS     r0,#0x20
        0x00024702:    f2c40000    ....    MOVT     r0,#0x4000
        0x00024706:    2200        ."      MOVS     r2,#0
        0x00024708:    f7ffffba    ....    BL       GIO_MaskedWrite ; 0x24680
        0x0002470c:    f89d1007    ....    LDRB     r1,[sp,#7]
        0x00024710:    f04f2040    O.@     MOV      r0,#0x40004000
        0x00024714:    2201        ."      MOVS     r2,#1
        0x00024716:    f7ffffb3    ....    BL       GIO_MaskedWrite ; 0x24680
        0x0002471a:    e7ff        ..      B        0x2471c ; GIO_SetDirection + 104
        0x0002471c:    b002        ..      ADD      sp,sp,#8
        0x0002471e:    bd80        ..      POP      {r7,pc}
    PINCTRL_SelIn
        0x00024720:    b084        ..      SUB      sp,sp,#0x10
        0x00024722:    9003        ..      STR      r0,[sp,#0xc]
        0x00024724:    f88d100b    ....    STRB     r1,[sp,#0xb]
        0x00024728:    f88d200a    ...     STRB     r2,[sp,#0xa]
        0x0002472c:    9803        ..      LDR      r0,[sp,#0xc]
        0x0002472e:    2100        .!      MOVS     r1,#0
        0x00024730:    f2c40107    ....    MOVT     r1,#0x4007
        0x00024734:    4408        .D      ADD      r0,r0,r1
        0x00024736:    9001        ..      STR      r0,[sp,#4]
        0x00024738:    f89d100b    ....    LDRB     r1,[sp,#0xb]
        0x0002473c:    203f        ?       MOVS     r0,#0x3f
        0x0002473e:    4088        .@      LSLS     r0,r0,r1
        0x00024740:    9000        ..      STR      r0,[sp,#0]
        0x00024742:    9801        ..      LDR      r0,[sp,#4]
        0x00024744:    6800        .h      LDR      r0,[r0,#0]
        0x00024746:    9900        ..      LDR      r1,[sp,#0]
        0x00024748:    4388        .C      BICS     r0,r0,r1
        0x0002474a:    f89d100a    ....    LDRB     r1,[sp,#0xa]
        0x0002474e:    f89d200b    ...     LDRB     r2,[sp,#0xb]
        0x00024752:    4091        .@      LSLS     r1,r1,r2
        0x00024754:    4308        .C      ORRS     r0,r0,r1
        0x00024756:    9901        ..      LDR      r1,[sp,#4]
        0x00024758:    6008        .`      STR      r0,[r1,#0]
        0x0002475a:    b004        ..      ADD      sp,sp,#0x10
        0x0002475c:    4770        pG      BX       lr
        0x0002475e:    0000        ..      MOVS     r0,r0
    PINCTRL_SelUartRxdIn
        0x00024760:    b580        ..      PUSH     {r7,lr}
        0x00024762:    b082        ..      SUB      sp,sp,#8
        0x00024764:    f88d0007    ....    STRB     r0,[sp,#7]
        0x00024768:    f88d1006    ....    STRB     r1,[sp,#6]
        0x0002476c:    f89d1007    ....    LDRB     r1,[sp,#7]
        0x00024770:    2900        .)      CMP      r1,#0
        0x00024772:    bf18        ..      IT       NE
        0x00024774:    2112        .!      MOVNE    r1,#0x12
        0x00024776:    f89d2006    ...     LDRB     r2,[sp,#6]
        0x0002477a:    2054        T       MOVS     r0,#0x54
        0x0002477c:    f7ffffd0    ....    BL       PINCTRL_SelIn ; 0x24720
        0x00024780:    b002        ..      ADD      sp,sp,#8
        0x00024782:    bd80        ..      POP      {r7,pc}
    PINCTRL_SetPadMux
        0x00024784:    b083        ..      SUB      sp,sp,#0xc
        0x00024786:    f88d000b    ....    STRB     r0,[sp,#0xb]
        0x0002478a:    f88d100a    ....    STRB     r1,[sp,#0xa]
        0x0002478e:    f89d100b    ....    LDRB     r1,[sp,#0xb]
        0x00024792:    207c        |       MOVS     r0,#0x7c
        0x00024794:    ea000051    ..Q.    AND      r0,r0,r1,LSR #1
        0x00024798:    2144        D!      MOVS     r1,#0x44
        0x0002479a:    f2c40107    ....    MOVT     r1,#0x4007
        0x0002479e:    4408        .D      ADD      r0,r0,r1
        0x000247a0:    9001        ..      STR      r0,[sp,#4]
        0x000247a2:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x000247a6:    f0000007    ....    AND      r0,r0,#7
        0x000247aa:    0080        ..      LSLS     r0,r0,#2
        0x000247ac:    f88d0003    ....    STRB     r0,[sp,#3]
        0x000247b0:    9801        ..      LDR      r0,[sp,#4]
        0x000247b2:    6800        .h      LDR      r0,[r0,#0]
        0x000247b4:    f89d2003    ...     LDRB     r2,[sp,#3]
        0x000247b8:    210f        .!      MOVS     r1,#0xf
        0x000247ba:    4091        .@      LSLS     r1,r1,r2
        0x000247bc:    4388        .C      BICS     r0,r0,r1
        0x000247be:    f89d100a    ....    LDRB     r1,[sp,#0xa]
        0x000247c2:    4091        .@      LSLS     r1,r1,r2
        0x000247c4:    4308        .C      ORRS     r0,r0,r1
        0x000247c6:    9901        ..      LDR      r1,[sp,#4]
        0x000247c8:    6008        .`      STR      r0,[r1,#0]
        0x000247ca:    b003        ..      ADD      sp,sp,#0xc
        0x000247cc:    4770        pG      BX       lr
        0x000247ce:    0000        ..      MOVS     r0,r0
    SYSCTRL_ClearClkGateMulti
        0x000247d0:    b081        ..      SUB      sp,sp,#4
        0x000247d2:    9000        ..      STR      r0,[sp,#0]
        0x000247d4:    9a00        ..      LDR      r2,[sp,#0]
        0x000247d6:    2104        .!      MOVS     r1,#4
        0x000247d8:    f2c40107    ....    MOVT     r1,#0x4007
        0x000247dc:    6808        .h      LDR      r0,[r1,#0]
        0x000247de:    4310        .C      ORRS     r0,r0,r2
        0x000247e0:    6008        .`      STR      r0,[r1,#0]
        0x000247e2:    b001        ..      ADD      sp,sp,#4
        0x000247e4:    4770        pG      BX       lr
        0x000247e6:    0000        ..      MOVS     r0,r0
    TMR_Disable
        0x000247e8:    b081        ..      SUB      sp,sp,#4
        0x000247ea:    9000        ..      STR      r0,[sp,#0]
        0x000247ec:    9900        ..      LDR      r1,[sp,#0]
        0x000247ee:    6888        .h      LDR      r0,[r1,#8]
        0x000247f0:    f0200001     ...    BIC      r0,r0,#1
        0x000247f4:    6088        .`      STR      r0,[r1,#8]
        0x000247f6:    b001        ..      ADD      sp,sp,#4
        0x000247f8:    4770        pG      BX       lr
        0x000247fa:    0000        ..      MOVS     r0,r0
    TMR_Enable
        0x000247fc:    b081        ..      SUB      sp,sp,#4
        0x000247fe:    9000        ..      STR      r0,[sp,#0]
        0x00024800:    9900        ..      LDR      r1,[sp,#0]
        0x00024802:    6888        .h      LDR      r0,[r1,#8]
        0x00024804:    f0400001    @...    ORR      r0,r0,#1
        0x00024808:    6088        .`      STR      r0,[r1,#8]
        0x0002480a:    b001        ..      ADD      sp,sp,#4
        0x0002480c:    4770        pG      BX       lr
        0x0002480e:    0000        ..      MOVS     r0,r0
    TMR_IntClr
        0x00024810:    b081        ..      SUB      sp,sp,#4
        0x00024812:    9000        ..      STR      r0,[sp,#0]
        0x00024814:    9900        ..      LDR      r1,[sp,#0]
        0x00024816:    6888        .h      LDR      r0,[r1,#8]
        0x00024818:    f0400040    @.@.    ORR      r0,r0,#0x40
        0x0002481c:    6088        .`      STR      r0,[r1,#8]
        0x0002481e:    b001        ..      ADD      sp,sp,#4
        0x00024820:    4770        pG      BX       lr
        0x00024822:    0000        ..      MOVS     r0,r0
    TMR_IntEnable
        0x00024824:    b081        ..      SUB      sp,sp,#4
        0x00024826:    9000        ..      STR      r0,[sp,#0]
        0x00024828:    9900        ..      LDR      r1,[sp,#0]
        0x0002482a:    6888        .h      LDR      r0,[r1,#8]
        0x0002482c:    f0400010    @...    ORR      r0,r0,#0x10
        0x00024830:    6088        .`      STR      r0,[r1,#8]
        0x00024832:    b001        ..      ADD      sp,sp,#4
        0x00024834:    4770        pG      BX       lr
        0x00024836:    0000        ..      MOVS     r0,r0
    TMR_Reload
        0x00024838:    b081        ..      SUB      sp,sp,#4
        0x0002483a:    9000        ..      STR      r0,[sp,#0]
        0x0002483c:    9900        ..      LDR      r1,[sp,#0]
        0x0002483e:    6888        .h      LDR      r0,[r1,#8]
        0x00024840:    f0400002    @...    ORR      r0,r0,#2
        0x00024844:    6088        .`      STR      r0,[r1,#8]
        0x00024846:    b001        ..      ADD      sp,sp,#4
        0x00024848:    4770        pG      BX       lr
        0x0002484a:    0000        ..      MOVS     r0,r0
    TMR_SetCMP
        0x0002484c:    b082        ..      SUB      sp,sp,#8
        0x0002484e:    9001        ..      STR      r0,[sp,#4]
        0x00024850:    9100        ..      STR      r1,[sp,#0]
        0x00024852:    9800        ..      LDR      r0,[sp,#0]
        0x00024854:    9901        ..      LDR      r1,[sp,#4]
        0x00024856:    6048        H`      STR      r0,[r1,#4]
        0x00024858:    b002        ..      ADD      sp,sp,#8
        0x0002485a:    4770        pG      BX       lr
    TMR_SetOpMode
        0x0002485c:    b082        ..      SUB      sp,sp,#8
        0x0002485e:    9001        ..      STR      r0,[sp,#4]
        0x00024860:    f88d1003    ....    STRB     r1,[sp,#3]
        0x00024864:    9801        ..      LDR      r0,[sp,#4]
        0x00024866:    6880        .h      LDR      r0,[r0,#8]
        0x00024868:    f0200008     ...    BIC      r0,r0,#8
        0x0002486c:    f89d1003    ....    LDRB     r1,[sp,#3]
        0x00024870:    ea400081    @...    ORR      r0,r0,r1,LSL #2
        0x00024874:    9901        ..      LDR      r1,[sp,#4]
        0x00024876:    6088        .`      STR      r0,[r1,#8]
        0x00024878:    b002        ..      ADD      sp,sp,#8
        0x0002487a:    4770        pG      BX       lr
    UART_SendData
        0x0002487c:    b082        ..      SUB      sp,sp,#8
        0x0002487e:    9001        ..      STR      r0,[sp,#4]
        0x00024880:    f88d1003    ....    STRB     r1,[sp,#3]
        0x00024884:    f89d0003    ....    LDRB     r0,[sp,#3]
        0x00024888:    9901        ..      LDR      r1,[sp,#4]
        0x0002488a:    6008        .`      STR      r0,[r1,#0]
        0x0002488c:    b002        ..      ADD      sp,sp,#8
        0x0002488e:    4770        pG      BX       lr
    __NVIC_SetPriority
        0x00024890:    b082        ..      SUB      sp,sp,#8
        0x00024892:    f88d0007    ....    STRB     r0,[sp,#7]
        0x00024896:    9100        ..      STR      r1,[sp,#0]
        0x00024898:    f99d0007    ....    LDRSB    r0,[sp,#7]
        0x0002489c:    2800        .(      CMP      r0,#0
        0x0002489e:    d40a        ..      BMI      0x248b6 ; __NVIC_SetPriority + 38
        0x000248a0:    e7ff        ..      B        0x248a2 ; __NVIC_SetPriority + 18
        0x000248a2:    9800        ..      LDR      r0,[sp,#0]
        0x000248a4:    0140        @.      LSLS     r0,r0,#5
        0x000248a6:    f99d1007    ....    LDRSB    r1,[sp,#7]
        0x000248aa:    f24e4200    N..B    MOVW     r2,#0xe400
        0x000248ae:    f2ce0200    ....    MOVT     r2,#0xe000
        0x000248b2:    5488        .T      STRB     r0,[r1,r2]
        0x000248b4:    e00b        ..      B        0x248ce ; __NVIC_SetPriority + 62
        0x000248b6:    9800        ..      LDR      r0,[sp,#0]
        0x000248b8:    0140        @.      LSLS     r0,r0,#5
        0x000248ba:    f89d1007    ....    LDRB     r1,[sp,#7]
        0x000248be:    f001010f    ....    AND      r1,r1,#0xf
        0x000248c2:    f64e5214    N..R    MOV      r2,#0xed14
        0x000248c6:    f2ce0200    ....    MOVT     r2,#0xe000
        0x000248ca:    5488        .T      STRB     r0,[r1,r2]
        0x000248cc:    e7ff        ..      B        0x248ce ; __NVIC_SetPriority + 62
        0x000248ce:    b002        ..      ADD      sp,sp,#8
        0x000248d0:    4770        pG      BX       lr
        0x000248d2:    0000        ..      MOVS     r0,r0
    apUART_BaudRateSet
        0x000248d4:    b086        ..      SUB      sp,sp,#0x18
        0x000248d6:    9005        ..      STR      r0,[sp,#0x14]
        0x000248d8:    9104        ..      STR      r1,[sp,#0x10]
        0x000248da:    9203        ..      STR      r2,[sp,#0xc]
        0x000248dc:    9804        ..      LDR      r0,[sp,#0x10]
        0x000248de:    00c0        ..      LSLS     r0,r0,#3
        0x000248e0:    9903        ..      LDR      r1,[sp,#0xc]
        0x000248e2:    fbb0f0f1    ....    UDIV     r0,r0,r1
        0x000248e6:    9002        ..      STR      r0,[sp,#8]
        0x000248e8:    9802        ..      LDR      r0,[sp,#8]
        0x000248ea:    09c0        ..      LSRS     r0,r0,#7
        0x000248ec:    9001        ..      STR      r0,[sp,#4]
        0x000248ee:    9901        ..      LDR      r1,[sp,#4]
        0x000248f0:    9802        ..      LDR      r0,[sp,#8]
        0x000248f2:    eba010c1    ....    SUB      r0,r0,r1,LSL #7
        0x000248f6:    9002        ..      STR      r0,[sp,#8]
        0x000248f8:    9802        ..      LDR      r0,[sp,#8]
        0x000248fa:    3001        .0      ADDS     r0,#1
        0x000248fc:    0840        @.      LSRS     r0,r0,#1
        0x000248fe:    9000        ..      STR      r0,[sp,#0]
        0x00024900:    9801        ..      LDR      r0,[sp,#4]
        0x00024902:    9905        ..      LDR      r1,[sp,#0x14]
        0x00024904:    6248        Hb      STR      r0,[r1,#0x24]
        0x00024906:    f8bd0006    ....    LDRH     r0,[sp,#6]
        0x0002490a:    b918        ..      CBNZ     r0,0x24914 ; apUART_BaudRateSet + 64
        0x0002490c:    e7ff        ..      B        0x2490e ; apUART_BaudRateSet + 58
        0x0002490e:    9801        ..      LDR      r0,[sp,#4]
        0x00024910:    b910        ..      CBNZ     r0,0x24918 ; apUART_BaudRateSet + 68
        0x00024912:    e7ff        ..      B        0x24914 ; apUART_BaudRateSet + 64
        0x00024914:    e7ff        ..      B        0x24916 ; apUART_BaudRateSet + 66
        0x00024916:    e7fe        ..      B        0x24916 ; apUART_BaudRateSet + 66
        0x00024918:    9801        ..      LDR      r0,[sp,#4]
        0x0002491a:    f64f71ff    O..q    MOV      r1,#0xffff
        0x0002491e:    4288        .B      CMP      r0,r1
        0x00024920:    d104        ..      BNE      0x2492c ; apUART_BaudRateSet + 88
        0x00024922:    e7ff        ..      B        0x24924 ; apUART_BaudRateSet + 80
        0x00024924:    9905        ..      LDR      r1,[sp,#0x14]
        0x00024926:    2000        .       MOVS     r0,#0
        0x00024928:    6288        .b      STR      r0,[r1,#0x28]
        0x0002492a:    e007        ..      B        0x2493c ; apUART_BaudRateSet + 104
        0x0002492c:    9901        ..      LDR      r1,[sp,#4]
        0x0002492e:    9802        ..      LDR      r0,[sp,#8]
        0x00024930:    1a40        @.      SUBS     r0,r0,r1
        0x00024932:    9002        ..      STR      r0,[sp,#8]
        0x00024934:    9800        ..      LDR      r0,[sp,#0]
        0x00024936:    9905        ..      LDR      r1,[sp,#0x14]
        0x00024938:    6288        .b      STR      r0,[r1,#0x28]
        0x0002493a:    e7ff        ..      B        0x2493c ; apUART_BaudRateSet + 104
        0x0002493c:    9805        ..      LDR      r0,[sp,#0x14]
        0x0002493e:    6ac0        .j      LDR      r0,[r0,#0x2c]
        0x00024940:    9905        ..      LDR      r1,[sp,#0x14]
        0x00024942:    62c8        .b      STR      r0,[r1,#0x2c]
        0x00024944:    b006        ..      ADD      sp,sp,#0x18
        0x00024946:    4770        pG      BX       lr
    apUART_Check_RXFIFO_EMPTY
        0x00024948:    b081        ..      SUB      sp,sp,#4
        0x0002494a:    9000        ..      STR      r0,[sp,#0]
        0x0002494c:    9800        ..      LDR      r0,[sp,#0]
        0x0002494e:    6980        .i      LDR      r0,[r0,#0x18]
        0x00024950:    f3c01000    ....    UBFX     r0,r0,#4,#1
        0x00024954:    b001        ..      ADD      sp,sp,#4
        0x00024956:    4770        pG      BX       lr
    apUART_Check_TXFIFO_FULL
        0x00024958:    b081        ..      SUB      sp,sp,#4
        0x0002495a:    9000        ..      STR      r0,[sp,#0]
        0x0002495c:    9800        ..      LDR      r0,[sp,#0]
        0x0002495e:    6980        .i      LDR      r0,[r0,#0x18]
        0x00024960:    f3c01040    ..@.    UBFX     r0,r0,#5,#1
        0x00024964:    b001        ..      ADD      sp,sp,#4
        0x00024966:    4770        pG      BX       lr
    apUART_Get_all_raw_int_stat
        0x00024968:    b081        ..      SUB      sp,sp,#4
        0x0002496a:    9000        ..      STR      r0,[sp,#0]
        0x0002496c:    9800        ..      LDR      r0,[sp,#0]
        0x0002496e:    6bc0        .k      LDR      r0,[r0,#0x3c]
        0x00024970:    b001        ..      ADD      sp,sp,#4
        0x00024972:    4770        pG      BX       lr
    apUART_Initialize
        0x00024974:    b580        ..      PUSH     {r7,lr}
        0x00024976:    b084        ..      SUB      sp,sp,#0x10
        0x00024978:    9003        ..      STR      r0,[sp,#0xc]
        0x0002497a:    9102        ..      STR      r1,[sp,#8]
        0x0002497c:    9201        ..      STR      r2,[sp,#4]
        0x0002497e:    9903        ..      LDR      r1,[sp,#0xc]
        0x00024980:    2000        .       MOVS     r0,#0
        0x00024982:    6308        .c      STR      r0,[r1,#0x30]
        0x00024984:    9903        ..      LDR      r1,[sp,#0xc]
        0x00024986:    6448        Hd      STR      r0,[r1,#0x44]
        0x00024988:    9903        ..      LDR      r1,[sp,#0xc]
        0x0002498a:    6388        .c      STR      r0,[r1,#0x38]
        0x0002498c:    9903        ..      LDR      r1,[sp,#0xc]
        0x0002498e:    6048        H`      STR      r0,[r1,#4]
        0x00024990:    9903        ..      LDR      r1,[sp,#0xc]
        0x00024992:    6248        Hb      STR      r0,[r1,#0x24]
        0x00024994:    9903        ..      LDR      r1,[sp,#0xc]
        0x00024996:    6288        .b      STR      r0,[r1,#0x28]
        0x00024998:    9903        ..      LDR      r1,[sp,#0xc]
        0x0002499a:    62c8        .b      STR      r0,[r1,#0x2c]
        0x0002499c:    9803        ..      LDR      r0,[sp,#0xc]
        0x0002499e:    9a02        ..      LDR      r2,[sp,#8]
        0x000249a0:    68d1        .h      LDR      r1,[r2,#0xc]
        0x000249a2:    6912        .i      LDR      r2,[r2,#0x10]
        0x000249a4:    f7ffff96    ....    BL       apUART_BaudRateSet ; 0x248d4
        0x000249a8:    9802        ..      LDR      r0,[sp,#8]
        0x000249aa:    f890c000    ....    LDRB     r12,[r0,#0]
        0x000249ae:    7841        Ax      LDRB     r1,[r0,#1]
        0x000249b0:    7883        .x      LDRB     r3,[r0,#2]
        0x000249b2:    78c2        .x      LDRB     r2,[r0,#3]
        0x000249b4:    2080        .       MOVS     r0,#0x80
        0x000249b6:    ea001041    ..A.    AND      r0,r0,r1,LSL #5
        0x000249ba:    ea40104c    @.L.    ORR      r0,r0,r12,LSL #5
        0x000249be:    ea401003    @...    ORR      r0,r0,r3,LSL #4
        0x000249c2:    ea4000c2    @...    ORR      r0,r0,r2,LSL #3
        0x000249c6:    f0010103    ....    AND      r1,r1,#3
        0x000249ca:    ea400041    @.A.    ORR      r0,r0,r1,LSL #1
        0x000249ce:    9903        ..      LDR      r1,[sp,#0xc]
        0x000249d0:    62c8        .b      STR      r0,[r1,#0x2c]
        0x000249d2:    9802        ..      LDR      r0,[sp,#8]
        0x000249d4:    f8b00009    ....    LDRH     r0,[r0,#9]
        0x000249d8:    0400        ..      LSLS     r0,r0,#16
        0x000249da:    ba00        ..      REV      r0,r0
        0x000249dc:    9903        ..      LDR      r1,[sp,#0xc]
        0x000249de:    6348        Hc      STR      r0,[r1,#0x34]
        0x000249e0:    9801        ..      LDR      r0,[sp,#4]
        0x000249e2:    9903        ..      LDR      r1,[sp,#0xc]
        0x000249e4:    6388        .c      STR      r0,[r1,#0x38]
        0x000249e6:    9902        ..      LDR      r1,[sp,#8]
        0x000249e8:    7908        .y      LDRB     r0,[r1,#4]
        0x000249ea:    f891c005    ....    LDRB     r12,[r1,#5]
        0x000249ee:    798b        .y      LDRB     r3,[r1,#6]
        0x000249f0:    79ca        .y      LDRB     r2,[r1,#7]
        0x000249f2:    0240        @.      LSLS     r0,r0,#9
        0x000249f4:    ea40200c    @..     ORR      r0,r0,r12,LSL #8
        0x000249f8:    4418        .D      ADD      r0,r0,r3
        0x000249fa:    ea4030c2    @..0    ORR      r0,r0,r2,LSL #15
        0x000249fe:    7a09        .z      LDRB     r1,[r1,#8]
        0x00024a00:    ea403081    @..0    ORR      r0,r0,r1,LSL #14
        0x00024a04:    9903        ..      LDR      r1,[sp,#0xc]
        0x00024a06:    6308        .c      STR      r0,[r1,#0x30]
        0x00024a08:    b004        ..      ADD      sp,sp,#0x10
        0x00024a0a:    bd80        ..      POP      {r7,pc}
    app_main
        0x00024a0c:    b580        ..      PUSH     {r7,lr}
        0x00024a0e:    b082        ..      SUB      sp,sp,#8
        0x00024a10:    f6450161    E.a.    MOV      r1,#0x5861
        0x00024a14:    f2c00102    ....    MOVT     r1,#2
        0x00024a18:    2001        .       MOVS     r0,#1
        0x00024a1a:    2200        ."      MOVS     r2,#0
        0x00024a1c:    9201        ..      STR      r2,[sp,#4]
        0x00024a1e:    f7f9f815    ....    BL       platform_set_evt_callback ; 0x1da4c
        0x00024a22:    9a01        ..      LDR      r2,[sp,#4]
        0x00024a24:    f6447111    D..q    MOV      r1,#0x4f11
        0x00024a28:    f2c00102    ....    MOVT     r1,#2
        0x00024a2c:    2004        .       MOVS     r0,#4
        0x00024a2e:    f7f9f80d    ....    BL       platform_set_evt_callback ; 0x1da4c
        0x00024a32:    9a01        ..      LDR      r2,[sp,#4]
        0x00024a34:    f64461f1    D..a    MOV      r1,#0x4ef1
        0x00024a38:    f2c00102    ....    MOVT     r1,#2
        0x00024a3c:    2005        .       MOVS     r0,#5
        0x00024a3e:    f7f9f805    ....    BL       platform_set_evt_callback ; 0x1da4c
        0x00024a42:    9a01        ..      LDR      r2,[sp,#4]
        0x00024a44:    f6447169    D.iq    MOV      r1,#0x4f69
        0x00024a48:    f2c00102    ....    MOVT     r1,#2
        0x00024a4c:    2007        .       MOVS     r0,#7
        0x00024a4e:    f7f8fffd    ....    BL       platform_set_evt_callback ; 0x1da4c
        0x00024a52:    9a01        ..      LDR      r2,[sp,#4]
        0x00024a54:    f2456161    E.aa    MOV      r1,#0x5661
        0x00024a58:    f2c00102    ....    MOVT     r1,#2
        0x00024a5c:    2002        .       MOVS     r0,#2
        0x00024a5e:    f7f8fff5    ....    BL       platform_set_evt_callback ; 0x1da4c
        0x00024a62:    9a01        ..      LDR      r2,[sp,#4]
        0x00024a64:    f24561a1    E..a    MOV      r1,#0x56a1
        0x00024a68:    f2c00102    ....    MOVT     r1,#2
        0x00024a6c:    2003        .       MOVS     r0,#3
        0x00024a6e:    f7f8ffed    ....    BL       platform_set_evt_callback ; 0x1da4c
        0x00024a72:    9a01        ..      LDR      r2,[sp,#4]
        0x00024a74:    f6447185    D..q    MOV      r1,#0x4f85
        0x00024a78:    f2c00102    ....    MOVT     r1,#2
        0x00024a7c:    4610        .F      MOV      r0,r2
        0x00024a7e:    f7f8ffe5    ....    BL       platform_set_evt_callback ; 0x1da4c
        0x00024a82:    f000feaf    ....    BL       setup_peripherals ; 0x257e4
        0x00024a86:    f000fe03    ....    BL       os_impl_get_driver ; 0x25690
        0x00024a8a:    b002        ..      ADD      sp,sp,#8
        0x00024a8c:    bd80        ..      POP      {r7,pc}
        0x00024a8e:    0000        ..      MOVS     r0,r0
    att_event_mtu_exchange_complete_get_MTU
        0x00024a90:    b081        ..      SUB      sp,sp,#4
        0x00024a92:    9000        ..      STR      r0,[sp,#0]
        0x00024a94:    9800        ..      LDR      r0,[sp,#0]
        0x00024a96:    8880        ..      LDRH     r0,[r0,#4]
        0x00024a98:    b001        ..      ADD      sp,sp,#4
        0x00024a9a:    4770        pG      BX       lr
    att_read_callback
        0x00024a9c:    b580        ..      PUSH     {r7,lr}
        0x00024a9e:    b084        ..      SUB      sp,sp,#0x10
        0x00024aa0:    4684        .F      MOV      r12,r0
        0x00024aa2:    9806        ..      LDR      r0,[sp,#0x18]
        0x00024aa4:    f8adc00c    ....    STRH     r12,[sp,#0xc]
        0x00024aa8:    f8ad100a    ....    STRH     r1,[sp,#0xa]
        0x00024aac:    f8ad2008    ...     STRH     r2,[sp,#8]
        0x00024ab0:    9301        ..      STR      r3,[sp,#4]
        0x00024ab2:    f8ad0002    ....    STRH     r0,[sp,#2]
        0x00024ab6:    f8bd000a    ....    LDRH     r0,[sp,#0xa]
        0x00024aba:    2808        .(      CMP      r0,#8
        0x00024abc:    d113        ..      BNE      0x24ae6 ; att_read_callback + 74
        0x00024abe:    e7ff        ..      B        0x24ac0 ; att_read_callback + 36
        0x00024ac0:    9801        ..      LDR      r0,[sp,#4]
        0x00024ac2:    b160        `.      CBZ      r0,0x24ade ; att_read_callback + 66
        0x00024ac4:    e7ff        ..      B        0x24ac6 ; att_read_callback + 42
        0x00024ac6:    f2421000    B...    MOVW     r0,#0x2100
        0x00024aca:    f2c20000    ....    MOVT     r0,#0x2000
        0x00024ace:    6800        .h      LDR      r0,[r0,#0]
        0x00024ad0:    9901        ..      LDR      r1,[sp,#4]
        0x00024ad2:    6008        .`      STR      r0,[r1,#0]
        0x00024ad4:    f8bd0002    ....    LDRH     r0,[sp,#2]
        0x00024ad8:    f8ad000e    ....    STRH     r0,[sp,#0xe]
        0x00024adc:    e007        ..      B        0x24aee ; att_read_callback + 82
        0x00024ade:    2004        .       MOVS     r0,#4
        0x00024ae0:    f8ad000e    ....    STRH     r0,[sp,#0xe]
        0x00024ae4:    e003        ..      B        0x24aee ; att_read_callback + 82
        0x00024ae6:    2000        .       MOVS     r0,#0
        0x00024ae8:    f8ad000e    ....    STRH     r0,[sp,#0xe]
        0x00024aec:    e7ff        ..      B        0x24aee ; att_read_callback + 82
        0x00024aee:    f8bd000e    ....    LDRH     r0,[sp,#0xe]
        0x00024af2:    b004        ..      ADD      sp,sp,#0x10
        0x00024af4:    bd80        ..      POP      {r7,pc}
        0x00024af6:    0000        ..      MOVS     r0,r0
    att_write_callback
        0x00024af8:    b580        ..      PUSH     {r7,lr}
        0x00024afa:    b086        ..      SUB      sp,sp,#0x18
        0x00024afc:    4684        .F      MOV      r12,r0
        0x00024afe:    9809        ..      LDR      r0,[sp,#0x24]
        0x00024b00:    f8dde020    .. .    LDR      lr,[sp,#0x20]
        0x00024b04:    f8adc012    ....    STRH     r12,[sp,#0x12]
        0x00024b08:    f8ad1010    ....    STRH     r1,[sp,#0x10]
        0x00024b0c:    f8ad200e    ...     STRH     r2,[sp,#0xe]
        0x00024b10:    f8ad300c    ...0    STRH     r3,[sp,#0xc]
        0x00024b14:    f8ad000a    ....    STRH     r0,[sp,#0xa]
        0x00024b18:    f8bd0010    ....    LDRH     r0,[sp,#0x10]
        0x00024b1c:    4601        .F      MOV      r1,r0
        0x00024b1e:    9101        ..      STR      r1,[sp,#4]
        0x00024b20:    2808        .(      CMP      r0,#8
        0x00024b22:    d004        ..      BEQ      0x24b2e ; att_write_callback + 54
        0x00024b24:    e7ff        ..      B        0x24b26 ; att_write_callback + 46
        0x00024b26:    9801        ..      LDR      r0,[sp,#4]
        0x00024b28:    280b        .(      CMP      r0,#0xb
        0x00024b2a:    d011        ..      BEQ      0x24b50 ; att_write_callback + 88
        0x00024b2c:    e026        &.      B        0x24b7c ; att_write_callback + 132
        0x00024b2e:    f8bd200a    ...     LDRH     r2,[sp,#0xa]
        0x00024b32:    f2421100    B...    MOVW     r1,#0x2100
        0x00024b36:    f2c20100    ....    MOVT     r1,#0x2000
        0x00024b3a:    6808        .h      LDR      r0,[r1,#0]
        0x00024b3c:    4410        .D      ADD      r0,r0,r2
        0x00024b3e:    6008        .`      STR      r0,[r1,#0]
        0x00024b40:    9808        ..      LDR      r0,[sp,#0x20]
        0x00024b42:    f8bd100a    ....    LDRH     r1,[sp,#0xa]
        0x00024b46:    f000f81f    ....    BL       ble_att_data_handle ; 0x24b88
        0x00024b4a:    2000        .       MOVS     r0,#0
        0x00024b4c:    9005        ..      STR      r0,[sp,#0x14]
        0x00024b4e:    e018        ..      B        0x24b82 ; att_write_callback + 138
        0x00024b50:    9808        ..      LDR      r0,[sp,#0x20]
        0x00024b52:    8800        ..      LDRH     r0,[r0,#0]
        0x00024b54:    2801        .(      CMP      r0,#1
        0x00024b56:    d107        ..      BNE      0x24b68 ; att_write_callback + 112
        0x00024b58:    e7ff        ..      B        0x24b5a ; att_write_callback + 98
        0x00024b5a:    f64171f9    A..q    MOV      r1,#0x1ff9
        0x00024b5e:    f2c20100    ....    MOVT     r1,#0x2000
        0x00024b62:    2001        .       MOVS     r0,#1
        0x00024b64:    7008        .p      STRB     r0,[r1,#0]
        0x00024b66:    e006        ..      B        0x24b76 ; att_write_callback + 126
        0x00024b68:    f64171f9    A..q    MOV      r1,#0x1ff9
        0x00024b6c:    f2c20100    ....    MOVT     r1,#0x2000
        0x00024b70:    2000        .       MOVS     r0,#0
        0x00024b72:    7008        .p      STRB     r0,[r1,#0]
        0x00024b74:    e7ff        ..      B        0x24b76 ; att_write_callback + 126
        0x00024b76:    2000        .       MOVS     r0,#0
        0x00024b78:    9005        ..      STR      r0,[sp,#0x14]
        0x00024b7a:    e002        ..      B        0x24b82 ; att_write_callback + 138
        0x00024b7c:    2000        .       MOVS     r0,#0
        0x00024b7e:    9005        ..      STR      r0,[sp,#0x14]
        0x00024b80:    e7ff        ..      B        0x24b82 ; att_write_callback + 138
        0x00024b82:    9805        ..      LDR      r0,[sp,#0x14]
        0x00024b84:    b006        ..      ADD      sp,sp,#0x18
        0x00024b86:    bd80        ..      POP      {r7,pc}
    ble_att_data_handle
        0x00024b88:    b580        ..      PUSH     {r7,lr}
        0x00024b8a:    b088        ..      SUB      sp,sp,#0x20
        0x00024b8c:    9007        ..      STR      r0,[sp,#0x1c]
        0x00024b8e:    f8ad101a    ....    STRH     r1,[sp,#0x1a]
        0x00024b92:    9807        ..      LDR      r0,[sp,#0x1c]
        0x00024b94:    9005        ..      STR      r0,[sp,#0x14]
        0x00024b96:    9807        ..      LDR      r0,[sp,#0x1c]
        0x00024b98:    7801        .x      LDRB     r1,[r0,#0]
        0x00024b9a:    7842        Bx      LDRB     r2,[r0,#1]
        0x00024b9c:    7883        .x      LDRB     r3,[r0,#2]
        0x00024b9e:    f2464003    F..@    MOV      r0,#0x6403
        0x00024ba2:    f2c00002    ....    MOVT     r0,#2
        0x00024ba6:    f7f8ff13    ....    BL       platform_printf ; 0x1d9d0
        0x00024baa:    9805        ..      LDR      r0,[sp,#0x14]
        0x00024bac:    7800        .x      LDRB     r0,[r0,#0]
        0x00024bae:    38a0        .8      SUBS     r0,r0,#0xa0
        0x00024bb0:    4601        .F      MOV      r1,r0
        0x00024bb2:    9100        ..      STR      r1,[sp,#0]
        0x00024bb4:    2803        .(      CMP      r0,#3
        0x00024bb6:    d83e        >.      BHI      0x24c36 ; ble_att_data_handle + 174
        0x00024bb8:    9900        ..      LDR      r1,[sp,#0]
        0x00024bba:    e8dff001    ....    TBB      [pc,r1]
    $d.1
        0x00024bbe:    2a02        .*      DCW    10754
        0x00024bc0:    3310        .3      DCW    13072
    $t.2
        0x00024bc2:    9807        ..      LDR      r0,[sp,#0x1c]
        0x00024bc4:    9004        ..      STR      r0,[sp,#0x10]
        0x00024bc6:    9804        ..      LDR      r0,[sp,#0x10]
        0x00024bc8:    f8d00001    ....    LDR      r0,[r0,#1]
        0x00024bcc:    f24171f0    A..q    MOV      r1,#0x17f0
        0x00024bd0:    f2c20100    ....    MOVT     r1,#0x2000
        0x00024bd4:    f8c107fd    ....    STR      r0,[r1,#0x7fd]
        0x00024bd8:    f000fcbe    ....    BL       internal_time_sync_schedule ; 0x25558
        0x00024bdc:    e02c        ,.      B        0x24c38 ; ble_att_data_handle + 176
        0x00024bde:    9807        ..      LDR      r0,[sp,#0x1c]
        0x00024be0:    9003        ..      STR      r0,[sp,#0xc]
        0x00024be2:    f64170f9    A..p    MOV      r0,#0x1ff9
        0x00024be6:    f2c20000    ....    MOVT     r0,#0x2000
        0x00024bea:    7800        .x      LDRB     r0,[r0,#0]
        0x00024bec:    b180        ..      CBZ      r0,0x24c10 ; ble_att_data_handle + 136
        0x00024bee:    e7ff        ..      B        0x24bf0 ; ble_att_data_handle + 104
        0x00024bf0:    9903        ..      LDR      r1,[sp,#0xc]
        0x00024bf2:    f8d10001    ....    LDR      r0,[r1,#1]
        0x00024bf6:    f8d12005    ...     LDR      r2,[r1,#5]
        0x00024bfa:    f2417132    A.2q    MOV      r1,#0x1732
        0x00024bfe:    f2c20100    ....    MOVT     r1,#0x2000
        0x00024c02:    f8c12005    ...     STR      r2,[r1,#5]
        0x00024c06:    f8c10001    ....    STR      r0,[r1,#1]
        0x00024c0a:    f000f8c7    ....    BL       came_sync_schedule0 ; 0x24d9c
        0x00024c0e:    e7ff        ..      B        0x24c10 ; ble_att_data_handle + 136
        0x00024c10:    e012        ..      B        0x24c38 ; ble_att_data_handle + 176
        0x00024c12:    9807        ..      LDR      r0,[sp,#0x1c]
        0x00024c14:    9002        ..      STR      r0,[sp,#8]
        0x00024c16:    9902        ..      LDR      r1,[sp,#8]
        0x00024c18:    1cc8        ..      ADDS     r0,r1,#3
        0x00024c1a:    f8b11001    ....    LDRH     r1,[r1,#1]
        0x00024c1e:    f001f92b    ..+.    BL       uart_external_send_data ; 0x25e78
        0x00024c22:    e009        ..      B        0x24c38 ; ble_att_data_handle + 176
        0x00024c24:    9807        ..      LDR      r0,[sp,#0x1c]
        0x00024c26:    9001        ..      STR      r0,[sp,#4]
        0x00024c28:    9901        ..      LDR      r1,[sp,#4]
        0x00024c2a:    1cc8        ..      ADDS     r0,r1,#3
        0x00024c2c:    f8b11001    ....    LDRH     r1,[r1,#1]
        0x00024c30:    f001f922    ..".    BL       uart_external_send_data ; 0x25e78
        0x00024c34:    e000        ..      B        0x24c38 ; ble_att_data_handle + 176
        0x00024c36:    e7ff        ..      B        0x24c38 ; ble_att_data_handle + 176
        0x00024c38:    b008        ..      ADD      sp,sp,#0x20
        0x00024c3a:    bd80        ..      POP      {r7,pc}
    ble_att_send_data
        0x00024c3c:    b580        ..      PUSH     {r7,lr}
        0x00024c3e:    b088        ..      SUB      sp,sp,#0x20
        0x00024c40:    9007        ..      STR      r0,[sp,#0x1c]
        0x00024c42:    9106        ..      STR      r1,[sp,#0x18]
        0x00024c44:    f24170d0    A..p    MOV      r0,#0x17d0
        0x00024c48:    f2c20000    ....    MOVT     r0,#0x2000
        0x00024c4c:    8800        ..      LDRH     r0,[r0,#0]
        0x00024c4e:    f7e1fa6f    ..o.    BL       att_server_get_mtu ; 0x6130
        0x00024c52:    3803        .8      SUBS     r0,#3
        0x00024c54:    9005        ..      STR      r0,[sp,#0x14]
        0x00024c56:    f64170f9    A..p    MOV      r0,#0x1ff9
        0x00024c5a:    f2c20000    ....    MOVT     r0,#0x2000
        0x00024c5e:    7800        .x      LDRB     r0,[r0,#0]
        0x00024c60:    b908        ..      CBNZ     r0,0x24c66 ; ble_att_send_data + 42
        0x00024c62:    e7ff        ..      B        0x24c64 ; ble_att_send_data + 40
        0x00024c64:    e048        H.      B        0x24cf8 ; ble_att_send_data + 188
        0x00024c66:    9807        ..      LDR      r0,[sp,#0x1c]
        0x00024c68:    9004        ..      STR      r0,[sp,#0x10]
        0x00024c6a:    9804        ..      LDR      r0,[sp,#0x10]
        0x00024c6c:    7801        .x      LDRB     r1,[r0,#0]
        0x00024c6e:    7842        Bx      LDRB     r2,[r0,#1]
        0x00024c70:    7883        .x      LDRB     r3,[r0,#2]
        0x00024c72:    78c0        .x      LDRB     r0,[r0,#3]
        0x00024c74:    f8dde018    ....    LDR      lr,[sp,#0x18]
        0x00024c78:    46ec        .F      MOV      r12,sp
        0x00024c7a:    f8cce004    ....    STR      lr,[r12,#4]
        0x00024c7e:    f8cc0000    ....    STR      r0,[r12,#0]
        0x00024c82:    f2464048    F.H@    MOV      r0,#0x6448
        0x00024c86:    f2c00002    ....    MOVT     r0,#2
        0x00024c8a:    f7f8fea1    ....    BL       platform_printf ; 0x1d9d0
        0x00024c8e:    e7ff        ..      B        0x24c90 ; ble_att_send_data + 84
        0x00024c90:    9806        ..      LDR      r0,[sp,#0x18]
        0x00024c92:    b388        ..      CBZ      r0,0x24cf8 ; ble_att_send_data + 188
        0x00024c94:    e7ff        ..      B        0x24c96 ; ble_att_send_data + 90
        0x00024c96:    9806        ..      LDR      r0,[sp,#0x18]
        0x00024c98:    9905        ..      LDR      r1,[sp,#0x14]
        0x00024c9a:    4288        .B      CMP      r0,r1
        0x00024c9c:    dd03        ..      BLE      0x24ca6 ; ble_att_send_data + 106
        0x00024c9e:    e7ff        ..      B        0x24ca0 ; ble_att_send_data + 100
        0x00024ca0:    9805        ..      LDR      r0,[sp,#0x14]
        0x00024ca2:    9002        ..      STR      r0,[sp,#8]
        0x00024ca4:    e002        ..      B        0x24cac ; ble_att_send_data + 112
        0x00024ca6:    9806        ..      LDR      r0,[sp,#0x18]
        0x00024ca8:    9002        ..      STR      r0,[sp,#8]
        0x00024caa:    e7ff        ..      B        0x24cac ; ble_att_send_data + 112
        0x00024cac:    9802        ..      LDR      r0,[sp,#8]
        0x00024cae:    9003        ..      STR      r0,[sp,#0xc]
        0x00024cb0:    f24170d0    A..p    MOV      r0,#0x17d0
        0x00024cb4:    f2c20000    ....    MOVT     r0,#0x2000
        0x00024cb8:    8800        ..      LDRH     r0,[r0,#0]
        0x00024cba:    9a04        ..      LDR      r2,[sp,#0x10]
        0x00024cbc:    f8bd300c    ...0    LDRH     r3,[sp,#0xc]
        0x00024cc0:    210a        .!      MOVS     r1,#0xa
        0x00024cc2:    f7e1fad1    ....    BL       att_server_notify ; 0x6268
        0x00024cc6:    b170        p.      CBZ      r0,0x24ce6 ; ble_att_send_data + 170
        0x00024cc8:    e7ff        ..      B        0x24cca ; ble_att_send_data + 142
        0x00024cca:    f2464019    F..@    MOV      r0,#0x6419
        0x00024cce:    f2c00002    ....    MOVT     r0,#2
        0x00024cd2:    f7f8fe7d    ..}.    BL       platform_printf ; 0x1d9d0
        0x00024cd6:    f24170d0    A..p    MOV      r0,#0x17d0
        0x00024cda:    f2c20000    ....    MOVT     r0,#0x2000
        0x00024cde:    8800        ..      LDRH     r0,[r0,#0]
        0x00024ce0:    f7e1fb54    ..T.    BL       att_server_request_can_send_now_event ; 0x638c
        0x00024ce4:    e008        ..      B        0x24cf8 ; ble_att_send_data + 188
        0x00024ce6:    9903        ..      LDR      r1,[sp,#0xc]
        0x00024ce8:    9806        ..      LDR      r0,[sp,#0x18]
        0x00024cea:    1a40        @.      SUBS     r0,r0,r1
        0x00024cec:    9006        ..      STR      r0,[sp,#0x18]
        0x00024cee:    9903        ..      LDR      r1,[sp,#0xc]
        0x00024cf0:    9804        ..      LDR      r0,[sp,#0x10]
        0x00024cf2:    4408        .D      ADD      r0,r0,r1
        0x00024cf4:    9004        ..      STR      r0,[sp,#0x10]
        0x00024cf6:    e7cb        ..      B        0x24c90 ; ble_att_send_data + 84
        0x00024cf8:    b008        ..      ADD      sp,sp,#0x20
        0x00024cfa:    bd80        ..      POP      {r7,pc}
    ble_external_send_data
        0x00024cfc:    b580        ..      PUSH     {r7,lr}
        0x00024cfe:    b084        ..      SUB      sp,sp,#0x10
        0x00024d00:    9003        ..      STR      r0,[sp,#0xc]
        0x00024d02:    f8ad100a    ....    STRH     r1,[sp,#0xa]
        0x00024d06:    f2416048    A.H`    MOV      r0,#0x1648
        0x00024d0a:    f2c20000    ....    MOVT     r0,#0x2000
        0x00024d0e:    9001        ..      STR      r0,[sp,#4]
        0x00024d10:    21a1        .!      MOVS     r1,#0xa1
        0x00024d12:    7001        .p      STRB     r1,[r0,#0]
        0x00024d14:    f8bd100a    ....    LDRH     r1,[sp,#0xa]
        0x00024d18:    f8a01001    ....    STRH     r1,[r0,#1]
        0x00024d1c:    9903        ..      LDR      r1,[sp,#0xc]
        0x00024d1e:    f8bd200a    ...     LDRH     r2,[sp,#0xa]
        0x00024d22:    3003        .0      ADDS     r0,#3
        0x00024d24:    f7fff998    ....    BL       ___aeabi_memcpy4$move ; 0x24058
        0x00024d28:    9901        ..      LDR      r1,[sp,#4]
        0x00024d2a:    f8b10001    ....    LDRH     r0,[r1,#1]
        0x00024d2e:    3003        .0      ADDS     r0,#3
        0x00024d30:    b282        ..      UXTH     r2,r0
        0x00024d32:    2008        .       MOVS     r0,#8
        0x00024d34:    f7e1fde4    ....    BL       btstack_push_user_msg ; 0x6900
        0x00024d38:    b004        ..      ADD      sp,sp,#0x10
        0x00024d3a:    bd80        ..      POP      {r7,pc}
    ble_external_send_dev_sync_data
        0x00024d3c:    b580        ..      PUSH     {r7,lr}
        0x00024d3e:    b084        ..      SUB      sp,sp,#0x10
        0x00024d40:    9003        ..      STR      r0,[sp,#0xc]
        0x00024d42:    f8ad100a    ....    STRH     r1,[sp,#0xa]
        0x00024d46:    f2416048    A.H`    MOV      r0,#0x1648
        0x00024d4a:    f2c20000    ....    MOVT     r0,#0x2000
        0x00024d4e:    9001        ..      STR      r0,[sp,#4]
        0x00024d50:    21a3        .!      MOVS     r1,#0xa3
        0x00024d52:    7001        .p      STRB     r1,[r0,#0]
        0x00024d54:    f8bd100a    ....    LDRH     r1,[sp,#0xa]
        0x00024d58:    f8a01001    ....    STRH     r1,[r0,#1]
        0x00024d5c:    9903        ..      LDR      r1,[sp,#0xc]
        0x00024d5e:    f8bd200a    ...     LDRH     r2,[sp,#0xa]
        0x00024d62:    3003        .0      ADDS     r0,#3
        0x00024d64:    f7fff978    ..x.    BL       ___aeabi_memcpy4$move ; 0x24058
        0x00024d68:    9801        ..      LDR      r0,[sp,#4]
        0x00024d6a:    78c1        .x      LDRB     r1,[r0,#3]
        0x00024d6c:    7902        .y      LDRB     r2,[r0,#4]
        0x00024d6e:    f24630f9    F..0    MOV      r0,#0x63f9
        0x00024d72:    f2c00002    ....    MOVT     r0,#2
        0x00024d76:    f7f8fe2b    ..+.    BL       platform_printf ; 0x1d9d0
        0x00024d7a:    9901        ..      LDR      r1,[sp,#4]
        0x00024d7c:    f8b10001    ....    LDRH     r0,[r1,#1]
        0x00024d80:    3003        .0      ADDS     r0,#3
        0x00024d82:    b282        ..      UXTH     r2,r0
        0x00024d84:    2008        .       MOVS     r0,#8
        0x00024d86:    f7e1fdbb    ....    BL       btstack_push_user_msg ; 0x6900
        0x00024d8a:    b004        ..      ADD      sp,sp,#0x10
        0x00024d8c:    bd80        ..      POP      {r7,pc}
        0x00024d8e:    0000        ..      MOVS     r0,r0
    btstack_event_state_get_state
        0x00024d90:    b081        ..      SUB      sp,sp,#4
        0x00024d92:    9000        ..      STR      r0,[sp,#0]
        0x00024d94:    9800        ..      LDR      r0,[sp,#0]
        0x00024d96:    7880        .x      LDRB     r0,[r0,#2]
        0x00024d98:    b001        ..      ADD      sp,sp,#4
        0x00024d9a:    4770        pG      BX       lr
    came_sync_schedule0
        0x00024d9c:    b510        ..      PUSH     {r4,lr}
        0x00024d9e:    b094        ..      SUB      sp,sp,#0x50
        0x00024da0:    2000        .       MOVS     r0,#0
        0x00024da2:    9013        ..      STR      r0,[sp,#0x4c]
        0x00024da4:    9012        ..      STR      r0,[sp,#0x48]
        0x00024da6:    9011        ..      STR      r0,[sp,#0x44]
        0x00024da8:    9010        ..      STR      r0,[sp,#0x40]
        0x00024daa:    900b        ..      STR      r0,[sp,#0x2c]
        0x00024dac:    900a        ..      STR      r0,[sp,#0x28]
        0x00024dae:    9009        ..      STR      r0,[sp,#0x24]
        0x00024db0:    f24171f0    A..q    MOV      r1,#0x17f0
        0x00024db4:    f2c20100    ....    MOVT     r1,#0x2000
        0x00024db8:    6908        .i      LDR      r0,[r1,#0x10]
        0x00024dba:    6949        Ii      LDR      r1,[r1,#0x14]
        0x00024dbc:    4308        .C      ORRS     r0,r0,r1
        0x00024dbe:    2800        .(      CMP      r0,#0
        0x00024dc0:    f0008093    ....    BEQ.W    0x24eea ; came_sync_schedule0 + 334
        0x00024dc4:    e7ff        ..      B        0x24dc6 ; came_sync_schedule0 + 42
        0x00024dc6:    f2417032    A.2p    MOV      r0,#0x1732
        0x00024dca:    f2c20000    ....    MOVT     r0,#0x2000
        0x00024dce:    f8d01001    ....    LDR      r1,[r0,#1]
        0x00024dd2:    f8d00005    ....    LDR      r0,[r0,#5]
        0x00024dd6:    f24172f0    A..r    MOV      r2,#0x17f0
        0x00024dda:    f2c20200    ....    MOVT     r2,#0x2000
        0x00024dde:    9206        ..      STR      r2,[sp,#0x18]
        0x00024de0:    f8d2c010    ....    LDR      r12,[r2,#0x10]
        0x00024de4:    6953        Si      LDR      r3,[r2,#0x14]
        0x00024de6:    ebb1010c    ....    SUBS     r1,r1,r12
        0x00024dea:    4198        .A      SBCS     r0,r0,r3
        0x00024dec:    9112        ..      STR      r1,[sp,#0x48]
        0x00024dee:    9013        ..      STR      r0,[sp,#0x4c]
        0x00024df0:    9912        ..      LDR      r1,[sp,#0x48]
        0x00024df2:    9813        ..      LDR      r0,[sp,#0x4c]
        0x00024df4:    6893        .h      LDR      r3,[r2,#8]
        0x00024df6:    68d2        .h      LDR      r2,[r2,#0xc]
        0x00024df8:    1ac9        ..      SUBS     r1,r1,r3
        0x00024dfa:    4190        .A      SBCS     r0,r0,r2
        0x00024dfc:    9110        ..      STR      r1,[sp,#0x40]
        0x00024dfe:    9011        ..      STR      r0,[sp,#0x44]
        0x00024e00:    9812        ..      LDR      r0,[sp,#0x48]
        0x00024e02:    9913        ..      LDR      r1,[sp,#0x4c]
        0x00024e04:    f7fffb00    ....    BL       __aeabi_l2d ; 0x24408
        0x00024e08:    910f        ..      STR      r1,[sp,#0x3c]
        0x00024e0a:    900e        ..      STR      r0,[sp,#0x38]
        0x00024e0c:    9810        ..      LDR      r0,[sp,#0x40]
        0x00024e0e:    9911        ..      LDR      r1,[sp,#0x44]
        0x00024e10:    f7fffafa    ....    BL       __aeabi_l2d ; 0x24408
        0x00024e14:    9b06        ..      LDR      r3,[sp,#0x18]
        0x00024e16:    910d        ..      STR      r1,[sp,#0x34]
        0x00024e18:    900c        ..      STR      r0,[sp,#0x30]
        0x00024e1a:    980c        ..      LDR      r0,[sp,#0x30]
        0x00024e1c:    990d        ..      LDR      r1,[sp,#0x34]
        0x00024e1e:    f8d32801    ...(    LDR      r2,[r3,#0x801]
        0x00024e22:    f8d33805    ...8    LDR      r3,[r3,#0x805]
        0x00024e26:    f7fff9f0    ....    BL       __aeabi_dmul ; 0x2420a
        0x00024e2a:    2200        ."      MOVS     r2,#0
        0x00024e2c:    f2484380    H..C    MOV      r3,#0x8480
        0x00024e30:    f2c4132e    ....    MOVT     r3,#0x412e
        0x00024e34:    f7fffa5b    ..[.    BL       __aeabi_ddiv ; 0x242ee
        0x00024e38:    910d        ..      STR      r1,[sp,#0x34]
        0x00024e3a:    900c        ..      STR      r0,[sp,#0x30]
        0x00024e3c:    9a0c        ..      LDR      r2,[sp,#0x30]
        0x00024e3e:    9b0d        ..      LDR      r3,[sp,#0x34]
        0x00024e40:    980e        ..      LDR      r0,[sp,#0x38]
        0x00024e42:    990f        ..      LDR      r1,[sp,#0x3c]
        0x00024e44:    f7fff93a    ..:.    BL       __aeabi_dadd ; 0x240bc
        0x00024e48:    910f        ..      STR      r1,[sp,#0x3c]
        0x00024e4a:    900e        ..      STR      r0,[sp,#0x38]
        0x00024e4c:    980e        ..      LDR      r0,[sp,#0x38]
        0x00024e4e:    990f        ..      LDR      r1,[sp,#0x3c]
        0x00024e50:    f001f99e    ....    BL       round ; 0x26190
        0x00024e54:    f7fffaec    ....    BL       __aeabi_d2lz ; 0x24430
        0x00024e58:    910b        ..      STR      r1,[sp,#0x2c]
        0x00024e5a:    900a        ..      STR      r0,[sp,#0x28]
        0x00024e5c:    b672        r.      CPSID    i
        0x00024e5e:    980a        ..      LDR      r0,[sp,#0x28]
        0x00024e60:    9008        ..      STR      r0,[sp,#0x20]
        0x00024e62:    980b        ..      LDR      r0,[sp,#0x2c]
        0x00024e64:    9007        ..      STR      r0,[sp,#0x1c]
        0x00024e66:    f7f8fd8b    ....    BL       platform_get_us_time ; 0x1d980
        0x00024e6a:    4603        .F      MOV      r3,r0
        0x00024e6c:    9807        ..      LDR      r0,[sp,#0x1c]
        0x00024e6e:    460a        .F      MOV      r2,r1
        0x00024e70:    9908        ..      LDR      r1,[sp,#0x20]
        0x00024e72:    1ac9        ..      SUBS     r1,r1,r3
        0x00024e74:    4190        .A      SBCS     r0,r0,r2
        0x00024e76:    f24032e9    @..2    MOV      r2,#0x3e9
        0x00024e7a:    1a89        ..      SUBS     r1,r1,r2
        0x00024e7c:    f1700000    p...    SBCS     r0,r0,#0
        0x00024e80:    d311        ..      BCC      0x24ea6 ; came_sync_schedule0 + 266
        0x00024e82:    e7ff        ..      B        0x24e84 ; came_sync_schedule0 + 232
        0x00024e84:    980a        ..      LDR      r0,[sp,#0x28]
        0x00024e86:    9004        ..      STR      r0,[sp,#0x10]
        0x00024e88:    f7f8fd7a    ..z.    BL       platform_get_us_time ; 0x1d980
        0x00024e8c:    4602        .F      MOV      r2,r0
        0x00024e8e:    9804        ..      LDR      r0,[sp,#0x10]
        0x00024e90:    9205        ..      STR      r2,[sp,#0x14]
        0x00024e92:    9905        ..      LDR      r1,[sp,#0x14]
        0x00024e94:    1a40        @.      SUBS     r0,r0,r1
        0x00024e96:    9009        ..      STR      r0,[sp,#0x24]
        0x00024e98:    9809        ..      LDR      r0,[sp,#0x24]
        0x00024e9a:    eb000040    ..@.    ADD      r0,r0,r0,LSL #1
        0x00024e9e:    00c0        ..      LSLS     r0,r0,#3
        0x00024ea0:    f000fdde    ....    BL       timer2_enable ; 0x25a60
        0x00024ea4:    e7ff        ..      B        0x24ea6 ; came_sync_schedule0 + 266
        0x00024ea6:    b662        b.      CPSIE    i
        0x00024ea8:    f2417032    A.2p    MOV      r0,#0x1732
        0x00024eac:    f2c20000    ....    MOVT     r0,#0x2000
        0x00024eb0:    f8d02001    ...     LDR      r2,[r0,#1]
        0x00024eb4:    f8d03005    ...0    LDR      r3,[r0,#5]
        0x00024eb8:    980a        ..      LDR      r0,[sp,#0x28]
        0x00024eba:    f8ddc02c    ..,.    LDR      r12,[sp,#0x2c]
        0x00024ebe:    f24171f0    A..q    MOV      r1,#0x17f0
        0x00024ec2:    f2c20100    ....    MOVT     r1,#0x2000
        0x00024ec6:    f8d1e801    ....    LDR      lr,[r1,#0x801]
        0x00024eca:    f8d14805    ...H    LDR      r4,[r1,#0x805]
        0x00024ece:    4669        iF      MOV      r1,sp
        0x00024ed0:    60cc        .`      STR      r4,[r1,#0xc]
        0x00024ed2:    f8c1e008    ....    STR      lr,[r1,#8]
        0x00024ed6:    f8c1c004    ....    STR      r12,[r1,#4]
        0x00024eda:    6008        .`      STR      r0,[r1,#0]
        0x00024edc:    f24640d3    F..@    MOV      r0,#0x64d3
        0x00024ee0:    f2c00002    ....    MOVT     r0,#2
        0x00024ee4:    f7f8fd74    ..t.    BL       platform_printf ; 0x1d9d0
        0x00024ee8:    e7ff        ..      B        0x24eea ; came_sync_schedule0 + 334
        0x00024eea:    b014        ..      ADD      sp,sp,#0x50
        0x00024eec:    bd10        ..      POP      {r4,pc}
        0x00024eee:    0000        ..      MOVS     r0,r0
    cb_assertion
        0x00024ef0:    b580        ..      PUSH     {r7,lr}
        0x00024ef2:    b082        ..      SUB      sp,sp,#8
        0x00024ef4:    9001        ..      STR      r0,[sp,#4]
        0x00024ef6:    9100        ..      STR      r1,[sp,#0]
        0x00024ef8:    9801        ..      LDR      r0,[sp,#4]
        0x00024efa:    6801        .h      LDR      r1,[r0,#0]
        0x00024efc:    6842        Bh      LDR      r2,[r0,#4]
        0x00024efe:    f24630d2    F..0    MOV      r0,#0x63d2
        0x00024f02:    f2c00002    ....    MOVT     r0,#2
        0x00024f06:    f7f8fd63    ..c.    BL       platform_printf ; 0x1d9d0
        0x00024f0a:    e7ff        ..      B        0x24f0c ; cb_assertion + 28
        0x00024f0c:    e7fe        ..      B        0x24f0c ; cb_assertion + 28
        0x00024f0e:    0000        ..      MOVS     r0,r0
    cb_hard_fault
        0x00024f10:    b570        p.      PUSH     {r4-r6,lr}
        0x00024f12:    b088        ..      SUB      sp,sp,#0x20
        0x00024f14:    9007        ..      STR      r0,[sp,#0x1c]
        0x00024f16:    9106        ..      STR      r1,[sp,#0x18]
        0x00024f18:    f8ddc01c    ....    LDR      r12,[sp,#0x1c]
        0x00024f1c:    f8cdc014    ....    STR      r12,[sp,#0x14]
        0x00024f20:    f8dc1018    ....    LDR      r1,[r12,#0x18]
        0x00024f24:    f8dc2014    ...     LDR      r2,[r12,#0x14]
        0x00024f28:    f8dc301c    ...0    LDR      r3,[r12,#0x1c]
        0x00024f2c:    f8dc0000    ....    LDR      r0,[r12,#0]
        0x00024f30:    f8dce004    ....    LDR      lr,[r12,#4]
        0x00024f34:    f8dc4008    ...@    LDR      r4,[r12,#8]
        0x00024f38:    f8dc500c    ...P    LDR      r5,[r12,#0xc]
        0x00024f3c:    f8dc6010    ...`    LDR      r6,[r12,#0x10]
        0x00024f40:    46ec        .F      MOV      r12,sp
        0x00024f42:    f8cc6010    ...`    STR      r6,[r12,#0x10]
        0x00024f46:    f8cc500c    ...P    STR      r5,[r12,#0xc]
        0x00024f4a:    f8cc4008    ...@    STR      r4,[r12,#8]
        0x00024f4e:    f8cce004    ....    STR      lr,[r12,#4]
        0x00024f52:    f8cc0000    ....    STR      r0,[r12,#0]
        0x00024f56:    f246305a    F.Z0    MOV      r0,#0x635a
        0x00024f5a:    f2c00002    ....    MOVT     r0,#2
        0x00024f5e:    f7f8fd37    ..7.    BL       platform_printf ; 0x1d9d0
        0x00024f62:    e7ff        ..      B        0x24f64 ; cb_hard_fault + 84
        0x00024f64:    e7fe        ..      B        0x24f64 ; cb_hard_fault + 84
        0x00024f66:    0000        ..      MOVS     r0,r0
    cb_heap_out_of_mem
        0x00024f68:    b580        ..      PUSH     {r7,lr}
        0x00024f6a:    b082        ..      SUB      sp,sp,#8
        0x00024f6c:    9001        ..      STR      r0,[sp,#4]
        0x00024f6e:    9100        ..      STR      r1,[sp,#0]
        0x00024f70:    9901        ..      LDR      r1,[sp,#4]
        0x00024f72:    f24630c6    F..0    MOV      r0,#0x63c6
        0x00024f76:    f2c00002    ....    MOVT     r0,#2
        0x00024f7a:    f7f8fd29    ..).    BL       platform_printf ; 0x1d9d0
        0x00024f7e:    e7ff        ..      B        0x24f80 ; cb_heap_out_of_mem + 24
        0x00024f80:    e7fe        ..      B        0x24f80 ; cb_heap_out_of_mem + 24
        0x00024f82:    0000        ..      MOVS     r0,r0
    cb_putc
        0x00024f84:    b580        ..      PUSH     {r7,lr}
        0x00024f86:    b082        ..      SUB      sp,sp,#8
        0x00024f88:    9001        ..      STR      r0,[sp,#4]
        0x00024f8a:    9100        ..      STR      r1,[sp,#0]
        0x00024f8c:    e7ff        ..      B        0x24f8e ; cb_putc + 10
        0x00024f8e:    2000        .       MOVS     r0,#0
        0x00024f90:    f2c40002    ....    MOVT     r0,#0x4002
        0x00024f94:    f7fffce0    ....    BL       apUART_Check_TXFIFO_FULL ; 0x24958
        0x00024f98:    2801        .(      CMP      r0,#1
        0x00024f9a:    d101        ..      BNE      0x24fa0 ; cb_putc + 28
        0x00024f9c:    e7ff        ..      B        0x24f9e ; cb_putc + 26
        0x00024f9e:    e7f6        ..      B        0x24f8e ; cb_putc + 10
        0x00024fa0:    9801        ..      LDR      r0,[sp,#4]
        0x00024fa2:    7801        .x      LDRB     r1,[r0,#0]
        0x00024fa4:    2000        .       MOVS     r0,#0
        0x00024fa6:    f2c40002    ....    MOVT     r0,#0x4002
        0x00024faa:    f7fffc67    ..g.    BL       UART_SendData ; 0x2487c
        0x00024fae:    2000        .       MOVS     r0,#0
        0x00024fb0:    b002        ..      ADD      sp,sp,#8
        0x00024fb2:    bd80        ..      POP      {r7,pc}
    config_comm_uart
        0x00024fb4:    b580        ..      PUSH     {r7,lr}
        0x00024fb6:    b088        ..      SUB      sp,sp,#0x20
        0x00024fb8:    f44f6080    O..`    MOV      r0,#0x400
        0x00024fbc:    f7fffc08    ....    BL       SYSCTRL_ClearClkGateMulti ; 0x247d0
        0x00024fc0:    2004        .       MOVS     r0,#4
        0x00024fc2:    9000        ..      STR      r0,[sp,#0]
        0x00024fc4:    2100        .!      MOVS     r1,#0
        0x00024fc6:    9102        ..      STR      r1,[sp,#8]
        0x00024fc8:    f7fffbdc    ....    BL       PINCTRL_SetPadMux ; 0x24784
        0x00024fcc:    9900        ..      LDR      r1,[sp,#0]
        0x00024fce:    2001        .       MOVS     r0,#1
        0x00024fd0:    9001        ..      STR      r0,[sp,#4]
        0x00024fd2:    f7fffbc5    ....    BL       PINCTRL_SelUartRxdIn ; 0x24760
        0x00024fd6:    2005        .       MOVS     r0,#5
        0x00024fd8:    210a        .!      MOVS     r1,#0xa
        0x00024fda:    f7fffbd3    ....    BL       PINCTRL_SetPadMux ; 0x24784
        0x00024fde:    9801        ..      LDR      r0,[sp,#4]
        0x00024fe0:    9902        ..      LDR      r1,[sp,#8]
        0x00024fe2:    2203        ."      MOVS     r2,#3
        0x00024fe4:    f88d200c    ...     STRB     r2,[sp,#0xc]
        0x00024fe8:    f88d100d    ....    STRB     r1,[sp,#0xd]
        0x00024fec:    f88d000e    ....    STRB     r0,[sp,#0xe]
        0x00024ff0:    f88d100f    ....    STRB     r1,[sp,#0xf]
        0x00024ff4:    f88d0010    ....    STRB     r0,[sp,#0x10]
        0x00024ff8:    f88d0011    ....    STRB     r0,[sp,#0x11]
        0x00024ffc:    f88d0012    ....    STRB     r0,[sp,#0x12]
        0x00025000:    f88d1013    ....    STRB     r1,[sp,#0x13]
        0x00025004:    f88d1014    ....    STRB     r1,[sp,#0x14]
        0x00025008:    f88d0015    ....    STRB     r0,[sp,#0x15]
        0x0002500c:    f88d0016    ....    STRB     r0,[sp,#0x16]
        0x00025010:    f2436000    C..`    MOVW     r0,#0x3600
        0x00025014:    f2c0106e    ..n.    MOVT     r0,#0x16e
        0x00025018:    9006        ..      STR      r0,[sp,#0x18]
        0x0002501a:    f44f2061    O.a     MOV      r0,#0xe1000
        0x0002501e:    9007        ..      STR      r0,[sp,#0x1c]
        0x00025020:    f2410000    A...    MOVW     r0,#0x1000
        0x00025024:    f2c40002    ....    MOVT     r0,#0x4002
        0x00025028:    a903        ..      ADD      r1,sp,#0xc
        0x0002502a:    2210        ."      MOVS     r2,#0x10
        0x0002502c:    f7fffca2    ....    BL       apUART_Initialize ; 0x24974
        0x00025030:    9a02        ..      LDR      r2,[sp,#8]
        0x00025032:    f64541a9    E..A    MOV      r1,#0x5ca9
        0x00025036:    f2c00102    ....    MOVT     r1,#2
        0x0002503a:    2008        .       MOVS     r0,#8
        0x0002503c:    f7f8fd10    ....    BL       platform_set_irq_callback ; 0x1da60
        0x00025040:    b008        ..      ADD      sp,sp,#0x20
        0x00025042:    bd80        ..      POP      {r7,pc}
    config_uart
        0x00025044:    b580        ..      PUSH     {r7,lr}
        0x00025046:    b088        ..      SUB      sp,sp,#0x20
        0x00025048:    9007        ..      STR      r0,[sp,#0x1c]
        0x0002504a:    9106        ..      STR      r1,[sp,#0x18]
        0x0002504c:    2003        .       MOVS     r0,#3
        0x0002504e:    f88d0004    ....    STRB     r0,[sp,#4]
        0x00025052:    2200        ."      MOVS     r2,#0
        0x00025054:    f88d2005    ...     STRB     r2,[sp,#5]
        0x00025058:    2001        .       MOVS     r0,#1
        0x0002505a:    f88d0006    ....    STRB     r0,[sp,#6]
        0x0002505e:    f88d2007    ...     STRB     r2,[sp,#7]
        0x00025062:    f88d0008    ....    STRB     r0,[sp,#8]
        0x00025066:    f88d0009    ....    STRB     r0,[sp,#9]
        0x0002506a:    f88d000a    ....    STRB     r0,[sp,#0xa]
        0x0002506e:    f88d200b    ...     STRB     r2,[sp,#0xb]
        0x00025072:    f88d200c    ...     STRB     r2,[sp,#0xc]
        0x00025076:    f88d000d    ....    STRB     r0,[sp,#0xd]
        0x0002507a:    f88d000e    ....    STRB     r0,[sp,#0xe]
        0x0002507e:    9807        ..      LDR      r0,[sp,#0x1c]
        0x00025080:    9004        ..      STR      r0,[sp,#0x10]
        0x00025082:    9806        ..      LDR      r0,[sp,#0x18]
        0x00025084:    9005        ..      STR      r0,[sp,#0x14]
        0x00025086:    2000        .       MOVS     r0,#0
        0x00025088:    f2c40002    ....    MOVT     r0,#0x4002
        0x0002508c:    a901        ..      ADD      r1,sp,#4
        0x0002508e:    f7fffc71    ..q.    BL       apUART_Initialize ; 0x24974
        0x00025092:    b008        ..      ADD      sp,sp,#0x20
        0x00025094:    bd80        ..      POP      {r7,pc}
        0x00025096:    0000        ..      MOVS     r0,r0
    data_get_average_float
        0x00025098:    b580        ..      PUSH     {r7,lr}
        0x0002509a:    b088        ..      SUB      sp,sp,#0x20
        0x0002509c:    9007        ..      STR      r0,[sp,#0x1c]
        0x0002509e:    9106        ..      STR      r1,[sp,#0x18]
        0x000250a0:    2000        .       MOVS     r0,#0
        0x000250a2:    9003        ..      STR      r0,[sp,#0xc]
        0x000250a4:    9002        ..      STR      r0,[sp,#8]
        0x000250a6:    9005        ..      STR      r0,[sp,#0x14]
        0x000250a8:    e7ff        ..      B        0x250aa ; data_get_average_float + 18
        0x000250aa:    9805        ..      LDR      r0,[sp,#0x14]
        0x000250ac:    9906        ..      LDR      r1,[sp,#0x18]
        0x000250ae:    4288        .B      CMP      r0,r1
        0x000250b0:    d212        ..      BCS      0x250d8 ; data_get_average_float + 64
        0x000250b2:    e7ff        ..      B        0x250b4 ; data_get_average_float + 28
        0x000250b4:    9907        ..      LDR      r1,[sp,#0x1c]
        0x000250b6:    9a05        ..      LDR      r2,[sp,#0x14]
        0x000250b8:    eb0100c2    ....    ADD      r0,r1,r2,LSL #3
        0x000250bc:    f8512032    Q.2     LDR      r2,[r1,r2,LSL #3]
        0x000250c0:    6843        Ch      LDR      r3,[r0,#4]
        0x000250c2:    9802        ..      LDR      r0,[sp,#8]
        0x000250c4:    9903        ..      LDR      r1,[sp,#0xc]
        0x000250c6:    f7fefff9    ....    BL       __aeabi_dadd ; 0x240bc
        0x000250ca:    9103        ..      STR      r1,[sp,#0xc]
        0x000250cc:    9002        ..      STR      r0,[sp,#8]
        0x000250ce:    e7ff        ..      B        0x250d0 ; data_get_average_float + 56
        0x000250d0:    9805        ..      LDR      r0,[sp,#0x14]
        0x000250d2:    3001        .0      ADDS     r0,#1
        0x000250d4:    9005        ..      STR      r0,[sp,#0x14]
        0x000250d6:    e7e8        ..      B        0x250aa ; data_get_average_float + 18
        0x000250d8:    9802        ..      LDR      r0,[sp,#8]
        0x000250da:    9000        ..      STR      r0,[sp,#0]
        0x000250dc:    9803        ..      LDR      r0,[sp,#0xc]
        0x000250de:    9001        ..      STR      r0,[sp,#4]
        0x000250e0:    9806        ..      LDR      r0,[sp,#0x18]
        0x000250e2:    f7fff984    ....    BL       __aeabi_ui2d ; 0x243ee
        0x000250e6:    4602        .F      MOV      r2,r0
        0x000250e8:    9800        ..      LDR      r0,[sp,#0]
        0x000250ea:    460b        .F      MOV      r3,r1
        0x000250ec:    9901        ..      LDR      r1,[sp,#4]
        0x000250ee:    f7fff8fe    ....    BL       __aeabi_ddiv ; 0x242ee
        0x000250f2:    b008        ..      ADD      sp,sp,#0x20
        0x000250f4:    bd80        ..      POP      {r7,pc}
        0x000250f6:    0000        ..      MOVS     r0,r0
    dummy_event_create
        0x000250f8:    f24171cc    A..q    MOV      r1,#0x17cc
        0x000250fc:    f2c20100    ....    MOVT     r1,#0x2000
        0x00025100:    6808        .h      LDR      r0,[r1,#0]
        0x00025102:    3001        .0      ADDS     r0,#1
        0x00025104:    6008        .`      STR      r0,[r1,#0]
        0x00025106:    4770        pG      BX       lr
    dummy_event_set
        0x00025108:    b081        ..      SUB      sp,sp,#4
        0x0002510a:    9000        ..      STR      r0,[sp,#0]
        0x0002510c:    b001        ..      ADD      sp,sp,#4
        0x0002510e:    4770        pG      BX       lr
    dummy_event_wait
        0x00025110:    b081        ..      SUB      sp,sp,#4
        0x00025112:    9000        ..      STR      r0,[sp,#0]
        0x00025114:    2000        .       MOVS     r0,#0
        0x00025116:    b001        ..      ADD      sp,sp,#4
        0x00025118:    4770        pG      BX       lr
        0x0002511a:    0000        ..      MOVS     r0,r0
    enter_critical
        0x0002511c:    b672        r.      CPSID    i
        0x0002511e:    f24171e4    A..q    MOV      r1,#0x17e4
        0x00025122:    f2c20100    ....    MOVT     r1,#0x2000
        0x00025126:    6808        .h      LDR      r0,[r1,#0]
        0x00025128:    3001        .0      ADDS     r0,#1
        0x0002512a:    6008        .`      STR      r0,[r1,#0]
        0x0002512c:    4770        pG      BX       lr
        0x0002512e:    0000        ..      MOVS     r0,r0
    hci_event_command_complete_get_command_opcode
        0x00025130:    b081        ..      SUB      sp,sp,#4
        0x00025132:    9000        ..      STR      r0,[sp,#0]
        0x00025134:    9800        ..      LDR      r0,[sp,#0]
        0x00025136:    f8b00003    ....    LDRH     r0,[r0,#3]
        0x0002513a:    b001        ..      ADD      sp,sp,#4
        0x0002513c:    4770        pG      BX       lr
        0x0002513e:    0000        ..      MOVS     r0,r0
    hci_event_le_meta_get_subevent_code
        0x00025140:    b081        ..      SUB      sp,sp,#4
        0x00025142:    9000        ..      STR      r0,[sp,#0]
        0x00025144:    9800        ..      LDR      r0,[sp,#0]
        0x00025146:    7880        .x      LDRB     r0,[r0,#2]
        0x00025148:    b001        ..      ADD      sp,sp,#4
        0x0002514a:    4770        pG      BX       lr
    hci_event_packet_get_type
        0x0002514c:    b081        ..      SUB      sp,sp,#4
        0x0002514e:    9000        ..      STR      r0,[sp,#0]
        0x00025150:    9800        ..      LDR      r0,[sp,#0]
        0x00025152:    7800        .x      LDRB     r0,[r0,#0]
        0x00025154:    b001        ..      ADD      sp,sp,#4
        0x00025156:    4770        pG      BX       lr
    hci_event_packet_get_user_msg
        0x00025158:    b081        ..      SUB      sp,sp,#4
        0x0002515a:    9000        ..      STR      r0,[sp,#0]
        0x0002515c:    9800        ..      LDR      r0,[sp,#0]
        0x0002515e:    3004        .0      ADDS     r0,#4
        0x00025160:    b001        ..      ADD      sp,sp,#4
        0x00025162:    4770        pG      BX       lr
    hint_ce_len
        0x00025164:    b580        ..      PUSH     {r7,lr}
        0x00025166:    b082        ..      SUB      sp,sp,#8
        0x00025168:    f8ad0006    ....    STRH     r0,[sp,#6]
        0x0002516c:    f8bd0006    ....    LDRH     r0,[sp,#6]
        0x00025170:    0040        @.      LSLS     r0,r0,#1
        0x00025172:    f8ad0004    ....    STRH     r0,[sp,#4]
        0x00025176:    f8bd0004    ....    LDRH     r0,[sp,#4]
        0x0002517a:    2815        .(      CMP      r0,#0x15
        0x0002517c:    db09        ..      BLT      0x25192 ; hint_ce_len + 46
        0x0002517e:    e7ff        ..      B        0x25180 ; hint_ce_len + 28
        0x00025180:    f8bd0004    ....    LDRH     r0,[sp,#4]
        0x00025184:    380f        .8      SUBS     r0,r0,#0xf
        0x00025186:    b282        ..      UXTH     r2,r0
        0x00025188:    2000        .       MOVS     r0,#0
        0x0002518a:    4611        .F      MOV      r1,r2
        0x0002518c:    f7e7fde2    ....    BL       ll_hint_on_ce_len ; 0xcd54
        0x00025190:    e7ff        ..      B        0x25192 ; hint_ce_len + 46
        0x00025192:    b002        ..      ADD      sp,sp,#8
        0x00025194:    bd80        ..      POP      {r7,pc}
        0x00025196:    0000        ..      MOVS     r0,r0
    idle_process
        0x00025198:    4770        pG      BX       lr
        0x0002519a:    0000        ..      MOVS     r0,r0
    internal_internal_time_sync_offset_calculation
        0x0002519c:    b570        p.      PUSH     {r4-r6,lr}
        0x0002519e:    b090        ..      SUB      sp,sp,#0x40
        0x000251a0:    469e        .F      MOV      lr,r3
        0x000251a2:    4694        .F      MOV      r12,r2
        0x000251a4:    460d        .F      MOV      r5,r1
        0x000251a6:    4604        .F      MOV      r4,r0
        0x000251a8:    9917        ..      LDR      r1,[sp,#0x5c]
        0x000251aa:    9816        ..      LDR      r0,[sp,#0x58]
        0x000251ac:    9b15        ..      LDR      r3,[sp,#0x54]
        0x000251ae:    9a14        ..      LDR      r2,[sp,#0x50]
        0x000251b0:    950f        ..      STR      r5,[sp,#0x3c]
        0x000251b2:    940e        ..      STR      r4,[sp,#0x38]
        0x000251b4:    f8cde034    ..4.    STR      lr,[sp,#0x34]
        0x000251b8:    f8cdc030    ..0.    STR      r12,[sp,#0x30]
        0x000251bc:    930b        ..      STR      r3,[sp,#0x2c]
        0x000251be:    920a        ..      STR      r2,[sp,#0x28]
        0x000251c0:    9109        ..      STR      r1,[sp,#0x24]
        0x000251c2:    9008        ..      STR      r0,[sp,#0x20]
        0x000251c4:    2000        .       MOVS     r0,#0
        0x000251c6:    9007        ..      STR      r0,[sp,#0x1c]
        0x000251c8:    9006        ..      STR      r0,[sp,#0x18]
        0x000251ca:    9005        ..      STR      r0,[sp,#0x14]
        0x000251cc:    9004        ..      STR      r0,[sp,#0x10]
        0x000251ce:    9b0a        ..      LDR      r3,[sp,#0x28]
        0x000251d0:    990b        ..      LDR      r1,[sp,#0x2c]
        0x000251d2:    9a0e        ..      LDR      r2,[sp,#0x38]
        0x000251d4:    980f        ..      LDR      r0,[sp,#0x3c]
        0x000251d6:    1ad2        ..      SUBS     r2,r2,r3
        0x000251d8:    4188        .A      SBCS     r0,r0,r1
        0x000251da:    d254        T.      BCS      0x25286 ; internal_internal_time_sync_offset_calculation + 234
        0x000251dc:    e7ff        ..      B        0x251de ; internal_internal_time_sync_offset_calculation + 66
        0x000251de:    9b08        ..      LDR      r3,[sp,#0x20]
        0x000251e0:    9909        ..      LDR      r1,[sp,#0x24]
        0x000251e2:    9a0c        ..      LDR      r2,[sp,#0x30]
        0x000251e4:    980d        ..      LDR      r0,[sp,#0x34]
        0x000251e6:    1ad2        ..      SUBS     r2,r2,r3
        0x000251e8:    4188        .A      SBCS     r0,r0,r1
        0x000251ea:    d24c        L.      BCS      0x25286 ; internal_internal_time_sync_offset_calculation + 234
        0x000251ec:    e7ff        ..      B        0x251ee ; internal_internal_time_sync_offset_calculation + 82
        0x000251ee:    9908        ..      LDR      r1,[sp,#0x20]
        0x000251f0:    9809        ..      LDR      r0,[sp,#0x24]
        0x000251f2:    9b0c        ..      LDR      r3,[sp,#0x30]
        0x000251f4:    9a0d        ..      LDR      r2,[sp,#0x34]
        0x000251f6:    1ac9        ..      SUBS     r1,r1,r3
        0x000251f8:    4190        .A      SBCS     r0,r0,r2
        0x000251fa:    f8dde028    ..(.    LDR      lr,[sp,#0x28]
        0x000251fe:    f8ddc02c    ..,.    LDR      r12,[sp,#0x2c]
        0x00025202:    9b0e        ..      LDR      r3,[sp,#0x38]
        0x00025204:    9a0f        ..      LDR      r2,[sp,#0x3c]
        0x00025206:    ebb3030e    ....    SUBS     r3,r3,lr
        0x0002520a:    eb62020c    b...    SBC      r2,r2,r12
        0x0002520e:    18c9        ..      ADDS     r1,r1,r3
        0x00025210:    4150        PA      ADCS     r0,r0,r2
        0x00025212:    9106        ..      STR      r1,[sp,#0x18]
        0x00025214:    9007        ..      STR      r0,[sp,#0x1c]
        0x00025216:    9906        ..      LDR      r1,[sp,#0x18]
        0x00025218:    9807        ..      LDR      r0,[sp,#0x1c]
        0x0002521a:    f2442240    D.@"    MOV      r2,#0x4240
        0x0002521e:    f2c0020f    ....    MOVT     r2,#0xf
        0x00025222:    fba11302    ....    UMULL    r1,r3,r1,r2
        0x00025226:    fb003002    ...0    MLA      r0,r0,r2,r3
        0x0002522a:    9106        ..      STR      r1,[sp,#0x18]
        0x0002522c:    9007        ..      STR      r0,[sp,#0x1c]
        0x0002522e:    990a        ..      LDR      r1,[sp,#0x28]
        0x00025230:    980b        ..      LDR      r0,[sp,#0x2c]
        0x00025232:    9b0e        ..      LDR      r3,[sp,#0x38]
        0x00025234:    9a0f        ..      LDR      r2,[sp,#0x3c]
        0x00025236:    1ac9        ..      SUBS     r1,r1,r3
        0x00025238:    4190        .A      SBCS     r0,r0,r2
        0x0002523a:    9104        ..      STR      r1,[sp,#0x10]
        0x0002523c:    9005        ..      STR      r0,[sp,#0x14]
        0x0002523e:    9806        ..      LDR      r0,[sp,#0x18]
        0x00025240:    9907        ..      LDR      r1,[sp,#0x1c]
        0x00025242:    f7fff8e1    ....    BL       __aeabi_l2d ; 0x24408
        0x00025246:    9103        ..      STR      r1,[sp,#0xc]
        0x00025248:    9002        ..      STR      r0,[sp,#8]
        0x0002524a:    9804        ..      LDR      r0,[sp,#0x10]
        0x0002524c:    9905        ..      LDR      r1,[sp,#0x14]
        0x0002524e:    f7fff8db    ....    BL       __aeabi_l2d ; 0x24408
        0x00025252:    9101        ..      STR      r1,[sp,#4]
        0x00025254:    9000        ..      STR      r0,[sp,#0]
        0x00025256:    9802        ..      LDR      r0,[sp,#8]
        0x00025258:    9903        ..      LDR      r1,[sp,#0xc]
        0x0002525a:    9a00        ..      LDR      r2,[sp,#0]
        0x0002525c:    9b01        ..      LDR      r3,[sp,#4]
        0x0002525e:    f7fff846    ..F.    BL       __aeabi_ddiv ; 0x242ee
        0x00025262:    f000f8db    ....    BL       internal_time_sync_drift_filter1 ; 0x2541c
        0x00025266:    460a        .F      MOV      r2,r1
        0x00025268:    f24171f0    A..q    MOV      r1,#0x17f0
        0x0002526c:    f2c20100    ....    MOVT     r1,#0x2000
        0x00025270:    f8c12805    ...(    STR      r2,[r1,#0x805]
        0x00025274:    f8c10801    ....    STR      r0,[r1,#0x801]
        0x00025278:    9804        ..      LDR      r0,[sp,#0x10]
        0x0002527a:    9a05        ..      LDR      r2,[sp,#0x14]
        0x0002527c:    f8c12344    ..D#    STR      r2,[r1,#0x344]
        0x00025280:    f8c10340    ..@.    STR      r0,[r1,#0x340]
        0x00025284:    e7ff        ..      B        0x25286 ; internal_internal_time_sync_offset_calculation + 234
        0x00025286:    b010        ..      ADD      sp,sp,#0x40
        0x00025288:    bd70        p.      POP      {r4-r6,pc}
        0x0002528a:    0000        ..      MOVS     r0,r0
    internal_internal_time_sync_offset_post_processing
        0x0002528c:    b570        p.      PUSH     {r4-r6,lr}
        0x0002528e:    b088        ..      SUB      sp,sp,#0x20
        0x00025290:    20ff        .       MOVS     r0,#0xff
        0x00025292:    9007        ..      STR      r0,[sp,#0x1c]
        0x00025294:    2000        .       MOVS     r0,#0
        0x00025296:    9006        ..      STR      r0,[sp,#0x18]
        0x00025298:    f24170f0    A..p    MOV      r0,#0x17f0
        0x0002529c:    f2c20000    ....    MOVT     r0,#0x2000
        0x000252a0:    f8d017f9    ....    LDR      r1,[r0,#0x7f9]
        0x000252a4:    f2003049    ..I0    ADD      r0,r0,#0x349
        0x000252a8:    aa07        ..      ADD      r2,sp,#0x1c
        0x000252aa:    ab06        ..      ADD      r3,sp,#0x18
        0x000252ac:    f000fb28    ..(.    BL       time_sync_delta_with_high_frequency ; 0x25900
        0x000252b0:    9806        ..      LDR      r0,[sp,#0x18]
        0x000252b2:    280a        .(      CMP      r0,#0xa
        0x000252b4:    d364        d.      BCC      0x25380 ; internal_internal_time_sync_offset_post_processing + 244
        0x000252b6:    e7ff        ..      B        0x252b8 ; internal_internal_time_sync_offset_post_processing + 44
        0x000252b8:    f24171f0    A..q    MOV      r1,#0x17f0
        0x000252bc:    f2c20100    ....    MOVT     r1,#0x2000
        0x000252c0:    6888        .h      LDR      r0,[r1,#8]
        0x000252c2:    68c9        .h      LDR      r1,[r1,#0xc]
        0x000252c4:    4308        .C      ORRS     r0,r0,r1
        0x000252c6:    2800        .(      CMP      r0,#0
        0x000252c8:    d040        @.      BEQ      0x2534c ; internal_internal_time_sync_offset_post_processing + 192
        0x000252ca:    e7ff        ..      B        0x252cc ; internal_internal_time_sync_offset_post_processing + 64
        0x000252cc:    f24171f0    A..q    MOV      r1,#0x17f0
        0x000252d0:    f2c20100    ....    MOVT     r1,#0x2000
        0x000252d4:    6808        .h      LDR      r0,[r1,#0]
        0x000252d6:    6849        Ih      LDR      r1,[r1,#4]
        0x000252d8:    4308        .C      ORRS     r0,r0,r1
        0x000252da:    b3b8        ..      CBZ      r0,0x2534c ; internal_internal_time_sync_offset_post_processing + 192
        0x000252dc:    e7ff        ..      B        0x252de ; internal_internal_time_sync_offset_post_processing + 82
        0x000252de:    f2417cf0    A..|    MOV      r12,#0x17f0
        0x000252e2:    f2c20c00    ....    MOVT     r12,#0x2000
        0x000252e6:    f8cdc014    ....    STR      r12,[sp,#0x14]
        0x000252ea:    f8dc0000    ....    LDR      r0,[r12,#0]
        0x000252ee:    f8dc1004    ....    LDR      r1,[r12,#4]
        0x000252f2:    f8dc2008    ...     LDR      r2,[r12,#8]
        0x000252f6:    f8dc300c    ...0    LDR      r3,[r12,#0xc]
        0x000252fa:    f8dde01c    ....    LDR      lr,[sp,#0x1c]
        0x000252fe:    eb0e044e    ..N.    ADD      r4,lr,lr,LSL #1
        0x00025302:    f20c3c49    ..I<    ADD      r12,r12,#0x349
        0x00025306:    f8cdc010    ....    STR      r12,[sp,#0x10]
        0x0002530a:    eb0c0ec4    ....    ADD      lr,r12,r4,LSL #3
        0x0002530e:    f85cc034    \.4.    LDR      r12,[r12,r4,LSL #3]
        0x00025312:    f8de4004    ...@    LDR      r4,[lr,#4]
        0x00025316:    f8de5008    ...P    LDR      r5,[lr,#8]
        0x0002531a:    f8de600c    ...`    LDR      r6,[lr,#0xc]
        0x0002531e:    46ee        .F      MOV      lr,sp
        0x00025320:    f8ce600c    ...`    STR      r6,[lr,#0xc]
        0x00025324:    f8ce5008    ...P    STR      r5,[lr,#8]
        0x00025328:    f8ce4004    ...@    STR      r4,[lr,#4]
        0x0002532c:    f8cec000    ....    STR      r12,[lr,#0]
        0x00025330:    f7ffff34    ..4.    BL       internal_internal_time_sync_offset_calculation ; 0x2519c
        0x00025334:    9804        ..      LDR      r0,[sp,#0x10]
        0x00025336:    9905        ..      LDR      r1,[sp,#0x14]
        0x00025338:    9a07        ..      LDR      r2,[sp,#0x1c]
        0x0002533a:    eb020242    ..B.    ADD      r2,r2,r2,LSL #1
        0x0002533e:    eb0002c2    ....    ADD      r2,r0,r2,LSL #3
        0x00025342:    6910        .i      LDR      r0,[r2,#0x10]
        0x00025344:    6952        Ri      LDR      r2,[r2,#0x14]
        0x00025346:    614a        Ja      STR      r2,[r1,#0x14]
        0x00025348:    6108        .a      STR      r0,[r1,#0x10]
        0x0002534a:    e7ff        ..      B        0x2534c ; internal_internal_time_sync_offset_post_processing + 192
        0x0002534c:    9807        ..      LDR      r0,[sp,#0x1c]
        0x0002534e:    eb000240    ..@.    ADD      r2,r0,r0,LSL #1
        0x00025352:    f24171f0    A..q    MOV      r1,#0x17f0
        0x00025356:    f2c20100    ....    MOVT     r1,#0x2000
        0x0002535a:    f2013049    ..I0    ADD      r0,r1,#0x349
        0x0002535e:    eb0003c2    ....    ADD      r3,r0,r2,LSL #3
        0x00025362:    689a        .h      LDR      r2,[r3,#8]
        0x00025364:    68db        .h      LDR      r3,[r3,#0xc]
        0x00025366:    60cb        .`      STR      r3,[r1,#0xc]
        0x00025368:    608a        .`      STR      r2,[r1,#8]
        0x0002536a:    9a07        ..      LDR      r2,[sp,#0x1c]
        0x0002536c:    eb020342    ..B.    ADD      r3,r2,r2,LSL #1
        0x00025370:    eb0002c3    ....    ADD      r2,r0,r3,LSL #3
        0x00025374:    f8500033    P.3.    LDR      r0,[r0,r3,LSL #3]
        0x00025378:    6852        Rh      LDR      r2,[r2,#4]
        0x0002537a:    604a        J`      STR      r2,[r1,#4]
        0x0002537c:    6008        .`      STR      r0,[r1,#0]
        0x0002537e:    e7ff        ..      B        0x25380 ; internal_internal_time_sync_offset_post_processing + 244
        0x00025380:    b008        ..      ADD      sp,sp,#0x20
        0x00025382:    bd70        p.      POP      {r4-r6,pc}
    internal_internal_time_sync_offset_record
        0x00025384:    b086        ..      SUB      sp,sp,#0x18
        0x00025386:    9105        ..      STR      r1,[sp,#0x14]
        0x00025388:    9004        ..      STR      r0,[sp,#0x10]
        0x0002538a:    9303        ..      STR      r3,[sp,#0xc]
        0x0002538c:    9202        ..      STR      r2,[sp,#8]
        0x0002538e:    f24170f0    A..p    MOV      r0,#0x17f0
        0x00025392:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025396:    f20070f9    ...p    ADD      r0,r0,#0x7f9
        0x0002539a:    9001        ..      STR      r0,[sp,#4]
        0x0002539c:    9801        ..      LDR      r0,[sp,#4]
        0x0002539e:    6800        .h      LDR      r0,[r0,#0]
        0x000253a0:    2831        1(      CMP      r0,#0x31
        0x000253a2:    d830        0.      BHI      0x25406 ; internal_internal_time_sync_offset_record + 130
        0x000253a4:    e7ff        ..      B        0x253a6 ; internal_internal_time_sync_offset_record + 34
        0x000253a6:    9b04        ..      LDR      r3,[sp,#0x10]
        0x000253a8:    9805        ..      LDR      r0,[sp,#0x14]
        0x000253aa:    9901        ..      LDR      r1,[sp,#4]
        0x000253ac:    680a        .h      LDR      r2,[r1,#0]
        0x000253ae:    f24171f0    A..q    MOV      r1,#0x17f0
        0x000253b2:    f2c20100    ....    MOVT     r1,#0x2000
        0x000253b6:    f2013149    ..I1    ADD      r1,r1,#0x349
        0x000253ba:    eb020c42    ..B.    ADD      r12,r2,r2,LSL #1
        0x000253be:    eb0102cc    ....    ADD      r2,r1,r12,LSL #3
        0x000253c2:    f841303c    A.<0    STR      r3,[r1,r12,LSL #3]
        0x000253c6:    6050        P`      STR      r0,[r2,#4]
        0x000253c8:    9802        ..      LDR      r0,[sp,#8]
        0x000253ca:    9b03        ..      LDR      r3,[sp,#0xc]
        0x000253cc:    9a01        ..      LDR      r2,[sp,#4]
        0x000253ce:    6812        .h      LDR      r2,[r2,#0]
        0x000253d0:    eb020242    ..B.    ADD      r2,r2,r2,LSL #1
        0x000253d4:    eb0102c2    ....    ADD      r2,r1,r2,LSL #3
        0x000253d8:    60d3        .`      STR      r3,[r2,#0xc]
        0x000253da:    6090        .`      STR      r0,[r2,#8]
        0x000253dc:    9804        ..      LDR      r0,[sp,#0x10]
        0x000253de:    9a05        ..      LDR      r2,[sp,#0x14]
        0x000253e0:    f8ddc008    ....    LDR      r12,[sp,#8]
        0x000253e4:    9b03        ..      LDR      r3,[sp,#0xc]
        0x000253e6:    ebb0000c    ....    SUBS     r0,r0,r12
        0x000253ea:    419a        .A      SBCS     r2,r2,r3
        0x000253ec:    9b01        ..      LDR      r3,[sp,#4]
        0x000253ee:    681b        .h      LDR      r3,[r3,#0]
        0x000253f0:    eb030343    ..C.    ADD      r3,r3,r3,LSL #1
        0x000253f4:    eb0101c3    ....    ADD      r1,r1,r3,LSL #3
        0x000253f8:    614a        Ja      STR      r2,[r1,#0x14]
        0x000253fa:    6108        .a      STR      r0,[r1,#0x10]
        0x000253fc:    9901        ..      LDR      r1,[sp,#4]
        0x000253fe:    6808        .h      LDR      r0,[r1,#0]
        0x00025400:    3001        .0      ADDS     r0,#1
        0x00025402:    6008        .`      STR      r0,[r1,#0]
        0x00025404:    e007        ..      B        0x25416 ; internal_internal_time_sync_offset_record + 146
        0x00025406:    f24171f0    A..q    MOV      r1,#0x17f0
        0x0002540a:    f2c20100    ....    MOVT     r1,#0x2000
        0x0002540e:    2000        .       MOVS     r0,#0
        0x00025410:    f8810348    ..H.    STRB     r0,[r1,#0x348]
        0x00025414:    e7ff        ..      B        0x25416 ; internal_internal_time_sync_offset_record + 146
        0x00025416:    b006        ..      ADD      sp,sp,#0x18
        0x00025418:    4770        pG      BX       lr
        0x0002541a:    0000        ..      MOVS     r0,r0
    internal_time_sync_drift_filter1
        0x0002541c:    b580        ..      PUSH     {r7,lr}
        0x0002541e:    b084        ..      SUB      sp,sp,#0x10
        0x00025420:    9103        ..      STR      r1,[sp,#0xc]
        0x00025422:    9002        ..      STR      r0,[sp,#8]
        0x00025424:    9902        ..      LDR      r1,[sp,#8]
        0x00025426:    9b03        ..      LDR      r3,[sp,#0xc]
        0x00025428:    f24170e8    A..p    MOV      r0,#0x17e8
        0x0002542c:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025430:    f8d0c000    ....    LDR      r12,[r0,#0]
        0x00025434:    f10c0201    ....    ADD      r2,r12,#1
        0x00025438:    6002        .`      STR      r2,[r0,#0]
        0x0002543a:    f2417232    A.2r    MOV      r2,#0x1732
        0x0002543e:    f2c20200    ....    MOVT     r2,#0x2000
        0x00025442:    eb0202cc    ....    ADD      r2,r2,r12,LSL #3
        0x00025446:    f8c2304d    ..M0    STR      r3,[r2,#0x4d]
        0x0002544a:    f8c21049    ..I.    STR      r1,[r2,#0x49]
        0x0002544e:    6800        .h      LDR      r0,[r0,#0]
        0x00025450:    280a        .(      CMP      r0,#0xa
        0x00025452:    d10d        ..      BNE      0x25470 ; internal_time_sync_drift_filter1 + 84
        0x00025454:    e7ff        ..      B        0x25456 ; internal_time_sync_drift_filter1 + 58
        0x00025456:    f24171e8    A..q    MOV      r1,#0x17e8
        0x0002545a:    f2c20100    ....    MOVT     r1,#0x2000
        0x0002545e:    2000        .       MOVS     r0,#0
        0x00025460:    6008        .`      STR      r0,[r1,#0]
        0x00025462:    f24171ec    A..q    MOV      r1,#0x17ec
        0x00025466:    f2c20100    ....    MOVT     r1,#0x2000
        0x0002546a:    2001        .       MOVS     r0,#1
        0x0002546c:    6008        .`      STR      r0,[r1,#0]
        0x0002546e:    e7ff        ..      B        0x25470 ; internal_time_sync_drift_filter1 + 84
        0x00025470:    f24170ec    A..p    MOV      r0,#0x17ec
        0x00025474:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025478:    6800        .h      LDR      r0,[r0,#0]
        0x0002547a:    b118        ..      CBZ      r0,0x25484 ; internal_time_sync_drift_filter1 + 104
        0x0002547c:    e7ff        ..      B        0x2547e ; internal_time_sync_drift_filter1 + 98
        0x0002547e:    200a        .       MOVS     r0,#0xa
        0x00025480:    9001        ..      STR      r0,[sp,#4]
        0x00025482:    e006        ..      B        0x25492 ; internal_time_sync_drift_filter1 + 118
        0x00025484:    f24170e8    A..p    MOV      r0,#0x17e8
        0x00025488:    f2c20000    ....    MOVT     r0,#0x2000
        0x0002548c:    6800        .h      LDR      r0,[r0,#0]
        0x0002548e:    9001        ..      STR      r0,[sp,#4]
        0x00025490:    e7ff        ..      B        0x25492 ; internal_time_sync_drift_filter1 + 118
        0x00025492:    9901        ..      LDR      r1,[sp,#4]
        0x00025494:    f2417032    A.2p    MOV      r0,#0x1732
        0x00025498:    f2c20000    ....    MOVT     r0,#0x2000
        0x0002549c:    3049        I0      ADDS     r0,r0,#0x49
        0x0002549e:    f7fffdfb    ....    BL       data_get_average_float ; 0x25098
        0x000254a2:    b004        ..      ADD      sp,sp,#0x10
        0x000254a4:    bd80        ..      POP      {r7,pc}
        0x000254a6:    0000        ..      MOVS     r0,r0
    internal_time_sync_init
        0x000254a8:    b580        ..      PUSH     {r7,lr}
        0x000254aa:    b082        ..      SUB      sp,sp,#8
        0x000254ac:    f2456175    E.ua    MOV      r1,#0x5675
        0x000254b0:    f2c00102    ....    MOVT     r1,#2
        0x000254b4:    2200        ."      MOVS     r2,#0
        0x000254b6:    4610        .F      MOV      r0,r2
        0x000254b8:    f7e7fd32    ..2.    BL       ll_raw_packet_alloc ; 0xcf20
        0x000254bc:    4601        .F      MOV      r1,r0
        0x000254be:    f64170fc    A..p    MOV      r0,#0x1ffc
        0x000254c2:    f2c20000    ....    MOVT     r0,#0x2000
        0x000254c6:    6001        .`      STR      r1,[r0,#0]
        0x000254c8:    6800        .h      LDR      r0,[r0,#0]
        0x000254ca:    466a        jF      MOV      r2,sp
        0x000254cc:    f2455155    E.UQ    MOV      r1,#0x5555
        0x000254d0:    f2c00155    ..U.    MOVT     r1,#0x55
        0x000254d4:    6051        Q`      STR      r1,[r2,#4]
        0x000254d6:    f64b61d6    K..a    MOV      r1,#0xbed6
        0x000254da:    f6c86189    ...a    MOVT     r1,#0x8e89
        0x000254de:    6011        .`      STR      r1,[r2,#0]
        0x000254e0:    2103        .!      MOVS     r1,#3
        0x000254e2:    220f        ."      MOVS     r2,#0xf
        0x000254e4:    2301        .#      MOVS     r3,#1
        0x000254e6:    f7e7ffcb    ....    BL       ll_raw_packet_set_param ; 0xd480
        0x000254ea:    b002        ..      ADD      sp,sp,#8
        0x000254ec:    bd80        ..      POP      {r7,pc}
        0x000254ee:    0000        ..      MOVS     r0,r0
    internal_time_sync_recv_schedule
        0x000254f0:    b580        ..      PUSH     {r7,lr}
        0x000254f2:    b084        ..      SUB      sp,sp,#0x10
        0x000254f4:    9003        ..      STR      r0,[sp,#0xc]
        0x000254f6:    2000        .       MOVS     r0,#0
        0x000254f8:    9002        ..      STR      r0,[sp,#8]
        0x000254fa:    f64170fc    A..p    MOV      r0,#0x1ffc
        0x000254fe:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025502:    6800        .h      LDR      r0,[r0,#0]
        0x00025504:    9001        ..      STR      r0,[sp,#4]
        0x00025506:    f7f8fa3b    ..;.    BL       platform_get_us_time ; 0x1d980
        0x0002550a:    4602        .F      MOV      r2,r0
        0x0002550c:    9801        ..      LDR      r0,[sp,#4]
        0x0002550e:    f51272fa    ...r    ADDS     r2,r2,#0x1f4
        0x00025512:    f1410300    A...    ADC      r3,r1,#0
        0x00025516:    9903        ..      LDR      r1,[sp,#0xc]
        0x00025518:    46ec        .F      MOV      r12,sp
        0x0002551a:    f8cc1000    ....    STR      r1,[r12,#0]
        0x0002551e:    f7e7fe3b    ..;.    BL       ll_raw_packet_recv ; 0xd198
        0x00025522:    9002        ..      STR      r0,[sp,#8]
        0x00025524:    9802        ..      LDR      r0,[sp,#8]
        0x00025526:    b130        0.      CBZ      r0,0x25536 ; internal_time_sync_recv_schedule + 70
        0x00025528:    e7ff        ..      B        0x2552a ; internal_time_sync_recv_schedule + 58
        0x0002552a:    2007        .       MOVS     r0,#7
        0x0002552c:    2200        ."      MOVS     r2,#0
        0x0002552e:    4611        .F      MOV      r1,r2
        0x00025530:    f7e1f9e6    ....    BL       btstack_push_user_msg ; 0x6900
        0x00025534:    e7ff        ..      B        0x25536 ; internal_time_sync_recv_schedule + 70
        0x00025536:    9802        ..      LDR      r0,[sp,#8]
        0x00025538:    b004        ..      ADD      sp,sp,#0x10
        0x0002553a:    bd80        ..      POP      {r7,pc}
    internal_time_sync_reset
        0x0002553c:    b580        ..      PUSH     {r7,lr}
        0x0002553e:    f000fa4b    ..K.    BL       timer1_disable ; 0x259d8
        0x00025542:    f000fa85    ....    BL       timer2_disable ; 0x25a50
        0x00025546:    f24170f0    A..p    MOV      r0,#0x17f0
        0x0002554a:    f2c20000    ....    MOVT     r0,#0x2000
        0x0002554e:    f6400109    @...    MOV      r1,#0x809
        0x00025552:    f7fefda8    ....    BL       __aeabi_memclr ; 0x240a6
        0x00025556:    bd80        ..      POP      {r7,pc}
    internal_time_sync_schedule
        0x00025558:    b580        ..      PUSH     {r7,lr}
        0x0002555a:    b082        ..      SUB      sp,sp,#8
        0x0002555c:    f24170f0    A..p    MOV      r0,#0x17f0
        0x00025560:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025564:    2100        .!      MOVS     r1,#0
        0x00025566:    9101        ..      STR      r1,[sp,#4]
        0x00025568:    f8c0133c    ..<.    STR      r1,[r0,#0x33c]
        0x0002556c:    f8c017f9    ....    STR      r1,[r0,#0x7f9]
        0x00025570:    2101        .!      MOVS     r1,#1
        0x00025572:    f8801348    ..H.    STRB     r1,[r0,#0x348]
        0x00025576:    f8d007fd    ....    LDR      r0,[r0,#0x7fd]
        0x0002557a:    f64551c0    E..Q    MOV      r1,#0x5dc0
        0x0002557e:    4348        HC      MULS     r0,r1,r0
        0x00025580:    f000fa32    ..2.    BL       timer1_enable ; 0x259e8
        0x00025584:    9a01        ..      LDR      r2,[sp,#4]
        0x00025586:    b672        r.      CPSID    i
        0x00025588:    2007        .       MOVS     r0,#7
        0x0002558a:    4611        .F      MOV      r1,r2
        0x0002558c:    f7e1f9b8    ....    BL       btstack_push_user_msg ; 0x6900
        0x00025590:    b002        ..      ADD      sp,sp,#8
        0x00025592:    bd80        ..      POP      {r7,pc}
    internal_time_sync_show_rx
        0x00025594:    b580        ..      PUSH     {r7,lr}
        0x00025596:    b08e        ..      SUB      sp,sp,#0x38
        0x00025598:    900d        ..      STR      r0,[sp,#0x34]
        0x0002559a:    980d        ..      LDR      r0,[sp,#0x34]
        0x0002559c:    466a        jF      MOV      r2,sp
        0x0002559e:    a904        ..      ADD      r1,sp,#0x10
        0x000255a0:    6051        Q`      STR      r1,[r2,#4]
        0x000255a2:    a905        ..      ADD      r1,sp,#0x14
        0x000255a4:    6011        .`      STR      r1,[r2,#0]
        0x000255a6:    f2420300    B...    MOVW     r3,#0x2000
        0x000255aa:    f2c20300    ....    MOVT     r3,#0x2000
        0x000255ae:    a90a        ..      ADD      r1,sp,#0x28
        0x000255b0:    f10d0227    ..'.    ADD      r2,sp,#0x27
        0x000255b4:    f7e7fd96    ....    BL       ll_raw_packet_get_rx_data ; 0xd0e4
        0x000255b8:    b9b8        ..      CBNZ     r0,0x255ea ; internal_time_sync_show_rx + 86
        0x000255ba:    e7ff        ..      B        0x255bc ; internal_time_sync_show_rx + 40
        0x000255bc:    f2420000    B...    MOVW     r0,#0x2000
        0x000255c0:    f2c20000    ....    MOVT     r0,#0x2000
        0x000255c4:    9003        ..      STR      r0,[sp,#0xc]
        0x000255c6:    9803        ..      LDR      r0,[sp,#0xc]
        0x000255c8:    7800        .x      LDRB     r0,[r0,#0]
        0x000255ca:    f88d0026    ..&.    STRB     r0,[sp,#0x26]
        0x000255ce:    9903        ..      LDR      r1,[sp,#0xc]
        0x000255d0:    f8d10001    ....    LDR      r0,[r1,#1]
        0x000255d4:    f8d11005    ....    LDR      r1,[r1,#5]
        0x000255d8:    9107        ..      STR      r1,[sp,#0x1c]
        0x000255da:    9006        ..      STR      r0,[sp,#0x18]
        0x000255dc:    9806        ..      LDR      r0,[sp,#0x18]
        0x000255de:    9907        ..      LDR      r1,[sp,#0x1c]
        0x000255e0:    9a0a        ..      LDR      r2,[sp,#0x28]
        0x000255e2:    9b0b        ..      LDR      r3,[sp,#0x2c]
        0x000255e4:    f7fffece    ....    BL       internal_internal_time_sync_offset_record ; 0x25384
        0x000255e8:    e000        ..      B        0x255ec ; internal_time_sync_show_rx + 88
        0x000255ea:    e7ff        ..      B        0x255ec ; internal_time_sync_show_rx + 88
        0x000255ec:    2007        .       MOVS     r0,#7
        0x000255ee:    2200        ."      MOVS     r2,#0
        0x000255f0:    4611        .F      MOV      r1,r2
        0x000255f2:    f7e1f985    ....    BL       btstack_push_user_msg ; 0x6900
        0x000255f6:    b00e        ..      ADD      sp,sp,#0x38
        0x000255f8:    bd80        ..      POP      {r7,pc}
        0x000255fa:    0000        ..      MOVS     r0,r0
    internal_time_sync_stop
        0x000255fc:    b580        ..      PUSH     {r7,lr}
        0x000255fe:    b662        b.      CPSIE    i
        0x00025600:    f24170f0    A..p    MOV      r0,#0x17f0
        0x00025604:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025608:    2200        ."      MOVS     r2,#0
        0x0002560a:    f8802348    ..H#    STRB     r2,[r0,#0x348]
        0x0002560e:    200c        .       MOVS     r0,#0xc
        0x00025610:    4611        .F      MOV      r1,r2
        0x00025612:    f7e1f975    ..u.    BL       btstack_push_user_msg ; 0x6900
        0x00025616:    bd80        ..      POP      {r7,pc}
    leave_critical
        0x00025618:    f24170e4    A..p    MOV      r0,#0x17e4
        0x0002561c:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025620:    6801        .h      LDR      r1,[r0,#0]
        0x00025622:    3901        .9      SUBS     r1,#1
        0x00025624:    6001        .`      STR      r1,[r0,#0]
        0x00025626:    6800        .h      LDR      r0,[r0,#0]
        0x00025628:    2800        .(      CMP      r0,#0
        0x0002562a:    dc02        ..      BGT      0x25632 ; leave_critical + 26
        0x0002562c:    e7ff        ..      B        0x2562e ; leave_critical + 22
        0x0002562e:    b662        b.      CPSIE    i
        0x00025630:    e7ff        ..      B        0x25632 ; leave_critical + 26
        0x00025632:    4770        pG      BX       lr
    noos_start
        0x00025634:    b580        ..      PUSH     {r7,lr}
        0x00025636:    f24e0110    N...    MOV      r1,#0xe010
        0x0002563a:    f2ce0100    ....    MOVT     r1,#0xe000
        0x0002563e:    2001        .       MOVS     r0,#1
        0x00025640:    6008        .`      STR      r0,[r1,#0]
        0x00025642:    b662        b.      CPSIE    i
        0x00025644:    f7f8f9a6    ....    BL       platform_init_controller ; 0x1d994
        0x00025648:    f24170dc    A..p    MOV      r0,#0x17dc
        0x0002564c:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025650:    6801        .h      LDR      r1,[r0,#0]
        0x00025652:    f24170e0    A..p    MOVW     r0,#0x17e0
        0x00025656:    f2c20000    ....    MOVT     r0,#0x2000
        0x0002565a:    6800        .h      LDR      r0,[r0,#0]
        0x0002565c:    4788        .G      BLX      r1
        0x0002565e:    bd80        ..      POP      {r7,pc}
    on_deep_sleep_wakeup
        0x00025660:    b580        ..      PUSH     {r7,lr}
        0x00025662:    b082        ..      SUB      sp,sp,#8
        0x00025664:    9001        ..      STR      r0,[sp,#4]
        0x00025666:    9100        ..      STR      r1,[sp,#0]
        0x00025668:    f000f8bc    ....    BL       setup_peripherals ; 0x257e4
        0x0002566c:    2000        .       MOVS     r0,#0
        0x0002566e:    b002        ..      ADD      sp,sp,#8
        0x00025670:    bd80        ..      POP      {r7,pc}
        0x00025672:    0000        ..      MOVS     r0,r0
    on_raw_packet_done
        0x00025674:    b580        ..      PUSH     {r7,lr}
        0x00025676:    b082        ..      SUB      sp,sp,#8
        0x00025678:    9001        ..      STR      r0,[sp,#4]
        0x0002567a:    9100        ..      STR      r1,[sp,#0]
        0x0002567c:    f64170fc    A..p    MOV      r0,#0x1ffc
        0x00025680:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025684:    6800        .h      LDR      r0,[r0,#0]
        0x00025686:    f7ffff85    ....    BL       internal_time_sync_show_rx ; 0x25594
        0x0002568a:    b002        ..      ADD      sp,sp,#8
        0x0002568c:    bd80        ..      POP      {r7,pc}
        0x0002568e:    0000        ..      MOVS     r0,r0
    os_impl_get_driver
        0x00025690:    f2462040    F.@     MOV      r0,#0x6240
        0x00025694:    f2c00002    ....    MOVT     r0,#2
        0x00025698:    4770        pG      BX       lr
        0x0002569a:    0000        ..      MOVS     r0,r0
    pendsv_isr
        0x0002569c:    4770        pG      BX       lr
        0x0002569e:    0000        ..      MOVS     r0,r0
    query_deep_sleep_allowed
        0x000256a0:    b082        ..      SUB      sp,sp,#8
        0x000256a2:    9001        ..      STR      r0,[sp,#4]
        0x000256a4:    9100        ..      STR      r1,[sp,#0]
        0x000256a6:    2000        .       MOVS     r0,#0
        0x000256a8:    b002        ..      ADD      sp,sp,#8
        0x000256aa:    4770        pG      BX       lr
    queue_create
        0x000256ac:    b580        ..      PUSH     {r7,lr}
        0x000256ae:    b084        ..      SUB      sp,sp,#0x10
        0x000256b0:    9003        ..      STR      r0,[sp,#0xc]
        0x000256b2:    9102        ..      STR      r1,[sp,#8]
        0x000256b4:    9803        ..      LDR      r0,[sp,#0xc]
        0x000256b6:    9902        ..      LDR      r1,[sp,#8]
        0x000256b8:    4348        HC      MULS     r0,r1,r0
        0x000256ba:    300c        .0      ADDS     r0,r0,#0xc
        0x000256bc:    f000fd32    ..2.    BL       malloc ; 0x26124
        0x000256c0:    9001        ..      STR      r0,[sp,#4]
        0x000256c2:    9901        ..      LDR      r1,[sp,#4]
        0x000256c4:    2000        .       MOVS     r0,#0
        0x000256c6:    6088        .`      STR      r0,[r1,#8]
        0x000256c8:    9803        ..      LDR      r0,[sp,#0xc]
        0x000256ca:    9901        ..      LDR      r1,[sp,#4]
        0x000256cc:    6008        .`      STR      r0,[r1,#0]
        0x000256ce:    9802        ..      LDR      r0,[sp,#8]
        0x000256d0:    9901        ..      LDR      r1,[sp,#4]
        0x000256d2:    6048        H`      STR      r0,[r1,#4]
        0x000256d4:    9801        ..      LDR      r0,[sp,#4]
        0x000256d6:    b004        ..      ADD      sp,sp,#0x10
        0x000256d8:    bd80        ..      POP      {r7,pc}
        0x000256da:    0000        ..      MOVS     r0,r0
    queue_recv_msg
        0x000256dc:    b580        ..      PUSH     {r7,lr}
        0x000256de:    b084        ..      SUB      sp,sp,#0x10
        0x000256e0:    9002        ..      STR      r0,[sp,#8]
        0x000256e2:    9101        ..      STR      r1,[sp,#4]
        0x000256e4:    f7f8f924    ..$.    BL       platform_controller_run ; 0x1d930
        0x000256e8:    9802        ..      LDR      r0,[sp,#8]
        0x000256ea:    9000        ..      STR      r0,[sp,#0]
        0x000256ec:    9800        ..      LDR      r0,[sp,#0]
        0x000256ee:    6880        .h      LDR      r0,[r0,#8]
        0x000256f0:    2800        .(      CMP      r0,#0
        0x000256f2:    dc06        ..      BGT      0x25702 ; queue_recv_msg + 38
        0x000256f4:    e7ff        ..      B        0x256f6 ; queue_recv_msg + 26
        0x000256f6:    f7fffd4f    ..O.    BL       idle_process ; 0x25198
        0x000256fa:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x000256fe:    9003        ..      STR      r0,[sp,#0xc]
        0x00025700:    e016        ..      B        0x25730 ; queue_recv_msg + 84
        0x00025702:    9801        ..      LDR      r0,[sp,#4]
        0x00025704:    9a00        ..      LDR      r2,[sp,#0]
        0x00025706:    f102010c    ....    ADD      r1,r2,#0xc
        0x0002570a:    6852        Rh      LDR      r2,[r2,#4]
        0x0002570c:    f7fefca4    ....    BL       ___aeabi_memcpy4$move ; 0x24058
        0x00025710:    9900        ..      LDR      r1,[sp,#0]
        0x00025712:    6888        .h      LDR      r0,[r1,#8]
        0x00025714:    3801        .8      SUBS     r0,#1
        0x00025716:    6088        .`      STR      r0,[r1,#8]
        0x00025718:    9900        ..      LDR      r1,[sp,#0]
        0x0002571a:    f101000c    ....    ADD      r0,r1,#0xc
        0x0002571e:    684a        Jh      LDR      r2,[r1,#4]
        0x00025720:    688b        .h      LDR      r3,[r1,#8]
        0x00025722:    1881        ..      ADDS     r1,r0,r2
        0x00025724:    435a        ZC      MULS     r2,r3,r2
        0x00025726:    f7fefc97    ....    BL       ___aeabi_memcpy4$move ; 0x24058
        0x0002572a:    2000        .       MOVS     r0,#0
        0x0002572c:    9003        ..      STR      r0,[sp,#0xc]
        0x0002572e:    e7ff        ..      B        0x25730 ; queue_recv_msg + 84
        0x00025730:    9803        ..      LDR      r0,[sp,#0xc]
        0x00025732:    b004        ..      ADD      sp,sp,#0x10
        0x00025734:    bd80        ..      POP      {r7,pc}
        0x00025736:    0000        ..      MOVS     r0,r0
    queue_send_msg
        0x00025738:    b580        ..      PUSH     {r7,lr}
        0x0002573a:    b084        ..      SUB      sp,sp,#0x10
        0x0002573c:    9002        ..      STR      r0,[sp,#8]
        0x0002573e:    9101        ..      STR      r1,[sp,#4]
        0x00025740:    9802        ..      LDR      r0,[sp,#8]
        0x00025742:    9000        ..      STR      r0,[sp,#0]
        0x00025744:    9800        ..      LDR      r0,[sp,#0]
        0x00025746:    6801        .h      LDR      r1,[r0,#0]
        0x00025748:    6880        .h      LDR      r0,[r0,#8]
        0x0002574a:    4288        .B      CMP      r0,r1
        0x0002574c:    db04        ..      BLT      0x25758 ; queue_send_msg + 32
        0x0002574e:    e7ff        ..      B        0x25750 ; queue_send_msg + 24
        0x00025750:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x00025754:    9003        ..      STR      r0,[sp,#0xc]
        0x00025756:    e00f        ..      B        0x25778 ; queue_send_msg + 64
        0x00025758:    9900        ..      LDR      r1,[sp,#0]
        0x0002575a:    684a        Jh      LDR      r2,[r1,#4]
        0x0002575c:    6888        .h      LDR      r0,[r1,#8]
        0x0002575e:    fb001002    ....    MLA      r0,r0,r2,r1
        0x00025762:    300c        .0      ADDS     r0,r0,#0xc
        0x00025764:    9901        ..      LDR      r1,[sp,#4]
        0x00025766:    f7fefc77    ..w.    BL       ___aeabi_memcpy4$move ; 0x24058
        0x0002576a:    9900        ..      LDR      r1,[sp,#0]
        0x0002576c:    6888        .h      LDR      r0,[r1,#8]
        0x0002576e:    3001        .0      ADDS     r0,#1
        0x00025770:    6088        .`      STR      r0,[r1,#8]
        0x00025772:    2000        .       MOVS     r0,#0
        0x00025774:    9003        ..      STR      r0,[sp,#0xc]
        0x00025776:    e7ff        ..      B        0x25778 ; queue_send_msg + 64
        0x00025778:    9803        ..      LDR      r0,[sp,#0xc]
        0x0002577a:    b004        ..      ADD      sp,sp,#0x10
        0x0002577c:    bd80        ..      POP      {r7,pc}
        0x0002577e:    0000        ..      MOVS     r0,r0
    setup_adv
        0x00025780:    b580        ..      PUSH     {r7,lr}
        0x00025782:    b08e        ..      SUB      sp,sp,#0x38
        0x00025784:    466a        jF      MOV      r2,sp
        0x00025786:    2000        .       MOVS     r0,#0
        0x00025788:    900c        ..      STR      r0,[sp,#0x30]
        0x0002578a:    6290        .b      STR      r0,[r2,#0x28]
        0x0002578c:    6250        Pb      STR      r0,[r2,#0x24]
        0x0002578e:    2101        .!      MOVS     r1,#1
        0x00025790:    910d        ..      STR      r1,[sp,#0x34]
        0x00025792:    6211        .b      STR      r1,[r2,#0x20]
        0x00025794:    61d0        .a      STR      r0,[r2,#0x1c]
        0x00025796:    6191        .a      STR      r1,[r2,#0x18]
        0x00025798:    6150        Pa      STR      r0,[r2,#0x14]
        0x0002579a:    6110        .a      STR      r0,[r2,#0x10]
        0x0002579c:    60d0        .`      STR      r0,[r2,#0xc]
        0x0002579e:    6090        .`      STR      r0,[r2,#8]
        0x000257a0:    6051        Q`      STR      r1,[r2,#4]
        0x000257a2:    2107        .!      MOVS     r1,#7
        0x000257a4:    6011        .`      STR      r1,[r2,#0]
        0x000257a6:    2113        .!      MOVS     r1,#0x13
        0x000257a8:    23a1        .#      MOVS     r3,#0xa1
        0x000257aa:    461a        .F      MOV      r2,r3
        0x000257ac:    f7e2f93e    ..>.    BL       gap_set_ext_adv_para ; 0x7a2c
        0x000257b0:    980c        ..      LDR      r0,[sp,#0x30]
        0x000257b2:    f2462224    F.$"    MOV      r2,#0x6224
        0x000257b6:    f2c00202    ....    MOVT     r2,#2
        0x000257ba:    2115        .!      MOVS     r1,#0x15
        0x000257bc:    f7e2f8ec    ....    BL       gap_set_ext_adv_data ; 0x7998
        0x000257c0:    990d        ..      LDR      r1,[sp,#0x34]
        0x000257c2:    980c        ..      LDR      r0,[sp,#0x30]
        0x000257c4:    f246324c    F.L2    MOV      r2,#0x634c
        0x000257c8:    f2c00202    ....    MOVT     r2,#2
        0x000257cc:    f7e2f9fe    ....    BL       gap_set_ext_scan_response_data ; 0x7bcc
        0x000257d0:    990d        ..      LDR      r1,[sp,#0x34]
        0x000257d2:    f246223a    F.:"    MOV      r2,#0x623a
        0x000257d6:    f2c00202    ....    MOVT     r2,#2
        0x000257da:    4608        .F      MOV      r0,r1
        0x000257dc:    f7e2f8e8    ....    BL       gap_set_ext_adv_enable ; 0x79b0
        0x000257e0:    b00e        ..      ADD      sp,sp,#0x38
        0x000257e2:    bd80        ..      POP      {r7,pc}
    setup_peripherals
        0x000257e4:    b580        ..      PUSH     {r7,lr}
        0x000257e6:    b084        ..      SUB      sp,sp,#0x10
        0x000257e8:    2000        .       MOVS     r0,#0
        0x000257ea:    9001        ..      STR      r0,[sp,#4]
        0x000257ec:    f7fefff0    ....    BL       SYSCTRL_ClearClkGateMulti ; 0x247d0
        0x000257f0:    f2436000    C..`    MOVW     r0,#0x3600
        0x000257f4:    f2c0106e    ..n.    MOVT     r0,#0x16e
        0x000257f8:    f44f31e1    O..1    MOV      r1,#0x1c200
        0x000257fc:    f7fffc22    ..".    BL       config_uart ; 0x25044
        0x00025800:    f000f902    ....    BL       timer1_init ; 0x25a08
        0x00025804:    f000f946    ..F.    BL       timer2_init ; 0x25a94
        0x00025808:    9a01        ..      LDR      r2,[sp,#4]
        0x0002580a:    f6452135    E.5!    MOV      r1,#0x5a35
        0x0002580e:    f2c00102    ....    MOVT     r1,#2
        0x00025812:    2002        .       MOVS     r0,#2
        0x00025814:    f7f8f924    ..$.    BL       platform_set_irq_callback ; 0x1da60
        0x00025818:    9a01        ..      LDR      r2,[sp,#4]
        0x0002581a:    f64521c1    E..!    MOV      r1,#0x5ac1
        0x0002581e:    f2c00102    ....    MOVT     r1,#2
        0x00025822:    2003        .       MOVS     r0,#3
        0x00025824:    f7f8f91c    ....    BL       platform_set_irq_callback ; 0x1da60
        0x00025828:    f44f2084    O..     MOV      r0,#0x42000
        0x0002582c:    f7feffd0    ....    BL       SYSCTRL_ClearClkGateMulti ; 0x247d0
        0x00025830:    9901        ..      LDR      r1,[sp,#4]
        0x00025832:    2006        .       MOVS     r0,#6
        0x00025834:    9002        ..      STR      r0,[sp,#8]
        0x00025836:    f7feffa5    ....    BL       PINCTRL_SetPadMux ; 0x24784
        0x0002583a:    9802        ..      LDR      r0,[sp,#8]
        0x0002583c:    2101        .!      MOVS     r1,#1
        0x0002583e:    9103        ..      STR      r1,[sp,#0xc]
        0x00025840:    f7feff38    ..8.    BL       GIO_SetDirection ; 0x246b4
        0x00025844:    f7fffbb6    ....    BL       config_comm_uart ; 0x24fb4
        0x00025848:    9802        ..      LDR      r0,[sp,#8]
        0x0002584a:    9903        ..      LDR      r1,[sp,#0xc]
        0x0002584c:    f7fff820    .. .    BL       __NVIC_SetPriority ; 0x24890
        0x00025850:    f246304d    F.M0    MOV      r0,#0x634d
        0x00025854:    f2c00002    ....    MOVT     r0,#2
        0x00025858:    f7f8f8ba    ....    BL       platform_printf ; 0x1d9d0
        0x0002585c:    b004        ..      ADD      sp,sp,#0x10
        0x0002585e:    bd80        ..      POP      {r7,pc}
    setup_profile
        0x00025860:    b580        ..      PUSH     {r7,lr}
        0x00025862:    b084        ..      SUB      sp,sp,#0x10
        0x00025864:    9003        ..      STR      r0,[sp,#0xc]
        0x00025866:    9102        ..      STR      r1,[sp,#8]
        0x00025868:    f2464065    F.e@    MOV      r0,#0x6465
        0x0002586c:    f2c00002    ....    MOVT     r0,#2
        0x00025870:    f7f8f8ae    ....    BL       platform_printf ; 0x1d9d0
        0x00025874:    f7fffe18    ....    BL       internal_time_sync_init ; 0x254a8
        0x00025878:    f644209d    D..     MOV      r0,#0x4a9d
        0x0002587c:    f2c00002    ....    MOVT     r0,#2
        0x00025880:    f64421f9    D..!    MOV      r1,#0x4af9
        0x00025884:    f2c00102    ....    MOVT     r1,#2
        0x00025888:    f7e0fcd0    ....    BL       att_server_init ; 0x622c
        0x0002588c:    f24170d4    A..p    MOV      r0,#0x17d4
        0x00025890:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025894:    f6457121    E.!q    MOV      r1,#0x5f21
        0x00025898:    f2c00102    ....    MOVT     r1,#2
        0x0002589c:    9101        ..      STR      r1,[sp,#4]
        0x0002589e:    6041        A`      STR      r1,[r0,#4]
        0x000258a0:    f7e4fd38    ..8.    BL       hci_add_event_handler ; 0xa314
        0x000258a4:    9801        ..      LDR      r0,[sp,#4]
        0x000258a6:    f7e0fd6b    ..k.    BL       att_server_register_packet_handler ; 0x6380
        0x000258aa:    2000        .       MOVS     r0,#0
        0x000258ac:    b004        ..      ADD      sp,sp,#0x10
        0x000258ae:    bd80        ..      POP      {r7,pc}
    svc_isr
        0x000258b0:    4770        pG      BX       lr
        0x000258b2:    0000        ..      MOVS     r0,r0
    task_create
        0x000258b4:    b085        ..      SUB      sp,sp,#0x14
        0x000258b6:    4684        .F      MOV      r12,r0
        0x000258b8:    9805        ..      LDR      r0,[sp,#0x14]
        0x000258ba:    f8cdc010    ....    STR      r12,[sp,#0x10]
        0x000258be:    9103        ..      STR      r1,[sp,#0xc]
        0x000258c0:    9202        ..      STR      r2,[sp,#8]
        0x000258c2:    9301        ..      STR      r3,[sp,#4]
        0x000258c4:    f88d0003    ....    STRB     r0,[sp,#3]
        0x000258c8:    f89d0003    ....    LDRB     r0,[sp,#3]
        0x000258cc:    b968        h.      CBNZ     r0,0x258ea ; task_create + 54
        0x000258ce:    e7ff        ..      B        0x258d0 ; task_create + 28
        0x000258d0:    9803        ..      LDR      r0,[sp,#0xc]
        0x000258d2:    f24171dc    A..q    MOV      r1,#0x17dc
        0x000258d6:    f2c20100    ....    MOVT     r1,#0x2000
        0x000258da:    6008        .`      STR      r0,[r1,#0]
        0x000258dc:    9802        ..      LDR      r0,[sp,#8]
        0x000258de:    f24171e0    A..q    MOVW     r1,#0x17e0
        0x000258e2:    f2c20100    ....    MOVT     r1,#0x2000
        0x000258e6:    6008        .`      STR      r0,[r1,#0]
        0x000258e8:    e7ff        ..      B        0x258ea ; task_create + 54
        0x000258ea:    f24171cc    A..q    MOV      r1,#0x17cc
        0x000258ee:    f2c20100    ....    MOVT     r1,#0x2000
        0x000258f2:    6808        .h      LDR      r0,[r1,#0]
        0x000258f4:    3001        .0      ADDS     r0,#1
        0x000258f6:    6008        .`      STR      r0,[r1,#0]
        0x000258f8:    b005        ..      ADD      sp,sp,#0x14
        0x000258fa:    4770        pG      BX       lr
    tick_isr
        0x000258fc:    4770        pG      BX       lr
        0x000258fe:    0000        ..      MOVS     r0,r0
    time_sync_delta_with_high_frequency
        0x00025900:    b580        ..      PUSH     {r7,lr}
        0x00025902:    b096        ..      SUB      sp,sp,#0x58
        0x00025904:    9015        ..      STR      r0,[sp,#0x54]
        0x00025906:    9114        ..      STR      r1,[sp,#0x50]
        0x00025908:    9213        ..      STR      r2,[sp,#0x4c]
        0x0002590a:    9312        ..      STR      r3,[sp,#0x48]
        0x0002590c:    f10d000e    ....    ADD      r0,sp,#0xe
        0x00025910:    9001        ..      STR      r0,[sp,#4]
        0x00025912:    2132        2!      MOVS     r1,#0x32
        0x00025914:    9102        ..      STR      r1,[sp,#8]
        0x00025916:    f7fefbc6    ....    BL       __aeabi_memclr ; 0x240a6
        0x0002591a:    9801        ..      LDR      r0,[sp,#4]
        0x0002591c:    9902        ..      LDR      r1,[sp,#8]
        0x0002591e:    f7fefbc2    ....    BL       __aeabi_memclr ; 0x240a6
        0x00025922:    2000        .       MOVS     r0,#0
        0x00025924:    9011        ..      STR      r0,[sp,#0x44]
        0x00025926:    e7ff        ..      B        0x25928 ; time_sync_delta_with_high_frequency + 40
        0x00025928:    9811        ..      LDR      r0,[sp,#0x44]
        0x0002592a:    9914        ..      LDR      r1,[sp,#0x50]
        0x0002592c:    4288        .B      CMP      r0,r1
        0x0002592e:    d22d        -.      BCS      0x2598c ; time_sync_delta_with_high_frequency + 140
        0x00025930:    e7ff        ..      B        0x25932 ; time_sync_delta_with_high_frequency + 50
        0x00025932:    2000        .       MOVS     r0,#0
        0x00025934:    9010        ..      STR      r0,[sp,#0x40]
        0x00025936:    e7ff        ..      B        0x25938 ; time_sync_delta_with_high_frequency + 56
        0x00025938:    9810        ..      LDR      r0,[sp,#0x40]
        0x0002593a:    9911        ..      LDR      r1,[sp,#0x44]
        0x0002593c:    4288        .B      CMP      r0,r1
        0x0002593e:    d220         .      BCS      0x25982 ; time_sync_delta_with_high_frequency + 130
        0x00025940:    e7ff        ..      B        0x25942 ; time_sync_delta_with_high_frequency + 66
        0x00025942:    9a15        ..      LDR      r2,[sp,#0x54]
        0x00025944:    9811        ..      LDR      r0,[sp,#0x44]
        0x00025946:    eb000040    ..@.    ADD      r0,r0,r0,LSL #1
        0x0002594a:    eb0201c0    ....    ADD      r1,r2,r0,LSL #3
        0x0002594e:    6908        .i      LDR      r0,[r1,#0x10]
        0x00025950:    6949        Ii      LDR      r1,[r1,#0x14]
        0x00025952:    9b10        ..      LDR      r3,[sp,#0x40]
        0x00025954:    eb030343    ..C.    ADD      r3,r3,r3,LSL #1
        0x00025958:    eb0203c3    ....    ADD      r3,r2,r3,LSL #3
        0x0002595c:    691a        .i      LDR      r2,[r3,#0x10]
        0x0002595e:    695b        [i      LDR      r3,[r3,#0x14]
        0x00025960:    4059        Y@      EORS     r1,r1,r3
        0x00025962:    4050        P@      EORS     r0,r0,r2
        0x00025964:    4308        .C      ORRS     r0,r0,r1
        0x00025966:    b938        8.      CBNZ     r0,0x25978 ; time_sync_delta_with_high_frequency + 120
        0x00025968:    e7ff        ..      B        0x2596a ; time_sync_delta_with_high_frequency + 106
        0x0002596a:    9a10        ..      LDR      r2,[sp,#0x40]
        0x0002596c:    f10d010e    ....    ADD      r1,sp,#0xe
        0x00025970:    5c88        .\      LDRB     r0,[r1,r2]
        0x00025972:    3001        .0      ADDS     r0,#1
        0x00025974:    5488        .T      STRB     r0,[r1,r2]
        0x00025976:    e004        ..      B        0x25982 ; time_sync_delta_with_high_frequency + 130
        0x00025978:    e7ff        ..      B        0x2597a ; time_sync_delta_with_high_frequency + 122
        0x0002597a:    9810        ..      LDR      r0,[sp,#0x40]
        0x0002597c:    3001        .0      ADDS     r0,#1
        0x0002597e:    9010        ..      STR      r0,[sp,#0x40]
        0x00025980:    e7da        ..      B        0x25938 ; time_sync_delta_with_high_frequency + 56
        0x00025982:    e7ff        ..      B        0x25984 ; time_sync_delta_with_high_frequency + 132
        0x00025984:    9811        ..      LDR      r0,[sp,#0x44]
        0x00025986:    3001        .0      ADDS     r0,#1
        0x00025988:    9011        ..      STR      r0,[sp,#0x44]
        0x0002598a:    e7cd        ..      B        0x25928 ; time_sync_delta_with_high_frequency + 40
        0x0002598c:    2000        .       MOVS     r0,#0
        0x0002598e:    9011        ..      STR      r0,[sp,#0x44]
        0x00025990:    9010        ..      STR      r0,[sp,#0x40]
        0x00025992:    e7ff        ..      B        0x25994 ; time_sync_delta_with_high_frequency + 148
        0x00025994:    9811        ..      LDR      r0,[sp,#0x44]
        0x00025996:    9914        ..      LDR      r1,[sp,#0x50]
        0x00025998:    4288        .B      CMP      r0,r1
        0x0002599a:    d211        ..      BCS      0x259c0 ; time_sync_delta_with_high_frequency + 192
        0x0002599c:    e7ff        ..      B        0x2599e ; time_sync_delta_with_high_frequency + 158
        0x0002599e:    9811        ..      LDR      r0,[sp,#0x44]
        0x000259a0:    f10d010e    ....    ADD      r1,sp,#0xe
        0x000259a4:    5c08        .\      LDRB     r0,[r1,r0]
        0x000259a6:    9a10        ..      LDR      r2,[sp,#0x40]
        0x000259a8:    5c89        .\      LDRB     r1,[r1,r2]
        0x000259aa:    4288        .B      CMP      r0,r1
        0x000259ac:    dd03        ..      BLE      0x259b6 ; time_sync_delta_with_high_frequency + 182
        0x000259ae:    e7ff        ..      B        0x259b0 ; time_sync_delta_with_high_frequency + 176
        0x000259b0:    9811        ..      LDR      r0,[sp,#0x44]
        0x000259b2:    9010        ..      STR      r0,[sp,#0x40]
        0x000259b4:    e7ff        ..      B        0x259b6 ; time_sync_delta_with_high_frequency + 182
        0x000259b6:    e7ff        ..      B        0x259b8 ; time_sync_delta_with_high_frequency + 184
        0x000259b8:    9811        ..      LDR      r0,[sp,#0x44]
        0x000259ba:    3001        .0      ADDS     r0,#1
        0x000259bc:    9011        ..      STR      r0,[sp,#0x44]
        0x000259be:    e7e9        ..      B        0x25994 ; time_sync_delta_with_high_frequency + 148
        0x000259c0:    9810        ..      LDR      r0,[sp,#0x40]
        0x000259c2:    9913        ..      LDR      r1,[sp,#0x4c]
        0x000259c4:    6008        .`      STR      r0,[r1,#0]
        0x000259c6:    9910        ..      LDR      r1,[sp,#0x40]
        0x000259c8:    f10d000e    ....    ADD      r0,sp,#0xe
        0x000259cc:    5c40        @\      LDRB     r0,[r0,r1]
        0x000259ce:    9912        ..      LDR      r1,[sp,#0x48]
        0x000259d0:    6008        .`      STR      r0,[r1,#0]
        0x000259d2:    b016        ..      ADD      sp,sp,#0x58
        0x000259d4:    bd80        ..      POP      {r7,pc}
        0x000259d6:    0000        ..      MOVS     r0,r0
    timer1_disable
        0x000259d8:    b580        ..      PUSH     {r7,lr}
        0x000259da:    f2420000    B...    MOVW     r0,#0x2000
        0x000259de:    f2c40000    ....    MOVT     r0,#0x4000
        0x000259e2:    f7feff01    ....    BL       TMR_Disable ; 0x247e8
        0x000259e6:    bd80        ..      POP      {r7,pc}
    timer1_enable
        0x000259e8:    b580        ..      PUSH     {r7,lr}
        0x000259ea:    b082        ..      SUB      sp,sp,#8
        0x000259ec:    9001        ..      STR      r0,[sp,#4]
        0x000259ee:    9901        ..      LDR      r1,[sp,#4]
        0x000259f0:    f2420000    B...    MOVW     r0,#0x2000
        0x000259f4:    f2c40000    ....    MOVT     r0,#0x4000
        0x000259f8:    9000        ..      STR      r0,[sp,#0]
        0x000259fa:    f7feff27    ..'.    BL       TMR_SetCMP ; 0x2484c
        0x000259fe:    9800        ..      LDR      r0,[sp,#0]
        0x00025a00:    f7fefefc    ....    BL       TMR_Enable ; 0x247fc
        0x00025a04:    b002        ..      ADD      sp,sp,#8
        0x00025a06:    bd80        ..      POP      {r7,pc}
    timer1_init
        0x00025a08:    b580        ..      PUSH     {r7,lr}
        0x00025a0a:    b082        ..      SUB      sp,sp,#8
        0x00025a0c:    2080        .       MOVS     r0,#0x80
        0x00025a0e:    f7fefedf    ....    BL       SYSCTRL_ClearClkGateMulti ; 0x247d0
        0x00025a12:    f2420000    B...    MOVW     r0,#0x2000
        0x00025a16:    f2c40000    ....    MOVT     r0,#0x4000
        0x00025a1a:    9001        ..      STR      r0,[sp,#4]
        0x00025a1c:    2101        .!      MOVS     r1,#1
        0x00025a1e:    f7feff1d    ....    BL       TMR_SetOpMode ; 0x2485c
        0x00025a22:    9801        ..      LDR      r0,[sp,#4]
        0x00025a24:    f7feff08    ....    BL       TMR_Reload ; 0x24838
        0x00025a28:    9801        ..      LDR      r0,[sp,#4]
        0x00025a2a:    f7fefefb    ....    BL       TMR_IntEnable ; 0x24824
        0x00025a2e:    b002        ..      ADD      sp,sp,#8
        0x00025a30:    bd80        ..      POP      {r7,pc}
        0x00025a32:    0000        ..      MOVS     r0,r0
    timer1_isr
        0x00025a34:    b580        ..      PUSH     {r7,lr}
        0x00025a36:    b082        ..      SUB      sp,sp,#8
        0x00025a38:    9001        ..      STR      r0,[sp,#4]
        0x00025a3a:    f7fffddf    ....    BL       internal_time_sync_stop ; 0x255fc
        0x00025a3e:    f2420000    B...    MOVW     r0,#0x2000
        0x00025a42:    f2c40000    ....    MOVT     r0,#0x4000
        0x00025a46:    f7fefee3    ....    BL       TMR_IntClr ; 0x24810
        0x00025a4a:    2000        .       MOVS     r0,#0
        0x00025a4c:    b002        ..      ADD      sp,sp,#8
        0x00025a4e:    bd80        ..      POP      {r7,pc}
    timer2_disable
        0x00025a50:    b580        ..      PUSH     {r7,lr}
        0x00025a52:    f2430000    C...    MOVW     r0,#0x3000
        0x00025a56:    f2c40000    ....    MOVT     r0,#0x4000
        0x00025a5a:    f7fefec5    ....    BL       TMR_Disable ; 0x247e8
        0x00025a5e:    bd80        ..      POP      {r7,pc}
    timer2_enable
        0x00025a60:    b081        ..      SUB      sp,sp,#4
        0x00025a62:    9000        ..      STR      r0,[sp,#0]
        0x00025a64:    f2430108    C...    MOV      r1,#0x3008
        0x00025a68:    f2c40100    ....    MOVT     r1,#0x4000
        0x00025a6c:    6808        .h      LDR      r0,[r1,#0]
        0x00025a6e:    f0200001     ...    BIC      r0,r0,#1
        0x00025a72:    6008        .`      STR      r0,[r1,#0]
        0x00025a74:    6808        .h      LDR      r0,[r1,#0]
        0x00025a76:    f0400002    @...    ORR      r0,r0,#2
        0x00025a7a:    6008        .`      STR      r0,[r1,#0]
        0x00025a7c:    9800        ..      LDR      r0,[sp,#0]
        0x00025a7e:    f2430204    C...    MOV      r2,#0x3004
        0x00025a82:    f2c40200    ....    MOVT     r2,#0x4000
        0x00025a86:    6010        .`      STR      r0,[r2,#0]
        0x00025a88:    6808        .h      LDR      r0,[r1,#0]
        0x00025a8a:    f0400001    @...    ORR      r0,r0,#1
        0x00025a8e:    6008        .`      STR      r0,[r1,#0]
        0x00025a90:    b001        ..      ADD      sp,sp,#4
        0x00025a92:    4770        pG      BX       lr
    timer2_init
        0x00025a94:    b580        ..      PUSH     {r7,lr}
        0x00025a96:    b082        ..      SUB      sp,sp,#8
        0x00025a98:    f44f7080    O..p    MOV      r0,#0x100
        0x00025a9c:    f7fefe98    ....    BL       SYSCTRL_ClearClkGateMulti ; 0x247d0
        0x00025aa0:    f2430000    C...    MOVW     r0,#0x3000
        0x00025aa4:    f2c40000    ....    MOVT     r0,#0x4000
        0x00025aa8:    9001        ..      STR      r0,[sp,#4]
        0x00025aaa:    2101        .!      MOVS     r1,#1
        0x00025aac:    f7fefed6    ....    BL       TMR_SetOpMode ; 0x2485c
        0x00025ab0:    9801        ..      LDR      r0,[sp,#4]
        0x00025ab2:    f7fefec1    ....    BL       TMR_Reload ; 0x24838
        0x00025ab6:    9801        ..      LDR      r0,[sp,#4]
        0x00025ab8:    f7fefeb4    ....    BL       TMR_IntEnable ; 0x24824
        0x00025abc:    b002        ..      ADD      sp,sp,#8
        0x00025abe:    bd80        ..      POP      {r7,pc}
    timer2_isr
        0x00025ac0:    b580        ..      PUSH     {r7,lr}
        0x00025ac2:    b082        ..      SUB      sp,sp,#8
        0x00025ac4:    9001        ..      STR      r0,[sp,#4]
        0x00025ac6:    f2416040    A.@`    MOVW     r0,#0x1640
        0x00025aca:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025ace:    2101        .!      MOVS     r1,#1
        0x00025ad0:    f000f9a2    ....    BL       uart_driver_send_data ; 0x25e18
        0x00025ad4:    f2430000    C...    MOVW     r0,#0x3000
        0x00025ad8:    f2c40000    ....    MOVT     r0,#0x4000
        0x00025adc:    f7fefe98    ....    BL       TMR_IntClr ; 0x24810
        0x00025ae0:    2000        .       MOVS     r0,#0
        0x00025ae2:    b002        ..      ADD      sp,sp,#8
        0x00025ae4:    bd80        ..      POP      {r7,pc}
        0x00025ae6:    0000        ..      MOVS     r0,r0
    timer_cb
        0x00025ae8:    b580        ..      PUSH     {r7,lr}
        0x00025aea:    b082        ..      SUB      sp,sp,#8
        0x00025aec:    9001        ..      STR      r0,[sp,#4]
        0x00025aee:    9801        ..      LDR      r0,[sp,#4]
        0x00025af0:    2800        .(      CMP      r0,#0
        0x00025af2:    d410        ..      BMI      0x25b16 ; timer_cb + 46
        0x00025af4:    e7ff        ..      B        0x25af6 ; timer_cb + 14
        0x00025af6:    9801        ..      LDR      r0,[sp,#4]
        0x00025af8:    2807        .(      CMP      r0,#7
        0x00025afa:    dc0c        ..      BGT      0x25b16 ; timer_cb + 46
        0x00025afc:    e7ff        ..      B        0x25afe ; timer_cb + 22
        0x00025afe:    9801        ..      LDR      r0,[sp,#4]
        0x00025b00:    eb000180    ....    ADD      r1,r0,r0,LSL #2
        0x00025b04:    f24150a0    A..P    MOVW     r0,#0x15a0
        0x00025b08:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025b0c:    eb000081    ....    ADD      r0,r0,r1,LSL #2
        0x00025b10:    7c00        .|      LDRB     r0,[r0,#0x10]
        0x00025b12:    b908        ..      CBNZ     r0,0x25b18 ; timer_cb + 48
        0x00025b14:    e7ff        ..      B        0x25b16 ; timer_cb + 46
        0x00025b16:    e00c        ..      B        0x25b32 ; timer_cb + 74
        0x00025b18:    9801        ..      LDR      r0,[sp,#4]
        0x00025b1a:    eb000180    ....    ADD      r1,r0,r0,LSL #2
        0x00025b1e:    f24150a0    A..P    MOVW     r0,#0x15a0
        0x00025b22:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025b26:    eb000081    ....    ADD      r0,r0,r1,LSL #2
        0x00025b2a:    6841        Ah      LDR      r1,[r0,#4]
        0x00025b2c:    6880        .h      LDR      r0,[r0,#8]
        0x00025b2e:    4788        .G      BLX      r1
        0x00025b30:    e7ff        ..      B        0x25b32 ; timer_cb + 74
        0x00025b32:    b002        ..      ADD      sp,sp,#8
        0x00025b34:    bd80        ..      POP      {r7,pc}
        0x00025b36:    0000        ..      MOVS     r0,r0
    timer_cb_0
        0x00025b38:    b580        ..      PUSH     {r7,lr}
        0x00025b3a:    2000        .       MOVS     r0,#0
        0x00025b3c:    f7ffffd4    ....    BL       timer_cb ; 0x25ae8
        0x00025b40:    bd80        ..      POP      {r7,pc}
        0x00025b42:    0000        ..      MOVS     r0,r0
    timer_cb_1
        0x00025b44:    b580        ..      PUSH     {r7,lr}
        0x00025b46:    2001        .       MOVS     r0,#1
        0x00025b48:    f7ffffce    ....    BL       timer_cb ; 0x25ae8
        0x00025b4c:    bd80        ..      POP      {r7,pc}
        0x00025b4e:    0000        ..      MOVS     r0,r0
    timer_cb_2
        0x00025b50:    b580        ..      PUSH     {r7,lr}
        0x00025b52:    2002        .       MOVS     r0,#2
        0x00025b54:    f7ffffc8    ....    BL       timer_cb ; 0x25ae8
        0x00025b58:    bd80        ..      POP      {r7,pc}
        0x00025b5a:    0000        ..      MOVS     r0,r0
    timer_cb_3
        0x00025b5c:    b580        ..      PUSH     {r7,lr}
        0x00025b5e:    2003        .       MOVS     r0,#3
        0x00025b60:    f7ffffc2    ....    BL       timer_cb ; 0x25ae8
        0x00025b64:    bd80        ..      POP      {r7,pc}
        0x00025b66:    0000        ..      MOVS     r0,r0
    timer_cb_4
        0x00025b68:    b580        ..      PUSH     {r7,lr}
        0x00025b6a:    2004        .       MOVS     r0,#4
        0x00025b6c:    f7ffffbc    ....    BL       timer_cb ; 0x25ae8
        0x00025b70:    bd80        ..      POP      {r7,pc}
        0x00025b72:    0000        ..      MOVS     r0,r0
    timer_cb_5
        0x00025b74:    b580        ..      PUSH     {r7,lr}
        0x00025b76:    2005        .       MOVS     r0,#5
        0x00025b78:    f7ffffb6    ....    BL       timer_cb ; 0x25ae8
        0x00025b7c:    bd80        ..      POP      {r7,pc}
        0x00025b7e:    0000        ..      MOVS     r0,r0
    timer_cb_6
        0x00025b80:    b580        ..      PUSH     {r7,lr}
        0x00025b82:    2006        .       MOVS     r0,#6
        0x00025b84:    f7ffffb0    ....    BL       timer_cb ; 0x25ae8
        0x00025b88:    bd80        ..      POP      {r7,pc}
        0x00025b8a:    0000        ..      MOVS     r0,r0
    timer_cb_7
        0x00025b8c:    b580        ..      PUSH     {r7,lr}
        0x00025b8e:    2007        .       MOVS     r0,#7
        0x00025b90:    f7ffffaa    ....    BL       timer_cb ; 0x25ae8
        0x00025b94:    bd80        ..      POP      {r7,pc}
        0x00025b96:    0000        ..      MOVS     r0,r0
    timer_create
        0x00025b98:    b580        ..      PUSH     {r7,lr}
        0x00025b9a:    b086        ..      SUB      sp,sp,#0x18
        0x00025b9c:    9004        ..      STR      r0,[sp,#0x10]
        0x00025b9e:    9103        ..      STR      r1,[sp,#0xc]
        0x00025ba0:    9202        ..      STR      r2,[sp,#8]
        0x00025ba2:    2000        .       MOVS     r0,#0
        0x00025ba4:    9001        ..      STR      r0,[sp,#4]
        0x00025ba6:    e7ff        ..      B        0x25ba8 ; timer_create + 16
        0x00025ba8:    9801        ..      LDR      r0,[sp,#4]
        0x00025baa:    2807        .(      CMP      r0,#7
        0x00025bac:    dc12        ..      BGT      0x25bd4 ; timer_create + 60
        0x00025bae:    e7ff        ..      B        0x25bb0 ; timer_create + 24
        0x00025bb0:    9801        ..      LDR      r0,[sp,#4]
        0x00025bb2:    eb000180    ....    ADD      r1,r0,r0,LSL #2
        0x00025bb6:    f24150a0    A..P    MOVW     r0,#0x15a0
        0x00025bba:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025bbe:    eb000081    ....    ADD      r0,r0,r1,LSL #2
        0x00025bc2:    7c00        .|      LDRB     r0,[r0,#0x10]
        0x00025bc4:    b908        ..      CBNZ     r0,0x25bca ; timer_create + 50
        0x00025bc6:    e7ff        ..      B        0x25bc8 ; timer_create + 48
        0x00025bc8:    e004        ..      B        0x25bd4 ; timer_create + 60
        0x00025bca:    e7ff        ..      B        0x25bcc ; timer_create + 52
        0x00025bcc:    9801        ..      LDR      r0,[sp,#4]
        0x00025bce:    3001        .0      ADDS     r0,#1
        0x00025bd0:    9001        ..      STR      r0,[sp,#4]
        0x00025bd2:    e7e9        ..      B        0x25ba8 ; timer_create + 16
        0x00025bd4:    9801        ..      LDR      r0,[sp,#4]
        0x00025bd6:    2808        .(      CMP      r0,#8
        0x00025bd8:    db0a        ..      BLT      0x25bf0 ; timer_create + 88
        0x00025bda:    e7ff        ..      B        0x25bdc ; timer_create + 68
        0x00025bdc:    f24640c7    F..@    MOV      r0,#0x64c7
        0x00025be0:    f2c00002    ....    MOVT     r0,#2
        0x00025be4:    215b        [!      MOVS     r1,#0x5b
        0x00025be6:    f7f7fefd    ....    BL       platform_raise_assertion ; 0x1d9e4
        0x00025bea:    2000        .       MOVS     r0,#0
        0x00025bec:    9005        ..      STR      r0,[sp,#0x14]
        0x00025bee:    e030        0.      B        0x25c52 ; timer_create + 186
        0x00025bf0:    9902        ..      LDR      r1,[sp,#8]
        0x00025bf2:    9801        ..      LDR      r0,[sp,#4]
        0x00025bf4:    eb000280    ....    ADD      r2,r0,r0,LSL #2
        0x00025bf8:    f24150a0    A..P    MOVW     r0,#0x15a0
        0x00025bfc:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025c00:    eb000282    ....    ADD      r2,r0,r2,LSL #2
        0x00025c04:    6051        Q`      STR      r1,[r2,#4]
        0x00025c06:    9903        ..      LDR      r1,[sp,#0xc]
        0x00025c08:    9a01        ..      LDR      r2,[sp,#4]
        0x00025c0a:    eb020282    ....    ADD      r2,r2,r2,LSL #2
        0x00025c0e:    eb000282    ....    ADD      r2,r0,r2,LSL #2
        0x00025c12:    6091        .`      STR      r1,[r2,#8]
        0x00025c14:    9a04        ..      LDR      r2,[sp,#0x10]
        0x00025c16:    eb020152    ..R.    ADD      r1,r2,r2,LSR #1
        0x00025c1a:    f64c43cd    L..C    MOV      r3,#0xcccd
        0x00025c1e:    f6cc43cc    ...C    MOVT     r3,#0xcccc
        0x00025c22:    fba23203    ...2    UMULL    r3,r2,r2,r3
        0x00025c26:    eb0101d2    ....    ADD      r1,r1,r2,LSR #3
        0x00025c2a:    9a01        ..      LDR      r2,[sp,#4]
        0x00025c2c:    eb020282    ....    ADD      r2,r2,r2,LSL #2
        0x00025c30:    eb000282    ....    ADD      r2,r0,r2,LSL #2
        0x00025c34:    60d1        .`      STR      r1,[r2,#0xc]
        0x00025c36:    9901        ..      LDR      r1,[sp,#4]
        0x00025c38:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x00025c3c:    eb000281    ....    ADD      r2,r0,r1,LSL #2
        0x00025c40:    2101        .!      MOVS     r1,#1
        0x00025c42:    7411        .t      STRB     r1,[r2,#0x10]
        0x00025c44:    9901        ..      LDR      r1,[sp,#4]
        0x00025c46:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x00025c4a:    eb000081    ....    ADD      r0,r0,r1,LSL #2
        0x00025c4e:    9005        ..      STR      r0,[sp,#0x14]
        0x00025c50:    e7ff        ..      B        0x25c52 ; timer_create + 186
        0x00025c52:    9805        ..      LDR      r0,[sp,#0x14]
        0x00025c54:    b006        ..      ADD      sp,sp,#0x18
        0x00025c56:    bd80        ..      POP      {r7,pc}
    timer_delete
        0x00025c58:    b580        ..      PUSH     {r7,lr}
        0x00025c5a:    b084        ..      SUB      sp,sp,#0x10
        0x00025c5c:    9003        ..      STR      r0,[sp,#0xc]
        0x00025c5e:    9803        ..      LDR      r0,[sp,#0xc]
        0x00025c60:    9002        ..      STR      r0,[sp,#8]
        0x00025c62:    9802        ..      LDR      r0,[sp,#8]
        0x00025c64:    6800        .h      LDR      r0,[r0,#0]
        0x00025c66:    2100        .!      MOVS     r1,#0
        0x00025c68:    9101        ..      STR      r1,[sp,#4]
        0x00025c6a:    f7f7ff27    ..'.    BL       platform_set_timer ; 0x1dabc
        0x00025c6e:    9801        ..      LDR      r0,[sp,#4]
        0x00025c70:    9902        ..      LDR      r1,[sp,#8]
        0x00025c72:    7408        .t      STRB     r0,[r1,#0x10]
        0x00025c74:    b004        ..      ADD      sp,sp,#0x10
        0x00025c76:    bd80        ..      POP      {r7,pc}
    timer_start
        0x00025c78:    b580        ..      PUSH     {r7,lr}
        0x00025c7a:    b082        ..      SUB      sp,sp,#8
        0x00025c7c:    9001        ..      STR      r0,[sp,#4]
        0x00025c7e:    9801        ..      LDR      r0,[sp,#4]
        0x00025c80:    9000        ..      STR      r0,[sp,#0]
        0x00025c82:    9900        ..      LDR      r1,[sp,#0]
        0x00025c84:    6808        .h      LDR      r0,[r1,#0]
        0x00025c86:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00025c88:    f7f7ff18    ....    BL       platform_set_timer ; 0x1dabc
        0x00025c8c:    b002        ..      ADD      sp,sp,#8
        0x00025c8e:    bd80        ..      POP      {r7,pc}
    timer_stop
        0x00025c90:    b580        ..      PUSH     {r7,lr}
        0x00025c92:    b082        ..      SUB      sp,sp,#8
        0x00025c94:    9001        ..      STR      r0,[sp,#4]
        0x00025c96:    9801        ..      LDR      r0,[sp,#4]
        0x00025c98:    9000        ..      STR      r0,[sp,#0]
        0x00025c9a:    9800        ..      LDR      r0,[sp,#0]
        0x00025c9c:    6800        .h      LDR      r0,[r0,#0]
        0x00025c9e:    2100        .!      MOVS     r1,#0
        0x00025ca0:    f7f7ff0c    ....    BL       platform_set_timer ; 0x1dabc
        0x00025ca4:    b002        ..      ADD      sp,sp,#8
        0x00025ca6:    bd80        ..      POP      {r7,pc}
    uart_driver_isr
        0x00025ca8:    b580        ..      PUSH     {r7,lr}
        0x00025caa:    b082        ..      SUB      sp,sp,#8
        0x00025cac:    9001        ..      STR      r0,[sp,#4]
        0x00025cae:    e7ff        ..      B        0x25cb0 ; uart_driver_isr + 8
        0x00025cb0:    f2410000    A...    MOVW     r0,#0x1000
        0x00025cb4:    f2c40002    ....    MOVT     r0,#0x4002
        0x00025cb8:    f7fefe56    ..V.    BL       apUART_Get_all_raw_int_stat ; 0x24968
        0x00025cbc:    9000        ..      STR      r0,[sp,#0]
        0x00025cbe:    9800        ..      LDR      r0,[sp,#0]
        0x00025cc0:    b908        ..      CBNZ     r0,0x25cc6 ; uart_driver_isr + 30
        0x00025cc2:    e7ff        ..      B        0x25cc4 ; uart_driver_isr + 28
        0x00025cc4:    e016        ..      B        0x25cf4 ; uart_driver_isr + 76
        0x00025cc6:    9800        ..      LDR      r0,[sp,#0]
        0x00025cc8:    f2410144    A.D.    MOV      r1,#0x1044
        0x00025ccc:    f2c40102    ....    MOVT     r1,#0x4002
        0x00025cd0:    6008        .`      STR      r0,[r1,#0]
        0x00025cd2:    f89d0000    ....    LDRB     r0,[sp,#0]
        0x00025cd6:    06c0        ..      LSLS     r0,r0,#27
        0x00025cd8:    2800        .(      CMP      r0,#0
        0x00025cda:    d503        ..      BPL      0x25ce4 ; uart_driver_isr + 60
        0x00025cdc:    e7ff        ..      B        0x25cde ; uart_driver_isr + 54
        0x00025cde:    f000f80d    ....    BL       uart_driver_read_data ; 0x25cfc
        0x00025ce2:    e7ff        ..      B        0x25ce4 ; uart_driver_isr + 60
        0x00025ce4:    f89d0000    ....    LDRB     r0,[sp,#0]
        0x00025ce8:    0680        ..      LSLS     r0,r0,#26
        0x00025cea:    2800        .(      CMP      r0,#0
        0x00025cec:    d501        ..      BPL      0x25cf2 ; uart_driver_isr + 74
        0x00025cee:    e7ff        ..      B        0x25cf0 ; uart_driver_isr + 72
        0x00025cf0:    e7ff        ..      B        0x25cf2 ; uart_driver_isr + 74
        0x00025cf2:    e7dd        ..      B        0x25cb0 ; uart_driver_isr + 8
        0x00025cf4:    2000        .       MOVS     r0,#0
        0x00025cf6:    b002        ..      ADD      sp,sp,#8
        0x00025cf8:    bd80        ..      POP      {r7,pc}
        0x00025cfa:    0000        ..      MOVS     r0,r0
    uart_driver_read_data
        0x00025cfc:    b580        ..      PUSH     {r7,lr}
        0x00025cfe:    b084        ..      SUB      sp,sp,#0x10
        0x00025d00:    f2421006    B...    MOV      r0,#0x2106
        0x00025d04:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025d08:    9003        ..      STR      r0,[sp,#0xc]
        0x00025d0a:    e7ff        ..      B        0x25d0c ; uart_driver_read_data + 16
        0x00025d0c:    f2410000    A...    MOVW     r0,#0x1000
        0x00025d10:    f2c40002    ....    MOVT     r0,#0x4002
        0x00025d14:    f7fefe18    ....    BL       apUART_Check_RXFIFO_EMPTY ; 0x24948
        0x00025d18:    2801        .(      CMP      r0,#1
        0x00025d1a:    d015        ..      BEQ      0x25d48 ; uart_driver_read_data + 76
        0x00025d1c:    e7ff        ..      B        0x25d1e ; uart_driver_read_data + 34
        0x00025d1e:    f2410000    A...    MOVW     r0,#0x1000
        0x00025d22:    f2c40002    ....    MOVT     r0,#0x4002
        0x00025d26:    6800        .h      LDR      r0,[r0,#0]
        0x00025d28:    f88d000b    ....    STRB     r0,[sp,#0xb]
        0x00025d2c:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x00025d30:    9903        ..      LDR      r1,[sp,#0xc]
        0x00025d32:    f2421c04    B...    MOV      r12,#0x2104
        0x00025d36:    f2c20c00    ....    MOVT     r12,#0x2000
        0x00025d3a:    f8bc2000    ...     LDRH     r2,[r12,#0]
        0x00025d3e:    1c53        S.      ADDS     r3,r2,#1
        0x00025d40:    f8ac3000    ...0    STRH     r3,[r12,#0]
        0x00025d44:    5488        .T      STRB     r0,[r1,r2]
        0x00025d46:    e7e1        ..      B        0x25d0c ; uart_driver_read_data + 16
        0x00025d48:    f2421004    B...    MOV      r0,#0x2104
        0x00025d4c:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025d50:    8800        ..      LDRH     r0,[r0,#0]
        0x00025d52:    2802        .(      CMP      r0,#2
        0x00025d54:    db5e        ^.      BLT      0x25e14 ; uart_driver_read_data + 280
        0x00025d56:    e7ff        ..      B        0x25d58 ; uart_driver_read_data + 92
        0x00025d58:    f2421004    B...    MOV      r0,#0x2104
        0x00025d5c:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025d60:    8800        ..      LDRH     r0,[r0,#0]
        0x00025d62:    f2421106    B...    MOV      r1,#0x2106
        0x00025d66:    f2c20100    ....    MOVT     r1,#0x2000
        0x00025d6a:    7849        Ix      LDRB     r1,[r1,#1]
        0x00025d6c:    3102        .1      ADDS     r1,#2
        0x00025d6e:    4288        .B      CMP      r0,r1
        0x00025d70:    d150        P.      BNE      0x25e14 ; uart_driver_read_data + 280
        0x00025d72:    e7ff        ..      B        0x25d74 ; uart_driver_read_data + 120
        0x00025d74:    9803        ..      LDR      r0,[sp,#0xc]
        0x00025d76:    7801        .x      LDRB     r1,[r0,#0]
        0x00025d78:    7842        Bx      LDRB     r2,[r0,#1]
        0x00025d7a:    7883        .x      LDRB     r3,[r0,#2]
        0x00025d7c:    f24630e7    F..0    MOV      r0,#0x63e7
        0x00025d80:    f2c00002    ....    MOVT     r0,#2
        0x00025d84:    f7f7fe24    ..$.    BL       platform_printf ; 0x1d9d0
        0x00025d88:    f2421006    B...    MOV      r0,#0x2106
        0x00025d8c:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025d90:    7800        .x      LDRB     r0,[r0,#0]
        0x00025d92:    4601        .F      MOV      r1,r0
        0x00025d94:    9101        ..      STR      r1,[sp,#4]
        0x00025d96:    2802        .(      CMP      r0,#2
        0x00025d98:    d01c        ..      BEQ      0x25dd4 ; uart_driver_read_data + 216
        0x00025d9a:    e7ff        ..      B        0x25d9c ; uart_driver_read_data + 160
        0x00025d9c:    9801        ..      LDR      r0,[sp,#4]
        0x00025d9e:    2805        .(      CMP      r0,#5
        0x00025da0:    d130        0.      BNE      0x25e04 ; uart_driver_read_data + 264
        0x00025da2:    e7ff        ..      B        0x25da4 ; uart_driver_read_data + 168
        0x00025da4:    f2421004    B...    MOV      r0,#0x2104
        0x00025da8:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025dac:    8800        ..      LDRH     r0,[r0,#0]
        0x00025dae:    2803        .(      CMP      r0,#3
        0x00025db0:    db0f        ..      BLT      0x25dd2 ; uart_driver_read_data + 214
        0x00025db2:    e7ff        ..      B        0x25db4 ; uart_driver_read_data + 184
        0x00025db4:    f2421004    B...    MOV      r0,#0x2104
        0x00025db8:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025dbc:    8800        ..      LDRH     r0,[r0,#0]
        0x00025dbe:    1e81        ..      SUBS     r1,r0,#2
        0x00025dc0:    f2421006    B...    MOV      r0,#0x2106
        0x00025dc4:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025dc8:    3002        .0      ADDS     r0,#2
        0x00025dca:    b289        ..      UXTH     r1,r1
        0x00025dcc:    f7feffb6    ....    BL       ble_external_send_dev_sync_data ; 0x24d3c
        0x00025dd0:    e7ff        ..      B        0x25dd2 ; uart_driver_read_data + 214
        0x00025dd2:    e018        ..      B        0x25e06 ; uart_driver_read_data + 266
        0x00025dd4:    f2421004    B...    MOV      r0,#0x2104
        0x00025dd8:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025ddc:    8800        ..      LDRH     r0,[r0,#0]
        0x00025dde:    2803        .(      CMP      r0,#3
        0x00025de0:    db0f        ..      BLT      0x25e02 ; uart_driver_read_data + 262
        0x00025de2:    e7ff        ..      B        0x25de4 ; uart_driver_read_data + 232
        0x00025de4:    f2421004    B...    MOV      r0,#0x2104
        0x00025de8:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025dec:    8800        ..      LDRH     r0,[r0,#0]
        0x00025dee:    1e81        ..      SUBS     r1,r0,#2
        0x00025df0:    f2421006    B...    MOV      r0,#0x2106
        0x00025df4:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025df8:    3002        .0      ADDS     r0,#2
        0x00025dfa:    b289        ..      UXTH     r1,r1
        0x00025dfc:    f7feff7e    ..~.    BL       ble_external_send_data ; 0x24cfc
        0x00025e00:    e7ff        ..      B        0x25e02 ; uart_driver_read_data + 262
        0x00025e02:    e000        ..      B        0x25e06 ; uart_driver_read_data + 266
        0x00025e04:    e7ff        ..      B        0x25e06 ; uart_driver_read_data + 266
        0x00025e06:    f2421104    B...    MOV      r1,#0x2104
        0x00025e0a:    f2c20100    ....    MOVT     r1,#0x2000
        0x00025e0e:    2000        .       MOVS     r0,#0
        0x00025e10:    8008        ..      STRH     r0,[r1,#0]
        0x00025e12:    e7ff        ..      B        0x25e14 ; uart_driver_read_data + 280
        0x00025e14:    b004        ..      ADD      sp,sp,#0x10
        0x00025e16:    bd80        ..      POP      {r7,pc}
    uart_driver_send_data
        0x00025e18:    b580        ..      PUSH     {r7,lr}
        0x00025e1a:    b082        ..      SUB      sp,sp,#8
        0x00025e1c:    9001        ..      STR      r0,[sp,#4]
        0x00025e1e:    f8ad1002    ....    STRH     r1,[sp,#2]
        0x00025e22:    2000        .       MOVS     r0,#0
        0x00025e24:    f8ad0000    ....    STRH     r0,[sp,#0]
        0x00025e28:    e7ff        ..      B        0x25e2a ; uart_driver_send_data + 18
        0x00025e2a:    f8bd0000    ....    LDRH     r0,[sp,#0]
        0x00025e2e:    f8bd1002    ....    LDRH     r1,[sp,#2]
        0x00025e32:    4288        .B      CMP      r0,r1
        0x00025e34:    da1c        ..      BGE      0x25e70 ; uart_driver_send_data + 88
        0x00025e36:    e7ff        ..      B        0x25e38 ; uart_driver_send_data + 32
        0x00025e38:    e7ff        ..      B        0x25e3a ; uart_driver_send_data + 34
        0x00025e3a:    f2410000    A...    MOVW     r0,#0x1000
        0x00025e3e:    f2c40002    ....    MOVT     r0,#0x4002
        0x00025e42:    f7fefd89    ....    BL       apUART_Check_TXFIFO_FULL ; 0x24958
        0x00025e46:    2801        .(      CMP      r0,#1
        0x00025e48:    d101        ..      BNE      0x25e4e ; uart_driver_send_data + 54
        0x00025e4a:    e7ff        ..      B        0x25e4c ; uart_driver_send_data + 52
        0x00025e4c:    e7f5        ..      B        0x25e3a ; uart_driver_send_data + 34
        0x00025e4e:    9801        ..      LDR      r0,[sp,#4]
        0x00025e50:    f8bd1000    ....    LDRH     r1,[sp,#0]
        0x00025e54:    5c41        A\      LDRB     r1,[r0,r1]
        0x00025e56:    f2410000    A...    MOVW     r0,#0x1000
        0x00025e5a:    f2c40002    ....    MOVT     r0,#0x4002
        0x00025e5e:    f7fefd0d    ....    BL       UART_SendData ; 0x2487c
        0x00025e62:    e7ff        ..      B        0x25e64 ; uart_driver_send_data + 76
        0x00025e64:    f8bd0000    ....    LDRH     r0,[sp,#0]
        0x00025e68:    3001        .0      ADDS     r0,#1
        0x00025e6a:    f8ad0000    ....    STRH     r0,[sp,#0]
        0x00025e6e:    e7dc        ..      B        0x25e2a ; uart_driver_send_data + 18
        0x00025e70:    2000        .       MOVS     r0,#0
        0x00025e72:    b002        ..      ADD      sp,sp,#8
        0x00025e74:    bd80        ..      POP      {r7,pc}
        0x00025e76:    0000        ..      MOVS     r0,r0
    uart_external_send_data
        0x00025e78:    b580        ..      PUSH     {r7,lr}
        0x00025e7a:    b082        ..      SUB      sp,sp,#8
        0x00025e7c:    9001        ..      STR      r0,[sp,#4]
        0x00025e7e:    f8ad1002    ....    STRH     r1,[sp,#2]
        0x00025e82:    f2422008    B..     MOV      r0,#0x2208
        0x00025e86:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025e8a:    2102        .!      MOVS     r1,#2
        0x00025e8c:    7001        .p      STRB     r1,[r0,#0]
        0x00025e8e:    f89d1002    ....    LDRB     r1,[sp,#2]
        0x00025e92:    7041        Ap      STRB     r1,[r0,#1]
        0x00025e94:    9901        ..      LDR      r1,[sp,#4]
        0x00025e96:    f8bd2002    ...     LDRH     r2,[sp,#2]
        0x00025e9a:    3002        .0      ADDS     r0,#2
        0x00025e9c:    f7fef8dc    ....    BL       ___aeabi_memcpy4$move ; 0x24058
        0x00025ea0:    200e        .       MOVS     r0,#0xe
        0x00025ea2:    2200        ."      MOVS     r2,#0
        0x00025ea4:    4611        .F      MOV      r1,r2
        0x00025ea6:    f7e0fd2b    ..+.    BL       btstack_push_user_msg ; 0x6900
        0x00025eaa:    b002        ..      ADD      sp,sp,#8
        0x00025eac:    bd80        ..      POP      {r7,pc}
        0x00025eae:    0000        ..      MOVS     r0,r0
    user_msg_handler
        0x00025eb0:    b580        ..      PUSH     {r7,lr}
        0x00025eb2:    b084        ..      SUB      sp,sp,#0x10
        0x00025eb4:    9003        ..      STR      r0,[sp,#0xc]
        0x00025eb6:    9102        ..      STR      r1,[sp,#8]
        0x00025eb8:    f8ad2006    ...     STRH     r2,[sp,#6]
        0x00025ebc:    9803        ..      LDR      r0,[sp,#0xc]
        0x00025ebe:    3807        .8      SUBS     r0,#7
        0x00025ec0:    4601        .F      MOV      r1,r0
        0x00025ec2:    9100        ..      STR      r1,[sp,#0]
        0x00025ec4:    2807        .(      CMP      r0,#7
        0x00025ec6:    d827        '.      BHI      0x25f18 ; user_msg_handler + 104
        0x00025ec8:    9900        ..      LDR      r1,[sp,#0]
        0x00025eca:    e8dff001    ....    TBB      [pc,r1]
    $d.20
        0x00025ece:    1304        ..      DCW    4868
        0x00025ed0:    19252525    %%%.    DCD    421864741
        0x00025ed4:    1c25        %.      DCW    7205
    $t.21
        0x00025ed6:    f24170f0    A..p    MOV      r0,#0x17f0
        0x00025eda:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025ede:    f8900348    ..H.    LDRB     r0,[r0,#0x348]
        0x00025ee2:    07c0        ..      LSLS     r0,r0,#31
        0x00025ee4:    b128        (.      CBZ      r0,0x25ef2 ; user_msg_handler + 66
        0x00025ee6:    e7ff        ..      B        0x25ee8 ; user_msg_handler + 56
        0x00025ee8:    f44f60fa    O..`    MOV      r0,#0x7d0
        0x00025eec:    f7fffb00    ....    BL       internal_time_sync_recv_schedule ; 0x254f0
        0x00025ef0:    e7ff        ..      B        0x25ef2 ; user_msg_handler + 66
        0x00025ef2:    e012        ..      B        0x25f1a ; user_msg_handler + 106
        0x00025ef4:    9802        ..      LDR      r0,[sp,#8]
        0x00025ef6:    f8bd1006    ....    LDRH     r1,[sp,#6]
        0x00025efa:    f7fefe9f    ....    BL       ble_att_send_data ; 0x24c3c
        0x00025efe:    e00c        ..      B        0x25f1a ; user_msg_handler + 106
        0x00025f00:    f7fff9c4    ....    BL       internal_internal_time_sync_offset_post_processing ; 0x2528c
        0x00025f04:    e009        ..      B        0x25f1a ; user_msg_handler + 106
        0x00025f06:    f2422008    B..     MOV      r0,#0x2208
        0x00025f0a:    f2c20000    ....    MOVT     r0,#0x2000
        0x00025f0e:    7841        Ax      LDRB     r1,[r0,#1]
        0x00025f10:    3002        .0      ADDS     r0,#2
        0x00025f12:    f7ffff81    ....    BL       uart_driver_send_data ; 0x25e18
        0x00025f16:    e000        ..      B        0x25f1a ; user_msg_handler + 106
        0x00025f18:    e7ff        ..      B        0x25f1a ; user_msg_handler + 106
        0x00025f1a:    b004        ..      ADD      sp,sp,#0x10
        0x00025f1c:    bd80        ..      POP      {r7,pc}
        0x00025f1e:    0000        ..      MOVS     r0,r0
    user_packet_handler
        0x00025f20:    b580        ..      PUSH     {r7,lr}
        0x00025f22:    b08a        ..      SUB      sp,sp,#0x28
        0x00025f24:    f88d0027    ..'.    STRB     r0,[sp,#0x27]
        0x00025f28:    f8ad1024    ..$.    STRH     r1,[sp,#0x24]
        0x00025f2c:    9208        ..      STR      r2,[sp,#0x20]
        0x00025f2e:    f8ad301e    ...0    STRH     r3,[sp,#0x1e]
        0x00025f32:    9808        ..      LDR      r0,[sp,#0x20]
        0x00025f34:    f7fff90a    ....    BL       hci_event_packet_get_type ; 0x2514c
        0x00025f38:    f88d001d    ....    STRB     r0,[sp,#0x1d]
        0x00025f3c:    f89d0027    ..'.    LDRB     r0,[sp,#0x27]
        0x00025f40:    2804        .(      CMP      r0,#4
        0x00025f42:    d001        ..      BEQ      0x25f48 ; user_packet_handler + 40
        0x00025f44:    e7ff        ..      B        0x25f46 ; user_packet_handler + 38
        0x00025f46:    e0b4        ..      B        0x260b2 ; user_packet_handler + 402
        0x00025f48:    f89d001d    ....    LDRB     r0,[sp,#0x1d]
        0x00025f4c:    4601        .F      MOV      r1,r0
        0x00025f4e:    9103        ..      STR      r1,[sp,#0xc]
        0x00025f50:    2805        .(      CMP      r0,#5
        0x00025f52:    d079        y.      BEQ      0x26048 ; user_packet_handler + 296
        0x00025f54:    e7ff        ..      B        0x25f56 ; user_packet_handler + 54
        0x00025f56:    9803        ..      LDR      r0,[sp,#0xc]
        0x00025f58:    280e        .(      CMP      r0,#0xe
        0x00025f5a:    d028        (.      BEQ      0x25fae ; user_packet_handler + 142
        0x00025f5c:    e7ff        ..      B        0x25f5e ; user_packet_handler + 62
        0x00025f5e:    9803        ..      LDR      r0,[sp,#0xc]
        0x00025f60:    283e        >(      CMP      r0,#0x3e
        0x00025f62:    d029        ).      BEQ      0x25fb8 ; user_packet_handler + 152
        0x00025f64:    e7ff        ..      B        0x25f66 ; user_packet_handler + 70
        0x00025f66:    9803        ..      LDR      r0,[sp,#0xc]
        0x00025f68:    2860        `(      CMP      r0,#0x60
        0x00025f6a:    d00f        ..      BEQ      0x25f8c ; user_packet_handler + 108
        0x00025f6c:    e7ff        ..      B        0x25f6e ; user_packet_handler + 78
        0x00025f6e:    9803        ..      LDR      r0,[sp,#0xc]
        0x00025f70:    28b5        .(      CMP      r0,#0xb5
        0x00025f72:    f0008080    ....    BEQ.W    0x26076 ; user_packet_handler + 342
        0x00025f76:    e7ff        ..      B        0x25f78 ; user_packet_handler + 88
        0x00025f78:    9803        ..      LDR      r0,[sp,#0xc]
        0x00025f7a:    28b7        .(      CMP      r0,#0xb7
        0x00025f7c:    f0008086    ....    BEQ.W    0x2608c ; user_packet_handler + 364
        0x00025f80:    e7ff        ..      B        0x25f82 ; user_packet_handler + 98
        0x00025f82:    9803        ..      LDR      r0,[sp,#0xc]
        0x00025f84:    28ff        .(      CMP      r0,#0xff
        0x00025f86:    f0008088    ....    BEQ.W    0x2609a ; user_packet_handler + 378
        0x00025f8a:    e091        ..      B        0x260b0 ; user_packet_handler + 400
        0x00025f8c:    9808        ..      LDR      r0,[sp,#0x20]
        0x00025f8e:    f7fefeff    ....    BL       btstack_event_state_get_state ; 0x24d90
        0x00025f92:    2802        .(      CMP      r0,#2
        0x00025f94:    d001        ..      BEQ      0x25f9a ; user_packet_handler + 122
        0x00025f96:    e7ff        ..      B        0x25f98 ; user_packet_handler + 120
        0x00025f98:    e08b        ..      B        0x260b2 ; user_packet_handler + 402
        0x00025f9a:    f2463146    F.F1    MOV      r1,#0x6346
        0x00025f9e:    f2c00102    ....    MOVT     r1,#2
        0x00025fa2:    2000        .       MOVS     r0,#0
        0x00025fa4:    f7e1fcac    ....    BL       gap_set_adv_set_random_addr ; 0x7900
        0x00025fa8:    f7fffbea    ....    BL       setup_adv ; 0x25780
        0x00025fac:    e081        ..      B        0x260b2 ; user_packet_handler + 402
        0x00025fae:    9808        ..      LDR      r0,[sp,#0x20]
        0x00025fb0:    f7fff8be    ....    BL       hci_event_command_complete_get_command_opcode ; 0x25130
        0x00025fb4:    e7ff        ..      B        0x25fb6 ; user_packet_handler + 150
        0x00025fb6:    e07c        |.      B        0x260b2 ; user_packet_handler + 402
        0x00025fb8:    9808        ..      LDR      r0,[sp,#0x20]
        0x00025fba:    f7fff8c1    ....    BL       hci_event_le_meta_get_subevent_code ; 0x25140
        0x00025fbe:    4601        .F      MOV      r1,r0
        0x00025fc0:    9102        ..      STR      r1,[sp,#8]
        0x00025fc2:    2803        .(      CMP      r0,#3
        0x00025fc4:    d01e        ..      BEQ      0x26004 ; user_packet_handler + 228
        0x00025fc6:    e7ff        ..      B        0x25fc8 ; user_packet_handler + 168
        0x00025fc8:    9802        ..      LDR      r0,[sp,#8]
        0x00025fca:    280a        .(      CMP      r0,#0xa
        0x00025fcc:    d13a        :.      BNE      0x26044 ; user_packet_handler + 292
        0x00025fce:    e7ff        ..      B        0x25fd0 ; user_packet_handler + 176
        0x00025fd0:    9808        ..      LDR      r0,[sp,#0x20]
        0x00025fd2:    3003        .0      ADDS     r0,#3
        0x00025fd4:    9005        ..      STR      r0,[sp,#0x14]
        0x00025fd6:    9805        ..      LDR      r0,[sp,#0x14]
        0x00025fd8:    f8b00001    ....    LDRH     r0,[r0,#1]
        0x00025fdc:    f24171d0    A..q    MOV      r1,#0x17d0
        0x00025fe0:    f2c20100    ....    MOVT     r1,#0x2000
        0x00025fe4:    9101        ..      STR      r1,[sp,#4]
        0x00025fe6:    8008        ..      STRH     r0,[r1,#0]
        0x00025fe8:    9805        ..      LDR      r0,[sp,#0x14]
        0x00025fea:    f8b00017    ....    LDRH     r0,[r0,#0x17]
        0x00025fee:    f7fff8b9    ....    BL       hint_ce_len ; 0x25164
        0x00025ff2:    9801        ..      LDR      r0,[sp,#4]
        0x00025ff4:    8800        ..      LDRH     r0,[r0,#0]
        0x00025ff6:    f246218c    F..!    MOV      r1,#0x628c
        0x00025ffa:    f2c00102    ....    MOVT     r1,#2
        0x00025ffe:    f7e0f9d3    ....    BL       att_set_db ; 0x63a8
        0x00026002:    e020         .      B        0x26046 ; user_packet_handler + 294
        0x00026004:    9808        ..      LDR      r0,[sp,#0x20]
        0x00026006:    3003        .0      ADDS     r0,#3
        0x00026008:    9004        ..      STR      r0,[sp,#0x10]
        0x0002600a:    9804        ..      LDR      r0,[sp,#0x10]
        0x0002600c:    f8b01001    ....    LDRH     r1,[r0,#1]
        0x00026010:    9100        ..      STR      r1,[sp,#0]
        0x00026012:    f8b00003    ....    LDRH     r0,[r0,#3]
        0x00026016:    f7fef9d9    ....    BL       __aeabi_i2d ; 0x243cc
        0x0002601a:    2200        ."      MOVS     r2,#0
        0x0002601c:    2300        .#      MOVS     r3,#0
        0x0002601e:    f6c373f4    ...s    MOVT     r3,#0x3ff4
        0x00026022:    f7fef8f2    ....    BL       __aeabi_dmul ; 0x2420a
        0x00026026:    4602        .F      MOV      r2,r0
        0x00026028:    460b        .F      MOV      r3,r1
        0x0002602a:    9900        ..      LDR      r1,[sp,#0]
        0x0002602c:    f2464074    F.t@    MOV      r0,#0x6474
        0x00026030:    f2c00002    ....    MOVT     r0,#2
        0x00026034:    f7f7fccc    ....    BL       platform_printf ; 0x1d9d0
        0x00026038:    9804        ..      LDR      r0,[sp,#0x10]
        0x0002603a:    f8b00003    ....    LDRH     r0,[r0,#3]
        0x0002603e:    f7fff891    ....    BL       hint_ce_len ; 0x25164
        0x00026042:    e000        ..      B        0x26046 ; user_packet_handler + 294
        0x00026044:    e7ff        ..      B        0x26046 ; user_packet_handler + 294
        0x00026046:    e034        4.      B        0x260b2 ; user_packet_handler + 402
        0x00026048:    f64171f9    A..q    MOV      r1,#0x1ff9
        0x0002604c:    f2c20100    ....    MOVT     r1,#0x2000
        0x00026050:    2000        .       MOVS     r0,#0
        0x00026052:    7008        .p      STRB     r0,[r1,#0]
        0x00026054:    f246223a    F.:"    MOV      r2,#0x623a
        0x00026058:    f2c00202    ....    MOVT     r2,#2
        0x0002605c:    2101        .!      MOVS     r1,#1
        0x0002605e:    4608        .F      MOV      r0,r1
        0x00026060:    f7e1fca6    ....    BL       gap_set_ext_adv_enable ; 0x79b0
        0x00026064:    f7fffa6a    ..j.    BL       internal_time_sync_reset ; 0x2553c
        0x00026068:    f24640b7    F..@    MOV      r0,#0x64b7
        0x0002606c:    f2c00002    ....    MOVT     r0,#2
        0x00026070:    f7f7fcae    ....    BL       platform_printf ; 0x1d9d0
        0x00026074:    e01d        ..      B        0x260b2 ; user_packet_handler + 402
        0x00026076:    9808        ..      LDR      r0,[sp,#0x20]
        0x00026078:    f7fefd0a    ....    BL       att_event_mtu_exchange_complete_get_MTU ; 0x24a90
        0x0002607c:    4601        .F      MOV      r1,r0
        0x0002607e:    f246402d    F.-@    MOV      r0,#0x642d
        0x00026082:    f2c00002    ....    MOVT     r0,#2
        0x00026086:    f7f7fca3    ....    BL       platform_printf ; 0x1d9d0
        0x0002608a:    e012        ..      B        0x260b2 ; user_packet_handler + 402
        0x0002608c:    f2464098    F..@    MOV      r0,#0x6498
        0x00026090:    f2c00002    ....    MOVT     r0,#2
        0x00026094:    f7f7fc9c    ....    BL       platform_printf ; 0x1d9d0
        0x00026098:    e00b        ..      B        0x260b2 ; user_packet_handler + 402
        0x0002609a:    9808        ..      LDR      r0,[sp,#0x20]
        0x0002609c:    f7fff85c    ..\.    BL       hci_event_packet_get_user_msg ; 0x25158
        0x000260a0:    9006        ..      STR      r0,[sp,#0x18]
        0x000260a2:    9a06        ..      LDR      r2,[sp,#0x18]
        0x000260a4:    6810        .h      LDR      r0,[r2,#0]
        0x000260a6:    6851        Qh      LDR      r1,[r2,#4]
        0x000260a8:    8912        ..      LDRH     r2,[r2,#8]
        0x000260aa:    f7ffff01    ....    BL       user_msg_handler ; 0x25eb0
        0x000260ae:    e000        ..      B        0x260b2 ; user_packet_handler + 402
        0x000260b0:    e7ff        ..      B        0x260b2 ; user_packet_handler + 402
        0x000260b2:    b00a        ..      ADD      sp,sp,#0x28
        0x000260b4:    bd80        ..      POP      {r7,pc}
    $t
    i.__scatterload_copy
    __scatterload_copy
        0x000260b6:    e002        ..      B        0x260be ; __scatterload_copy + 8
        0x000260b8:    c808        ..      LDM      r0!,{r3}
        0x000260ba:    1f12        ..      SUBS     r2,r2,#4
        0x000260bc:    c108        ..      STM      r1!,{r3}
        0x000260be:    2a00        .*      CMP      r2,#0
        0x000260c0:    d1fa        ..      BNE      0x260b8 ; __scatterload_copy + 2
        0x000260c2:    4770        pG      BX       lr
    i.__scatterload_null
    __scatterload_null
        0x000260c4:    4770        pG      BX       lr
    i.__scatterload_zeroinit
    __scatterload_zeroinit
        0x000260c6:    2000        .       MOVS     r0,#0
        0x000260c8:    e001        ..      B        0x260ce ; __scatterload_zeroinit + 8
        0x000260ca:    c101        ..      STM      r1!,{r0}
        0x000260cc:    1f12        ..      SUBS     r2,r2,#4
        0x000260ce:    2a00        .*      CMP      r2,#0
        0x000260d0:    d1fb        ..      BNE      0x260ca ; __scatterload_zeroinit + 4
        0x000260d2:    4770        pG      BX       lr
    i.free
    free
        0x000260d4:    b510        ..      PUSH     {r4,lr}
        0x000260d6:    2800        .(      CMP      r0,#0
        0x000260d8:    d021        !.      BEQ      0x2611e ; free + 74
        0x000260da:    4b11        .K      LDR      r3,[pc,#68] ; [0x26120] = 0x20001598
        0x000260dc:    2200        ."      MOVS     r2,#0
        0x000260de:    1f00        ..      SUBS     r0,r0,#4
        0x000260e0:    6819        .h      LDR      r1,[r3,#0]
        0x000260e2:    e003        ..      B        0x260ec ; free + 24
        0x000260e4:    4281        .B      CMP      r1,r0
        0x000260e6:    d803        ..      BHI      0x260f0 ; free + 28
        0x000260e8:    460a        .F      MOV      r2,r1
        0x000260ea:    6849        Ih      LDR      r1,[r1,#4]
        0x000260ec:    2900        .)      CMP      r1,#0
        0x000260ee:    d1f9        ..      BNE      0x260e4 ; free + 16
        0x000260f0:    b152        R.      CBZ      r2,0x26108 ; free + 52
        0x000260f2:    6813        .h      LDR      r3,[r2,#0]
        0x000260f4:    1a84        ..      SUBS     r4,r0,r2
        0x000260f6:    429c        .B      CMP      r4,r3
        0x000260f8:    d104        ..      BNE      0x26104 ; free + 48
        0x000260fa:    6800        .h      LDR      r0,[r0,#0]
        0x000260fc:    4418        .D      ADD      r0,r0,r3
        0x000260fe:    6010        .`      STR      r0,[r2,#0]
        0x00026100:    4610        .F      MOV      r0,r2
        0x00026102:    e002        ..      B        0x2610a ; free + 54
        0x00026104:    6050        P`      STR      r0,[r2,#4]
        0x00026106:    e000        ..      B        0x2610a ; free + 54
        0x00026108:    6018        .`      STR      r0,[r3,#0]
        0x0002610a:    b139        9.      CBZ      r1,0x2611c ; free + 72
        0x0002610c:    6802        .h      LDR      r2,[r0,#0]
        0x0002610e:    1a0b        ..      SUBS     r3,r1,r0
        0x00026110:    4293        .B      CMP      r3,r2
        0x00026112:    d103        ..      BNE      0x2611c ; free + 72
        0x00026114:    680b        .h      LDR      r3,[r1,#0]
        0x00026116:    441a        .D      ADD      r2,r2,r3
        0x00026118:    6002        .`      STR      r2,[r0,#0]
        0x0002611a:    6849        Ih      LDR      r1,[r1,#4]
        0x0002611c:    6041        A`      STR      r1,[r0,#4]
        0x0002611e:    bd10        ..      POP      {r4,pc}
    $d
        0x00026120:    20001598    ...     DCD    536876440
    $t
    i.malloc
    malloc
        0x00026124:    b5f0        ..      PUSH     {r4-r7,lr}
        0x00026126:    300b        .0      ADDS     r0,r0,#0xb
        0x00026128:    4d15        .M      LDR      r5,[pc,#84] ; [0x26180] = 0x2000159c
        0x0002612a:    f0200107     ...    BIC      r1,r0,#7
        0x0002612e:    2400        .$      MOVS     r4,#0
        0x00026130:    4a14        .J      LDR      r2,[pc,#80] ; [0x26184] = 0x20001598
        0x00026132:    e00f        ..      B        0x26154 ; malloc + 48
        0x00026134:    6803        .h      LDR      r3,[r0,#0]
        0x00026136:    428b        .B      CMP      r3,r1
        0x00026138:    d30b        ..      BCC      0x26152 ; malloc + 46
        0x0002613a:    428b        .B      CMP      r3,r1
        0x0002613c:    d905        ..      BLS      0x2614a ; malloc + 38
        0x0002613e:    1a5e        ^.      SUBS     r6,r3,r1
        0x00026140:    1843        C.      ADDS     r3,r0,r1
        0x00026142:    6847        Gh      LDR      r7,[r0,#4]
        0x00026144:    e9c36700    ...g    STRD     r6,r7,[r3,#0]
        0x00026148:    e000        ..      B        0x2614c ; malloc + 40
        0x0002614a:    6843        Ch      LDR      r3,[r0,#4]
        0x0002614c:    6013        .`      STR      r3,[r2,#0]
        0x0002614e:    c002        ..      STM      r0!,{r1}
        0x00026150:    e004        ..      B        0x2615c ; malloc + 56
        0x00026152:    1d02        ..      ADDS     r2,r0,#4
        0x00026154:    6810        .h      LDR      r0,[r2,#0]
        0x00026156:    2800        .(      CMP      r0,#0
        0x00026158:    d1ec        ..      BNE      0x26134 ; malloc + 16
        0x0002615a:    4620         F      MOV      r0,r4
        0x0002615c:    2800        .(      CMP      r0,#0
        0x0002615e:    d102        ..      BNE      0x26166 ; malloc + 66
        0x00026160:    6828        (h      LDR      r0,[r5,#0]
        0x00026162:    b108        ..      CBZ      r0,0x26168 ; malloc + 68
        0x00026164:    2000        .       MOVS     r0,#0
        0x00026166:    bdf0        ..      POP      {r4-r7,pc}
        0x00026168:    4a06        .J      LDR      r2,[pc,#24] ; [0x26184] = 0x20001598
        0x0002616a:    4807        .H      LDR      r0,[pc,#28] ; [0x26188] = 0x20002314
        0x0002616c:    6010        .`      STR      r0,[r2,#0]
        0x0002616e:    4a07        .J      LDR      r2,[pc,#28] ; [0x2618c] = 0x20002310
        0x00026170:    1a12        ..      SUBS     r2,r2,r0
        0x00026172:    f0220207    "...    BIC      r2,r2,#7
        0x00026176:    e9c02400    ...$    STRD     r2,r4,[r0,#0]
        0x0002617a:    2001        .       MOVS     r0,#1
        0x0002617c:    6028        (`      STR      r0,[r5,#0]
        0x0002617e:    e7d7        ..      B        0x26130 ; malloc + 12
    $d
        0x00026180:    2000159c    ...     DCD    536876444
        0x00026184:    20001598    ...     DCD    536876440
        0x00026188:    20002314    .#.     DCD    536879892
        0x0002618c:    20002310    .#.     DCD    536879888
    $t
    i.round
    round
        0x00026190:    e92d4df0    -..M    PUSH     {r4-r8,r10,r11,lr}
        0x00026194:    4607        .F      MOV      r7,r0
        0x00026196:    460e        .F      MOV      r6,r1
        0x00026198:    f7fef9fe    ....    BL       _drnd ; 0x24598
        0x0002619c:    4604        .F      MOV      r4,r0
        0x0002619e:    460d        .F      MOV      r5,r1
        0x000261a0:    463a        :F      MOV      r2,r7
        0x000261a2:    4633        3F      MOV      r3,r6
        0x000261a4:    f7fef82e    ....    BL       __aeabi_drsub ; 0x24204
        0x000261a8:    f8dfa06c    ..l.    LDR      r10,[pc,#108] ; [0x26218] = 0x3ff00000
        0x000261ac:    f8dfb06c    ..l.    LDR      r11,[pc,#108] ; [0x2621c] = 0x3fe00000
        0x000261b0:    4b1b        .K      LDR      r3,[pc,#108] ; [0x26220] = 0xbfe00000
        0x000261b2:    4607        .F      MOV      r7,r0
        0x000261b4:    4688        .F      MOV      r8,r1
        0x000261b6:    f0164f00    ...O    TST      r6,#0x80000000
        0x000261ba:    f04f0200    O...    MOV      r2,#0
        0x000261be:    d00a        ..      BEQ      0x261d6 ; round + 70
        0x000261c0:    f7fefa2e    ....    BL       __aeabi_cdcmpeq ; 0x24620
        0x000261c4:    d90a        ..      BLS      0x261dc ; round + 76
        0x000261c6:    2200        ."      MOVS     r2,#0
        0x000261c8:    465b        [F      MOV      r3,r11
        0x000261ca:    4638        8F      MOV      r0,r7
        0x000261cc:    4641        AF      MOV      r1,r8
        0x000261ce:    f7fefa3f    ..?.    BL       __aeabi_cdrcmple ; 0x24650
        0x000261d2:    d21b        ..      BCS      0x2620c ; round + 124
        0x000261d4:    e012        ..      B        0x261fc ; round + 108
        0x000261d6:    f7fefa23    ..#.    BL       __aeabi_cdcmpeq ; 0x24620
        0x000261da:    d208        ..      BCS      0x261ee ; round + 94
        0x000261dc:    2200        ."      MOVS     r2,#0
        0x000261de:    4653        SF      MOV      r3,r10
        0x000261e0:    4620         F      MOV      r0,r4
        0x000261e2:    4629        )F      MOV      r1,r5
        0x000261e4:    f7fef80b    ....    BL       __aeabi_dsub ; 0x241fe
        0x000261e8:    4604        .F      MOV      r4,r0
        0x000261ea:    460d        .F      MOV      r5,r1
        0x000261ec:    e00e        ..      B        0x2620c ; round + 124
        0x000261ee:    2200        ."      MOVS     r2,#0
        0x000261f0:    465b        [F      MOV      r3,r11
        0x000261f2:    4638        8F      MOV      r0,r7
        0x000261f4:    4641        AF      MOV      r1,r8
        0x000261f6:    f7fefa2b    ..+.    BL       __aeabi_cdrcmple ; 0x24650
        0x000261fa:    d807        ..      BHI      0x2620c ; round + 124
        0x000261fc:    2200        ."      MOVS     r2,#0
        0x000261fe:    4653        SF      MOV      r3,r10
        0x00026200:    4620         F      MOV      r0,r4
        0x00026202:    4629        )F      MOV      r1,r5
        0x00026204:    f7fdff5a    ..Z.    BL       __aeabi_dadd ; 0x240bc
        0x00026208:    4604        .F      MOV      r4,r0
        0x0002620a:    460d        .F      MOV      r5,r1
        0x0002620c:    4631        1F      MOV      r1,r6
        0x0002620e:    4620         F      MOV      r0,r4
        0x00026210:    f365011e    e...    BFI      r1,r5,#0,#31
        0x00026214:    e8bd8df0    ....    POP      {r4-r8,r10,r11,pc}
    $d
        0x00026218:    3ff00000    ...?    DCD    1072693248
        0x0002621c:    3fe00000    ...?    DCD    1071644672
        0x00026220:    bfe00000    ....    DCD    3219128320
    $d.realdata
    adv_data
        0x00026224:    11060102    ....    DCD    285606146
        0x00026228:    6e656809    .hen    DCD    1852139529
        0x0002622c:    61696467    gdia    DCD    1634296935
        0x00026230:    72705f6e    n_pr    DCD    1919967086
        0x00026234:    63656a6f    ojec    DCD    1667590767
        0x00026238:    0074        t.      DCW    116
    adv_sets_en
        0x0002623a:    0000        ..      DCW    0
        0x0002623c:    00000000    ....    DCD    0
    driver
        0x00026240:    00025b99    .[..    DCD    154521
        0x00026244:    00025c79    y\..    DCD    154745
        0x00026248:    00025c91    .\..    DCD    154769
        0x0002624c:    00025c59    Y\..    DCD    154713
        0x00026250:    000258b5    .X..    DCD    153781
        0x00026254:    000256ad    .V..    DCD    153261
        0x00026258:    00025739    9W..    DCD    153401
        0x0002625c:    000256dd    .V..    DCD    153309
        0x00026260:    000250f9    .P..    DCD    151801
        0x00026264:    00025111    .Q..    DCD    151825
        0x00026268:    00025109    .Q..    DCD    151817
        0x0002626c:    00026125    %a..    DCD    155941
        0x00026270:    000260d5    .`..    DCD    155861
        0x00026274:    0002511d    .Q..    DCD    151837
        0x00026278:    00025619    .V..    DCD    153113
        0x0002627c:    00025635    5V..    DCD    153141
        0x00026280:    000258fd    .X..    DCD    153853
        0x00026284:    000258b1    .X..    DCD    153777
        0x00026288:    0002569d    .V..    DCD    153245
    profile_data
        0x0002628c:    0002000a    ....    DCD    131082
        0x00026290:    28000001    ...(    DCD    671088641
        0x00026294:    000d1800    ....    DCD    858112
        0x00026298:    00020002    ....    DCD    131074
        0x0002629c:    03022803    .(..    DCD    50472963
        0x000262a0:    082a0000    ..*.    DCD    136970240
        0x000262a4:    03000200    ....    DCD    50332160
        0x000262a8:    0d2a0000    ..*.    DCD    220856320
        0x000262ac:    04000200    ....    DCD    67109376
        0x000262b0:    02280300    ..(.    DCD    36176640
        0x000262b4:    2a010005    ...*    DCD    704708613
        0x000262b8:    00020008    ....    DCD    131080
        0x000262bc:    2a010005    ...*    DCD    704708613
        0x000262c0:    00020018    ....    DCD    131096
        0x000262c4:    28000006    ...(    DCD    671088646
        0x000262c8:    6f501485    ..Po    DCD    1867519109
        0x000262cc:    b4d1fdfb    ....    DCD    3033660923
        0x000262d0:    a1d44874    tH..    DCD    2715043956
        0x000262d4:    2445314a    J1E$    DCD    608514378
        0x000262d8:    0002001b    ....    DCD    131099
        0x000262dc:    28030007    ...(    DCD    671285255
        0x000262e0:    67000806    ...g    DCD    1728055302
        0x000262e4:    64ceb3ff    ...d    DCD    1691268095
        0x000262e8:    4d9035ce    .5.M    DCD    1301296590
        0x000262ec:    f1399a41    A.9.    DCD    4047084097
        0x000262f0:    16bf83f3    ....    DCD    381649907
        0x000262f4:    08030600    ....    DCD    134415872
        0x000262f8:    b3ff6700    .g..    DCD    3019859712
        0x000262fc:    35ce64ce    .d.5    DCD    902718670
        0x00026300:    9a414d90    .MA.    DCD    2587970960
        0x00026304:    83f3f139    9...    DCD    2213802297
        0x00026308:    02001bbf    ....    DCD    33561535
        0x0002630c:    03000900    ....    DCD    50333952
        0x00026310:    000a1028    (...    DCD    659496
        0x00026314:    ceb3ff67    g...    DCD    3467902823
        0x00026318:    9035ce64    d.5.    DCD    2419445348
        0x0002631c:    399a414d    MA.9    DCD    966410573
        0x00026320:    bf83f3f2    ....    DCD    3213095922
        0x00026324:    02100016    ....    DCD    34603030
        0x00026328:    ff67000a    ..g.    DCD    4284940298
        0x0002632c:    ce64ceb3    ..d.    DCD    3462713011
        0x00026330:    414d9035    5.MA    DCD    1095602229
        0x00026334:    f3f2399a    .9..    DCD    4092737946
        0x00026338:    000abf83    ....    DCD    704387
        0x0002633c:    000b010a    ....    DCD    721162
        0x00026340:    00002902    .)..    DCD    10498
        0x00026344:    0000        ..      DCW    0
    rand_addr
        0x00026346:    d4c3        ..      DCW    54467
        0x00026348:    00ed9a17    ....    DCD    15571479
    scan_data
        0x0002634c:    00          .       DCB    0
    .L.str.1
        0x0002634d:    736574      set     DCB    115,101,116
        0x00026350:    64207075    up d    DCD    1679847541
        0x00026354:    2e656e6f    one.    DCD    778399343
        0x00026358:    000a        ..      DCW    10
    .L.str.2
        0x0002635a:    4148        HA      DCW    16712
        0x0002635c:    41464452    RDFA    DCD    1095124050
        0x00026360:    3a544c55    ULT:    DCD    978603093
        0x00026364:    2043500a    .PC     DCD    541282314
        0x00026368:    7830203a    : 0x    DCD    2016419898
        0x0002636c:    58383025    %08X    DCD    1480077349
        0x00026370:    20524c0a    .LR     DCD    542264330
        0x00026374:    7830203a    : 0x    DCD    2016419898
        0x00026378:    58383025    %08X    DCD    1480077349
        0x0002637c:    5253500a    .PSR    DCD    1381191690
        0x00026380:    7830203a    : 0x    DCD    2016419898
        0x00026384:    58383025    %08X    DCD    1480077349
        0x00026388:    2030520a    .R0     DCD    540037642
        0x0002638c:    7830203a    : 0x    DCD    2016419898
        0x00026390:    58383025    %08X    DCD    1480077349
        0x00026394:    2031520a    .R1     DCD    540103178
        0x00026398:    7830203a    : 0x    DCD    2016419898
        0x0002639c:    58383025    %08X    DCD    1480077349
        0x000263a0:    2032520a    .R2     DCD    540168714
        0x000263a4:    7830203a    : 0x    DCD    2016419898
        0x000263a8:    58383025    %08X    DCD    1480077349
        0x000263ac:    2033500a    .P3     DCD    540233738
        0x000263b0:    7830203a    : 0x    DCD    2016419898
        0x000263b4:    58383025    %08X    DCD    1480077349
        0x000263b8:    3231520a    .R12    DCD    842093066
        0x000263bc:    7830203a    : 0x    DCD    2016419898
        0x000263c0:    58383025    %08X    DCD    1480077349
        0x000263c4:    000a        ..      DCW    10
    .L.str.4
        0x000263c6:    4f5b        [O      DCW    20315
        0x000263c8:    205d4d4f    OM]     DCD    542985551
        0x000263cc:    64252040    @ %d    DCD    1680154688
        0x000263d0:    000a        ..      DCW    10
    .L.str.3
        0x000263d2:    415b        [A      DCW    16731
        0x000263d4:    52455353    SSER    DCD    1380275027
        0x000263d8:    4e4f4954    TION    DCD    1313818964
        0x000263dc:    2040205d    ] @     DCD    541073501
        0x000263e0:    253a7325    %s:%    DCD    624587557
        0x000263e4:    0a64        d.      DCW    2660
        0x000263e6:    00          .       DCB    0
    .L.str
        0x000263e7:    75          u       DCB    117
        0x000263e8:    20747261    art     DCD    544502369
        0x000263ec:    25207872    rx %    DCD    622884978
        0x000263f0:    78252078    x %x    DCD    2015699064
        0x000263f4:    0a782520     %x.    DCD    175645984
        0x000263f8:    00          .       DCB    0
    .L.str.3
        0x000263f9:    732025      s %     DCB    115,32,37
        0x000263fc:    78252078    x %x    DCD    2015699064
        0x00026400:    0a20         .      DCW    2592
        0x00026402:    00          .       DCB    0
    .L.str
        0x00026403:    72          r       DCB    114
        0x00026404:    20766365    ecv     DCD    544629605
        0x00026408:    78257830    0x%x    DCD    2015721520
        0x0002640c:    25783020     0x%    DCD    628633632
        0x00026410:    78302078    x 0x    DCD    2016419960
        0x00026414:    0a207825    %x .    DCD    169900069
        0x00026418:    00          .       DCB    0
    .L.str.2
        0x00026419:    617474      att     DCB    97,116,116
        0x0002641c:    746f6e20     not    DCD    1953459744
        0x00026420:    20796669    ify     DCD    544826985
        0x00026424:    6f727265    erro    DCD    1869771365
        0x00026428:    0a212072    r !.    DCD    169943154
        0x0002642c:    00          .       DCB    0
    .L.str.7
        0x0002642d:    415454      ATT     DCB    65,84,84
        0x00026430:    4556455f    _EVE    DCD    1163281759
        0x00026434:    4d5f544e    NT_M    DCD    1298093134
        0x00026438:    75205554    TU u    DCD    1965053268
        0x0002643c:    74616470    pdat    DCD    1952539760
        0x00026440:    203a6465    ed:     DCD    540697701
        0x00026444:    000a6425    %d..    DCD    680997
    .L.str.1
        0x00026448:    646e6573    send    DCD    1684956531
        0x0002644c:    25783020     0x%    DCD    628633632
        0x00026450:    78302078    x 0x    DCD    2016419960
        0x00026454:    30207825    %x 0    DCD    807434277
        0x00026458:    20782578    x%x     DCD    544744824
        0x0002645c:    78257830    0x%x    DCD    2015721520
        0x00026460:    0a642520     %d.    DCD    174335264
        0x00026464:    00          .       DCB    0
    .L.str.4
        0x00026465:    736574      set     DCB    115,101,116
        0x00026468:    70207075    up p    DCD    1881174133
        0x0002646c:    69666f72    rofi    DCD    1768320882
        0x00026470:    000a656c    le..    DCD    681324
    .L.str.5
        0x00026474:    4e4e4f43    CONN    DCD    1313754947
        0x00026478:    64707520     upd    DCD    1685091616
        0x0002647c:    64657461    ated    DCD    1684370529
        0x00026480:    6425203a    : %d    DCD    1680154682
        0x00026484:    6e69202c    , in    DCD    1852383276
        0x00026488:    76726574    terv    DCD    1987208564
        0x0002648c:    25206c61    al %    DCD    622881889
        0x00026490:    2066322e    .2f     DCD    543568430
        0x00026494:    000a736d    ms..    DCD    684909
    .L.str.8
        0x00026498:    6465656e    need    DCD    1684366702
        0x0002649c:    65737520     use    DCD    1702065440
        0x000264a0:    6d692072    r im    DCD    1835606130
        0x000264a4:    6d656c70    plem    DCD    1835363440
        0x000264a8:    61746e65    enta    DCD    1635020389
        0x000264ac:    6e6f6974    tion    DCD    1852795252
        0x000264b0:    2e2e2e2e    ....    DCD    774778414
        0x000264b4:    2e2e        ..      DCW    11822
        0x000264b6:    00          .       DCB    0
    .L.str.6
        0x000264b7:    44          D       DCB    68
        0x000264b8:    6f637369    isco    DCD    1868788585
        0x000264bc:    63656e6e    nnec    DCD    1667591790
        0x000264c0:    2e646574    ted.    DCD    778331508
        0x000264c4:    2e2e        ..      DCW    11822
        0x000264c6:    00          .       DCB    0
    .L.str
        0x000264c7:    6e          n       DCB    110
        0x000264c8:    5f736f6f    oos_    DCD    1601400687
        0x000264cc:    6c706d69    impl    DCD    1819307369
        0x000264d0:    632e        .c      DCW    25390
        0x000264d2:    00          .       DCB    0
    .L.str
        0x000264d3:    53          S       DCB    83
        0x000264d4:    20434e59    YNC     DCD    541281881
        0x000264d8:    20444d43    CMD     DCD    541347139
        0x000264dc:    253a4d28    (M:%    DCD    624577832
        0x000264e0:    2c646c6c    lld,    DCD    744778860
        0x000264e4:    253a5320     S:%    DCD    624579360
        0x000264e8:    29646c6c    lld)    DCD    694447212
        0x000264ec:    64207375    us d    DCD    1679848309
        0x000264f0:    74666972    rift    DCD    1952868722
        0x000264f4:    2e30253a    :%0.    DCD    774907194
        0x000264f8:    0a206632    2f .    DCD    169895474
        0x000264fc:    00000000    ....    DCD    0
    Region$$Table$$Base
        0x00026500:    00026520     e..    DCD    156960
        0x00026504:    20001598    ...     DCD    536876440
        0x00026508:    000000b0    ....    DCD    176
        0x0002650c:    000260b6    .`..    DCD    155830
        0x00026510:    000265d0    .e..    DCD    157136
        0x00026514:    20001648    H..     DCD    536876616
        0x00026518:    000010c8    ....    DCD    4296
        0x0002651c:    000260c6    .`..    DCD    155846
    Region$$Table$$Limit

** Section #2 'RW_IRAM1' (SHT_PROGBITS) [SHF_ALLOC + SHF_WRITE]
    Size   : 176 bytes (alignment 8)
    Address: 0x20001598


** Section #3 'RW_IRAM1' (SHT_NOBITS) [SHF_ALLOC + SHF_WRITE]
    Size   : 4296 bytes (alignment 8)
    Address: 0x20001648


** Section #4 '.debug_abbrev' (SHT_PROGBITS)
    Size   : 3103 bytes


** Section #5 '.debug_frame' (SHT_PROGBITS)
    Size   : 4936 bytes


** Section #6 '.debug_info' (SHT_PROGBITS)
    Size   : 15934 bytes


** Section #7 '.debug_line' (SHT_PROGBITS)
    Size   : 11481 bytes


** Section #8 '.debug_str' (SHT_PROGBITS)
    Size   : 14430 bytes


** Section #9 '.debug_ranges' (SHT_PROGBITS)
    Size   : 1392 bytes


** Section #10 '.symtab' (SHT_SYMTAB)
    Size   : 9392 bytes (alignment 4)
    String table #11 '.strtab'
    Last local symbol no. 208


** Section #11 '.strtab' (SHT_STRTAB)
    Size   : 11456 bytes


** Section #12 '.note' (SHT_NOTE)
    Size   : 28 bytes (alignment 4)


** Section #13 '.comment' (SHT_PROGBITS)
    Size   : 1340 bytes


** Section #14 '.shstrtab' (SHT_STRTAB)
    Size   : 136 bytes


