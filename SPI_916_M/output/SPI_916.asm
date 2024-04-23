
========================================================================

** ELF Header Information

    File Name: C:\ING_SDK\app\SPI_916_M\output\SPI_916.axf

    Machine class: ELFCLASS32 (32-bit)
    Data encoding: ELFDATA2LSB (Little endian)
    Header version: EV_CURRENT (Current version)
    Operating System ABI: none
    ABI Version: 0
    File Type: ET_EXEC (Executable) (2)
    Machine: EM_ARM (ARM)

    Image Entry point: 0x02028009
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

    Program header offset: 131272 (0x000200c8)
    Section header offset: 131304 (0x000200e8)

    Section header string table index: 14

========================================================================

** Program header #0 (PT_LOAD) [PF_X + PF_W + PF_R + PF_ARM_ENTRY]
    Size : 13588 bytes (12344 bytes in file)
    Virtual address: 0x02028000 (Alignment 8)


========================================================================

** Section #1 'ER_IROM1' (SHT_PROGBITS) [SHF_ALLOC + SHF_EXECINSTR]
    Size   : 12336 bytes (alignment 4)
    Address: 0x02028000

    $d.realdata
    RESET
    __Vectors
        0x02028000:    00000000    ....    DCD    0
        0x02028004:    0202801d    ....    DCD    33718301
    $t
    .ARM.Collect$$$$00000000
    .ARM.Collect$$$$00000001
    __main
    _main_stk
        0x02028008:    f8dfd00c    ....    LDR      sp,__lit__00000000 ; [0x2028018] = 0x20005a0c
    .ARM.Collect$$$$00000004
    _main_scatterload
        0x0202800c:    f000f812    ....    BL       __scatterload ; 0x2028034
    .ARM.Collect$$$$00000008
    .ARM.Collect$$$$0000000A
    .ARM.Collect$$$$0000000B
    __main_after_scatterload
    _main_clock
    _main_cpp_init
    _main_init
        0x02028010:    4800        .H      LDR      r0,[pc,#0] ; [0x2028014] = 0x2028025
        0x02028012:    4700        .G      BX       r0
    $d
        0x02028014:    02028025    %...    DCD    33718309
    .ARM.Collect$$$$00002712
    __lit__00000000
    .ARM.Collect$$$$0000000D
    .ARM.Collect$$$$0000000F
    __rt_final_cpp
    __rt_final_exit
        0x02028018:    20005a0c    .Z.     DCD    536893964
    $t
    .text
    Reset_Handler
        0x0202801c:    b502        ..      PUSH     {r1,lr}
        0x0202801e:    4803        .H      LDR      r0,[pc,#12] ; [0x202802c] = 0x2028035
        0x02028020:    4700        .G      BX       r0
    $d
        0x02028022:    0000        ..      DCW    0
    $t
    main
        0x02028024:    4802        .H      LDR      r0,[pc,#8] ; [0x2028030] = 0x2029b11
        0x02028026:    4780        .G      BLX      r0
        0x02028028:    bd02        ..      POP      {r1,pc}
    $d
        0x0202802a:    0000        ..      DCW    0
        0x0202802c:    02028035    5...    DCD    33718325
        0x02028030:    02029b11    ....    DCD    33725201
    $t
    .text
    __scatterload
    __scatterload_rt2
        0x02028034:    4c06        .L      LDR      r4,[pc,#24] ; [0x2028050] = 0x202b010
        0x02028036:    4d07        .M      LDR      r5,[pc,#28] ; [0x2028054] = 0x202b030
        0x02028038:    e006        ..      B        0x2028048 ; __scatterload + 20
        0x0202803a:    68e0        .h      LDR      r0,[r4,#0xc]
        0x0202803c:    f0400301    @...    ORR      r3,r0,#1
        0x02028040:    e8940007    ....    LDM      r4,{r0-r2}
        0x02028044:    4798        .G      BLX      r3
        0x02028046:    3410        .4      ADDS     r4,r4,#0x10
        0x02028048:    42ac        .B      CMP      r4,r5
        0x0202804a:    d3f6        ..      BCC      0x202803a ; __scatterload + 6
        0x0202804c:    f7ffffe0    ....    BL       __main_after_scatterload ; 0x2028010
    $d
        0x02028050:    0202b010    ....    DCD    33730576
        0x02028054:    0202b030    0...    DCD    33730608
    $t
    .text
    __aeabi_memcpy
    __aeabi_memcpy4
    __aeabi_memcpy8
        0x02028058:    ea400301    @...    ORR      r3,r0,r1
        0x0202805c:    079b        ..      LSLS     r3,r3,#30
        0x0202805e:    d003        ..      BEQ      0x2028068 ; __aeabi_memcpy + 16
        0x02028060:    e009        ..      B        0x2028076 ; __aeabi_memcpy + 30
        0x02028062:    c908        ..      LDM      r1!,{r3}
        0x02028064:    1f12        ..      SUBS     r2,r2,#4
        0x02028066:    c008        ..      STM      r0!,{r3}
        0x02028068:    2a04        .*      CMP      r2,#4
        0x0202806a:    d2fa        ..      BCS      0x2028062 ; __aeabi_memcpy + 10
        0x0202806c:    e003        ..      B        0x2028076 ; __aeabi_memcpy + 30
        0x0202806e:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x02028072:    f8003b01    ...;    STRB     r3,[r0],#1
        0x02028076:    1e52        R.      SUBS     r2,r2,#1
        0x02028078:    d2f9        ..      BCS      0x202806e ; __aeabi_memcpy + 22
        0x0202807a:    4770        pG      BX       lr
    .text
    __aeabi_memset
    __aeabi_memset4
    __aeabi_memset8
        0x0202807c:    b2d2        ..      UXTB     r2,r2
        0x0202807e:    e001        ..      B        0x2028084 ; __aeabi_memset + 8
        0x02028080:    f8002b01    ...+    STRB     r2,[r0],#1
        0x02028084:    1e49        I.      SUBS     r1,r1,#1
        0x02028086:    d2fb        ..      BCS      0x2028080 ; __aeabi_memset + 4
        0x02028088:    4770        pG      BX       lr
    __aeabi_memclr
    __aeabi_memclr4
    __aeabi_memclr8
        0x0202808a:    2200        ."      MOVS     r2,#0
        0x0202808c:    e7f6        ..      B        __aeabi_memset ; 0x202807c
    _memset$wrapper
        0x0202808e:    b510        ..      PUSH     {r4,lr}
        0x02028090:    4613        .F      MOV      r3,r2
        0x02028092:    460a        .F      MOV      r2,r1
        0x02028094:    4604        .F      MOV      r4,r0
        0x02028096:    4619        .F      MOV      r1,r3
        0x02028098:    f7fffff0    ....    BL       __aeabi_memset ; 0x202807c
        0x0202809c:    4620         F      MOV      r0,r4
        0x0202809e:    bd10        ..      POP      {r4,pc}
    .text
    strcpy
        0x020280a0:    4603        .F      MOV      r3,r0
        0x020280a2:    f8112b01    ...+    LDRB     r2,[r1],#1
        0x020280a6:    f8002b01    ...+    STRB     r2,[r0],#1
        0x020280aa:    2a00        .*      CMP      r2,#0
        0x020280ac:    d1f9        ..      BNE      0x20280a2 ; strcpy + 2
        0x020280ae:    4618        .F      MOV      r0,r3
        0x020280b0:    4770        pG      BX       lr
    .text
    __aeabi_dadd
        0x020280b2:    e92d4ffe    -..O    PUSH     {r1-r11,lr}
        0x020280b6:    4680        .F      MOV      r8,r0
        0x020280b8:    ea810003    ....    EOR      r0,r1,r3
        0x020280bc:    0fc0        ..      LSRS     r0,r0,#31
        0x020280be:    460c        .F      MOV      r4,r1
        0x020280c0:    9000        ..      STR      r0,[sp,#0]
        0x020280c2:    f0214100    !..A    BIC      r1,r1,#0x80000000
        0x020280c6:    f0234500    #..E    BIC      r5,r3,#0x80000000
        0x020280ca:    ebb80002    ....    SUBS     r0,r8,r2
        0x020280ce:    41a9        .A      SBCS     r1,r1,r5
        0x020280d0:    d205        ..      BCS      0x20280de ; __aeabi_dadd + 44
        0x020280d2:    4640        @F      MOV      r0,r8
        0x020280d4:    4621        !F      MOV      r1,r4
        0x020280d6:    4690        .F      MOV      r8,r2
        0x020280d8:    461c        .F      MOV      r4,r3
        0x020280da:    460b        .F      MOV      r3,r1
        0x020280dc:    4602        .F      MOV      r2,r0
        0x020280de:    f0234000    #..@    BIC      r0,r3,#0x80000000
        0x020280e2:    4310        .C      ORRS     r0,r0,r2
        0x020280e4:    d047        G.      BEQ      0x2028176 ; __aeabi_dadd + 196
        0x020280e6:    0d27        '.      LSRS     r7,r4,#20
        0x020280e8:    f3c7000a    ....    UBFX     r0,r7,#0,#11
        0x020280ec:    f3c3510a    ...Q    UBFX     r1,r3,#20,#11
        0x020280f0:    9002        ..      STR      r0,[sp,#8]
        0x020280f2:    1a40        @.      SUBS     r0,r0,r1
        0x020280f4:    9001        ..      STR      r0,[sp,#4]
        0x020280f6:    2840        @(      CMP      r0,#0x40
        0x020280f8:    da6b        k.      BGE      0x20281d2 ; __aeabi_dadd + 288
        0x020280fa:    f3c30013    ....    UBFX     r0,r3,#0,#20
        0x020280fe:    f4401b80    @...    ORR      r11,r0,#0x100000
        0x02028102:    9800        ..      LDR      r0,[sp,#0]
        0x02028104:    4692        .F      MOV      r10,r2
        0x02028106:    b120         .      CBZ      r0,0x2028112 ; __aeabi_dadd + 96
        0x02028108:    2300        .#      MOVS     r3,#0
        0x0202810a:    ebd20a03    ....    RSBS     r10,r2,r3
        0x0202810e:    eb630b0b    c...    SBC      r11,r3,r11
        0x02028112:    9801        ..      LDR      r0,[sp,#4]
        0x02028114:    4659        YF      MOV      r1,r11
        0x02028116:    f1c00240    ..@.    RSB      r2,r0,#0x40
        0x0202811a:    4650        PF      MOV      r0,r10
        0x0202811c:    f000f926    ..&.    BL       __aeabi_llsl ; 0x202836c
        0x02028120:    4606        .F      MOV      r6,r0
        0x02028122:    460d        .F      MOV      r5,r1
        0x02028124:    4650        PF      MOV      r0,r10
        0x02028126:    4659        YF      MOV      r1,r11
        0x02028128:    9a01        ..      LDR      r2,[sp,#4]
        0x0202812a:    f000f92e    ....    BL       __aeabi_lasr ; 0x202838a
        0x0202812e:    eb100008    ....    ADDS     r0,r0,r8
        0x02028132:    4161        aA      ADCS     r1,r1,r4
        0x02028134:    2400        .$      MOVS     r4,#0
        0x02028136:    ea875211    ...R    EOR      r2,r7,r1,LSR #20
        0x0202813a:    ea8473e7    ...s    EOR      r3,r4,r7,ASR #31
        0x0202813e:    431a        .C      ORRS     r2,r2,r3
        0x02028140:    d040        @.      BEQ      0x20281c4 ; __aeabi_dadd + 274
        0x02028142:    9a00        ..      LDR      r2,[sp,#0]
        0x02028144:    b362        b.      CBZ      r2,0x20281a0 ; __aeabi_dadd + 238
        0x02028146:    9a01        ..      LDR      r2,[sp,#4]
        0x02028148:    2a01        .*      CMP      r2,#1
        0x0202814a:    ea4f5207    O..R    LSL      r2,r7,#20
        0x0202814e:    dc15        ..      BGT      0x202817c ; __aeabi_dadd + 202
        0x02028150:    1b00        ..      SUBS     r0,r0,r4
        0x02028152:    eb610102    a...    SBC      r1,r1,r2
        0x02028156:    f04f4200    O..B    MOV      r2,#0x80000000
        0x0202815a:    ea025207    ...R    AND      r2,r2,r7,LSL #20
        0x0202815e:    e9cd4200    ...B    STRD     r4,r2,[sp,#0]
        0x02028162:    1c00        ..      ADDS     r0,r0,#0
        0x02028164:    f5411180    A...    ADC      r1,r1,#0x100000
        0x02028168:    4632        2F      MOV      r2,r6
        0x0202816a:    462b        +F      MOV      r3,r5
        0x0202816c:    f000f92e    ....    BL       _double_epilogue ; 0x20283cc
        0x02028170:    b003        ..      ADD      sp,sp,#0xc
        0x02028172:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x02028176:    4640        @F      MOV      r0,r8
        0x02028178:    4621        !F      MOV      r1,r4
        0x0202817a:    e7f9        ..      B        0x2028170 ; __aeabi_dadd + 190
        0x0202817c:    1b00        ..      SUBS     r0,r0,r4
        0x0202817e:    eb610102    a...    SBC      r1,r1,r2
        0x02028182:    1c00        ..      ADDS     r0,r0,#0
        0x02028184:    f5411380    A...    ADC      r3,r1,#0x100000
        0x02028188:    1800        ..      ADDS     r0,r0,r0
        0x0202818a:    415b        [A      ADCS     r3,r3,r3
        0x0202818c:    1820         .      ADDS     r0,r4,r0
        0x0202818e:    f5a21700    ....    SUB      r7,r2,#0x200000
        0x02028192:    eb470103    G...    ADC      r1,r7,r3
        0x02028196:    ea4070d5    @..p    ORR      r0,r0,r5,LSR #31
        0x0202819a:    19b6        ..      ADDS     r6,r6,r6
        0x0202819c:    416d        mA      ADCS     r5,r5,r5
        0x0202819e:    e011        ..      B        0x20281c4 ; __aeabi_dadd + 274
        0x020281a0:    086d        m.      LSRS     r5,r5,#1
        0x020281a2:    ea4f0636    O.6.    RRX      r6,r6
        0x020281a6:    ea4575c0    E..u    ORR      r5,r5,r0,LSL #31
        0x020281aa:    ea4f5207    O..R    LSL      r2,r7,#20
        0x020281ae:    1b00        ..      SUBS     r0,r0,r4
        0x020281b0:    eb610102    a...    SBC      r1,r1,r2
        0x020281b4:    1c00        ..      ADDS     r0,r0,#0
        0x020281b6:    f5411180    A...    ADC      r1,r1,#0x100000
        0x020281ba:    0849        I.      LSRS     r1,r1,#1
        0x020281bc:    ea4f0030    O.0.    RRX      r0,r0
        0x020281c0:    1900        ..      ADDS     r0,r0,r4
        0x020281c2:    4151        QA      ADCS     r1,r1,r2
        0x020281c4:    4632        2F      MOV      r2,r6
        0x020281c6:    462b        +F      MOV      r3,r5
        0x020281c8:    b003        ..      ADD      sp,sp,#0xc
        0x020281ca:    e8bd4ff0    ...O    POP      {r4-r11,lr}
        0x020281ce:    f000b8ee    ....    B.W      __I$use$fp ; 0x20283ae
        0x020281d2:    9800        ..      LDR      r0,[sp,#0]
        0x020281d4:    2201        ."      MOVS     r2,#1
        0x020281d6:    0040        @.      LSLS     r0,r0,#1
        0x020281d8:    2300        .#      MOVS     r3,#0
        0x020281da:    ebd00202    ....    RSBS     r2,r0,r2
        0x020281de:    eb6373e0    c..s    SBC      r3,r3,r0,ASR #31
        0x020281e2:    9800        ..      LDR      r0,[sp,#0]
        0x020281e4:    4621        !F      MOV      r1,r4
        0x020281e6:    ea4f74e0    O..t    ASR      r4,r0,#31
        0x020281ea:    ebb80000    ....    SUBS     r0,r8,r0
        0x020281ee:    eb610104    a...    SBC      r1,r1,r4
        0x020281f2:    e7e9        ..      B        0x20281c8 ; __aeabi_dadd + 278
    __aeabi_dsub
        0x020281f4:    f0834300    ...C    EOR      r3,r3,#0x80000000
        0x020281f8:    e75b        [.      B        __aeabi_dadd ; 0x20280b2
    __aeabi_drsub
        0x020281fa:    f0814100    ...A    EOR      r1,r1,#0x80000000
        0x020281fe:    e758        X.      B        __aeabi_dadd ; 0x20280b2
    .text
    __aeabi_ddiv
        0x02028200:    e92d4df0    -..M    PUSH     {r4-r8,r10,r11,lr}
        0x02028204:    ea810403    ....    EOR      r4,r1,r3
        0x02028208:    f0044b00    ...K    AND      r11,r4,#0x80000000
        0x0202820c:    f0214500    !..E    BIC      r5,r1,#0x80000000
        0x02028210:    4614        .F      MOV      r4,r2
        0x02028212:    f04f0a00    O...    MOV      r10,#0
        0x02028216:    f0234100    #..A    BIC      r1,r3,#0x80000000
        0x0202821a:    ea500205    P...    ORRS     r2,r0,r5
        0x0202821e:    d020         .      BEQ      0x2028262 ; __aeabi_ddiv + 98
        0x02028220:    ea540201    T...    ORRS     r2,r4,r1
        0x02028224:    d01d        ..      BEQ      0x2028262 ; __aeabi_ddiv + 98
        0x02028226:    f3c5570a    ...W    UBFX     r7,r5,#20,#11
        0x0202822a:    4602        .F      MOV      r2,r0
        0x0202822c:    f3c50313    ....    UBFX     r3,r5,#0,#20
        0x02028230:    f3c10013    ....    UBFX     r0,r1,#0,#20
        0x02028234:    f3c1560a    ...V    UBFX     r6,r1,#20,#11
        0x02028238:    f4401580    @...    ORR      r5,r0,#0x100000
        0x0202823c:    f4431380    C...    ORR      r3,r3,#0x100000
        0x02028240:    eba70806    ....    SUB      r8,r7,r6
        0x02028244:    1b10        ..      SUBS     r0,r2,r4
        0x02028246:    46d6        .F      MOV      lr,r10
        0x02028248:    f20838fd    ...8    ADD      r8,r8,#0x3fd
        0x0202824c:    eb730005    s...    SBCS     r0,r3,r5
        0x02028250:    d302        ..      BCC      0x2028258 ; __aeabi_ddiv + 88
        0x02028252:    f1080801    ....    ADD      r8,r8,#1
        0x02028256:    e001        ..      B        0x202825c ; __aeabi_ddiv + 92
        0x02028258:    1892        ..      ADDS     r2,r2,r2
        0x0202825a:    415b        [A      ADCS     r3,r3,r3
        0x0202825c:    f1b80f00    ....    CMP      r8,#0
        0x02028260:    da03        ..      BGE      0x202826a ; __aeabi_ddiv + 106
        0x02028262:    2000        .       MOVS     r0,#0
        0x02028264:    4601        .F      MOV      r1,r0
        0x02028266:    e8bd8df0    ....    POP      {r4-r8,r10,r11,pc}
        0x0202826a:    2000        .       MOVS     r0,#0
        0x0202826c:    f44f1180    O...    MOV      r1,#0x100000
        0x02028270:    4606        .F      MOV      r6,r0
        0x02028272:    4684        .F      MOV      r12,r0
        0x02028274:    e00e        ..      B        0x2028294 ; __aeabi_ddiv + 148
        0x02028276:    1b17        ..      SUBS     r7,r2,r4
        0x02028278:    eb730705    s...    SBCS     r7,r3,r5
        0x0202827c:    d305        ..      BCC      0x202828a ; __aeabi_ddiv + 138
        0x0202827e:    1b12        ..      SUBS     r2,r2,r4
        0x02028280:    eb630305    c...    SBC      r3,r3,r5
        0x02028284:    4306        .C      ORRS     r6,r6,r0
        0x02028286:    ea4c0c01    L...    ORR      r12,r12,r1
        0x0202828a:    0849        I.      LSRS     r1,r1,#1
        0x0202828c:    ea4f0030    O.0.    RRX      r0,r0
        0x02028290:    1892        ..      ADDS     r2,r2,r2
        0x02028292:    415b        [A      ADCS     r3,r3,r3
        0x02028294:    ea500701    P...    ORRS     r7,r0,r1
        0x02028298:    d1ed        ..      BNE      0x2028276 ; __aeabi_ddiv + 118
        0x0202829a:    ea520003    R...    ORRS     r0,r2,r3
        0x0202829e:    d012        ..      BEQ      0x20282c6 ; __aeabi_ddiv + 198
        0x020282a0:    ea820004    ....    EOR      r0,r2,r4
        0x020282a4:    ea830105    ....    EOR      r1,r3,r5
        0x020282a8:    4308        .C      ORRS     r0,r0,r1
        0x020282aa:    d005        ..      BEQ      0x20282b8 ; __aeabi_ddiv + 184
        0x020282ac:    1b10        ..      SUBS     r0,r2,r4
        0x020282ae:    41ab        .A      SBCS     r3,r3,r5
        0x020282b0:    d206        ..      BCS      0x20282c0 ; __aeabi_ddiv + 192
        0x020282b2:    2201        ."      MOVS     r2,#1
        0x020282b4:    2300        .#      MOVS     r3,#0
        0x020282b6:    e006        ..      B        0x20282c6 ; __aeabi_ddiv + 198
        0x020282b8:    2200        ."      MOVS     r2,#0
        0x020282ba:    f04f4300    O..C    MOV      r3,#0x80000000
        0x020282be:    e002        ..      B        0x20282c6 ; __aeabi_ddiv + 198
        0x020282c0:    f06f0201    o...    MVN      r2,#1
        0x020282c4:    1053        S.      ASRS     r3,r2,#1
        0x020282c6:    eb1a0006    ....    ADDS     r0,r10,r6
        0x020282ca:    eb4c5108    L..Q    ADC      r1,r12,r8,LSL #20
        0x020282ce:    eb10000a    ....    ADDS     r0,r0,r10
        0x020282d2:    eb41010b    A...    ADC      r1,r1,r11
        0x020282d6:    e8bd4df0    ...M    POP      {r4-r8,r10,r11,lr}
        0x020282da:    f000b868    ..h.    B.W      __I$use$fp ; 0x20283ae
    .text
    __aeabi_uidiv
    __aeabi_uidivmod
        0x020282de:    b530        0.      PUSH     {r4,r5,lr}
        0x020282e0:    460b        .F      MOV      r3,r1
        0x020282e2:    4601        .F      MOV      r1,r0
        0x020282e4:    2000        .       MOVS     r0,#0
        0x020282e6:    2220         "      MOVS     r2,#0x20
        0x020282e8:    2401        .$      MOVS     r4,#1
        0x020282ea:    e009        ..      B        0x2028300 ; __aeabi_uidiv + 34
        0x020282ec:    fa21f502    !...    LSR      r5,r1,r2
        0x020282f0:    429d        .B      CMP      r5,r3
        0x020282f2:    d305        ..      BCC      0x2028300 ; __aeabi_uidiv + 34
        0x020282f4:    fa03f502    ....    LSL      r5,r3,r2
        0x020282f8:    1b49        I.      SUBS     r1,r1,r5
        0x020282fa:    fa04f502    ....    LSL      r5,r4,r2
        0x020282fe:    4428        (D      ADD      r0,r0,r5
        0x02028300:    1e15        ..      SUBS     r5,r2,#0
        0x02028302:    f1a20201    ....    SUB      r2,r2,#1
        0x02028306:    dcf1        ..      BGT      0x20282ec ; __aeabi_uidiv + 14
        0x02028308:    bd30        0.      POP      {r4,r5,pc}
    .text
    __aeabi_uldivmod
        0x0202830a:    e92d5ff0    -.._    PUSH     {r4-r12,lr}
        0x0202830e:    4605        .F      MOV      r5,r0
        0x02028310:    2000        .       MOVS     r0,#0
        0x02028312:    4692        .F      MOV      r10,r2
        0x02028314:    469b        .F      MOV      r11,r3
        0x02028316:    4688        .F      MOV      r8,r1
        0x02028318:    4606        .F      MOV      r6,r0
        0x0202831a:    4681        .F      MOV      r9,r0
        0x0202831c:    2440        @$      MOVS     r4,#0x40
        0x0202831e:    e01b        ..      B        0x2028358 ; __aeabi_uldivmod + 78
        0x02028320:    4628        (F      MOV      r0,r5
        0x02028322:    4641        AF      MOV      r1,r8
        0x02028324:    4647        GF      MOV      r7,r8
        0x02028326:    4622        "F      MOV      r2,r4
        0x02028328:    f000f940    ..@.    BL       __aeabi_llsr ; 0x20285ac
        0x0202832c:    4653        SF      MOV      r3,r10
        0x0202832e:    465a        ZF      MOV      r2,r11
        0x02028330:    1ac0        ..      SUBS     r0,r0,r3
        0x02028332:    4191        .A      SBCS     r1,r1,r2
        0x02028334:    d310        ..      BCC      0x2028358 ; __aeabi_uldivmod + 78
        0x02028336:    4611        .F      MOV      r1,r2
        0x02028338:    4618        .F      MOV      r0,r3
        0x0202833a:    4622        "F      MOV      r2,r4
        0x0202833c:    f000f816    ....    BL       __aeabi_llsl ; 0x202836c
        0x02028340:    1a2d        -.      SUBS     r5,r5,r0
        0x02028342:    eb670801    g...    SBC      r8,r7,r1
        0x02028346:    464f        OF      MOV      r7,r9
        0x02028348:    4622        "F      MOV      r2,r4
        0x0202834a:    2001        .       MOVS     r0,#1
        0x0202834c:    2100        .!      MOVS     r1,#0
        0x0202834e:    f000f80d    ....    BL       __aeabi_llsl ; 0x202836c
        0x02028352:    eb170900    ....    ADDS     r9,r7,r0
        0x02028356:    414e        NA      ADCS     r6,r6,r1
        0x02028358:    1e20         .      SUBS     r0,r4,#0
        0x0202835a:    f1a40401    ....    SUB      r4,r4,#1
        0x0202835e:    dcdf        ..      BGT      0x2028320 ; __aeabi_uldivmod + 22
        0x02028360:    4648        HF      MOV      r0,r9
        0x02028362:    4631        1F      MOV      r1,r6
        0x02028364:    462a        *F      MOV      r2,r5
        0x02028366:    4643        CF      MOV      r3,r8
        0x02028368:    e8bd9ff0    ....    POP      {r4-r12,pc}
    .text
    __aeabi_llsl
    _ll_shift_l
        0x0202836c:    2a20         *      CMP      r2,#0x20
        0x0202836e:    db04        ..      BLT      0x202837a ; __aeabi_llsl + 14
        0x02028370:    3a20         :      SUBS     r2,r2,#0x20
        0x02028372:    fa00f102    ....    LSL      r1,r0,r2
        0x02028376:    2000        .       MOVS     r0,#0
        0x02028378:    4770        pG      BX       lr
        0x0202837a:    4091        .@      LSLS     r1,r1,r2
        0x0202837c:    f1c20320    .. .    RSB      r3,r2,#0x20
        0x02028380:    fa20f303     ...    LSR      r3,r0,r3
        0x02028384:    4319        .C      ORRS     r1,r1,r3
        0x02028386:    4090        .@      LSLS     r0,r0,r2
        0x02028388:    4770        pG      BX       lr
    .text
    __aeabi_lasr
    _ll_sshift_r
        0x0202838a:    2a20         *      CMP      r2,#0x20
        0x0202838c:    db06        ..      BLT      0x202839c ; __aeabi_lasr + 18
        0x0202838e:    17cb        ..      ASRS     r3,r1,#31
        0x02028390:    3a20         :      SUBS     r2,r2,#0x20
        0x02028392:    fa41f002    A...    ASR      r0,r1,r2
        0x02028396:    ea4373e0    C..s    ORR      r3,r3,r0,ASR #31
        0x0202839a:    e006        ..      B        0x20283aa ; __aeabi_lasr + 32
        0x0202839c:    fa41f302    A...    ASR      r3,r1,r2
        0x020283a0:    40d0        .@      LSRS     r0,r0,r2
        0x020283a2:    f1c20220    .. .    RSB      r2,r2,#0x20
        0x020283a6:    4091        .@      LSLS     r1,r1,r2
        0x020283a8:    4308        .C      ORRS     r0,r0,r1
        0x020283aa:    4619        .F      MOV      r1,r3
        0x020283ac:    4770        pG      BX       lr
    .text
    .text
    __I$use$fp
    _double_round
        0x020283ae:    b510        ..      PUSH     {r4,lr}
        0x020283b0:    1e14        ..      SUBS     r4,r2,#0
        0x020283b2:    f1730400    s...    SBCS     r4,r3,#0
        0x020283b6:    da08        ..      BGE      0x20283ca ; __I$use$fp + 28
        0x020283b8:    1c40        @.      ADDS     r0,r0,#1
        0x020283ba:    f1410100    A...    ADC      r1,r1,#0
        0x020283be:    1892        ..      ADDS     r2,r2,r2
        0x020283c0:    415b        [A      ADCS     r3,r3,r3
        0x020283c2:    431a        .C      ORRS     r2,r2,r3
        0x020283c4:    d101        ..      BNE      0x20283ca ; __I$use$fp + 28
        0x020283c6:    f0200001     ...    BIC      r0,r0,#1
        0x020283ca:    bd10        ..      POP      {r4,pc}
    _double_epilogue
        0x020283cc:    e92d4df0    -..M    PUSH     {r4-r8,r10,r11,lr}
        0x020283d0:    4692        .F      MOV      r10,r2
        0x020283d2:    469b        .F      MOV      r11,r3
        0x020283d4:    b111        ..      CBZ      r1,0x20283dc ; _double_epilogue + 16
        0x020283d6:    fab1f281    ....    CLZ      r2,r1
        0x020283da:    e002        ..      B        0x20283e2 ; _double_epilogue + 22
        0x020283dc:    fab0f280    ....    CLZ      r2,r0
        0x020283e0:    3220         2      ADDS     r2,r2,#0x20
        0x020283e2:    4690        .F      MOV      r8,r2
        0x020283e4:    f7ffffc2    ....    BL       __aeabi_llsl ; 0x202836c
        0x020283e8:    4604        .F      MOV      r4,r0
        0x020283ea:    460f        .F      MOV      r7,r1
        0x020283ec:    ea40000a    @...    ORR      r0,r0,r10
        0x020283f0:    ea41010b    A...    ORR      r1,r1,r11
        0x020283f4:    4653        SF      MOV      r3,r10
        0x020283f6:    465a        ZF      MOV      r2,r11
        0x020283f8:    4308        .C      ORRS     r0,r0,r1
        0x020283fa:    d013        ..      BEQ      0x2028424 ; _double_epilogue + 88
        0x020283fc:    4611        .F      MOV      r1,r2
        0x020283fe:    ea530001    S...    ORRS     r0,r3,r1
        0x02028402:    d019        ..      BEQ      0x2028438 ; _double_epilogue + 108
        0x02028404:    f1c80240    ..@.    RSB      r2,r8,#0x40
        0x02028408:    4650        PF      MOV      r0,r10
        0x0202840a:    f000f8cf    ....    BL       __aeabi_llsr ; 0x20285ac
        0x0202840e:    4605        .F      MOV      r5,r0
        0x02028410:    460e        .F      MOV      r6,r1
        0x02028412:    4650        PF      MOV      r0,r10
        0x02028414:    4659        YF      MOV      r1,r11
        0x02028416:    4642        BF      MOV      r2,r8
        0x02028418:    f7ffffa8    ....    BL       __aeabi_llsl ; 0x202836c
        0x0202841c:    4308        .C      ORRS     r0,r0,r1
        0x0202841e:    d005        ..      BEQ      0x202842c ; _double_epilogue + 96
        0x02028420:    2001        .       MOVS     r0,#1
        0x02028422:    e004        ..      B        0x202842e ; _double_epilogue + 98
        0x02028424:    4620         F      MOV      r0,r4
        0x02028426:    4639        9F      MOV      r1,r7
        0x02028428:    e8bd8df0    ....    POP      {r4-r8,r10,r11,pc}
        0x0202842c:    2000        .       MOVS     r0,#0
        0x0202842e:    4305        .C      ORRS     r5,r5,r0
        0x02028430:    ea4676e0    F..v    ORR      r6,r6,r0,ASR #31
        0x02028434:    432c        ,C      ORRS     r4,r4,r5
        0x02028436:    4337        7C      ORRS     r7,r7,r6
        0x02028438:    980a        ..      LDR      r0,[sp,#0x28]
        0x0202843a:    0563        c.      LSLS     r3,r4,#21
        0x0202843c:    0ae4        ..      LSRS     r4,r4,#11
        0x0202843e:    eba00008    ....    SUB      r0,r0,r8
        0x02028442:    2200        ."      MOVS     r2,#0
        0x02028444:    0afd        ..      LSRS     r5,r7,#11
        0x02028446:    ea445447    D.GT    ORR      r4,r4,r7,LSL #21
        0x0202844a:    300a        .0      ADDS     r0,r0,#0xa
        0x0202844c:    d502        ..      BPL      0x2028454 ; _double_epilogue + 136
        0x0202844e:    2000        .       MOVS     r0,#0
        0x02028450:    4601        .F      MOV      r1,r0
        0x02028452:    e7e9        ..      B        0x2028428 ; _double_epilogue + 92
        0x02028454:    0501        ..      LSLS     r1,r0,#20
        0x02028456:    1910        ..      ADDS     r0,r2,r4
        0x02028458:    4169        iA      ADCS     r1,r1,r5
        0x0202845a:    e9dd4508    ...E    LDRD     r4,r5,[sp,#0x20]
        0x0202845e:    1900        ..      ADDS     r0,r0,r4
        0x02028460:    4169        iA      ADCS     r1,r1,r5
        0x02028462:    e8bd4df0    ...M    POP      {r4-r8,r10,r11,lr}
        0x02028466:    e7a2        ..      B        __I$use$fp ; 0x20283ae
    .text
    __aeabi_dmul
        0x02028468:    e92d4ffe    -..O    PUSH     {r1-r11,lr}
        0x0202846c:    ea810403    ....    EOR      r4,r1,r3
        0x02028470:    f0044400    ...D    AND      r4,r4,#0x80000000
        0x02028474:    f0214100    !..A    BIC      r1,r1,#0x80000000
        0x02028478:    9400        ..      STR      r4,[sp,#0]
        0x0202847a:    f04f0b00    O...    MOV      r11,#0
        0x0202847e:    f0234300    #..C    BIC      r3,r3,#0x80000000
        0x02028482:    ea500401    P...    ORRS     r4,r0,r1
        0x02028486:    d05e        ^.      BEQ      0x2028546 ; __aeabi_dmul + 222
        0x02028488:    ea520403    R...    ORRS     r4,r2,r3
        0x0202848c:    d05b        [.      BEQ      0x2028546 ; __aeabi_dmul + 222
        0x0202848e:    f3c3540a    ...T    UBFX     r4,r3,#20,#11
        0x02028492:    f3c1550a    ...U    UBFX     r5,r1,#20,#11
        0x02028496:    442c        ,D      ADD      r4,r4,r5
        0x02028498:    f2a434f3    ...4    SUB      r4,r4,#0x3f3
        0x0202849c:    9401        ..      STR      r4,[sp,#4]
        0x0202849e:    fba05402    ...T    UMULL    r5,r4,r0,r2
        0x020284a2:    f3c10113    ....    UBFX     r1,r1,#0,#20
        0x020284a6:    f4411180    A...    ORR      r1,r1,#0x100000
        0x020284aa:    f3c30313    ....    UBFX     r3,r3,#0,#20
        0x020284ae:    f4431380    C...    ORR      r3,r3,#0x100000
        0x020284b2:    fb014402    ...D    MLA      r4,r1,r2,r4
        0x020284b6:    fb004e03    ...N    MLA      lr,r0,r3,r4
        0x020284ba:    0a84        ..      LSRS     r4,r0,#10
        0x020284bc:    0a97        ..      LSRS     r7,r2,#10
        0x020284be:    ea445481    D..T    ORR      r4,r4,r1,LSL #22
        0x020284c2:    ea475783    G..W    ORR      r7,r7,r3,LSL #22
        0x020284c6:    fba46807    ...h    UMULL    r6,r8,r4,r7
        0x020284ca:    9502        ..      STR      r5,[sp,#8]
        0x020284cc:    0a8d        ..      LSRS     r5,r1,#10
        0x020284ce:    fb058507    ....    MLA      r5,r5,r7,r8
        0x020284d2:    ea4f2c93    O..,    LSR      r12,r3,#10
        0x020284d6:    fb04540c    ...T    MLA      r4,r4,r12,r5
        0x020284da:    0527        '.      LSLS     r7,r4,#20
        0x020284dc:    9d02        ..      LDR      r5,[sp,#8]
        0x020284de:    ea4f5806    O..X    LSL      r8,r6,#20
        0x020284e2:    ea473716    G..7    ORR      r7,r7,r6,LSR #12
        0x020284e6:    ebb50508    ....    SUBS     r5,r5,r8
        0x020284ea:    eb6e0c07    n...    SBC      r12,lr,r7
        0x020284ee:    0e87        ..      LSRS     r7,r0,#26
        0x020284f0:    0e92        ..      LSRS     r2,r2,#26
        0x020284f2:    ea471781    G...    ORR      r7,r7,r1,LSL #6
        0x020284f6:    ea421283    B...    ORR      r2,r2,r3,LSL #6
        0x020284fa:    fba70102    ....    UMULL    r0,r1,r7,r2
        0x020284fe:    ebb6010b    ....    SUBS     r1,r6,r11
        0x02028502:    eb640400    d...    SBC      r4,r4,r0
        0x02028506:    0d2b        +.      LSRS     r3,r5,#20
        0x02028508:    ea43330c    C..3    ORR      r3,r3,r12,LSL #12
        0x0202850c:    185e        ^.      ADDS     r6,r3,r1
        0x0202850e:    eb44501c    D..P    ADC      r0,r4,r12,LSR #20
        0x02028512:    46da        .F      MOV      r10,r11
        0x02028514:    4651        QF      MOV      r1,r10
        0x02028516:    fbe70102    ....    UMLAL    r0,r1,r7,r2
        0x0202851a:    f3c50413    ....    UBFX     r4,r5,#0,#20
        0x0202851e:    ea4f330b    O..3    LSL      r3,r11,#12
        0x02028522:    ea435314    C..S    ORR      r3,r3,r4,LSR #20
        0x02028526:    ea4f3204    O..2    LSL      r2,r4,#12
        0x0202852a:    9c01        ..      LDR      r4,[sp,#4]
        0x0202852c:    ea430306    C...    ORR      r3,r3,r6
        0x02028530:    f1a4040c    ....    SUB      r4,r4,#0xc
        0x02028534:    9402        ..      STR      r4,[sp,#8]
        0x02028536:    9c00        ..      LDR      r4,[sp,#0]
        0x02028538:    e9cdb400    ....    STRD     r11,r4,[sp,#0]
        0x0202853c:    f7ffff46    ..F.    BL       _double_epilogue ; 0x20283cc
        0x02028540:    b003        ..      ADD      sp,sp,#0xc
        0x02028542:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x02028546:    2000        .       MOVS     r0,#0
        0x02028548:    4601        .F      MOV      r1,r0
        0x0202854a:    e7f9        ..      B        0x2028540 ; __aeabi_dmul + 216
    .text
    __aeabi_d2ulz
        0x0202854c:    f3c1520a    ...R    UBFX     r2,r1,#20,#11
        0x02028550:    f3c10113    ....    UBFX     r1,r1,#0,#20
        0x02028554:    f24033ff    @..3    MOV      r3,#0x3ff
        0x02028558:    f4411180    A...    ORR      r1,r1,#0x100000
        0x0202855c:    429a        .B      CMP      r2,r3
        0x0202855e:    da02        ..      BGE      0x2028566 ; __aeabi_d2ulz + 26
        0x02028560:    2000        .       MOVS     r0,#0
        0x02028562:    4601        .F      MOV      r1,r0
        0x02028564:    4770        pG      BX       lr
        0x02028566:    f2404333    @.3C    MOV      r3,#0x433
        0x0202856a:    429a        .B      CMP      r2,r3
        0x0202856c:    f2a24233    ..3B    SUB      r2,r2,#0x433
        0x02028570:    dc02        ..      BGT      0x2028578 ; __aeabi_d2ulz + 44
        0x02028572:    4252        RB      RSBS     r2,r2,#0
        0x02028574:    f000b81a    ....    B.W      __aeabi_llsr ; 0x20285ac
        0x02028578:    f7ffbef8    ....    B.W      __aeabi_llsl ; 0x202836c
    .text
    __aeabi_cdrcmple
        0x0202857c:    b530        0.      PUSH     {r4,r5,lr}
        0x0202857e:    1e04        ..      SUBS     r4,r0,#0
        0x02028580:    f1710400    q...    SBCS     r4,r1,#0
        0x02028584:    db04        ..      BLT      0x2028590 ; __aeabi_cdrcmple + 20
        0x02028586:    f04f4400    O..D    MOV      r4,#0x80000000
        0x0202858a:    4240        @B      RSBS     r0,r0,#0
        0x0202858c:    eb640101    d...    SBC      r1,r4,r1
        0x02028590:    1e14        ..      SUBS     r4,r2,#0
        0x02028592:    f1730400    s...    SBCS     r4,r3,#0
        0x02028596:    db05        ..      BLT      0x20285a4 ; __aeabi_cdrcmple + 40
        0x02028598:    461c        .F      MOV      r4,r3
        0x0202859a:    f04f4300    O..C    MOV      r3,#0x80000000
        0x0202859e:    4252        RB      RSBS     r2,r2,#0
        0x020285a0:    eb630304    c...    SBC      r3,r3,r4
        0x020285a4:    4299        .B      CMP      r1,r3
        0x020285a6:    bf08        ..      IT       EQ
        0x020285a8:    4290        .B      CMPEQ    r0,r2
        0x020285aa:    bd30        0.      POP      {r4,r5,pc}
    .text
    __aeabi_llsr
    _ll_ushift_r
        0x020285ac:    2a20         *      CMP      r2,#0x20
        0x020285ae:    db04        ..      BLT      0x20285ba ; __aeabi_llsr + 14
        0x020285b0:    3a20         :      SUBS     r2,r2,#0x20
        0x020285b2:    fa21f002    !...    LSR      r0,r1,r2
        0x020285b6:    2100        .!      MOVS     r1,#0
        0x020285b8:    4770        pG      BX       lr
        0x020285ba:    fa21f302    !...    LSR      r3,r1,r2
        0x020285be:    40d0        .@      LSRS     r0,r0,r2
        0x020285c0:    f1c20220    .. .    RSB      r2,r2,#0x20
        0x020285c4:    4091        .@      LSLS     r1,r1,r2
        0x020285c6:    4308        .C      ORRS     r0,r0,r1
        0x020285c8:    4619        .F      MOV      r1,r3
        0x020285ca:    4770        pG      BX       lr
    $t.11
    DMA_EnableChannel
        0x020285cc:    b5f0        ..      PUSH     {r4-r7,lr}
        0x020285ce:    b083        ..      SUB      sp,sp,#0xc
        0x020285d0:    9002        ..      STR      r0,[sp,#8]
        0x020285d2:    9101        ..      STR      r1,[sp,#4]
        0x020285d4:    9801        ..      LDR      r0,[sp,#4]
        0x020285d6:    6800        .h      LDR      r0,[r0,#0]
        0x020285d8:    9000        ..      STR      r0,[sp,#0]
        0x020285da:    9901        ..      LDR      r1,[sp,#4]
        0x020285dc:    6808        .h      LDR      r0,[r1,#0]
        0x020285de:    f0200001     ...    BIC      r0,r0,#1
        0x020285e2:    6008        .`      STR      r0,[r1,#0]
        0x020285e4:    9802        ..      LDR      r0,[sp,#8]
        0x020285e6:    f24c0140    L.@.    MOV      r1,#0xc040
        0x020285ea:    f2c40100    ....    MOVT     r1,#0x4000
        0x020285ee:    eb011240    ..@.    ADD      r2,r1,r0,LSL #5
        0x020285f2:    0147        G.      LSLS     r7,r0,#5
        0x020285f4:    9801        ..      LDR      r0,[sp,#4]
        0x020285f6:    6904        .i      LDR      r4,[r0,#0x10]
        0x020285f8:    6945        Ei      LDR      r5,[r0,#0x14]
        0x020285fa:    6806        .h      LDR      r6,[r0,#0]
        0x020285fc:    6843        Ch      LDR      r3,[r0,#4]
        0x020285fe:    f8d0c008    ....    LDR      r12,[r0,#8]
        0x02028602:    f8d0e00c    ....    LDR      lr,[r0,#0xc]
        0x02028606:    51ce        .Q      STR      r6,[r1,r7]
        0x02028608:    6155        Ua      STR      r5,[r2,#0x14]
        0x0202860a:    6114        .a      STR      r4,[r2,#0x10]
        0x0202860c:    f8c2e00c    ....    STR      lr,[r2,#0xc]
        0x02028610:    f8c2c008    ....    STR      r12,[r2,#8]
        0x02028614:    6053        S`      STR      r3,[r2,#4]
        0x02028616:    6980        .i      LDR      r0,[r0,#0x18]
        0x02028618:    6190        .a      STR      r0,[r2,#0x18]
        0x0202861a:    9800        ..      LDR      r0,[sp,#0]
        0x0202861c:    9a01        ..      LDR      r2,[sp,#4]
        0x0202861e:    6010        .`      STR      r0,[r2,#0]
        0x02028620:    9802        ..      LDR      r0,[sp,#8]
        0x02028622:    0142        B.      LSLS     r2,r0,#5
        0x02028624:    5888        .X      LDR      r0,[r1,r2]
        0x02028626:    f0400001    @...    ORR      r0,r0,#1
        0x0202862a:    5088        .P      STR      r0,[r1,r2]
        0x0202862c:    b003        ..      ADD      sp,sp,#0xc
        0x0202862e:    bdf0        ..      POP      {r4-r7,pc}
    DMA_GetPeripheralDataAddr
        0x02028630:    b083        ..      SUB      sp,sp,#0xc
        0x02028632:    f88d0007    ....    STRB     r0,[sp,#7]
        0x02028636:    f89d0007    ....    LDRB     r0,[sp,#7]
        0x0202863a:    4601        .F      MOV      r1,r0
        0x0202863c:    9100        ..      STR      r1,[sp,#0]
        0x0202863e:    281a        .(      CMP      r0,#0x1a
        0x02028640:    f2008082    ....    BHI.W    0x2028748 ; DMA_GetPeripheralDataAddr + 280
        0x02028644:    9900        ..      LDR      r1,[sp,#0]
        0x02028646:    e8dff001    ....    TBB      [pc,r1]
    $d.6
        0x0202864a:    140e        ..      DCW    5134
        0x0202864c:    2b251f1a    ..%+    DCD    723853082
        0x02028650:    3f393473    s49?    DCD    1060713587
        0x02028654:    7f7f7f7f    ....    DCD    2139062143
        0x02028658:    4b457f7f    ..EK    DCD    1262845823
        0x0202865c:    315c5651    QV\1    DCD    828134993
        0x02028660:    796d6865    ehmy    DCD    2037213285
        0x02028664:    0062        b.      DCW    98
    $t.7
        0x02028666:    f2410000    A...    MOVW     r0,#0x1000
        0x0202866a:    f2c40001    ....    MOVT     r0,#0x4001
        0x0202866e:    9002        ..      STR      r0,[sp,#8]
        0x02028670:    e06d        m.      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x02028672:    f2420000    B...    MOVW     r0,#0x2000
        0x02028676:    f2c40001    ....    MOVT     r0,#0x4001
        0x0202867a:    9002        ..      STR      r0,[sp,#8]
        0x0202867c:    e067        g.      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x0202867e:    202c        ,       MOVS     r0,#0x2c
        0x02028680:    f2c40016    ....    MOVT     r0,#0x4016
        0x02028684:    9002        ..      STR      r0,[sp,#8]
        0x02028686:    e062        b.      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x02028688:    f24e002c    N.,.    MOV      r0,#0xe02c
        0x0202868c:    f2c40000    ....    MOVT     r0,#0x4000
        0x02028690:    9002        ..      STR      r0,[sp,#8]
        0x02028692:    e05c        \.      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x02028694:    f2430020    C. .    MOV      r0,#0x3020
        0x02028698:    f2c40001    ....    MOVT     r0,#0x4001
        0x0202869c:    9002        ..      STR      r0,[sp,#8]
        0x0202869e:    e056        V.      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x020286a0:    f2490014    I...    MOV      r0,#0x9014
        0x020286a4:    f2c40000    ....    MOVT     r0,#0x4000
        0x020286a8:    9002        ..      STR      r0,[sp,#8]
        0x020286aa:    e050        P.      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x020286ac:    2000        .       MOVS     r0,#0
        0x020286ae:    9002        ..      STR      r0,[sp,#8]
        0x020286b0:    e04d        M.      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x020286b2:    2010        .       MOVS     r0,#0x10
        0x020286b4:    f2c40001    ....    MOVT     r0,#0x4001
        0x020286b8:    9002        ..      STR      r0,[sp,#8]
        0x020286ba:    e048        H.      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x020286bc:    f2480024    H.$.    MOV      r0,#0x8024
        0x020286c0:    f2c40000    ....    MOVT     r0,#0x4000
        0x020286c4:    9002        ..      STR      r0,[sp,#8]
        0x020286c6:    e042        B.      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x020286c8:    f24f000c    O...    MOV      r0,#0xf00c
        0x020286cc:    f2c40000    ....    MOVT     r0,#0x4000
        0x020286d0:    9002        ..      STR      r0,[sp,#8]
        0x020286d2:    e03c        <.      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x020286d4:    f2410000    A...    MOVW     r0,#0x1000
        0x020286d8:    f2c40001    ....    MOVT     r0,#0x4001
        0x020286dc:    9002        ..      STR      r0,[sp,#8]
        0x020286de:    e036        6.      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x020286e0:    f2420000    B...    MOVW     r0,#0x2000
        0x020286e4:    f2c40001    ....    MOVT     r0,#0x4001
        0x020286e8:    9002        ..      STR      r0,[sp,#8]
        0x020286ea:    e030        0.      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x020286ec:    202c        ,       MOVS     r0,#0x2c
        0x020286ee:    f2c40016    ....    MOVT     r0,#0x4016
        0x020286f2:    9002        ..      STR      r0,[sp,#8]
        0x020286f4:    e02b        +.      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x020286f6:    f24e002c    N.,.    MOV      r0,#0xe02c
        0x020286fa:    f2c40000    ....    MOVT     r0,#0x4000
        0x020286fe:    9002        ..      STR      r0,[sp,#8]
        0x02028700:    e025        %.      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x02028702:    f2440020    D. .    MOV      r0,#0x4020
        0x02028706:    f2c40001    ....    MOVT     r0,#0x4001
        0x0202870a:    9002        ..      STR      r0,[sp,#8]
        0x0202870c:    e01f        ..      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x0202870e:    2000        .       MOVS     r0,#0
        0x02028710:    9002        ..      STR      r0,[sp,#8]
        0x02028712:    e01c        ..      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x02028714:    2000        .       MOVS     r0,#0
        0x02028716:    9002        ..      STR      r0,[sp,#8]
        0x02028718:    e019        ..      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x0202871a:    200c        .       MOVS     r0,#0xc
        0x0202871c:    f2c40001    ....    MOVT     r0,#0x4001
        0x02028720:    9002        ..      STR      r0,[sp,#8]
        0x02028722:    e014        ..      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x02028724:    f245001c    E...    MOV      r0,#0x501c
        0x02028728:    f2c40000    ....    MOVT     r0,#0x4000
        0x0202872c:    9002        ..      STR      r0,[sp,#8]
        0x0202872e:    e00e        ..      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x02028730:    f245003c    E.<.    MOV      r0,#0x503c
        0x02028734:    f2c40000    ....    MOVT     r0,#0x4000
        0x02028738:    9002        ..      STR      r0,[sp,#8]
        0x0202873a:    e008        ..      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x0202873c:    f245005c    E.\.    MOV      r0,#0x505c
        0x02028740:    f2c40000    ....    MOVT     r0,#0x4000
        0x02028744:    9002        ..      STR      r0,[sp,#8]
        0x02028746:    e002        ..      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x02028748:    2000        .       MOVS     r0,#0
        0x0202874a:    9002        ..      STR      r0,[sp,#8]
        0x0202874c:    e7ff        ..      B        0x202874e ; DMA_GetPeripheralDataAddr + 286
        0x0202874e:    9802        ..      LDR      r0,[sp,#8]
        0x02028750:    b003        ..      ADD      sp,sp,#0xc
        0x02028752:    4770        pG      BX       lr
    DMA_GetPeripheralWidth
        0x02028754:    b580        ..      PUSH     {r7,lr}
        0x02028756:    b082        ..      SUB      sp,sp,#8
        0x02028758:    f88d0006    ....    STRB     r0,[sp,#6]
        0x0202875c:    f89d0006    ....    LDRB     r0,[sp,#6]
        0x02028760:    4601        .F      MOV      r1,r0
        0x02028762:    9100        ..      STR      r1,[sp,#0]
        0x02028764:    281a        .(      CMP      r0,#0x1a
        0x02028766:    d829        ).      BHI      0x20287bc ; DMA_GetPeripheralWidth + 104
        0x02028768:    9900        ..      LDR      r1,[sp,#0]
        0x0202876a:    e8dff001    ....    TBB      [pc,r1]
    $d.3
        0x0202876e:    0e0e        ..      DCW    3598
        0x02028770:    230e1a12    ...#    DCD    588126738
        0x02028774:    23232323    ####    DCD    589505315
        0x02028778:    27272727    ''''    DCD    656877351
        0x0202877c:    0e0e2727    ''..    DCD    235808551
        0x02028780:    230e1a12    ...#    DCD    588126738
        0x02028784:    23232323    ####    DCD    589505315
        0x02028788:    0023        #.      DCW    35
    $t.4
        0x0202878a:    2000        .       MOVS     r0,#0
        0x0202878c:    f88d0007    ....    STRB     r0,[sp,#7]
        0x02028790:    e018        ..      B        0x20287c4 ; DMA_GetPeripheralWidth + 112
        0x02028792:    2000        .       MOVS     r0,#0
        0x02028794:    f2c40016    ....    MOVT     r0,#0x4016
        0x02028798:    f000f8fa    ....    BL       DMG_GetSPIDMAWidth ; 0x2028990
        0x0202879c:    f88d0007    ....    STRB     r0,[sp,#7]
        0x020287a0:    e010        ..      B        0x20287c4 ; DMA_GetPeripheralWidth + 112
        0x020287a2:    f24e0000    N...    MOVW     r0,#0xe000
        0x020287a6:    f2c40000    ....    MOVT     r0,#0x4000
        0x020287aa:    f000f8f1    ....    BL       DMG_GetSPIDMAWidth ; 0x2028990
        0x020287ae:    f88d0007    ....    STRB     r0,[sp,#7]
        0x020287b2:    e007        ..      B        0x20287c4 ; DMA_GetPeripheralWidth + 112
        0x020287b4:    2002        .       MOVS     r0,#2
        0x020287b6:    f88d0007    ....    STRB     r0,[sp,#7]
        0x020287ba:    e003        ..      B        0x20287c4 ; DMA_GetPeripheralWidth + 112
        0x020287bc:    2002        .       MOVS     r0,#2
        0x020287be:    f88d0007    ....    STRB     r0,[sp,#7]
        0x020287c2:    e7ff        ..      B        0x20287c4 ; DMA_GetPeripheralWidth + 112
        0x020287c4:    f89d0007    ....    LDRB     r0,[sp,#7]
        0x020287c8:    b002        ..      ADD      sp,sp,#8
        0x020287ca:    bd80        ..      POP      {r7,pc}
    DMA_PrepareMem2Peripheral
        0x020287cc:    b580        ..      PUSH     {r7,lr}
        0x020287ce:    b08c        ..      SUB      sp,sp,#0x30
        0x020287d0:    4684        .F      MOV      r12,r0
        0x020287d2:    980f        ..      LDR      r0,[sp,#0x3c]
        0x020287d4:    980e        ..      LDR      r0,[sp,#0x38]
        0x020287d6:    f8cdc028    ..(.    STR      r12,[sp,#0x28]
        0x020287da:    f88d1027    ..'.    STRB     r1,[sp,#0x27]
        0x020287de:    9208        ..      STR      r2,[sp,#0x20]
        0x020287e0:    9307        ..      STR      r3,[sp,#0x1c]
        0x020287e2:    f88d001b    ....    STRB     r0,[sp,#0x1b]
        0x020287e6:    f89d0027    ..'.    LDRB     r0,[sp,#0x27]
        0x020287ea:    f000fdd1    ....    BL       SYSCTRL_GetDmaId ; 0x2029390
        0x020287ee:    9005        ..      STR      r0,[sp,#0x14]
        0x020287f0:    f89d0027    ..'.    LDRB     r0,[sp,#0x27]
        0x020287f4:    f7ffffae    ....    BL       DMA_GetPeripheralWidth ; 0x2028754
        0x020287f8:    9004        ..      STR      r0,[sp,#0x10]
        0x020287fa:    f89d0027    ..'.    LDRB     r0,[sp,#0x27]
        0x020287fe:    f7ffff17    ....    BL       DMA_GetPeripheralDataAddr ; 0x2028630
        0x02028802:    9003        ..      STR      r0,[sp,#0xc]
        0x02028804:    9808        ..      LDR      r0,[sp,#0x20]
        0x02028806:    9907        ..      LDR      r1,[sp,#0x1c]
        0x02028808:    4308        .C      ORRS     r0,r0,r1
        0x0202880a:    f0000003    ....    AND      r0,r0,#3
        0x0202880e:    9002        ..      STR      r0,[sp,#8]
        0x02028810:    9805        ..      LDR      r0,[sp,#0x14]
        0x02028812:    9904        ..      LDR      r1,[sp,#0x10]
        0x02028814:    4308        .C      ORRS     r0,r0,r1
        0x02028816:    0fc0        ..      LSRS     r0,r0,#31
        0x02028818:    9903        ..      LDR      r1,[sp,#0xc]
        0x0202881a:    2900        .)      CMP      r1,#0
        0x0202881c:    bf08        ..      IT       EQ
        0x0202881e:    2001        .       MOVEQ    r0,#1
        0x02028820:    b120         .      CBZ      r0,0x202882c ; DMA_PrepareMem2Peripheral + 96
        0x02028822:    e7ff        ..      B        0x2028824 ; DMA_PrepareMem2Peripheral + 88
        0x02028824:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x02028828:    900b        ..      STR      r0,[sp,#0x2c]
        0x0202882a:    e037        7.      B        0x202889c ; DMA_PrepareMem2Peripheral + 208
        0x0202882c:    9804        ..      LDR      r0,[sp,#0x10]
        0x0202882e:    2802        .(      CMP      r0,#2
        0x02028830:    d109        ..      BNE      0x2028846 ; DMA_PrepareMem2Peripheral + 122
        0x02028832:    e7ff        ..      B        0x2028834 ; DMA_PrepareMem2Peripheral + 104
        0x02028834:    f89d001c    ....    LDRB     r0,[sp,#0x1c]
        0x02028838:    0780        ..      LSLS     r0,r0,#30
        0x0202883a:    b120         .      CBZ      r0,0x2028846 ; DMA_PrepareMem2Peripheral + 122
        0x0202883c:    e7ff        ..      B        0x202883e ; DMA_PrepareMem2Peripheral + 114
        0x0202883e:    f06f0001    o...    MVN      r0,#1
        0x02028842:    900b        ..      STR      r0,[sp,#0x2c]
        0x02028844:    e02a        *.      B        0x202889c ; DMA_PrepareMem2Peripheral + 208
        0x02028846:    980f        ..      LDR      r0,[sp,#0x3c]
        0x02028848:    f89d101b    ....    LDRB     r1,[sp,#0x1b]
        0x0202884c:    ea403181    @..1    ORR      r1,r0,r1,LSL #14
        0x02028850:    9a02        ..      LDR      r2,[sp,#8]
        0x02028852:    f4410080    A...    ORR      r0,r1,#0x400000
        0x02028856:    2a00        .*      CMP      r2,#0
        0x02028858:    bf18        ..      IT       NE
        0x0202885a:    4608        .F      MOVNE    r0,r1
        0x0202885c:    9905        ..      LDR      r1,[sp,#0x14]
        0x0202885e:    ea401001    @...    ORR      r0,r0,r1,LSL #4
        0x02028862:    9904        ..      LDR      r1,[sp,#0x10]
        0x02028864:    ea404081    @..@    ORR      r0,r0,r1,LSL #18
        0x02028868:    f4403090    @..0    ORR      r0,r0,#0x12000
        0x0202886c:    990a        ..      LDR      r1,[sp,#0x28]
        0x0202886e:    6008        .`      STR      r0,[r1,#0]
        0x02028870:    9802        ..      LDR      r0,[sp,#8]
        0x02028872:    b118        ..      CBZ      r0,0x202887c ; DMA_PrepareMem2Peripheral + 176
        0x02028874:    e7ff        ..      B        0x2028876 ; DMA_PrepareMem2Peripheral + 170
        0x02028876:    9807        ..      LDR      r0,[sp,#0x1c]
        0x02028878:    9001        ..      STR      r0,[sp,#4]
        0x0202887a:    e003        ..      B        0x2028884 ; DMA_PrepareMem2Peripheral + 184
        0x0202887c:    9807        ..      LDR      r0,[sp,#0x1c]
        0x0202887e:    0880        ..      LSRS     r0,r0,#2
        0x02028880:    9001        ..      STR      r0,[sp,#4]
        0x02028882:    e7ff        ..      B        0x2028884 ; DMA_PrepareMem2Peripheral + 184
        0x02028884:    9801        ..      LDR      r0,[sp,#4]
        0x02028886:    990a        ..      LDR      r1,[sp,#0x28]
        0x02028888:    6048        H`      STR      r0,[r1,#4]
        0x0202888a:    9803        ..      LDR      r0,[sp,#0xc]
        0x0202888c:    990a        ..      LDR      r1,[sp,#0x28]
        0x0202888e:    6108        .a      STR      r0,[r1,#0x10]
        0x02028890:    9808        ..      LDR      r0,[sp,#0x20]
        0x02028892:    990a        ..      LDR      r1,[sp,#0x28]
        0x02028894:    6088        .`      STR      r0,[r1,#8]
        0x02028896:    2000        .       MOVS     r0,#0
        0x02028898:    900b        ..      STR      r0,[sp,#0x2c]
        0x0202889a:    e7ff        ..      B        0x202889c ; DMA_PrepareMem2Peripheral + 208
        0x0202889c:    980b        ..      LDR      r0,[sp,#0x2c]
        0x0202889e:    b00c        ..      ADD      sp,sp,#0x30
        0x020288a0:    bd80        ..      POP      {r7,pc}
        0x020288a2:    0000        ..      MOVS     r0,r0
    DMA_PreparePeripheral2Mem
        0x020288a4:    b580        ..      PUSH     {r7,lr}
        0x020288a6:    b08a        ..      SUB      sp,sp,#0x28
        0x020288a8:    4684        .F      MOV      r12,r0
        0x020288aa:    980d        ..      LDR      r0,[sp,#0x34]
        0x020288ac:    980c        ..      LDR      r0,[sp,#0x30]
        0x020288ae:    f8cdc020    .. .    STR      r12,[sp,#0x20]
        0x020288b2:    9107        ..      STR      r1,[sp,#0x1c]
        0x020288b4:    f88d201b    ...     STRB     r2,[sp,#0x1b]
        0x020288b8:    9305        ..      STR      r3,[sp,#0x14]
        0x020288ba:    f88d0013    ....    STRB     r0,[sp,#0x13]
        0x020288be:    f89d001b    ....    LDRB     r0,[sp,#0x1b]
        0x020288c2:    f000fd65    ..e.    BL       SYSCTRL_GetDmaId ; 0x2029390
        0x020288c6:    9003        ..      STR      r0,[sp,#0xc]
        0x020288c8:    f89d001b    ....    LDRB     r0,[sp,#0x1b]
        0x020288cc:    f7ffff42    ..B.    BL       DMA_GetPeripheralWidth ; 0x2028754
        0x020288d0:    9002        ..      STR      r0,[sp,#8]
        0x020288d2:    f89d001b    ....    LDRB     r0,[sp,#0x1b]
        0x020288d6:    f7fffeab    ....    BL       DMA_GetPeripheralDataAddr ; 0x2028630
        0x020288da:    9001        ..      STR      r0,[sp,#4]
        0x020288dc:    9807        ..      LDR      r0,[sp,#0x1c]
        0x020288de:    9905        ..      LDR      r1,[sp,#0x14]
        0x020288e0:    4308        .C      ORRS     r0,r0,r1
        0x020288e2:    f0000003    ....    AND      r0,r0,#3
        0x020288e6:    9000        ..      STR      r0,[sp,#0]
        0x020288e8:    9803        ..      LDR      r0,[sp,#0xc]
        0x020288ea:    9902        ..      LDR      r1,[sp,#8]
        0x020288ec:    4308        .C      ORRS     r0,r0,r1
        0x020288ee:    0fc0        ..      LSRS     r0,r0,#31
        0x020288f0:    9901        ..      LDR      r1,[sp,#4]
        0x020288f2:    2900        .)      CMP      r1,#0
        0x020288f4:    bf08        ..      IT       EQ
        0x020288f6:    2001        .       MOVEQ    r0,#1
        0x020288f8:    b120         .      CBZ      r0,0x2028904 ; DMA_PreparePeripheral2Mem + 96
        0x020288fa:    e7ff        ..      B        0x20288fc ; DMA_PreparePeripheral2Mem + 88
        0x020288fc:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x02028900:    9009        ..      STR      r0,[sp,#0x24]
        0x02028902:    e025        %.      B        0x2028950 ; DMA_PreparePeripheral2Mem + 172
        0x02028904:    980d        ..      LDR      r0,[sp,#0x34]
        0x02028906:    9903        ..      LDR      r1,[sp,#0xc]
        0x02028908:    ea402001    @..     ORR      r0,r0,r1,LSL #8
        0x0202890c:    9902        ..      LDR      r1,[sp,#8]
        0x0202890e:    ea405041    @.AP    ORR      r0,r0,r1,LSL #21
        0x02028912:    f89d1013    ....    LDRB     r1,[sp,#0x13]
        0x02028916:    ea403001    @..0    ORR      r0,r0,r1,LSL #12
        0x0202891a:    f4403120    @. 1    ORR      r1,r0,#0x28000
        0x0202891e:    9a00        ..      LDR      r2,[sp,#0]
        0x02028920:    f4402028    @.(     ORR      r0,r0,#0xa8000
        0x02028924:    2a00        .*      CMP      r2,#0
        0x02028926:    bf18        ..      IT       NE
        0x02028928:    4608        .F      MOVNE    r0,r1
        0x0202892a:    9908        ..      LDR      r1,[sp,#0x20]
        0x0202892c:    6008        .`      STR      r0,[r1,#0]
        0x0202892e:    9805        ..      LDR      r0,[sp,#0x14]
        0x02028930:    9a02        ..      LDR      r2,[sp,#8]
        0x02028932:    2101        .!      MOVS     r1,#1
        0x02028934:    4091        .@      LSLS     r1,r1,r2
        0x02028936:    fb90f0f1    ....    SDIV     r0,r0,r1
        0x0202893a:    9908        ..      LDR      r1,[sp,#0x20]
        0x0202893c:    6048        H`      STR      r0,[r1,#4]
        0x0202893e:    9807        ..      LDR      r0,[sp,#0x1c]
        0x02028940:    9908        ..      LDR      r1,[sp,#0x20]
        0x02028942:    6108        .a      STR      r0,[r1,#0x10]
        0x02028944:    9801        ..      LDR      r0,[sp,#4]
        0x02028946:    9908        ..      LDR      r1,[sp,#0x20]
        0x02028948:    6088        .`      STR      r0,[r1,#8]
        0x0202894a:    2000        .       MOVS     r0,#0
        0x0202894c:    9009        ..      STR      r0,[sp,#0x24]
        0x0202894e:    e7ff        ..      B        0x2028950 ; DMA_PreparePeripheral2Mem + 172
        0x02028950:    9809        ..      LDR      r0,[sp,#0x24]
        0x02028952:    b00a        ..      ADD      sp,sp,#0x28
        0x02028954:    bd80        ..      POP      {r7,pc}
        0x02028956:    0000        ..      MOVS     r0,r0
    DMA_Reset
        0x02028958:    b081        ..      SUB      sp,sp,#4
        0x0202895a:    f88d0003    ....    STRB     r0,[sp,#3]
        0x0202895e:    f89d0003    ....    LDRB     r0,[sp,#3]
        0x02028962:    b148        H.      CBZ      r0,0x2028978 ; DMA_Reset + 32
        0x02028964:    e7ff        ..      B        0x2028966 ; DMA_Reset + 14
        0x02028966:    f24c0120    L. .    MOV      r1,#0xc020
        0x0202896a:    f2c40100    ....    MOVT     r1,#0x4000
        0x0202896e:    6808        .h      LDR      r0,[r1,#0]
        0x02028970:    f0400001    @...    ORR      r0,r0,#1
        0x02028974:    6008        .`      STR      r0,[r1,#0]
        0x02028976:    e008        ..      B        0x202898a ; DMA_Reset + 50
        0x02028978:    f24c0120    L. .    MOV      r1,#0xc020
        0x0202897c:    f2c40100    ....    MOVT     r1,#0x4000
        0x02028980:    6808        .h      LDR      r0,[r1,#0]
        0x02028982:    f0200001     ...    BIC      r0,r0,#1
        0x02028986:    6008        .`      STR      r0,[r1,#0]
        0x02028988:    e7ff        ..      B        0x202898a ; DMA_Reset + 50
        0x0202898a:    b001        ..      ADD      sp,sp,#4
        0x0202898c:    4770        pG      BX       lr
        0x0202898e:    0000        ..      MOVS     r0,r0
    DMG_GetSPIDMAWidth
        0x02028990:    b083        ..      SUB      sp,sp,#0xc
        0x02028992:    9001        ..      STR      r0,[sp,#4]
        0x02028994:    9801        ..      LDR      r0,[sp,#4]
        0x02028996:    6900        .i      LDR      r0,[r0,#0x10]
        0x02028998:    f3c02004    ...     UBFX     r0,r0,#8,#5
        0x0202899c:    4601        .F      MOV      r1,r0
        0x0202899e:    9100        ..      STR      r1,[sp,#0]
        0x020289a0:    2807        .(      CMP      r0,#7
        0x020289a2:    d004        ..      BEQ      0x20289ae ; DMG_GetSPIDMAWidth + 30
        0x020289a4:    e7ff        ..      B        0x20289a6 ; DMG_GetSPIDMAWidth + 22
        0x020289a6:    9800        ..      LDR      r0,[sp,#0]
        0x020289a8:    280f        .(      CMP      r0,#0xf
        0x020289aa:    d003        ..      BEQ      0x20289b4 ; DMG_GetSPIDMAWidth + 36
        0x020289ac:    e005        ..      B        0x20289ba ; DMG_GetSPIDMAWidth + 42
        0x020289ae:    2000        .       MOVS     r0,#0
        0x020289b0:    9002        ..      STR      r0,[sp,#8]
        0x020289b2:    e005        ..      B        0x20289c0 ; DMG_GetSPIDMAWidth + 48
        0x020289b4:    2001        .       MOVS     r0,#1
        0x020289b6:    9002        ..      STR      r0,[sp,#8]
        0x020289b8:    e002        ..      B        0x20289c0 ; DMG_GetSPIDMAWidth + 48
        0x020289ba:    2002        .       MOVS     r0,#2
        0x020289bc:    9002        ..      STR      r0,[sp,#8]
        0x020289be:    e7ff        ..      B        0x20289c0 ; DMG_GetSPIDMAWidth + 48
        0x020289c0:    9802        ..      LDR      r0,[sp,#8]
        0x020289c2:    b003        ..      ADD      sp,sp,#0xc
        0x020289c4:    4770        pG      BX       lr
        0x020289c6:    0000        ..      MOVS     r0,r0
    PINCTRL_Pull
        0x020289c8:    b086        ..      SUB      sp,sp,#0x18
        0x020289ca:    f88d0017    ....    STRB     r0,[sp,#0x17]
        0x020289ce:    f88d1016    ....    STRB     r1,[sp,#0x16]
        0x020289d2:    f89d0017    ....    LDRB     r0,[sp,#0x17]
        0x020289d6:    9004        ..      STR      r0,[sp,#0x10]
        0x020289d8:    9904        ..      LDR      r1,[sp,#0x10]
        0x020289da:    2000        .       MOVS     r0,#0
        0x020289dc:    291f        .)      CMP      r1,#0x1f
        0x020289de:    bfc8        ..      IT       GT
        0x020289e0:    2001        .       MOVGT    r0,#1
        0x020289e2:    9003        ..      STR      r0,[sp,#0xc]
        0x020289e4:    9804        ..      LDR      r0,[sp,#0x10]
        0x020289e6:    f000011f    ....    AND      r1,r0,#0x1f
        0x020289ea:    2001        .       MOVS     r0,#1
        0x020289ec:    4088        .@      LSLS     r0,r0,r1
        0x020289ee:    9002        ..      STR      r0,[sp,#8]
        0x020289f0:    9903        ..      LDR      r1,[sp,#0xc]
        0x020289f2:    f2460080    F...    MOVW     r0,#0x6080
        0x020289f6:    f2c40000    ....    MOVT     r0,#0x4000
        0x020289fa:    eb000081    ....    ADD      r0,r0,r1,LSL #2
        0x020289fe:    9001        ..      STR      r0,[sp,#4]
        0x02028a00:    9903        ..      LDR      r1,[sp,#0xc]
        0x02028a02:    f2460088    F...    MOV      r0,#0x6088
        0x02028a06:    f2c40000    ....    MOVT     r0,#0x4000
        0x02028a0a:    eb000081    ....    ADD      r0,r0,r1,LSL #2
        0x02028a0e:    9000        ..      STR      r0,[sp,#0]
        0x02028a10:    f89d0016    ....    LDRB     r0,[sp,#0x16]
        0x02028a14:    b930        0.      CBNZ     r0,0x2028a24 ; PINCTRL_Pull + 92
        0x02028a16:    e7ff        ..      B        0x2028a18 ; PINCTRL_Pull + 80
        0x02028a18:    9a02        ..      LDR      r2,[sp,#8]
        0x02028a1a:    9901        ..      LDR      r1,[sp,#4]
        0x02028a1c:    6808        .h      LDR      r0,[r1,#0]
        0x02028a1e:    4390        .C      BICS     r0,r0,r2
        0x02028a20:    6008        .`      STR      r0,[r1,#0]
        0x02028a22:    e016        ..      B        0x2028a52 ; PINCTRL_Pull + 138
        0x02028a24:    f89d0016    ....    LDRB     r0,[sp,#0x16]
        0x02028a28:    2801        .(      CMP      r0,#1
        0x02028a2a:    d106        ..      BNE      0x2028a3a ; PINCTRL_Pull + 114
        0x02028a2c:    e7ff        ..      B        0x2028a2e ; PINCTRL_Pull + 102
        0x02028a2e:    9a02        ..      LDR      r2,[sp,#8]
        0x02028a30:    9900        ..      LDR      r1,[sp,#0]
        0x02028a32:    6808        .h      LDR      r0,[r1,#0]
        0x02028a34:    4310        .C      ORRS     r0,r0,r2
        0x02028a36:    6008        .`      STR      r0,[r1,#0]
        0x02028a38:    e005        ..      B        0x2028a46 ; PINCTRL_Pull + 126
        0x02028a3a:    9a02        ..      LDR      r2,[sp,#8]
        0x02028a3c:    9900        ..      LDR      r1,[sp,#0]
        0x02028a3e:    6808        .h      LDR      r0,[r1,#0]
        0x02028a40:    4390        .C      BICS     r0,r0,r2
        0x02028a42:    6008        .`      STR      r0,[r1,#0]
        0x02028a44:    e7ff        ..      B        0x2028a46 ; PINCTRL_Pull + 126
        0x02028a46:    9a02        ..      LDR      r2,[sp,#8]
        0x02028a48:    9901        ..      LDR      r1,[sp,#4]
        0x02028a4a:    6808        .h      LDR      r0,[r1,#0]
        0x02028a4c:    4310        .C      ORRS     r0,r0,r2
        0x02028a4e:    6008        .`      STR      r0,[r1,#0]
        0x02028a50:    e7ff        ..      B        0x2028a52 ; PINCTRL_Pull + 138
        0x02028a52:    2000        .       MOVS     r0,#0
        0x02028a54:    b006        ..      ADD      sp,sp,#0x18
        0x02028a56:    4770        pG      BX       lr
    PINCTRL_SelInput
        0x02028a58:    b580        ..      PUSH     {r7,lr}
        0x02028a5a:    b086        ..      SUB      sp,sp,#0x18
        0x02028a5c:    f8ddc020    .. .    LDR      r12,[sp,#0x20]
        0x02028a60:    f88d0013    ....    STRB     r0,[sp,#0x13]
        0x02028a64:    9103        ..      STR      r1,[sp,#0xc]
        0x02028a66:    9202        ..      STR      r2,[sp,#8]
        0x02028a68:    9301        ..      STR      r3,[sp,#4]
        0x02028a6a:    f89d0013    ....    LDRB     r0,[sp,#0x13]
        0x02028a6e:    287f        .(      CMP      r0,#0x7f
        0x02028a70:    d112        ..      BNE      0x2028a98 ; PINCTRL_SelInput + 64
        0x02028a72:    e7ff        ..      B        0x2028a74 ; PINCTRL_SelInput + 28
        0x02028a74:    9902        ..      LDR      r1,[sp,#8]
        0x02028a76:    f2460040    F.@.    MOV      r0,#0x6040
        0x02028a7a:    f2c40000    ....    MOVT     r0,#0x4000
        0x02028a7e:    eb000081    ....    ADD      r0,r0,r1,LSL #2
        0x02028a82:    f89d2004    ...     LDRB     r2,[sp,#4]
        0x02028a86:    f89d3020    .. 0    LDRB     r3,[sp,#0x20]
        0x02028a8a:    f04f31ff    O..1    MOV      r1,#0xffffffff
        0x02028a8e:    f001fb0b    ....    BL       set_reg_bits ; 0x202a0a8
        0x02028a92:    2000        .       MOVS     r0,#0
        0x02028a94:    9005        ..      STR      r0,[sp,#0x14]
        0x02028a96:    e024        $.      B        0x2028ae2 ; PINCTRL_SelInput + 138
        0x02028a98:    9803        ..      LDR      r0,[sp,#0xc]
        0x02028a9a:    f89d1013    ....    LDRB     r1,[sp,#0x13]
        0x02028a9e:    f001fa93    ....    BL       pin_id_for_input_source ; 0x2029fc8
        0x02028aa2:    9000        ..      STR      r0,[sp,#0]
        0x02028aa4:    9800        ..      LDR      r0,[sp,#0]
        0x02028aa6:    f1b03fff    ...?    CMP      r0,#0xffffffff
        0x02028aaa:    dc03        ..      BGT      0x2028ab4 ; PINCTRL_SelInput + 92
        0x02028aac:    e7ff        ..      B        0x2028aae ; PINCTRL_SelInput + 86
        0x02028aae:    9800        ..      LDR      r0,[sp,#0]
        0x02028ab0:    9005        ..      STR      r0,[sp,#0x14]
        0x02028ab2:    e016        ..      B        0x2028ae2 ; PINCTRL_SelInput + 138
        0x02028ab4:    9902        ..      LDR      r1,[sp,#8]
        0x02028ab6:    f2460040    F.@.    MOV      r0,#0x6040
        0x02028aba:    f2c40000    ....    MOVT     r0,#0x4000
        0x02028abe:    eb000081    ....    ADD      r0,r0,r1,LSL #2
        0x02028ac2:    9900        ..      LDR      r1,[sp,#0]
        0x02028ac4:    f89d2004    ...     LDRB     r2,[sp,#4]
        0x02028ac8:    f89d3020    .. 0    LDRB     r3,[sp,#0x20]
        0x02028acc:    f001faec    ....    BL       set_reg_bits ; 0x202a0a8
        0x02028ad0:    f89d0013    ....    LDRB     r0,[sp,#0x13]
        0x02028ad4:    f89d100c    ....    LDRB     r1,[sp,#0xc]
        0x02028ad8:    f000f90a    ....    BL       PINCTRL_SetPadMux ; 0x2028cf0
        0x02028adc:    2000        .       MOVS     r0,#0
        0x02028ade:    9005        ..      STR      r0,[sp,#0x14]
        0x02028ae0:    e7ff        ..      B        0x2028ae2 ; PINCTRL_SelInput + 138
        0x02028ae2:    9805        ..      LDR      r0,[sp,#0x14]
        0x02028ae4:    b006        ..      ADD      sp,sp,#0x18
        0x02028ae6:    bd80        ..      POP      {r7,pc}
    PINCTRL_SelSpiIn
        0x02028ae8:    b5b0        ..      PUSH     {r4,r5,r7,lr}
        0x02028aea:    b084        ..      SUB      sp,sp,#0x10
        0x02028aec:    4694        .F      MOV      r12,r2
        0x02028aee:    468e        .F      MOV      lr,r1
        0x02028af0:    4604        .F      MOV      r4,r0
        0x02028af2:    980a        ..      LDR      r0,[sp,#0x28]
        0x02028af4:    9909        ..      LDR      r1,[sp,#0x24]
        0x02028af6:    9a08        ..      LDR      r2,[sp,#0x20]
        0x02028af8:    f88d400b    ...@    STRB     r4,[sp,#0xb]
        0x02028afc:    f88de00a    ....    STRB     lr,[sp,#0xa]
        0x02028b00:    f88dc009    ....    STRB     r12,[sp,#9]
        0x02028b04:    f88d3008    ...0    STRB     r3,[sp,#8]
        0x02028b08:    f88d2007    ...     STRB     r2,[sp,#7]
        0x02028b0c:    f88d1006    ....    STRB     r1,[sp,#6]
        0x02028b10:    f88d0005    ....    STRB     r0,[sp,#5]
        0x02028b14:    f89d000a    ....    LDRB     r0,[sp,#0xa]
        0x02028b18:    f89d100b    ....    LDRB     r1,[sp,#0xb]
        0x02028b1c:    eb010c41    ..A.    ADD      r12,r1,r1,LSL #1
        0x02028b20:    f64a31fa    J..1    MOV      r1,#0xabfa
        0x02028b24:    f2c02102    ...!    MOVT     r1,#0x202
        0x02028b28:    f811101c    ....    LDRB     r1,[r1,r12,LSL #1]
        0x02028b2c:    f64a32ee    J..2    MOV      r2,#0xabee
        0x02028b30:    f2c02202    ..."    MOVT     r2,#0x202
        0x02028b34:    f812201c    ...     LDRB     r2,[r2,r12,LSL #1]
        0x02028b38:    f64a33e2    J..3    MOV      r3,#0xabe2
        0x02028b3c:    f2c02302    ...#    MOVT     r3,#0x202
        0x02028b40:    f813301c    ...0    LDRB     r3,[r3,r12,LSL #1]
        0x02028b44:    46ec        .F      MOV      r12,sp
        0x02028b46:    f8cc3000    ...0    STR      r3,[r12,#0]
        0x02028b4a:    2305        .#      MOVS     r3,#5
        0x02028b4c:    f7ffff84    ....    BL       PINCTRL_SelInput ; 0x2028a58
        0x02028b50:    b120         .      CBZ      r0,0x2028b5c ; PINCTRL_SelSpiIn + 116
        0x02028b52:    e7ff        ..      B        0x2028b54 ; PINCTRL_SelSpiIn + 108
        0x02028b54:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x02028b58:    9003        ..      STR      r0,[sp,#0xc]
        0x02028b5a:    e0c5        ..      B        0x2028ce8 ; PINCTRL_SelSpiIn + 512
        0x02028b5c:    f89d0009    ....    LDRB     r0,[sp,#9]
        0x02028b60:    f89d100b    ....    LDRB     r1,[sp,#0xb]
        0x02028b64:    eb010c41    ..A.    ADD      r12,r1,r1,LSL #1
        0x02028b68:    f64a31fa    J..1    MOV      r1,#0xabfa
        0x02028b6c:    f2c02102    ...!    MOVT     r1,#0x202
        0x02028b70:    eb01014c    ..L.    ADD      r1,r1,r12,LSL #1
        0x02028b74:    7849        Ix      LDRB     r1,[r1,#1]
        0x02028b76:    f64a32ee    J..2    MOV      r2,#0xabee
        0x02028b7a:    f2c02202    ..."    MOVT     r2,#0x202
        0x02028b7e:    eb02024c    ..L.    ADD      r2,r2,r12,LSL #1
        0x02028b82:    7852        Rx      LDRB     r2,[r2,#1]
        0x02028b84:    f64a33e2    J..3    MOV      r3,#0xabe2
        0x02028b88:    f2c02302    ...#    MOVT     r3,#0x202
        0x02028b8c:    eb03034c    ..L.    ADD      r3,r3,r12,LSL #1
        0x02028b90:    785b        [x      LDRB     r3,[r3,#1]
        0x02028b92:    46ec        .F      MOV      r12,sp
        0x02028b94:    f8cc3000    ...0    STR      r3,[r12,#0]
        0x02028b98:    2305        .#      MOVS     r3,#5
        0x02028b9a:    f7ffff5d    ..].    BL       PINCTRL_SelInput ; 0x2028a58
        0x02028b9e:    b120         .      CBZ      r0,0x2028baa ; PINCTRL_SelSpiIn + 194
        0x02028ba0:    e7ff        ..      B        0x2028ba2 ; PINCTRL_SelSpiIn + 186
        0x02028ba2:    f06f0001    o...    MVN      r0,#1
        0x02028ba6:    9003        ..      STR      r0,[sp,#0xc]
        0x02028ba8:    e09e        ..      B        0x2028ce8 ; PINCTRL_SelSpiIn + 512
        0x02028baa:    f89d0008    ....    LDRB     r0,[sp,#8]
        0x02028bae:    f89d100b    ....    LDRB     r1,[sp,#0xb]
        0x02028bb2:    eb010c41    ..A.    ADD      r12,r1,r1,LSL #1
        0x02028bb6:    f64a31fa    J..1    MOV      r1,#0xabfa
        0x02028bba:    f2c02102    ...!    MOVT     r1,#0x202
        0x02028bbe:    eb01014c    ..L.    ADD      r1,r1,r12,LSL #1
        0x02028bc2:    7889        .x      LDRB     r1,[r1,#2]
        0x02028bc4:    f64a32ee    J..2    MOV      r2,#0xabee
        0x02028bc8:    f2c02202    ..."    MOVT     r2,#0x202
        0x02028bcc:    eb02024c    ..L.    ADD      r2,r2,r12,LSL #1
        0x02028bd0:    7892        .x      LDRB     r2,[r2,#2]
        0x02028bd2:    f64a33e2    J..3    MOV      r3,#0xabe2
        0x02028bd6:    f2c02302    ...#    MOVT     r3,#0x202
        0x02028bda:    eb03034c    ..L.    ADD      r3,r3,r12,LSL #1
        0x02028bde:    789b        .x      LDRB     r3,[r3,#2]
        0x02028be0:    46ec        .F      MOV      r12,sp
        0x02028be2:    f8cc3000    ...0    STR      r3,[r12,#0]
        0x02028be6:    2305        .#      MOVS     r3,#5
        0x02028be8:    f7ffff36    ..6.    BL       PINCTRL_SelInput ; 0x2028a58
        0x02028bec:    b120         .      CBZ      r0,0x2028bf8 ; PINCTRL_SelSpiIn + 272
        0x02028bee:    e7ff        ..      B        0x2028bf0 ; PINCTRL_SelSpiIn + 264
        0x02028bf0:    f06f0002    o...    MVN      r0,#2
        0x02028bf4:    9003        ..      STR      r0,[sp,#0xc]
        0x02028bf6:    e077        w.      B        0x2028ce8 ; PINCTRL_SelSpiIn + 512
        0x02028bf8:    f89d0007    ....    LDRB     r0,[sp,#7]
        0x02028bfc:    f89d100b    ....    LDRB     r1,[sp,#0xb]
        0x02028c00:    eb010c41    ..A.    ADD      r12,r1,r1,LSL #1
        0x02028c04:    f64a31fa    J..1    MOV      r1,#0xabfa
        0x02028c08:    f2c02102    ...!    MOVT     r1,#0x202
        0x02028c0c:    eb01014c    ..L.    ADD      r1,r1,r12,LSL #1
        0x02028c10:    78c9        .x      LDRB     r1,[r1,#3]
        0x02028c12:    f64a32ee    J..2    MOV      r2,#0xabee
        0x02028c16:    f2c02202    ..."    MOVT     r2,#0x202
        0x02028c1a:    eb02024c    ..L.    ADD      r2,r2,r12,LSL #1
        0x02028c1e:    78d2        .x      LDRB     r2,[r2,#3]
        0x02028c20:    f64a33e2    J..3    MOV      r3,#0xabe2
        0x02028c24:    f2c02302    ...#    MOVT     r3,#0x202
        0x02028c28:    eb03034c    ..L.    ADD      r3,r3,r12,LSL #1
        0x02028c2c:    78db        .x      LDRB     r3,[r3,#3]
        0x02028c2e:    46ec        .F      MOV      r12,sp
        0x02028c30:    f8cc3000    ...0    STR      r3,[r12,#0]
        0x02028c34:    2305        .#      MOVS     r3,#5
        0x02028c36:    f7ffff0f    ....    BL       PINCTRL_SelInput ; 0x2028a58
        0x02028c3a:    b120         .      CBZ      r0,0x2028c46 ; PINCTRL_SelSpiIn + 350
        0x02028c3c:    e7ff        ..      B        0x2028c3e ; PINCTRL_SelSpiIn + 342
        0x02028c3e:    f06f0003    o...    MVN      r0,#3
        0x02028c42:    9003        ..      STR      r0,[sp,#0xc]
        0x02028c44:    e050        P.      B        0x2028ce8 ; PINCTRL_SelSpiIn + 512
        0x02028c46:    f89d0006    ....    LDRB     r0,[sp,#6]
        0x02028c4a:    f89d100b    ....    LDRB     r1,[sp,#0xb]
        0x02028c4e:    eb010c41    ..A.    ADD      r12,r1,r1,LSL #1
        0x02028c52:    f64a31fa    J..1    MOV      r1,#0xabfa
        0x02028c56:    f2c02102    ...!    MOVT     r1,#0x202
        0x02028c5a:    eb01014c    ..L.    ADD      r1,r1,r12,LSL #1
        0x02028c5e:    7909        .y      LDRB     r1,[r1,#4]
        0x02028c60:    f64a32ee    J..2    MOV      r2,#0xabee
        0x02028c64:    f2c02202    ..."    MOVT     r2,#0x202
        0x02028c68:    eb02024c    ..L.    ADD      r2,r2,r12,LSL #1
        0x02028c6c:    7912        .y      LDRB     r2,[r2,#4]
        0x02028c6e:    f64a33e2    J..3    MOV      r3,#0xabe2
        0x02028c72:    f2c02302    ...#    MOVT     r3,#0x202
        0x02028c76:    eb03034c    ..L.    ADD      r3,r3,r12,LSL #1
        0x02028c7a:    791b        .y      LDRB     r3,[r3,#4]
        0x02028c7c:    46ec        .F      MOV      r12,sp
        0x02028c7e:    f8cc3000    ...0    STR      r3,[r12,#0]
        0x02028c82:    2305        .#      MOVS     r3,#5
        0x02028c84:    f7fffee8    ....    BL       PINCTRL_SelInput ; 0x2028a58
        0x02028c88:    b120         .      CBZ      r0,0x2028c94 ; PINCTRL_SelSpiIn + 428
        0x02028c8a:    e7ff        ..      B        0x2028c8c ; PINCTRL_SelSpiIn + 420
        0x02028c8c:    f06f0004    o...    MVN      r0,#4
        0x02028c90:    9003        ..      STR      r0,[sp,#0xc]
        0x02028c92:    e029        ).      B        0x2028ce8 ; PINCTRL_SelSpiIn + 512
        0x02028c94:    f89d0005    ....    LDRB     r0,[sp,#5]
        0x02028c98:    f89d100b    ....    LDRB     r1,[sp,#0xb]
        0x02028c9c:    eb010c41    ..A.    ADD      r12,r1,r1,LSL #1
        0x02028ca0:    f64a31fa    J..1    MOV      r1,#0xabfa
        0x02028ca4:    f2c02102    ...!    MOVT     r1,#0x202
        0x02028ca8:    eb01014c    ..L.    ADD      r1,r1,r12,LSL #1
        0x02028cac:    7949        Iy      LDRB     r1,[r1,#5]
        0x02028cae:    f64a32ee    J..2    MOV      r2,#0xabee
        0x02028cb2:    f2c02202    ..."    MOVT     r2,#0x202
        0x02028cb6:    eb02024c    ..L.    ADD      r2,r2,r12,LSL #1
        0x02028cba:    7952        Ry      LDRB     r2,[r2,#5]
        0x02028cbc:    f64a33e2    J..3    MOV      r3,#0xabe2
        0x02028cc0:    f2c02302    ...#    MOVT     r3,#0x202
        0x02028cc4:    eb03034c    ..L.    ADD      r3,r3,r12,LSL #1
        0x02028cc8:    795b        [y      LDRB     r3,[r3,#5]
        0x02028cca:    46ec        .F      MOV      r12,sp
        0x02028ccc:    f8cc3000    ...0    STR      r3,[r12,#0]
        0x02028cd0:    2305        .#      MOVS     r3,#5
        0x02028cd2:    f7fffec1    ....    BL       PINCTRL_SelInput ; 0x2028a58
        0x02028cd6:    b120         .      CBZ      r0,0x2028ce2 ; PINCTRL_SelSpiIn + 506
        0x02028cd8:    e7ff        ..      B        0x2028cda ; PINCTRL_SelSpiIn + 498
        0x02028cda:    f06f0005    o...    MVN      r0,#5
        0x02028cde:    9003        ..      STR      r0,[sp,#0xc]
        0x02028ce0:    e002        ..      B        0x2028ce8 ; PINCTRL_SelSpiIn + 512
        0x02028ce2:    2000        .       MOVS     r0,#0
        0x02028ce4:    9003        ..      STR      r0,[sp,#0xc]
        0x02028ce6:    e7ff        ..      B        0x2028ce8 ; PINCTRL_SelSpiIn + 512
        0x02028ce8:    9803        ..      LDR      r0,[sp,#0xc]
        0x02028cea:    b004        ..      ADD      sp,sp,#0x10
        0x02028cec:    bdb0        ..      POP      {r4,r5,r7,pc}
        0x02028cee:    0000        ..      MOVS     r0,r0
    PINCTRL_SetPadMux
        0x02028cf0:    b580        ..      PUSH     {r7,lr}
        0x02028cf2:    b084        ..      SUB      sp,sp,#0x10
        0x02028cf4:    f88d000b    ....    STRB     r0,[sp,#0xb]
        0x02028cf8:    f88d100a    ....    STRB     r1,[sp,#0xa]
        0x02028cfc:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x02028d00:    f89d100a    ....    LDRB     r1,[sp,#0xa]
        0x02028d04:    f001fa92    ....    BL       source_id_on_pin ; 0x202a22c
        0x02028d08:    9001        ..      STR      r0,[sp,#4]
        0x02028d0a:    9801        ..      LDR      r0,[sp,#4]
        0x02028d0c:    f1b03fff    ...?    CMP      r0,#0xffffffff
        0x02028d10:    dc03        ..      BGT      0x2028d1a ; PINCTRL_SetPadMux + 42
        0x02028d12:    e7ff        ..      B        0x2028d14 ; PINCTRL_SetPadMux + 36
        0x02028d14:    9801        ..      LDR      r0,[sp,#4]
        0x02028d16:    9003        ..      STR      r0,[sp,#0xc]
        0x02028d18:    e0ba        ..      B        0x2028e90 ; PINCTRL_SetPadMux + 416
        0x02028d1a:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x02028d1e:    2811        .(      CMP      r0,#0x11
        0x02028d20:    dc12        ..      BGT      0x2028d48 ; PINCTRL_SetPadMux + 88
        0x02028d22:    e7ff        ..      B        0x2028d24 ; PINCTRL_SetPadMux + 52
        0x02028d24:    f89d200b    ...     LDRB     r2,[sp,#0xb]
        0x02028d28:    f2460000    F...    MOVW     r0,#0x6000
        0x02028d2c:    f2c40000    ....    MOVT     r0,#0x4000
        0x02028d30:    4310        .C      ORRS     r0,r0,r2
        0x02028d32:    f0200003     ...    BIC      r0,r0,#3
        0x02028d36:    9901        ..      LDR      r1,[sp,#4]
        0x02028d38:    f0020203    ....    AND      r2,r2,#3
        0x02028d3c:    ebc203c2    ....    RSB      r3,r2,r2,LSL #3
        0x02028d40:    2207        ."      MOVS     r2,#7
        0x02028d42:    f001f9b1    ....    BL       set_reg_bits ; 0x202a0a8
        0x02028d46:    e0a0        ..      B        0x2028e8a ; PINCTRL_SetPadMux + 410
        0x02028d48:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x02028d4c:    2814        .(      CMP      r0,#0x14
        0x02028d4e:    dc10        ..      BGT      0x2028d72 ; PINCTRL_SetPadMux + 130
        0x02028d50:    e7ff        ..      B        0x2028d52 ; PINCTRL_SetPadMux + 98
        0x02028d52:    9901        ..      LDR      r1,[sp,#4]
        0x02028d54:    f89d200b    ...     LDRB     r2,[sp,#0xb]
        0x02028d58:    f06f0015    o...    MVN      r0,#0x15
        0x02028d5c:    eb000042    ..B.    ADD      r0,r0,r2,LSL #1
        0x02028d60:    b2c3        ..      UXTB     r3,r0
        0x02028d62:    f2460010    F...    MOV      r0,#0x6010
        0x02028d66:    f2c40000    ....    MOVT     r0,#0x4000
        0x02028d6a:    2202        ."      MOVS     r2,#2
        0x02028d6c:    f001f99c    ....    BL       set_reg_bits ; 0x202a0a8
        0x02028d70:    e08a        ..      B        0x2028e88 ; PINCTRL_SetPadMux + 408
        0x02028d72:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x02028d76:    2815        .(      CMP      r0,#0x15
        0x02028d78:    d10a        ..      BNE      0x2028d90 ; PINCTRL_SetPadMux + 160
        0x02028d7a:    e7ff        ..      B        0x2028d7c ; PINCTRL_SetPadMux + 140
        0x02028d7c:    9901        ..      LDR      r1,[sp,#4]
        0x02028d7e:    f2460010    F...    MOV      r0,#0x6010
        0x02028d82:    f2c40000    ....    MOVT     r0,#0x4000
        0x02028d86:    2207        ."      MOVS     r2,#7
        0x02028d88:    2314        .#      MOVS     r3,#0x14
        0x02028d8a:    f001f98d    ....    BL       set_reg_bits ; 0x202a0a8
        0x02028d8e:    e07a        z.      B        0x2028e86 ; PINCTRL_SetPadMux + 406
        0x02028d90:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x02028d94:    2816        .(      CMP      r0,#0x16
        0x02028d96:    d10a        ..      BNE      0x2028dae ; PINCTRL_SetPadMux + 190
        0x02028d98:    e7ff        ..      B        0x2028d9a ; PINCTRL_SetPadMux + 170
        0x02028d9a:    9901        ..      LDR      r1,[sp,#4]
        0x02028d9c:    f2460014    F...    MOV      r0,#0x6014
        0x02028da0:    f2c40000    ....    MOVT     r0,#0x4000
        0x02028da4:    2207        ."      MOVS     r2,#7
        0x02028da6:    2300        .#      MOVS     r3,#0
        0x02028da8:    f001f97e    ..~.    BL       set_reg_bits ; 0x202a0a8
        0x02028dac:    e06a        j.      B        0x2028e84 ; PINCTRL_SetPadMux + 404
        0x02028dae:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x02028db2:    281e        .(      CMP      r0,#0x1e
        0x02028db4:    dc10        ..      BGT      0x2028dd8 ; PINCTRL_SetPadMux + 232
        0x02028db6:    e7ff        ..      B        0x2028db8 ; PINCTRL_SetPadMux + 200
        0x02028db8:    9901        ..      LDR      r1,[sp,#4]
        0x02028dba:    f89d200b    ...     LDRB     r2,[sp,#0xb]
        0x02028dbe:    f06f0026    o.&.    MVN      r0,#0x26
        0x02028dc2:    eb000042    ..B.    ADD      r0,r0,r2,LSL #1
        0x02028dc6:    b2c3        ..      UXTB     r3,r0
        0x02028dc8:    f2460014    F...    MOV      r0,#0x6014
        0x02028dcc:    f2c40000    ....    MOVT     r0,#0x4000
        0x02028dd0:    2202        ."      MOVS     r2,#2
        0x02028dd2:    f001f969    ..i.    BL       set_reg_bits ; 0x202a0a8
        0x02028dd6:    e054        T.      B        0x2028e82 ; PINCTRL_SetPadMux + 402
        0x02028dd8:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x02028ddc:    281f        .(      CMP      r0,#0x1f
        0x02028dde:    d10a        ..      BNE      0x2028df6 ; PINCTRL_SetPadMux + 262
        0x02028de0:    e7ff        ..      B        0x2028de2 ; PINCTRL_SetPadMux + 242
        0x02028de2:    9901        ..      LDR      r1,[sp,#4]
        0x02028de4:    f2460014    F...    MOV      r0,#0x6014
        0x02028de8:    f2c40000    ....    MOVT     r0,#0x4000
        0x02028dec:    2207        ."      MOVS     r2,#7
        0x02028dee:    2317        .#      MOVS     r3,#0x17
        0x02028df0:    f001f95a    ..Z.    BL       set_reg_bits ; 0x202a0a8
        0x02028df4:    e044        D.      B        0x2028e80 ; PINCTRL_SetPadMux + 400
        0x02028df6:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x02028dfa:    2820         (      CMP      r0,#0x20
        0x02028dfc:    d10a        ..      BNE      0x2028e14 ; PINCTRL_SetPadMux + 292
        0x02028dfe:    e7ff        ..      B        0x2028e00 ; PINCTRL_SetPadMux + 272
        0x02028e00:    9901        ..      LDR      r1,[sp,#4]
        0x02028e02:    f2460014    F...    MOV      r0,#0x6014
        0x02028e06:    f2c40000    ....    MOVT     r0,#0x4000
        0x02028e0a:    2202        ."      MOVS     r2,#2
        0x02028e0c:    231e        .#      MOVS     r3,#0x1e
        0x02028e0e:    f001f94b    ..K.    BL       set_reg_bits ; 0x202a0a8
        0x02028e12:    e034        4.      B        0x2028e7e ; PINCTRL_SetPadMux + 398
        0x02028e14:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x02028e18:    2821        !(      CMP      r0,#0x21
        0x02028e1a:    d10a        ..      BNE      0x2028e32 ; PINCTRL_SetPadMux + 322
        0x02028e1c:    e7ff        ..      B        0x2028e1e ; PINCTRL_SetPadMux + 302
        0x02028e1e:    9901        ..      LDR      r1,[sp,#4]
        0x02028e20:    f2460018    F...    MOV      r0,#0x6018
        0x02028e24:    f2c40000    ....    MOVT     r0,#0x4000
        0x02028e28:    2202        ."      MOVS     r2,#2
        0x02028e2a:    2300        .#      MOVS     r3,#0
        0x02028e2c:    f001f93c    ..<.    BL       set_reg_bits ; 0x202a0a8
        0x02028e30:    e024        $.      B        0x2028e7c ; PINCTRL_SetPadMux + 396
        0x02028e32:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x02028e36:    2823        #(      CMP      r0,#0x23
        0x02028e38:    dc0f        ..      BGT      0x2028e5a ; PINCTRL_SetPadMux + 362
        0x02028e3a:    e7ff        ..      B        0x2028e3c ; PINCTRL_SetPadMux + 332
        0x02028e3c:    9901        ..      LDR      r1,[sp,#4]
        0x02028e3e:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x02028e42:    ebc000c0    ....    RSB      r0,r0,r0,LSL #3
        0x02028e46:    38ec        .8      SUBS     r0,r0,#0xec
        0x02028e48:    b2c3        ..      UXTB     r3,r0
        0x02028e4a:    f2460018    F...    MOV      r0,#0x6018
        0x02028e4e:    f2c40000    ....    MOVT     r0,#0x4000
        0x02028e52:    2207        ."      MOVS     r2,#7
        0x02028e54:    f001f928    ..(.    BL       set_reg_bits ; 0x202a0a8
        0x02028e58:    e00f        ..      B        0x2028e7a ; PINCTRL_SetPadMux + 394
        0x02028e5a:    9901        ..      LDR      r1,[sp,#4]
        0x02028e5c:    f89d200b    ...     LDRB     r2,[sp,#0xb]
        0x02028e60:    f06f0037    o.7.    MVN      r0,#0x37
        0x02028e64:    eb000042    ..B.    ADD      r0,r0,r2,LSL #1
        0x02028e68:    b2c3        ..      UXTB     r3,r0
        0x02028e6a:    f2460018    F...    MOV      r0,#0x6018
        0x02028e6e:    f2c40000    ....    MOVT     r0,#0x4000
        0x02028e72:    2202        ."      MOVS     r2,#2
        0x02028e74:    f001f918    ....    BL       set_reg_bits ; 0x202a0a8
        0x02028e78:    e7ff        ..      B        0x2028e7a ; PINCTRL_SetPadMux + 394
        0x02028e7a:    e7ff        ..      B        0x2028e7c ; PINCTRL_SetPadMux + 396
        0x02028e7c:    e7ff        ..      B        0x2028e7e ; PINCTRL_SetPadMux + 398
        0x02028e7e:    e7ff        ..      B        0x2028e80 ; PINCTRL_SetPadMux + 400
        0x02028e80:    e7ff        ..      B        0x2028e82 ; PINCTRL_SetPadMux + 402
        0x02028e82:    e7ff        ..      B        0x2028e84 ; PINCTRL_SetPadMux + 404
        0x02028e84:    e7ff        ..      B        0x2028e86 ; PINCTRL_SetPadMux + 406
        0x02028e86:    e7ff        ..      B        0x2028e88 ; PINCTRL_SetPadMux + 408
        0x02028e88:    e7ff        ..      B        0x2028e8a ; PINCTRL_SetPadMux + 410
        0x02028e8a:    2000        .       MOVS     r0,#0
        0x02028e8c:    9003        ..      STR      r0,[sp,#0xc]
        0x02028e8e:    e7ff        ..      B        0x2028e90 ; PINCTRL_SetPadMux + 416
        0x02028e90:    9803        ..      LDR      r0,[sp,#0xc]
        0x02028e92:    b004        ..      ADD      sp,sp,#0x10
        0x02028e94:    bd80        ..      POP      {r7,pc}
        0x02028e96:    0000        ..      MOVS     r0,r0
    SEGGER_RTT_GetAvailWriteSpace
        0x02028e98:    b580        ..      PUSH     {r7,lr}
        0x02028e9a:    b082        ..      SUB      sp,sp,#8
        0x02028e9c:    9001        ..      STR      r0,[sp,#4]
        0x02028e9e:    9801        ..      LDR      r0,[sp,#4]
        0x02028ea0:    eb000140    ..@.    ADD      r1,r0,r0,LSL #1
        0x02028ea4:    f2455030    E.0P    MOV      r0,#0x5530
        0x02028ea8:    f2c20000    ....    MOVT     r0,#0x2000
        0x02028eac:    eb0000c1    ....    ADD      r0,r0,r1,LSL #3
        0x02028eb0:    3018        .0      ADDS     r0,r0,#0x18
        0x02028eb2:    f000fb85    ....    BL       _GetAvailWriteSpace ; 0x20295c0
        0x02028eb6:    b002        ..      ADD      sp,sp,#8
        0x02028eb8:    bd80        ..      POP      {r7,pc}
        0x02028eba:    0000        ..      MOVS     r0,r0
    SEGGER_RTT_Init
        0x02028ebc:    b580        ..      PUSH     {r7,lr}
        0x02028ebe:    f000fb31    ..1.    BL       _DoInit ; 0x2029524
        0x02028ec2:    bd80        ..      POP      {r7,pc}
    SEGGER_RTT_Write
        0x02028ec4:    b580        ..      PUSH     {r7,lr}
        0x02028ec6:    b086        ..      SUB      sp,sp,#0x18
        0x02028ec8:    9005        ..      STR      r0,[sp,#0x14]
        0x02028eca:    9104        ..      STR      r1,[sp,#0x10]
        0x02028ecc:    9203        ..      STR      r2,[sp,#0xc]
        0x02028ece:    e7ff        ..      B        0x2028ed0 ; SEGGER_RTT_Write + 12
        0x02028ed0:    f2455030    E.0P    MOV      r0,#0x5530
        0x02028ed4:    f2c20000    ....    MOVT     r0,#0x2000
        0x02028ed8:    7800        .x      LDRB     r0,[r0,#0]
        0x02028eda:    b918        ..      CBNZ     r0,0x2028ee4 ; SEGGER_RTT_Write + 32
        0x02028edc:    e7ff        ..      B        0x2028ede ; SEGGER_RTT_Write + 26
        0x02028ede:    f000fb21    ..!.    BL       _DoInit ; 0x2029524
        0x02028ee2:    e7ff        ..      B        0x2028ee4 ; SEGGER_RTT_Write + 32
        0x02028ee4:    e7ff        ..      B        0x2028ee6 ; SEGGER_RTT_Write + 34
        0x02028ee6:    f3ef8011    ....    MRS      r0,BASEPRI
        0x02028eea:    f04f0120    O. .    MOV      r1,#0x20
        0x02028eee:    f3818811    ....    MSR      BASEPRI,r1
        0x02028ef2:    9001        ..      STR      r0,[sp,#4]
        0x02028ef4:    9805        ..      LDR      r0,[sp,#0x14]
        0x02028ef6:    9904        ..      LDR      r1,[sp,#0x10]
        0x02028ef8:    9a03        ..      LDR      r2,[sp,#0xc]
        0x02028efa:    f000f807    ....    BL       SEGGER_RTT_WriteNoLock ; 0x2028f0c
        0x02028efe:    9002        ..      STR      r0,[sp,#8]
        0x02028f00:    9801        ..      LDR      r0,[sp,#4]
        0x02028f02:    f3808811    ....    MSR      BASEPRI,r0
        0x02028f06:    9802        ..      LDR      r0,[sp,#8]
        0x02028f08:    b006        ..      ADD      sp,sp,#0x18
        0x02028f0a:    bd80        ..      POP      {r7,pc}
    SEGGER_RTT_WriteNoLock
        0x02028f0c:    b580        ..      PUSH     {r7,lr}
        0x02028f0e:    b08a        ..      SUB      sp,sp,#0x28
        0x02028f10:    9009        ..      STR      r0,[sp,#0x24]
        0x02028f12:    9108        ..      STR      r1,[sp,#0x20]
        0x02028f14:    9207        ..      STR      r2,[sp,#0x1c]
        0x02028f16:    9808        ..      LDR      r0,[sp,#0x20]
        0x02028f18:    9004        ..      STR      r0,[sp,#0x10]
        0x02028f1a:    9809        ..      LDR      r0,[sp,#0x24]
        0x02028f1c:    eb000140    ..@.    ADD      r1,r0,r0,LSL #1
        0x02028f20:    f2455030    E.0P    MOV      r0,#0x5530
        0x02028f24:    f2c20000    ....    MOVT     r0,#0x2000
        0x02028f28:    eb0000c1    ....    ADD      r0,r0,r1,LSL #3
        0x02028f2c:    3018        .0      ADDS     r0,r0,#0x18
        0x02028f2e:    9003        ..      STR      r0,[sp,#0xc]
        0x02028f30:    9803        ..      LDR      r0,[sp,#0xc]
        0x02028f32:    6940        @i      LDR      r0,[r0,#0x14]
        0x02028f34:    9002        ..      STR      r0,[sp,#8]
        0x02028f36:    b140        @.      CBZ      r0,0x2028f4a ; SEGGER_RTT_WriteNoLock + 62
        0x02028f38:    e7ff        ..      B        0x2028f3a ; SEGGER_RTT_WriteNoLock + 46
        0x02028f3a:    9802        ..      LDR      r0,[sp,#8]
        0x02028f3c:    2801        .(      CMP      r0,#1
        0x02028f3e:    d019        ..      BEQ      0x2028f74 ; SEGGER_RTT_WriteNoLock + 104
        0x02028f40:    e7ff        ..      B        0x2028f42 ; SEGGER_RTT_WriteNoLock + 54
        0x02028f42:    9802        ..      LDR      r0,[sp,#8]
        0x02028f44:    2802        .(      CMP      r0,#2
        0x02028f46:    d02c        ,.      BEQ      0x2028fa2 ; SEGGER_RTT_WriteNoLock + 150
        0x02028f48:    e032        2.      B        0x2028fb0 ; SEGGER_RTT_WriteNoLock + 164
        0x02028f4a:    9803        ..      LDR      r0,[sp,#0xc]
        0x02028f4c:    f000fb38    ..8.    BL       _GetAvailWriteSpace ; 0x20295c0
        0x02028f50:    9005        ..      STR      r0,[sp,#0x14]
        0x02028f52:    9805        ..      LDR      r0,[sp,#0x14]
        0x02028f54:    9907        ..      LDR      r1,[sp,#0x1c]
        0x02028f56:    4288        .B      CMP      r0,r1
        0x02028f58:    d203        ..      BCS      0x2028f62 ; SEGGER_RTT_WriteNoLock + 86
        0x02028f5a:    e7ff        ..      B        0x2028f5c ; SEGGER_RTT_WriteNoLock + 80
        0x02028f5c:    2000        .       MOVS     r0,#0
        0x02028f5e:    9006        ..      STR      r0,[sp,#0x18]
        0x02028f60:    e007        ..      B        0x2028f72 ; SEGGER_RTT_WriteNoLock + 102
        0x02028f62:    9807        ..      LDR      r0,[sp,#0x1c]
        0x02028f64:    9006        ..      STR      r0,[sp,#0x18]
        0x02028f66:    9803        ..      LDR      r0,[sp,#0xc]
        0x02028f68:    9904        ..      LDR      r1,[sp,#0x10]
        0x02028f6a:    9a07        ..      LDR      r2,[sp,#0x1c]
        0x02028f6c:    f000fbb8    ....    BL       _WriteNoCheck ; 0x20296e0
        0x02028f70:    e7ff        ..      B        0x2028f72 ; SEGGER_RTT_WriteNoLock + 102
        0x02028f72:    e020         .      B        0x2028fb6 ; SEGGER_RTT_WriteNoLock + 170
        0x02028f74:    9803        ..      LDR      r0,[sp,#0xc]
        0x02028f76:    f000fb23    ..#.    BL       _GetAvailWriteSpace ; 0x20295c0
        0x02028f7a:    9005        ..      STR      r0,[sp,#0x14]
        0x02028f7c:    9805        ..      LDR      r0,[sp,#0x14]
        0x02028f7e:    9907        ..      LDR      r1,[sp,#0x1c]
        0x02028f80:    4288        .B      CMP      r0,r1
        0x02028f82:    d203        ..      BCS      0x2028f8c ; SEGGER_RTT_WriteNoLock + 128
        0x02028f84:    e7ff        ..      B        0x2028f86 ; SEGGER_RTT_WriteNoLock + 122
        0x02028f86:    9805        ..      LDR      r0,[sp,#0x14]
        0x02028f88:    9001        ..      STR      r0,[sp,#4]
        0x02028f8a:    e002        ..      B        0x2028f92 ; SEGGER_RTT_WriteNoLock + 134
        0x02028f8c:    9807        ..      LDR      r0,[sp,#0x1c]
        0x02028f8e:    9001        ..      STR      r0,[sp,#4]
        0x02028f90:    e7ff        ..      B        0x2028f92 ; SEGGER_RTT_WriteNoLock + 134
        0x02028f92:    9801        ..      LDR      r0,[sp,#4]
        0x02028f94:    9006        ..      STR      r0,[sp,#0x18]
        0x02028f96:    9803        ..      LDR      r0,[sp,#0xc]
        0x02028f98:    9904        ..      LDR      r1,[sp,#0x10]
        0x02028f9a:    9a06        ..      LDR      r2,[sp,#0x18]
        0x02028f9c:    f000fba0    ....    BL       _WriteNoCheck ; 0x20296e0
        0x02028fa0:    e009        ..      B        0x2028fb6 ; SEGGER_RTT_WriteNoLock + 170
        0x02028fa2:    9803        ..      LDR      r0,[sp,#0xc]
        0x02028fa4:    9904        ..      LDR      r1,[sp,#0x10]
        0x02028fa6:    9a07        ..      LDR      r2,[sp,#0x1c]
        0x02028fa8:    f000fb2a    ..*.    BL       _WriteBlocking ; 0x2029600
        0x02028fac:    9006        ..      STR      r0,[sp,#0x18]
        0x02028fae:    e002        ..      B        0x2028fb6 ; SEGGER_RTT_WriteNoLock + 170
        0x02028fb0:    2000        .       MOVS     r0,#0
        0x02028fb2:    9006        ..      STR      r0,[sp,#0x18]
        0x02028fb4:    e7ff        ..      B        0x2028fb6 ; SEGGER_RTT_WriteNoLock + 170
        0x02028fb6:    9806        ..      LDR      r0,[sp,#0x18]
        0x02028fb8:    b00a        ..      ADD      sp,sp,#0x28
        0x02028fba:    bd80        ..      POP      {r7,pc}
    SYSCTRL_ClearClkGate
        0x02028fbc:    b580        ..      PUSH     {r7,lr}
        0x02028fbe:    b082        ..      SUB      sp,sp,#8
        0x02028fc0:    f88d0007    ....    STRB     r0,[sp,#7]
        0x02028fc4:    f89d0007    ....    LDRB     r0,[sp,#7]
        0x02028fc8:    2101        .!      MOVS     r1,#1
        0x02028fca:    f000f825    ..%.    BL       SYSCTRL_ClkGateCtrl ; 0x2029018
        0x02028fce:    b002        ..      ADD      sp,sp,#8
        0x02028fd0:    bd80        ..      POP      {r7,pc}
        0x02028fd2:    0000        ..      MOVS     r0,r0
    SYSCTRL_ClearClkGateMulti
        0x02028fd4:    b580        ..      PUSH     {r7,lr}
        0x02028fd6:    b082        ..      SUB      sp,sp,#8
        0x02028fd8:    9001        ..      STR      r0,[sp,#4]
        0x02028fda:    2000        .       MOVS     r0,#0
        0x02028fdc:    f88d0003    ....    STRB     r0,[sp,#3]
        0x02028fe0:    e7ff        ..      B        0x2028fe2 ; SYSCTRL_ClearClkGateMulti + 14
        0x02028fe2:    f89d0003    ....    LDRB     r0,[sp,#3]
        0x02028fe6:    2818        .(      CMP      r0,#0x18
        0x02028fe8:    dc13        ..      BGT      0x2029012 ; SYSCTRL_ClearClkGateMulti + 62
        0x02028fea:    e7ff        ..      B        0x2028fec ; SYSCTRL_ClearClkGateMulti + 24
        0x02028fec:    9801        ..      LDR      r0,[sp,#4]
        0x02028fee:    f89d1003    ....    LDRB     r1,[sp,#3]
        0x02028ff2:    40c8        .@      LSRS     r0,r0,r1
        0x02028ff4:    07c0        ..      LSLS     r0,r0,#31
        0x02028ff6:    b128        (.      CBZ      r0,0x2029004 ; SYSCTRL_ClearClkGateMulti + 48
        0x02028ff8:    e7ff        ..      B        0x2028ffa ; SYSCTRL_ClearClkGateMulti + 38
        0x02028ffa:    f89d0003    ....    LDRB     r0,[sp,#3]
        0x02028ffe:    f7ffffdd    ....    BL       SYSCTRL_ClearClkGate ; 0x2028fbc
        0x02029002:    e7ff        ..      B        0x2029004 ; SYSCTRL_ClearClkGateMulti + 48
        0x02029004:    e7ff        ..      B        0x2029006 ; SYSCTRL_ClearClkGateMulti + 50
        0x02029006:    f89d0003    ....    LDRB     r0,[sp,#3]
        0x0202900a:    3001        .0      ADDS     r0,#1
        0x0202900c:    f88d0003    ....    STRB     r0,[sp,#3]
        0x02029010:    e7e7        ..      B        0x2028fe2 ; SYSCTRL_ClearClkGateMulti + 14
        0x02029012:    b002        ..      ADD      sp,sp,#8
        0x02029014:    bd80        ..      POP      {r7,pc}
        0x02029016:    0000        ..      MOVS     r0,r0
    SYSCTRL_ClkGateCtrl
        0x02029018:    b580        ..      PUSH     {r7,lr}
        0x0202901a:    b086        ..      SUB      sp,sp,#0x18
        0x0202901c:    f88d0017    ....    STRB     r0,[sp,#0x17]
        0x02029020:    f88d1016    ....    STRB     r1,[sp,#0x16]
        0x02029024:    f89d0017    ....    LDRB     r0,[sp,#0x17]
        0x02029028:    4601        .F      MOV      r1,r0
        0x0202902a:    9104        ..      STR      r1,[sp,#0x10]
        0x0202902c:    2818        .(      CMP      r0,#0x18
        0x0202902e:    f20081ab    ....    BHI.W    0x2029388 ; SYSCTRL_ClkGateCtrl + 880
        0x02029032:    9904        ..      LDR      r1,[sp,#0x10]
        0x02029034:    e8dff011    ....    TBH      [pc,r1,LSL #1]
    $d.2
        0x02029038:    002a0019    ..*.    DCD    2752537
        0x0202903c:    004c003b    ;.L.    DCD    4980795
        0x02029040:    006e005d    ].n.    DCD    7209053
        0x02029044:    0090007f    ....    DCD    9437311
        0x02029048:    00b200a1    ....    DCD    11665569
        0x0202904c:    00e300ca    ....    DCD    14876874
        0x02029050:    010500f4    ....    DCD    17105140
        0x02029054:    01270116    ..'.    DCD    19333398
        0x02029058:    01490138    8.I.    DCD    21561656
        0x0202905c:    0163015a    Z.c.    DCD    23265626
        0x02029060:    0175016c    l.u.    DCD    24445292
        0x02029064:    018f017e    ~...    DCD    26149246
        0x02029068:    019f        ..      DCW    415
    $t.3
        0x0202906a:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x0202906e:    200c        .       MOVS     r0,#0xc
        0x02029070:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029074:    2215        ."      MOVS     r2,#0x15
        0x02029076:    f000fffd    ....    BL       set_reg_bit ; 0x202a074
        0x0202907a:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x0202907e:    2014        .       MOVS     r0,#0x14
        0x02029080:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029084:    2212        ."      MOVS     r2,#0x12
        0x02029086:    f000fff5    ....    BL       set_reg_bit ; 0x202a074
        0x0202908a:    e17e        ~.      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x0202908c:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x02029090:    200c        .       MOVS     r0,#0xc
        0x02029092:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029096:    2216        ."      MOVS     r2,#0x16
        0x02029098:    f000ffec    ....    BL       set_reg_bit ; 0x202a074
        0x0202909c:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x020290a0:    2014        .       MOVS     r0,#0x14
        0x020290a2:    f2c40000    ....    MOVT     r0,#0x4000
        0x020290a6:    2212        ."      MOVS     r2,#0x12
        0x020290a8:    f000ffe4    ....    BL       set_reg_bit ; 0x202a074
        0x020290ac:    e16d        m.      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x020290ae:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x020290b2:    200c        .       MOVS     r0,#0xc
        0x020290b4:    f2c40000    ....    MOVT     r0,#0x4000
        0x020290b8:    2202        ."      MOVS     r2,#2
        0x020290ba:    f000ffdb    ....    BL       set_reg_bit ; 0x202a074
        0x020290be:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x020290c2:    2014        .       MOVS     r0,#0x14
        0x020290c4:    f2c40000    ....    MOVT     r0,#0x4000
        0x020290c8:    2200        ."      MOVS     r2,#0
        0x020290ca:    f000ffd3    ....    BL       set_reg_bit ; 0x202a074
        0x020290ce:    e15c        \.      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x020290d0:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x020290d4:    200c        .       MOVS     r0,#0xc
        0x020290d6:    f2c40000    ....    MOVT     r0,#0x4000
        0x020290da:    2203        ."      MOVS     r2,#3
        0x020290dc:    f000ffca    ....    BL       set_reg_bit ; 0x202a074
        0x020290e0:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x020290e4:    2014        .       MOVS     r0,#0x14
        0x020290e6:    f2c40000    ....    MOVT     r0,#0x4000
        0x020290ea:    2201        ."      MOVS     r2,#1
        0x020290ec:    f000ffc2    ....    BL       set_reg_bit ; 0x202a074
        0x020290f0:    e14b        K.      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x020290f2:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x020290f6:    200c        .       MOVS     r0,#0xc
        0x020290f8:    f2c40000    ....    MOVT     r0,#0x4000
        0x020290fc:    2204        ."      MOVS     r2,#4
        0x020290fe:    f000ffb9    ....    BL       set_reg_bit ; 0x202a074
        0x02029102:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x02029106:    2014        .       MOVS     r0,#0x14
        0x02029108:    f2c40000    ....    MOVT     r0,#0x4000
        0x0202910c:    2202        ."      MOVS     r2,#2
        0x0202910e:    f000ffb1    ....    BL       set_reg_bit ; 0x202a074
        0x02029112:    e13a        :.      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x02029114:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x02029118:    200c        .       MOVS     r0,#0xc
        0x0202911a:    f2c40000    ....    MOVT     r0,#0x4000
        0x0202911e:    2201        ."      MOVS     r2,#1
        0x02029120:    f000ffa8    ....    BL       set_reg_bit ; 0x202a074
        0x02029124:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x02029128:    2014        .       MOVS     r0,#0x14
        0x0202912a:    f2c40000    ....    MOVT     r0,#0x4000
        0x0202912e:    2211        ."      MOVS     r2,#0x11
        0x02029130:    f000ffa0    ....    BL       set_reg_bit ; 0x202a074
        0x02029134:    e129        ).      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x02029136:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x0202913a:    200c        .       MOVS     r0,#0xc
        0x0202913c:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029140:    2205        ."      MOVS     r2,#5
        0x02029142:    f000ff97    ....    BL       set_reg_bit ; 0x202a074
        0x02029146:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x0202914a:    2014        .       MOVS     r0,#0x14
        0x0202914c:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029150:    220a        ."      MOVS     r2,#0xa
        0x02029152:    f000ff8f    ....    BL       set_reg_bit ; 0x202a074
        0x02029156:    e118        ..      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x02029158:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x0202915c:    200c        .       MOVS     r0,#0xc
        0x0202915e:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029162:    2208        ."      MOVS     r2,#8
        0x02029164:    f000ff86    ....    BL       set_reg_bit ; 0x202a074
        0x02029168:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x0202916c:    2014        .       MOVS     r0,#0x14
        0x0202916e:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029172:    2209        ."      MOVS     r2,#9
        0x02029174:    f000ff7e    ..~.    BL       set_reg_bit ; 0x202a074
        0x02029178:    e107        ..      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x0202917a:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x0202917e:    200c        .       MOVS     r0,#0xc
        0x02029180:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029184:    2209        ."      MOVS     r2,#9
        0x02029186:    f000ff75    ..u.    BL       set_reg_bit ; 0x202a074
        0x0202918a:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x0202918e:    2054        T       MOVS     r0,#0x54
        0x02029190:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029194:    220c        ."      MOVS     r2,#0xc
        0x02029196:    f000ff6d    ..m.    BL       set_reg_bit ; 0x202a074
        0x0202919a:    e0f6        ..      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x0202919c:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x020291a0:    200c        .       MOVS     r0,#0xc
        0x020291a2:    f2c40000    ....    MOVT     r0,#0x4000
        0x020291a6:    220a        ."      MOVS     r2,#0xa
        0x020291a8:    f000ff64    ..d.    BL       set_reg_bit ; 0x202a074
        0x020291ac:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x020291b0:    2014        .       MOVS     r0,#0x14
        0x020291b2:    f2c40000    ....    MOVT     r0,#0x4000
        0x020291b6:    9003        ..      STR      r0,[sp,#0xc]
        0x020291b8:    2213        ."      MOVS     r2,#0x13
        0x020291ba:    f000ff5b    ..[.    BL       set_reg_bit ; 0x202a074
        0x020291be:    9803        ..      LDR      r0,[sp,#0xc]
        0x020291c0:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x020291c4:    2214        ."      MOVS     r2,#0x14
        0x020291c6:    f000ff55    ..U.    BL       set_reg_bit ; 0x202a074
        0x020291ca:    e0de        ..      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x020291cc:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x020291d0:    200c        .       MOVS     r0,#0xc
        0x020291d2:    f2c40000    ....    MOVT     r0,#0x4000
        0x020291d6:    220b        ."      MOVS     r2,#0xb
        0x020291d8:    9201        ..      STR      r2,[sp,#4]
        0x020291da:    f000ff4b    ..K.    BL       set_reg_bit ; 0x202a074
        0x020291de:    9a01        ..      LDR      r2,[sp,#4]
        0x020291e0:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x020291e4:    2014        .       MOVS     r0,#0x14
        0x020291e6:    f2c40000    ....    MOVT     r0,#0x4000
        0x020291ea:    9002        ..      STR      r0,[sp,#8]
        0x020291ec:    f000ff42    ..B.    BL       set_reg_bit ; 0x202a074
        0x020291f0:    9802        ..      LDR      r0,[sp,#8]
        0x020291f2:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x020291f6:    2210        ."      MOVS     r2,#0x10
        0x020291f8:    f000ff3c    ..<.    BL       set_reg_bit ; 0x202a074
        0x020291fc:    e0c5        ..      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x020291fe:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x02029202:    200c        .       MOVS     r0,#0xc
        0x02029204:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029208:    220c        ."      MOVS     r2,#0xc
        0x0202920a:    f000ff33    ..3.    BL       set_reg_bit ; 0x202a074
        0x0202920e:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x02029212:    2008        .       MOVS     r0,#8
        0x02029214:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029218:    2200        ."      MOVS     r2,#0
        0x0202921a:    f000ff2b    ..+.    BL       set_reg_bit ; 0x202a074
        0x0202921e:    e0b4        ..      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x02029220:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x02029224:    200c        .       MOVS     r0,#0xc
        0x02029226:    f2c40000    ....    MOVT     r0,#0x4000
        0x0202922a:    220d        ."      MOVS     r2,#0xd
        0x0202922c:    f000ff22    ..".    BL       set_reg_bit ; 0x202a074
        0x02029230:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x02029234:    2014        .       MOVS     r0,#0x14
        0x02029236:    f2c40000    ....    MOVT     r0,#0x4000
        0x0202923a:    2206        ."      MOVS     r2,#6
        0x0202923c:    f000ff1a    ....    BL       set_reg_bit ; 0x202a074
        0x02029240:    e0a3        ..      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x02029242:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x02029246:    200c        .       MOVS     r0,#0xc
        0x02029248:    f2c40000    ....    MOVT     r0,#0x4000
        0x0202924c:    220e        ."      MOVS     r2,#0xe
        0x0202924e:    f000ff11    ....    BL       set_reg_bit ; 0x202a074
        0x02029252:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x02029256:    2014        .       MOVS     r0,#0x14
        0x02029258:    f2c40000    ....    MOVT     r0,#0x4000
        0x0202925c:    2207        ."      MOVS     r2,#7
        0x0202925e:    f000ff09    ....    BL       set_reg_bit ; 0x202a074
        0x02029262:    e092        ..      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x02029264:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x02029268:    200c        .       MOVS     r0,#0xc
        0x0202926a:    f2c40000    ....    MOVT     r0,#0x4000
        0x0202926e:    220f        ."      MOVS     r2,#0xf
        0x02029270:    f000ff00    ....    BL       set_reg_bit ; 0x202a074
        0x02029274:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x02029278:    2014        .       MOVS     r0,#0x14
        0x0202927a:    f2c40000    ....    MOVT     r0,#0x4000
        0x0202927e:    220c        ."      MOVS     r2,#0xc
        0x02029280:    f000fef8    ....    BL       set_reg_bit ; 0x202a074
        0x02029284:    e081        ..      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x02029286:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x0202928a:    200c        .       MOVS     r0,#0xc
        0x0202928c:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029290:    2210        ."      MOVS     r2,#0x10
        0x02029292:    f000feef    ....    BL       set_reg_bit ; 0x202a074
        0x02029296:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x0202929a:    2014        .       MOVS     r0,#0x14
        0x0202929c:    f2c40000    ....    MOVT     r0,#0x4000
        0x020292a0:    2208        ."      MOVS     r2,#8
        0x020292a2:    f000fee7    ....    BL       set_reg_bit ; 0x202a074
        0x020292a6:    e070        p.      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x020292a8:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x020292ac:    200c        .       MOVS     r0,#0xc
        0x020292ae:    f2c40000    ....    MOVT     r0,#0x4000
        0x020292b2:    2211        ."      MOVS     r2,#0x11
        0x020292b4:    f000fede    ....    BL       set_reg_bit ; 0x202a074
        0x020292b8:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x020292bc:    2014        .       MOVS     r0,#0x14
        0x020292be:    f2c40000    ....    MOVT     r0,#0x4000
        0x020292c2:    2204        ."      MOVS     r2,#4
        0x020292c4:    f000fed6    ....    BL       set_reg_bit ; 0x202a074
        0x020292c8:    e05f        _.      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x020292ca:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x020292ce:    200c        .       MOVS     r0,#0xc
        0x020292d0:    f2c40000    ....    MOVT     r0,#0x4000
        0x020292d4:    2212        ."      MOVS     r2,#0x12
        0x020292d6:    f000fecd    ....    BL       set_reg_bit ; 0x202a074
        0x020292da:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x020292de:    2014        .       MOVS     r0,#0x14
        0x020292e0:    f2c40000    ....    MOVT     r0,#0x4000
        0x020292e4:    2205        ."      MOVS     r2,#5
        0x020292e6:    f000fec5    ....    BL       set_reg_bit ; 0x202a074
        0x020292ea:    e04e        N.      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x020292ec:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x020292f0:    200c        .       MOVS     r0,#0xc
        0x020292f2:    f2c40000    ....    MOVT     r0,#0x4000
        0x020292f6:    2213        ."      MOVS     r2,#0x13
        0x020292f8:    f000febc    ....    BL       set_reg_bit ; 0x202a074
        0x020292fc:    e045        E.      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x020292fe:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x02029302:    200c        .       MOVS     r0,#0xc
        0x02029304:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029308:    2214        ."      MOVS     r2,#0x14
        0x0202930a:    f000feb3    ....    BL       set_reg_bit ; 0x202a074
        0x0202930e:    e03c        <.      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x02029310:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x02029314:    200c        .       MOVS     r0,#0xc
        0x02029316:    f2c40000    ....    MOVT     r0,#0x4000
        0x0202931a:    2200        ."      MOVS     r2,#0
        0x0202931c:    f000feaa    ....    BL       set_reg_bit ; 0x202a074
        0x02029320:    e033        3.      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x02029322:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x02029326:    200c        .       MOVS     r0,#0xc
        0x02029328:    f2c40000    ....    MOVT     r0,#0x4000
        0x0202932c:    2206        ."      MOVS     r2,#6
        0x0202932e:    f000fea1    ....    BL       set_reg_bit ; 0x202a074
        0x02029332:    e02a        *.      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x02029334:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x02029338:    200c        .       MOVS     r0,#0xc
        0x0202933a:    f2c40000    ....    MOVT     r0,#0x4000
        0x0202933e:    2217        ."      MOVS     r2,#0x17
        0x02029340:    f000fe98    ....    BL       set_reg_bit ; 0x202a074
        0x02029344:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x02029348:    2014        .       MOVS     r0,#0x14
        0x0202934a:    f2c40000    ....    MOVT     r0,#0x4000
        0x0202934e:    220e        ."      MOVS     r2,#0xe
        0x02029350:    f000fe90    ....    BL       set_reg_bit ; 0x202a074
        0x02029354:    e019        ..      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x02029356:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x0202935a:    2080        .       MOVS     r0,#0x80
        0x0202935c:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029360:    9000        ..      STR      r0,[sp,#0]
        0x02029362:    2205        ."      MOVS     r2,#5
        0x02029364:    f000fe86    ....    BL       set_reg_bit ; 0x202a074
        0x02029368:    9800        ..      LDR      r0,[sp,#0]
        0x0202936a:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x0202936e:    2207        ."      MOVS     r2,#7
        0x02029370:    f000fe80    ....    BL       set_reg_bit ; 0x202a074
        0x02029374:    e009        ..      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x02029376:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x0202937a:    200c        .       MOVS     r0,#0xc
        0x0202937c:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029380:    2219        ."      MOVS     r2,#0x19
        0x02029382:    f000fe77    ..w.    BL       set_reg_bit ; 0x202a074
        0x02029386:    e000        ..      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x02029388:    e7ff        ..      B        0x202938a ; SYSCTRL_ClkGateCtrl + 882
        0x0202938a:    b006        ..      ADD      sp,sp,#0x18
        0x0202938c:    bd80        ..      POP      {r7,pc}
        0x0202938e:    0000        ..      MOVS     r0,r0
    SYSCTRL_GetDmaId
        0x02029390:    b085        ..      SUB      sp,sp,#0x14
        0x02029392:    f88d000f    ....    STRB     r0,[sp,#0xf]
        0x02029396:    2000        .       MOVS     r0,#0
        0x02029398:    9002        ..      STR      r0,[sp,#8]
        0x0202939a:    2030        0       MOVS     r0,#0x30
        0x0202939c:    f2c40000    ....    MOVT     r0,#0x4000
        0x020293a0:    6800        .h      LDR      r0,[r0,#0]
        0x020293a2:    9001        ..      STR      r0,[sp,#4]
        0x020293a4:    f89d000f    ....    LDRB     r0,[sp,#0xf]
        0x020293a8:    2810        .(      CMP      r0,#0x10
        0x020293aa:    db0d        ..      BLT      0x20293c8 ; SYSCTRL_GetDmaId + 56
        0x020293ac:    e7ff        ..      B        0x20293ae ; SYSCTRL_GetDmaId + 30
        0x020293ae:    2008        .       MOVS     r0,#8
        0x020293b0:    9002        ..      STR      r0,[sp,#8]
        0x020293b2:    f89d000f    ....    LDRB     r0,[sp,#0xf]
        0x020293b6:    3810        .8      SUBS     r0,r0,#0x10
        0x020293b8:    f88d000f    ....    STRB     r0,[sp,#0xf]
        0x020293bc:    2034        4       MOVS     r0,#0x34
        0x020293be:    f2c40000    ....    MOVT     r0,#0x4000
        0x020293c2:    6800        .h      LDR      r0,[r0,#0]
        0x020293c4:    9001        ..      STR      r0,[sp,#4]
        0x020293c6:    e7ff        ..      B        0x20293c8 ; SYSCTRL_GetDmaId + 56
        0x020293c8:    2000        .       MOVS     r0,#0
        0x020293ca:    9000        ..      STR      r0,[sp,#0]
        0x020293cc:    e7ff        ..      B        0x20293ce ; SYSCTRL_GetDmaId + 62
        0x020293ce:    9800        ..      LDR      r0,[sp,#0]
        0x020293d0:    281c        .(      CMP      r0,#0x1c
        0x020293d2:    dc19        ..      BGT      0x2029408 ; SYSCTRL_GetDmaId + 120
        0x020293d4:    e7ff        ..      B        0x20293d6 ; SYSCTRL_GetDmaId + 70
        0x020293d6:    9801        ..      LDR      r0,[sp,#4]
        0x020293d8:    f000000f    ....    AND      r0,r0,#0xf
        0x020293dc:    f89d100f    ....    LDRB     r1,[sp,#0xf]
        0x020293e0:    4288        .B      CMP      r0,r1
        0x020293e2:    d109        ..      BNE      0x20293f8 ; SYSCTRL_GetDmaId + 104
        0x020293e4:    e7ff        ..      B        0x20293e6 ; SYSCTRL_GetDmaId + 86
        0x020293e6:    9802        ..      LDR      r0,[sp,#8]
        0x020293e8:    9900        ..      LDR      r1,[sp,#0]
        0x020293ea:    17ca        ..      ASRS     r2,r1,#31
        0x020293ec:    eb017192    ...q    ADD      r1,r1,r2,LSR #30
        0x020293f0:    eb0000a1    ....    ADD      r0,r0,r1,ASR #2
        0x020293f4:    9004        ..      STR      r0,[sp,#0x10]
        0x020293f6:    e00b        ..      B        0x2029410 ; SYSCTRL_GetDmaId + 128
        0x020293f8:    9801        ..      LDR      r0,[sp,#4]
        0x020293fa:    0900        ..      LSRS     r0,r0,#4
        0x020293fc:    9001        ..      STR      r0,[sp,#4]
        0x020293fe:    e7ff        ..      B        0x2029400 ; SYSCTRL_GetDmaId + 112
        0x02029400:    9800        ..      LDR      r0,[sp,#0]
        0x02029402:    3004        .0      ADDS     r0,#4
        0x02029404:    9000        ..      STR      r0,[sp,#0]
        0x02029406:    e7e2        ..      B        0x20293ce ; SYSCTRL_GetDmaId + 62
        0x02029408:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x0202940c:    9004        ..      STR      r0,[sp,#0x10]
        0x0202940e:    e7ff        ..      B        0x2029410 ; SYSCTRL_GetDmaId + 128
        0x02029410:    9804        ..      LDR      r0,[sp,#0x10]
        0x02029412:    b005        ..      ADD      sp,sp,#0x14
        0x02029414:    4770        pG      BX       lr
        0x02029416:    0000        ..      MOVS     r0,r0
    SYSCTRL_GetPLLClk
        0x02029418:    b580        ..      PUSH     {r7,lr}
        0x0202941a:    b084        ..      SUB      sp,sp,#0x10
        0x0202941c:    f24010a8    @...    MOVW     r0,#0x1a8
        0x02029420:    f2c40010    ....    MOVT     r0,#0x4010
        0x02029424:    6800        .h      LDR      r0,[r0,#0]
        0x02029426:    02c0        ..      LSLS     r0,r0,#11
        0x02029428:    2800        .(      CMP      r0,#0
        0x0202942a:    d518        ..      BPL      0x202945e ; SYSCTRL_GetPLLClk + 70
        0x0202942c:    e7ff        ..      B        0x202942e ; SYSCTRL_GetPLLClk + 22
        0x0202942e:    2140        @!      MOVS     r1,#0x40
        0x02029430:    f2c40100    ....    MOVT     r1,#0x4000
        0x02029434:    9101        ..      STR      r1,[sp,#4]
        0x02029436:    6808        .h      LDR      r0,[r1,#0]
        0x02029438:    f3c00045    ..E.    UBFX     r0,r0,#1,#6
        0x0202943c:    6809        .h      LDR      r1,[r1,#0]
        0x0202943e:    f3c131c5    ...1    UBFX     r1,r1,#15,#6
        0x02029442:    4348        HC      MULS     r0,r1,r0
        0x02029444:    9002        ..      STR      r0,[sp,#8]
        0x02029446:    f000f811    ....    BL       SYSCTRL_GetSlowClk ; 0x202946c
        0x0202944a:    9901        ..      LDR      r1,[sp,#4]
        0x0202944c:    9a02        ..      LDR      r2,[sp,#8]
        0x0202944e:    fbb0f0f2    ....    UDIV     r0,r0,r2
        0x02029452:    6809        .h      LDR      r1,[r1,#0]
        0x02029454:    f3c111c7    ....    UBFX     r1,r1,#7,#8
        0x02029458:    4348        HC      MULS     r0,r1,r0
        0x0202945a:    9003        ..      STR      r0,[sp,#0xc]
        0x0202945c:    e002        ..      B        0x2029464 ; SYSCTRL_GetPLLClk + 76
        0x0202945e:    2000        .       MOVS     r0,#0
        0x02029460:    9003        ..      STR      r0,[sp,#0xc]
        0x02029462:    e7ff        ..      B        0x2029464 ; SYSCTRL_GetPLLClk + 76
        0x02029464:    9803        ..      LDR      r0,[sp,#0xc]
        0x02029466:    b004        ..      ADD      sp,sp,#0x10
        0x02029468:    bd80        ..      POP      {r7,pc}
        0x0202946a:    0000        ..      MOVS     r0,r0
    SYSCTRL_GetSlowClk
        0x0202946c:    b083        ..      SUB      sp,sp,#0xc
        0x0202946e:    f2420010    B...    MOV      r0,#0x2010
        0x02029472:    f2c40010    ....    MOVT     r0,#0x4010
        0x02029476:    6800        .h      LDR      r0,[r0,#0]
        0x02029478:    f3c02000    ...     UBFX     r0,r0,#8,#1
        0x0202947c:    f88d0007    ....    STRB     r0,[sp,#7]
        0x02029480:    f89d0007    ....    LDRB     r0,[sp,#7]
        0x02029484:    b130        0.      CBZ      r0,0x2029494 ; SYSCTRL_GetSlowClk + 40
        0x02029486:    e7ff        ..      B        0x2029488 ; SYSCTRL_GetSlowClk + 28
        0x02029488:    f2436000    C..`    MOVW     r0,#0x3600
        0x0202948c:    f2c0106e    ..n.    MOVT     r0,#0x16e
        0x02029490:    9002        ..      STR      r0,[sp,#8]
        0x02029492:    e039        9.      B        0x2029508 ; SYSCTRL_GetSlowClk + 156
        0x02029494:    f240107c    @.|.    MOVW     r0,#0x17c
        0x02029498:    f2c40010    ....    MOVT     r0,#0x4010
        0x0202949c:    6800        .h      LDR      r0,[r0,#0]
        0x0202949e:    f3c03004    ...0    UBFX     r0,r0,#12,#5
        0x020294a2:    4601        .F      MOV      r1,r0
        0x020294a4:    9100        ..      STR      r1,[sp,#0]
        0x020294a6:    280f        .(      CMP      r0,#0xf
        0x020294a8:    d828        (.      BHI      0x20294fc ; SYSCTRL_GetSlowClk + 144
        0x020294aa:    9900        ..      LDR      r1,[sp,#0]
        0x020294ac:    e8dff001    ....    TBB      [pc,r1]
    $d.29
        0x020294b0:    14260e08    ..&.    DCD    338038280
        0x020294b4:    1a262626    &&&.    DCD    438707750
        0x020294b8:    26262626    &&&&    DCD    640034342
        0x020294bc:    20262626    &&&     DCD    539371046
    $t.30
        0x020294c0:    f2412000    A..     MOVW     r0,#0x1200
        0x020294c4:    f2c0007a    ..z.    MOVT     r0,#0x7a
        0x020294c8:    9002        ..      STR      r0,[sp,#8]
        0x020294ca:    e01d        ..      B        0x2029508 ; SYSCTRL_GetSlowClk + 156
        0x020294cc:    f2424000    B..@    MOVW     r0,#0x2400
        0x020294d0:    f2c000f4    ....    MOVT     r0,#0xf4
        0x020294d4:    9002        ..      STR      r0,[sp,#8]
        0x020294d6:    e017        ..      B        0x2029508 ; SYSCTRL_GetSlowClk + 156
        0x020294d8:    f2436000    C..`    MOVW     r0,#0x3600
        0x020294dc:    f2c0106e    ..n.    MOVT     r0,#0x16e
        0x020294e0:    9002        ..      STR      r0,[sp,#8]
        0x020294e2:    e011        ..      B        0x2029508 ; SYSCTRL_GetSlowClk + 156
        0x020294e4:    f6440000    D...    MOVW     r0,#0x4800
        0x020294e8:    f2c010e8    ....    MOVT     r0,#0x1e8
        0x020294ec:    9002        ..      STR      r0,[sp,#8]
        0x020294ee:    e00b        ..      B        0x2029508 ; SYSCTRL_GetSlowClk + 156
        0x020294f0:    f6464000    F..@    MOVW     r0,#0x6c00
        0x020294f4:    f2c020dc    ...     MOVT     r0,#0x2dc
        0x020294f8:    9002        ..      STR      r0,[sp,#8]
        0x020294fa:    e005        ..      B        0x2029508 ; SYSCTRL_GetSlowClk + 156
        0x020294fc:    f2490000    I...    MOVW     r0,#0x9000
        0x02029500:    f2c030d0    ...0    MOVT     r0,#0x3d0
        0x02029504:    9002        ..      STR      r0,[sp,#8]
        0x02029506:    e7ff        ..      B        0x2029508 ; SYSCTRL_GetSlowClk + 156
        0x02029508:    9802        ..      LDR      r0,[sp,#8]
        0x0202950a:    b003        ..      ADD      sp,sp,#0xc
        0x0202950c:    4770        pG      BX       lr
        0x0202950e:    0000        ..      MOVS     r0,r0
    UART_SendData
        0x02029510:    b082        ..      SUB      sp,sp,#8
        0x02029512:    9001        ..      STR      r0,[sp,#4]
        0x02029514:    f88d1003    ....    STRB     r1,[sp,#3]
        0x02029518:    f89d0003    ....    LDRB     r0,[sp,#3]
        0x0202951c:    9901        ..      LDR      r1,[sp,#4]
        0x0202951e:    6008        .`      STR      r0,[r1,#0]
        0x02029520:    b002        ..      ADD      sp,sp,#8
        0x02029522:    4770        pG      BX       lr
    _DoInit
        0x02029524:    b580        ..      PUSH     {r7,lr}
        0x02029526:    b082        ..      SUB      sp,sp,#8
        0x02029528:    f2455030    E.0P    MOV      r0,#0x5530
        0x0202952c:    f2c20000    ....    MOVT     r0,#0x2000
        0x02029530:    9001        ..      STR      r0,[sp,#4]
        0x02029532:    9901        ..      LDR      r1,[sp,#4]
        0x02029534:    2001        .       MOVS     r0,#1
        0x02029536:    6108        .a      STR      r0,[r1,#0x10]
        0x02029538:    9901        ..      LDR      r1,[sp,#4]
        0x0202953a:    6148        Ha      STR      r0,[r1,#0x14]
        0x0202953c:    9801        ..      LDR      r0,[sp,#4]
        0x0202953e:    f24b0105    K...    MOV      r1,#0xb005
        0x02029542:    f2c02102    ...!    MOVT     r1,#0x202
        0x02029546:    6181        .a      STR      r1,[r0,#0x18]
        0x02029548:    9a01        ..      LDR      r2,[sp,#4]
        0x0202954a:    f2455088    E..P    MOV      r0,#0x5588
        0x0202954e:    f2c20000    ....    MOVT     r0,#0x2000
        0x02029552:    61d0        .a      STR      r0,[r2,#0x1c]
        0x02029554:    9a01        ..      LDR      r2,[sp,#4]
        0x02029556:    f44f70fa    O..p    MOV      r0,#0x1f4
        0x0202955a:    6210        .b      STR      r0,[r2,#0x20]
        0x0202955c:    9a01        ..      LDR      r2,[sp,#4]
        0x0202955e:    2000        .       MOVS     r0,#0
        0x02029560:    6290        .b      STR      r0,[r2,#0x28]
        0x02029562:    9a01        ..      LDR      r2,[sp,#4]
        0x02029564:    6250        Pb      STR      r0,[r2,#0x24]
        0x02029566:    9a01        ..      LDR      r2,[sp,#4]
        0x02029568:    62d0        .b      STR      r0,[r2,#0x2c]
        0x0202956a:    9a01        ..      LDR      r2,[sp,#4]
        0x0202956c:    6311        .c      STR      r1,[r2,#0x30]
        0x0202956e:    9a01        ..      LDR      r2,[sp,#4]
        0x02029570:    f2455178    E.xQ    MOV      r1,#0x5578
        0x02029574:    f2c20100    ....    MOVT     r1,#0x2000
        0x02029578:    6351        Qc      STR      r1,[r2,#0x34]
        0x0202957a:    9a01        ..      LDR      r2,[sp,#4]
        0x0202957c:    2110        .!      MOVS     r1,#0x10
        0x0202957e:    6391        .c      STR      r1,[r2,#0x38]
        0x02029580:    9901        ..      LDR      r1,[sp,#4]
        0x02029582:    6408        .d      STR      r0,[r1,#0x40]
        0x02029584:    9901        ..      LDR      r1,[sp,#4]
        0x02029586:    63c8        .c      STR      r0,[r1,#0x3c]
        0x02029588:    9901        ..      LDR      r1,[sp,#4]
        0x0202958a:    6448        Hd      STR      r0,[r1,#0x44]
        0x0202958c:    9801        ..      LDR      r0,[sp,#4]
        0x0202958e:    3007        .0      ADDS     r0,#7
        0x02029590:    f24b0101    K...    MOV      r1,#0xb001
        0x02029594:    f2c02102    ...!    MOVT     r1,#0x202
        0x02029598:    f7fefd82    ....    BL       strcpy ; 0x20280a0
        0x0202959c:    f3bf8f5f    .._.    DMB      
        0x020295a0:    9801        ..      LDR      r0,[sp,#4]
        0x020295a2:    f64a71fa    J..q    MOV      r1,#0xaffa
        0x020295a6:    f2c02102    ...!    MOVT     r1,#0x202
        0x020295aa:    f7fefd79    ..y.    BL       strcpy ; 0x20280a0
        0x020295ae:    f3bf8f5f    .._.    DMB      
        0x020295b2:    9901        ..      LDR      r1,[sp,#4]
        0x020295b4:    2020                MOVS     r0,#0x20
        0x020295b6:    7188        .q      STRB     r0,[r1,#6]
        0x020295b8:    f3bf8f5f    .._.    DMB      
        0x020295bc:    b002        ..      ADD      sp,sp,#8
        0x020295be:    bd80        ..      POP      {r7,pc}
    _GetAvailWriteSpace
        0x020295c0:    b084        ..      SUB      sp,sp,#0x10
        0x020295c2:    9003        ..      STR      r0,[sp,#0xc]
        0x020295c4:    9803        ..      LDR      r0,[sp,#0xc]
        0x020295c6:    6900        .i      LDR      r0,[r0,#0x10]
        0x020295c8:    9002        ..      STR      r0,[sp,#8]
        0x020295ca:    9803        ..      LDR      r0,[sp,#0xc]
        0x020295cc:    68c0        .h      LDR      r0,[r0,#0xc]
        0x020295ce:    9001        ..      STR      r0,[sp,#4]
        0x020295d0:    9802        ..      LDR      r0,[sp,#8]
        0x020295d2:    9901        ..      LDR      r1,[sp,#4]
        0x020295d4:    4288        .B      CMP      r0,r1
        0x020295d6:    d809        ..      BHI      0x20295ec ; _GetAvailWriteSpace + 44
        0x020295d8:    e7ff        ..      B        0x20295da ; _GetAvailWriteSpace + 26
        0x020295da:    9803        ..      LDR      r0,[sp,#0xc]
        0x020295dc:    6880        .h      LDR      r0,[r0,#8]
        0x020295de:    9901        ..      LDR      r1,[sp,#4]
        0x020295e0:    1a40        @.      SUBS     r0,r0,r1
        0x020295e2:    9902        ..      LDR      r1,[sp,#8]
        0x020295e4:    4408        .D      ADD      r0,r0,r1
        0x020295e6:    3801        .8      SUBS     r0,#1
        0x020295e8:    9000        ..      STR      r0,[sp,#0]
        0x020295ea:    e005        ..      B        0x20295f8 ; _GetAvailWriteSpace + 56
        0x020295ec:    9902        ..      LDR      r1,[sp,#8]
        0x020295ee:    9801        ..      LDR      r0,[sp,#4]
        0x020295f0:    43c0        .C      MVNS     r0,r0
        0x020295f2:    4408        .D      ADD      r0,r0,r1
        0x020295f4:    9000        ..      STR      r0,[sp,#0]
        0x020295f6:    e7ff        ..      B        0x20295f8 ; _GetAvailWriteSpace + 56
        0x020295f8:    9800        ..      LDR      r0,[sp,#0]
        0x020295fa:    b004        ..      ADD      sp,sp,#0x10
        0x020295fc:    4770        pG      BX       lr
        0x020295fe:    0000        ..      MOVS     r0,r0
    _WriteBlocking
        0x02029600:    b580        ..      PUSH     {r7,lr}
        0x02029602:    b08a        ..      SUB      sp,sp,#0x28
        0x02029604:    9009        ..      STR      r0,[sp,#0x24]
        0x02029606:    9108        ..      STR      r1,[sp,#0x20]
        0x02029608:    9207        ..      STR      r2,[sp,#0x1c]
        0x0202960a:    2000        .       MOVS     r0,#0
        0x0202960c:    9005        ..      STR      r0,[sp,#0x14]
        0x0202960e:    9809        ..      LDR      r0,[sp,#0x24]
        0x02029610:    68c0        .h      LDR      r0,[r0,#0xc]
        0x02029612:    9003        ..      STR      r0,[sp,#0xc]
        0x02029614:    e7ff        ..      B        0x2029616 ; _WriteBlocking + 22
        0x02029616:    9809        ..      LDR      r0,[sp,#0x24]
        0x02029618:    6900        .i      LDR      r0,[r0,#0x10]
        0x0202961a:    9004        ..      STR      r0,[sp,#0x10]
        0x0202961c:    9804        ..      LDR      r0,[sp,#0x10]
        0x0202961e:    9903        ..      LDR      r1,[sp,#0xc]
        0x02029620:    4288        .B      CMP      r0,r1
        0x02029622:    d906        ..      BLS      0x2029632 ; _WriteBlocking + 50
        0x02029624:    e7ff        ..      B        0x2029626 ; _WriteBlocking + 38
        0x02029626:    9904        ..      LDR      r1,[sp,#0x10]
        0x02029628:    9803        ..      LDR      r0,[sp,#0xc]
        0x0202962a:    43c0        .C      MVNS     r0,r0
        0x0202962c:    4408        .D      ADD      r0,r0,r1
        0x0202962e:    9006        ..      STR      r0,[sp,#0x18]
        0x02029630:    e008        ..      B        0x2029644 ; _WriteBlocking + 68
        0x02029632:    9809        ..      LDR      r0,[sp,#0x24]
        0x02029634:    6881        .h      LDR      r1,[r0,#8]
        0x02029636:    9803        ..      LDR      r0,[sp,#0xc]
        0x02029638:    9a04        ..      LDR      r2,[sp,#0x10]
        0x0202963a:    1a80        ..      SUBS     r0,r0,r2
        0x0202963c:    43c0        .C      MVNS     r0,r0
        0x0202963e:    4408        .D      ADD      r0,r0,r1
        0x02029640:    9006        ..      STR      r0,[sp,#0x18]
        0x02029642:    e7ff        ..      B        0x2029644 ; _WriteBlocking + 68
        0x02029644:    9806        ..      LDR      r0,[sp,#0x18]
        0x02029646:    9909        ..      LDR      r1,[sp,#0x24]
        0x02029648:    6889        .h      LDR      r1,[r1,#8]
        0x0202964a:    9a03        ..      LDR      r2,[sp,#0xc]
        0x0202964c:    1a89        ..      SUBS     r1,r1,r2
        0x0202964e:    4288        .B      CMP      r0,r1
        0x02029650:    d203        ..      BCS      0x202965a ; _WriteBlocking + 90
        0x02029652:    e7ff        ..      B        0x2029654 ; _WriteBlocking + 84
        0x02029654:    9806        ..      LDR      r0,[sp,#0x18]
        0x02029656:    9002        ..      STR      r0,[sp,#8]
        0x02029658:    e005        ..      B        0x2029666 ; _WriteBlocking + 102
        0x0202965a:    9809        ..      LDR      r0,[sp,#0x24]
        0x0202965c:    6880        .h      LDR      r0,[r0,#8]
        0x0202965e:    9903        ..      LDR      r1,[sp,#0xc]
        0x02029660:    1a40        @.      SUBS     r0,r0,r1
        0x02029662:    9002        ..      STR      r0,[sp,#8]
        0x02029664:    e7ff        ..      B        0x2029666 ; _WriteBlocking + 102
        0x02029666:    9802        ..      LDR      r0,[sp,#8]
        0x02029668:    9006        ..      STR      r0,[sp,#0x18]
        0x0202966a:    9806        ..      LDR      r0,[sp,#0x18]
        0x0202966c:    9907        ..      LDR      r1,[sp,#0x1c]
        0x0202966e:    4288        .B      CMP      r0,r1
        0x02029670:    d203        ..      BCS      0x202967a ; _WriteBlocking + 122
        0x02029672:    e7ff        ..      B        0x2029674 ; _WriteBlocking + 116
        0x02029674:    9806        ..      LDR      r0,[sp,#0x18]
        0x02029676:    9001        ..      STR      r0,[sp,#4]
        0x02029678:    e002        ..      B        0x2029680 ; _WriteBlocking + 128
        0x0202967a:    9807        ..      LDR      r0,[sp,#0x1c]
        0x0202967c:    9001        ..      STR      r0,[sp,#4]
        0x0202967e:    e7ff        ..      B        0x2029680 ; _WriteBlocking + 128
        0x02029680:    9801        ..      LDR      r0,[sp,#4]
        0x02029682:    9006        ..      STR      r0,[sp,#0x18]
        0x02029684:    9809        ..      LDR      r0,[sp,#0x24]
        0x02029686:    6840        @h      LDR      r0,[r0,#4]
        0x02029688:    9903        ..      LDR      r1,[sp,#0xc]
        0x0202968a:    4408        .D      ADD      r0,r0,r1
        0x0202968c:    9908        ..      LDR      r1,[sp,#0x20]
        0x0202968e:    9a06        ..      LDR      r2,[sp,#0x18]
        0x02029690:    f7fefce2    ....    BL       __aeabi_memcpy ; 0x2028058
        0x02029694:    9906        ..      LDR      r1,[sp,#0x18]
        0x02029696:    9805        ..      LDR      r0,[sp,#0x14]
        0x02029698:    4408        .D      ADD      r0,r0,r1
        0x0202969a:    9005        ..      STR      r0,[sp,#0x14]
        0x0202969c:    9906        ..      LDR      r1,[sp,#0x18]
        0x0202969e:    9808        ..      LDR      r0,[sp,#0x20]
        0x020296a0:    4408        .D      ADD      r0,r0,r1
        0x020296a2:    9008        ..      STR      r0,[sp,#0x20]
        0x020296a4:    9906        ..      LDR      r1,[sp,#0x18]
        0x020296a6:    9807        ..      LDR      r0,[sp,#0x1c]
        0x020296a8:    1a40        @.      SUBS     r0,r0,r1
        0x020296aa:    9007        ..      STR      r0,[sp,#0x1c]
        0x020296ac:    9906        ..      LDR      r1,[sp,#0x18]
        0x020296ae:    9803        ..      LDR      r0,[sp,#0xc]
        0x020296b0:    4408        .D      ADD      r0,r0,r1
        0x020296b2:    9003        ..      STR      r0,[sp,#0xc]
        0x020296b4:    9803        ..      LDR      r0,[sp,#0xc]
        0x020296b6:    9909        ..      LDR      r1,[sp,#0x24]
        0x020296b8:    6889        .h      LDR      r1,[r1,#8]
        0x020296ba:    4288        .B      CMP      r0,r1
        0x020296bc:    d103        ..      BNE      0x20296c6 ; _WriteBlocking + 198
        0x020296be:    e7ff        ..      B        0x20296c0 ; _WriteBlocking + 192
        0x020296c0:    2000        .       MOVS     r0,#0
        0x020296c2:    9003        ..      STR      r0,[sp,#0xc]
        0x020296c4:    e7ff        ..      B        0x20296c6 ; _WriteBlocking + 198
        0x020296c6:    f3bf8f5f    .._.    DMB      
        0x020296ca:    9803        ..      LDR      r0,[sp,#0xc]
        0x020296cc:    9909        ..      LDR      r1,[sp,#0x24]
        0x020296ce:    60c8        .`      STR      r0,[r1,#0xc]
        0x020296d0:    e7ff        ..      B        0x20296d2 ; _WriteBlocking + 210
        0x020296d2:    9807        ..      LDR      r0,[sp,#0x1c]
        0x020296d4:    2800        .(      CMP      r0,#0
        0x020296d6:    d19e        ..      BNE      0x2029616 ; _WriteBlocking + 22
        0x020296d8:    e7ff        ..      B        0x20296da ; _WriteBlocking + 218
        0x020296da:    9805        ..      LDR      r0,[sp,#0x14]
        0x020296dc:    b00a        ..      ADD      sp,sp,#0x28
        0x020296de:    bd80        ..      POP      {r7,pc}
    _WriteNoCheck
        0x020296e0:    b580        ..      PUSH     {r7,lr}
        0x020296e2:    b086        ..      SUB      sp,sp,#0x18
        0x020296e4:    9005        ..      STR      r0,[sp,#0x14]
        0x020296e6:    9104        ..      STR      r1,[sp,#0x10]
        0x020296e8:    9203        ..      STR      r2,[sp,#0xc]
        0x020296ea:    9805        ..      LDR      r0,[sp,#0x14]
        0x020296ec:    68c0        .h      LDR      r0,[r0,#0xc]
        0x020296ee:    9001        ..      STR      r0,[sp,#4]
        0x020296f0:    9805        ..      LDR      r0,[sp,#0x14]
        0x020296f2:    6880        .h      LDR      r0,[r0,#8]
        0x020296f4:    9901        ..      LDR      r1,[sp,#4]
        0x020296f6:    1a40        @.      SUBS     r0,r0,r1
        0x020296f8:    9000        ..      STR      r0,[sp,#0]
        0x020296fa:    9800        ..      LDR      r0,[sp,#0]
        0x020296fc:    9903        ..      LDR      r1,[sp,#0xc]
        0x020296fe:    4288        .B      CMP      r0,r1
        0x02029700:    d910        ..      BLS      0x2029724 ; _WriteNoCheck + 68
        0x02029702:    e7ff        ..      B        0x2029704 ; _WriteNoCheck + 36
        0x02029704:    9805        ..      LDR      r0,[sp,#0x14]
        0x02029706:    6840        @h      LDR      r0,[r0,#4]
        0x02029708:    9901        ..      LDR      r1,[sp,#4]
        0x0202970a:    4408        .D      ADD      r0,r0,r1
        0x0202970c:    9904        ..      LDR      r1,[sp,#0x10]
        0x0202970e:    9a03        ..      LDR      r2,[sp,#0xc]
        0x02029710:    f7fefca2    ....    BL       __aeabi_memcpy ; 0x2028058
        0x02029714:    f3bf8f5f    .._.    DMB      
        0x02029718:    9801        ..      LDR      r0,[sp,#4]
        0x0202971a:    9903        ..      LDR      r1,[sp,#0xc]
        0x0202971c:    4408        .D      ADD      r0,r0,r1
        0x0202971e:    9905        ..      LDR      r1,[sp,#0x14]
        0x02029720:    60c8        .`      STR      r0,[r1,#0xc]
        0x02029722:    e01b        ..      B        0x202975c ; _WriteNoCheck + 124
        0x02029724:    9800        ..      LDR      r0,[sp,#0]
        0x02029726:    9002        ..      STR      r0,[sp,#8]
        0x02029728:    9805        ..      LDR      r0,[sp,#0x14]
        0x0202972a:    6840        @h      LDR      r0,[r0,#4]
        0x0202972c:    9901        ..      LDR      r1,[sp,#4]
        0x0202972e:    4408        .D      ADD      r0,r0,r1
        0x02029730:    9904        ..      LDR      r1,[sp,#0x10]
        0x02029732:    9a02        ..      LDR      r2,[sp,#8]
        0x02029734:    f7fefc90    ....    BL       __aeabi_memcpy ; 0x2028058
        0x02029738:    9803        ..      LDR      r0,[sp,#0xc]
        0x0202973a:    9900        ..      LDR      r1,[sp,#0]
        0x0202973c:    1a40        @.      SUBS     r0,r0,r1
        0x0202973e:    9002        ..      STR      r0,[sp,#8]
        0x02029740:    9805        ..      LDR      r0,[sp,#0x14]
        0x02029742:    6840        @h      LDR      r0,[r0,#4]
        0x02029744:    9904        ..      LDR      r1,[sp,#0x10]
        0x02029746:    9a00        ..      LDR      r2,[sp,#0]
        0x02029748:    4411        .D      ADD      r1,r1,r2
        0x0202974a:    9a02        ..      LDR      r2,[sp,#8]
        0x0202974c:    f7fefc84    ....    BL       __aeabi_memcpy ; 0x2028058
        0x02029750:    f3bf8f5f    .._.    DMB      
        0x02029754:    9802        ..      LDR      r0,[sp,#8]
        0x02029756:    9905        ..      LDR      r1,[sp,#0x14]
        0x02029758:    60c8        .`      STR      r0,[r1,#0xc]
        0x0202975a:    e7ff        ..      B        0x202975c ; _WriteNoCheck + 124
        0x0202975c:    b006        ..      ADD      sp,sp,#0x18
        0x0202975e:    bd80        ..      POP      {r7,pc}
    apSSP_ClearIntStatus
        0x02029760:    b082        ..      SUB      sp,sp,#8
        0x02029762:    9001        ..      STR      r0,[sp,#4]
        0x02029764:    9100        ..      STR      r1,[sp,#0]
        0x02029766:    9a00        ..      LDR      r2,[sp,#0]
        0x02029768:    9901        ..      LDR      r1,[sp,#4]
        0x0202976a:    6bc8        .k      LDR      r0,[r1,#0x3c]
        0x0202976c:    4310        .C      ORRS     r0,r0,r2
        0x0202976e:    63c8        .c      STR      r0,[r1,#0x3c]
        0x02029770:    b002        ..      ADD      sp,sp,#8
        0x02029772:    4770        pG      BX       lr
    apSSP_DeviceParametersSet
        0x02029774:    b580        ..      PUSH     {r7,lr}
        0x02029776:    b082        ..      SUB      sp,sp,#8
        0x02029778:    9001        ..      STR      r0,[sp,#4]
        0x0202977a:    9100        ..      STR      r1,[sp,#0]
        0x0202977c:    9801        ..      LDR      r0,[sp,#4]
        0x0202977e:    f000f871    ..q.    BL       apSSP_Initialize ; 0x2029864
        0x02029782:    9900        ..      LDR      r1,[sp,#0]
        0x02029784:    7848        Hx      LDRB     r0,[r1,#1]
        0x02029786:    f891c002    ....    LDRB     r12,[r1,#2]
        0x0202978a:    78cb        .x      LDRB     r3,[r1,#3]
        0x0202978c:    790a        .y      LDRB     r2,[r1,#4]
        0x0202978e:    ea40004c    @.L.    ORR      r0,r0,r12,LSL #1
        0x02029792:    ea4000c3    @...    ORR      r0,r0,r3,LSL #3
        0x02029796:    ea402002    @..     ORR      r0,r0,r2,LSL #8
        0x0202979a:    794a        Jy      LDRB     r2,[r1,#5]
        0x0202979c:    ea400082    @...    ORR      r0,r0,r2,LSL #2
        0x020297a0:    7c89        .|      LDRB     r1,[r1,#0x12]
        0x020297a2:    ea404001    @..@    ORR      r0,r0,r1,LSL #16
        0x020297a6:    9901        ..      LDR      r1,[sp,#4]
        0x020297a8:    6108        .a      STR      r0,[r1,#0x10]
        0x020297aa:    9900        ..      LDR      r1,[sp,#0]
        0x020297ac:    7988        .y      LDRB     r0,[r1,#6]
        0x020297ae:    f891c007    ....    LDRB     r12,[r1,#7]
        0x020297b2:    7b0b        .{      LDRB     r3,[r1,#0xc]
        0x020297b4:    7b4a        J{      LDRB     r2,[r1,#0xd]
        0x020297b6:    0600        ..      LSLS     r0,r0,#24
        0x020297b8:    ea40508c    @..P    ORR      r0,r0,r12,LSL #22
        0x020297bc:    f8b1e008    ....    LDRH     lr,[r1,#8]
        0x020297c0:    f24f0c00    O...    MOVW     r12,#0xf000
        0x020297c4:    f6cf7cff    ...|    MOVT     r12,#0xffff
        0x020297c8:    eb0c3c0e    ...<    ADD      r12,r12,lr,LSL #12
        0x020297cc:    ea40000c    @...    ORR      r0,r0,r12
        0x020297d0:    f8b1c00a    ....    LDRH     r12,[r1,#0xa]
        0x020297d4:    f1ac0c01    ....    SUB      r12,r12,#1
        0x020297d8:    ea40000c    @...    ORR      r0,r0,r12
        0x020297dc:    ea407043    @.Cp    ORR      r0,r0,r3,LSL #29
        0x020297e0:    ea407082    @..p    ORR      r0,r0,r2,LSL #30
        0x020297e4:    7c49        I|      LDRB     r1,[r1,#0x11]
        0x020297e6:    ea4070c1    @..p    ORR      r0,r0,r1,LSL #31
        0x020297ea:    9901        ..      LDR      r1,[sp,#4]
        0x020297ec:    6208        .b      STR      r0,[r1,#0x20]
        0x020297ee:    9801        ..      LDR      r0,[sp,#4]
        0x020297f0:    9900        ..      LDR      r1,[sp,#0]
        0x020297f2:    7bc9        .{      LDRB     r1,[r1,#0xf]
        0x020297f4:    f000f8ec    ....    BL       apSSP_SetTxThres ; 0x20299d0
        0x020297f8:    9801        ..      LDR      r0,[sp,#4]
        0x020297fa:    9900        ..      LDR      r1,[sp,#0]
        0x020297fc:    7c09        .|      LDRB     r1,[r1,#0x10]
        0x020297fe:    f000f889    ....    BL       apSSP_SetRxThres ; 0x2029914
        0x02029802:    9801        ..      LDR      r0,[sp,#4]
        0x02029804:    9900        ..      LDR      r1,[sp,#0]
        0x02029806:    7809        .x      LDRB     r1,[r1,#0]
        0x02029808:    f000f896    ....    BL       apSSP_SetTimingSclkDiv ; 0x2029938
        0x0202980c:    9801        ..      LDR      r0,[sp,#4]
        0x0202980e:    9900        ..      LDR      r1,[sp,#0]
        0x02029810:    7b89        .{      LDRB     r1,[r1,#0xe]
        0x02029812:    f000f83f    ..?.    BL       apSSP_IntEnable ; 0x2029894
        0x02029816:    b002        ..      ADD      sp,sp,#8
        0x02029818:    bd80        ..      POP      {r7,pc}
        0x0202981a:    0000        ..      MOVS     r0,r0
    apSSP_GetDataNumInRxFifo
        0x0202981c:    b081        ..      SUB      sp,sp,#4
        0x0202981e:    9000        ..      STR      r0,[sp,#0]
        0x02029820:    9800        ..      LDR      r0,[sp,#0]
        0x02029822:    6b40        @k      LDR      r0,[r0,#0x34]
        0x02029824:    f3c02005    ...     UBFX     r0,r0,#8,#6
        0x02029828:    9900        ..      LDR      r1,[sp,#0]
        0x0202982a:    6b4a        Jk      LDR      r2,[r1,#0x34]
        0x0202982c:    21c0        .!      MOVS     r1,#0xc0
        0x0202982e:    ea014192    ...A    AND      r1,r1,r2,LSR #18
        0x02029832:    4408        .D      ADD      r0,r0,r1
        0x02029834:    b001        ..      ADD      sp,sp,#4
        0x02029836:    4770        pG      BX       lr
    apSSP_GetIntRawStatus
        0x02029838:    b081        ..      SUB      sp,sp,#4
        0x0202983a:    9000        ..      STR      r0,[sp,#0]
        0x0202983c:    9800        ..      LDR      r0,[sp,#0]
        0x0202983e:    6bc0        .k      LDR      r0,[r0,#0x3c]
        0x02029840:    b001        ..      ADD      sp,sp,#4
        0x02029842:    4770        pG      BX       lr
    apSSP_GetSlaveRxDataCnt
        0x02029844:    b081        ..      SUB      sp,sp,#4
        0x02029846:    9000        ..      STR      r0,[sp,#0]
        0x02029848:    9800        ..      LDR      r0,[sp,#0]
        0x0202984a:    6e40        @n      LDR      r0,[r0,#0x64]
        0x0202984c:    f36f209f    o..     BFC      r0,#10,#22
        0x02029850:    b001        ..      ADD      sp,sp,#4
        0x02029852:    4770        pG      BX       lr
    apSSP_GetSlaveTxDataCnt
        0x02029854:    b081        ..      SUB      sp,sp,#4
        0x02029856:    9000        ..      STR      r0,[sp,#0]
        0x02029858:    9800        ..      LDR      r0,[sp,#0]
        0x0202985a:    6e40        @n      LDR      r0,[r0,#0x64]
        0x0202985c:    f3c04009    ...@    UBFX     r0,r0,#16,#10
        0x02029860:    b001        ..      ADD      sp,sp,#4
        0x02029862:    4770        pG      BX       lr
    apSSP_Initialize
        0x02029864:    b580        ..      PUSH     {r7,lr}
        0x02029866:    b082        ..      SUB      sp,sp,#8
        0x02029868:    9001        ..      STR      r0,[sp,#4]
        0x0202986a:    9901        ..      LDR      r1,[sp,#4]
        0x0202986c:    6b08        .k      LDR      r0,[r1,#0x30]
        0x0202986e:    f0400001    @...    ORR      r0,r0,#1
        0x02029872:    6308        .c      STR      r0,[r1,#0x30]
        0x02029874:    e7ff        ..      B        0x2029876 ; apSSP_Initialize + 18
        0x02029876:    9801        ..      LDR      r0,[sp,#4]
        0x02029878:    6b00        .k      LDR      r0,[r0,#0x30]
        0x0202987a:    07c0        ..      LSLS     r0,r0,#31
        0x0202987c:    b108        ..      CBZ      r0,0x2029882 ; apSSP_Initialize + 30
        0x0202987e:    e7ff        ..      B        0x2029880 ; apSSP_Initialize + 28
        0x02029880:    e7f9        ..      B        0x2029876 ; apSSP_Initialize + 18
        0x02029882:    9801        ..      LDR      r0,[sp,#4]
        0x02029884:    f000f822    ..".    BL       apSSP_ResetTxFifo ; 0x20298cc
        0x02029888:    9801        ..      LDR      r0,[sp,#4]
        0x0202988a:    f000f80d    ....    BL       apSSP_ResetRxFifo ; 0x20298a8
        0x0202988e:    b002        ..      ADD      sp,sp,#8
        0x02029890:    bd80        ..      POP      {r7,pc}
        0x02029892:    0000        ..      MOVS     r0,r0
    apSSP_IntEnable
        0x02029894:    b082        ..      SUB      sp,sp,#8
        0x02029896:    9001        ..      STR      r0,[sp,#4]
        0x02029898:    9100        ..      STR      r1,[sp,#0]
        0x0202989a:    9a00        ..      LDR      r2,[sp,#0]
        0x0202989c:    9901        ..      LDR      r1,[sp,#4]
        0x0202989e:    6b88        .k      LDR      r0,[r1,#0x38]
        0x020298a0:    4310        .C      ORRS     r0,r0,r2
        0x020298a2:    6388        .c      STR      r0,[r1,#0x38]
        0x020298a4:    b002        ..      ADD      sp,sp,#8
        0x020298a6:    4770        pG      BX       lr
    apSSP_ResetRxFifo
        0x020298a8:    b081        ..      SUB      sp,sp,#4
        0x020298aa:    9000        ..      STR      r0,[sp,#0]
        0x020298ac:    9900        ..      LDR      r1,[sp,#0]
        0x020298ae:    6b08        .k      LDR      r0,[r1,#0x30]
        0x020298b0:    f0400002    @...    ORR      r0,r0,#2
        0x020298b4:    6308        .c      STR      r0,[r1,#0x30]
        0x020298b6:    e7ff        ..      B        0x20298b8 ; apSSP_ResetRxFifo + 16
        0x020298b8:    9800        ..      LDR      r0,[sp,#0]
        0x020298ba:    6b00        .k      LDR      r0,[r0,#0x30]
        0x020298bc:    0840        @.      LSRS     r0,r0,#1
        0x020298be:    07c0        ..      LSLS     r0,r0,#31
        0x020298c0:    b108        ..      CBZ      r0,0x20298c6 ; apSSP_ResetRxFifo + 30
        0x020298c2:    e7ff        ..      B        0x20298c4 ; apSSP_ResetRxFifo + 28
        0x020298c4:    e7f8        ..      B        0x20298b8 ; apSSP_ResetRxFifo + 16
        0x020298c6:    b001        ..      ADD      sp,sp,#4
        0x020298c8:    4770        pG      BX       lr
        0x020298ca:    0000        ..      MOVS     r0,r0
    apSSP_ResetTxFifo
        0x020298cc:    b081        ..      SUB      sp,sp,#4
        0x020298ce:    9000        ..      STR      r0,[sp,#0]
        0x020298d0:    9900        ..      LDR      r1,[sp,#0]
        0x020298d2:    6b08        .k      LDR      r0,[r1,#0x30]
        0x020298d4:    f0400004    @...    ORR      r0,r0,#4
        0x020298d8:    6308        .c      STR      r0,[r1,#0x30]
        0x020298da:    e7ff        ..      B        0x20298dc ; apSSP_ResetTxFifo + 16
        0x020298dc:    9800        ..      LDR      r0,[sp,#0]
        0x020298de:    6b00        .k      LDR      r0,[r0,#0x30]
        0x020298e0:    0880        ..      LSRS     r0,r0,#2
        0x020298e2:    07c0        ..      LSLS     r0,r0,#31
        0x020298e4:    b108        ..      CBZ      r0,0x20298ea ; apSSP_ResetTxFifo + 30
        0x020298e6:    e7ff        ..      B        0x20298e8 ; apSSP_ResetTxFifo + 28
        0x020298e8:    e7f8        ..      B        0x20298dc ; apSSP_ResetTxFifo + 16
        0x020298ea:    b001        ..      ADD      sp,sp,#4
        0x020298ec:    4770        pG      BX       lr
        0x020298ee:    0000        ..      MOVS     r0,r0
    apSSP_SetRxDmaEn
        0x020298f0:    b082        ..      SUB      sp,sp,#8
        0x020298f2:    9001        ..      STR      r0,[sp,#4]
        0x020298f4:    f88d1003    ....    STRB     r1,[sp,#3]
        0x020298f8:    9901        ..      LDR      r1,[sp,#4]
        0x020298fa:    6b08        .k      LDR      r0,[r1,#0x30]
        0x020298fc:    f0200008     ...    BIC      r0,r0,#8
        0x02029900:    6308        .c      STR      r0,[r1,#0x30]
        0x02029902:    f89d2003    ...     LDRB     r2,[sp,#3]
        0x02029906:    9901        ..      LDR      r1,[sp,#4]
        0x02029908:    6b08        .k      LDR      r0,[r1,#0x30]
        0x0202990a:    ea4000c2    @...    ORR      r0,r0,r2,LSL #3
        0x0202990e:    6308        .c      STR      r0,[r1,#0x30]
        0x02029910:    b002        ..      ADD      sp,sp,#8
        0x02029912:    4770        pG      BX       lr
    apSSP_SetRxThres
        0x02029914:    b082        ..      SUB      sp,sp,#8
        0x02029916:    9001        ..      STR      r0,[sp,#4]
        0x02029918:    f88d1003    ....    STRB     r1,[sp,#3]
        0x0202991c:    9901        ..      LDR      r1,[sp,#4]
        0x0202991e:    6b08        .k      LDR      r0,[r1,#0x30]
        0x02029920:    f420407f     ..@    BIC      r0,r0,#0xff00
        0x02029924:    6308        .c      STR      r0,[r1,#0x30]
        0x02029926:    f89d2003    ...     LDRB     r2,[sp,#3]
        0x0202992a:    9901        ..      LDR      r1,[sp,#4]
        0x0202992c:    6b08        .k      LDR      r0,[r1,#0x30]
        0x0202992e:    ea402002    @..     ORR      r0,r0,r2,LSL #8
        0x02029932:    6308        .c      STR      r0,[r1,#0x30]
        0x02029934:    b002        ..      ADD      sp,sp,#8
        0x02029936:    4770        pG      BX       lr
    apSSP_SetTimingSclkDiv
        0x02029938:    b082        ..      SUB      sp,sp,#8
        0x0202993a:    9001        ..      STR      r0,[sp,#4]
        0x0202993c:    f88d1003    ....    STRB     r1,[sp,#3]
        0x02029940:    9901        ..      LDR      r1,[sp,#4]
        0x02029942:    6c08        .l      LDR      r0,[r1,#0x40]
        0x02029944:    f02000ff     ...    BIC      r0,r0,#0xff
        0x02029948:    6408        .d      STR      r0,[r1,#0x40]
        0x0202994a:    f89d2003    ...     LDRB     r2,[sp,#3]
        0x0202994e:    9901        ..      LDR      r1,[sp,#4]
        0x02029950:    6c08        .l      LDR      r0,[r1,#0x40]
        0x02029952:    4310        .C      ORRS     r0,r0,r2
        0x02029954:    6408        .d      STR      r0,[r1,#0x40]
        0x02029956:    b002        ..      ADD      sp,sp,#8
        0x02029958:    4770        pG      BX       lr
        0x0202995a:    0000        ..      MOVS     r0,r0
    apSSP_SetTransferControlRdTranCnt
        0x0202995c:    b082        ..      SUB      sp,sp,#8
        0x0202995e:    9001        ..      STR      r0,[sp,#4]
        0x02029960:    9100        ..      STR      r1,[sp,#0]
        0x02029962:    9901        ..      LDR      r1,[sp,#4]
        0x02029964:    6a08        .j      LDR      r0,[r1,#0x20]
        0x02029966:    f24012ff    @...    MOV      r2,#0x1ff
        0x0202996a:    4390        .C      BICS     r0,r0,r2
        0x0202996c:    6208        .b      STR      r0,[r1,#0x20]
        0x0202996e:    9800        ..      LDR      r0,[sp,#0]
        0x02029970:    1e42        B.      SUBS     r2,r0,#1
        0x02029972:    9901        ..      LDR      r1,[sp,#4]
        0x02029974:    6a08        .j      LDR      r0,[r1,#0x20]
        0x02029976:    4310        .C      ORRS     r0,r0,r2
        0x02029978:    6208        .b      STR      r0,[r1,#0x20]
        0x0202997a:    b002        ..      ADD      sp,sp,#8
        0x0202997c:    4770        pG      BX       lr
        0x0202997e:    0000        ..      MOVS     r0,r0
    apSSP_SetTransferControlWrTranCnt
        0x02029980:    b082        ..      SUB      sp,sp,#8
        0x02029982:    9001        ..      STR      r0,[sp,#4]
        0x02029984:    9100        ..      STR      r1,[sp,#0]
        0x02029986:    9901        ..      LDR      r1,[sp,#4]
        0x02029988:    6a08        .j      LDR      r0,[r1,#0x20]
        0x0202998a:    f36f3014    o..0    BFC      r0,#12,#9
        0x0202998e:    6208        .b      STR      r0,[r1,#0x20]
        0x02029990:    9900        ..      LDR      r1,[sp,#0]
        0x02029992:    f24f0000    O...    MOVW     r0,#0xf000
        0x02029996:    f6cf70ff    ...p    MOVT     r0,#0xffff
        0x0202999a:    eb003201    ...2    ADD      r2,r0,r1,LSL #12
        0x0202999e:    9901        ..      LDR      r1,[sp,#4]
        0x020299a0:    6a08        .j      LDR      r0,[r1,#0x20]
        0x020299a2:    4310        .C      ORRS     r0,r0,r2
        0x020299a4:    6208        .b      STR      r0,[r1,#0x20]
        0x020299a6:    b002        ..      ADD      sp,sp,#8
        0x020299a8:    4770        pG      BX       lr
        0x020299aa:    0000        ..      MOVS     r0,r0
    apSSP_SetTxDmaEn
        0x020299ac:    b082        ..      SUB      sp,sp,#8
        0x020299ae:    9001        ..      STR      r0,[sp,#4]
        0x020299b0:    f88d1003    ....    STRB     r1,[sp,#3]
        0x020299b4:    9901        ..      LDR      r1,[sp,#4]
        0x020299b6:    6b08        .k      LDR      r0,[r1,#0x30]
        0x020299b8:    f0200010     ...    BIC      r0,r0,#0x10
        0x020299bc:    6308        .c      STR      r0,[r1,#0x30]
        0x020299be:    f89d2003    ...     LDRB     r2,[sp,#3]
        0x020299c2:    9901        ..      LDR      r1,[sp,#4]
        0x020299c4:    6b08        .k      LDR      r0,[r1,#0x30]
        0x020299c6:    ea401002    @...    ORR      r0,r0,r2,LSL #4
        0x020299ca:    6308        .c      STR      r0,[r1,#0x30]
        0x020299cc:    b002        ..      ADD      sp,sp,#8
        0x020299ce:    4770        pG      BX       lr
    apSSP_SetTxThres
        0x020299d0:    b082        ..      SUB      sp,sp,#8
        0x020299d2:    9001        ..      STR      r0,[sp,#4]
        0x020299d4:    f88d1003    ....    STRB     r1,[sp,#3]
        0x020299d8:    9901        ..      LDR      r1,[sp,#4]
        0x020299da:    6b08        .k      LDR      r0,[r1,#0x30]
        0x020299dc:    f420007f     ...    BIC      r0,r0,#0xff0000
        0x020299e0:    6308        .c      STR      r0,[r1,#0x30]
        0x020299e2:    f89d2003    ...     LDRB     r2,[sp,#3]
        0x020299e6:    9901        ..      LDR      r1,[sp,#4]
        0x020299e8:    6b08        .k      LDR      r0,[r1,#0x30]
        0x020299ea:    ea404002    @..@    ORR      r0,r0,r2,LSL #16
        0x020299ee:    6308        .c      STR      r0,[r1,#0x30]
        0x020299f0:    b002        ..      ADD      sp,sp,#8
        0x020299f2:    4770        pG      BX       lr
    apUART_BaudRateSet
        0x020299f4:    b086        ..      SUB      sp,sp,#0x18
        0x020299f6:    9005        ..      STR      r0,[sp,#0x14]
        0x020299f8:    9104        ..      STR      r1,[sp,#0x10]
        0x020299fa:    9203        ..      STR      r2,[sp,#0xc]
        0x020299fc:    9804        ..      LDR      r0,[sp,#0x10]
        0x020299fe:    00c0        ..      LSLS     r0,r0,#3
        0x02029a00:    9903        ..      LDR      r1,[sp,#0xc]
        0x02029a02:    fbb0f0f1    ....    UDIV     r0,r0,r1
        0x02029a06:    9002        ..      STR      r0,[sp,#8]
        0x02029a08:    9802        ..      LDR      r0,[sp,#8]
        0x02029a0a:    09c0        ..      LSRS     r0,r0,#7
        0x02029a0c:    9001        ..      STR      r0,[sp,#4]
        0x02029a0e:    9901        ..      LDR      r1,[sp,#4]
        0x02029a10:    9802        ..      LDR      r0,[sp,#8]
        0x02029a12:    eba010c1    ....    SUB      r0,r0,r1,LSL #7
        0x02029a16:    9002        ..      STR      r0,[sp,#8]
        0x02029a18:    9802        ..      LDR      r0,[sp,#8]
        0x02029a1a:    3001        .0      ADDS     r0,#1
        0x02029a1c:    0840        @.      LSRS     r0,r0,#1
        0x02029a1e:    9000        ..      STR      r0,[sp,#0]
        0x02029a20:    9801        ..      LDR      r0,[sp,#4]
        0x02029a22:    9905        ..      LDR      r1,[sp,#0x14]
        0x02029a24:    6248        Hb      STR      r0,[r1,#0x24]
        0x02029a26:    f8bd0006    ....    LDRH     r0,[sp,#6]
        0x02029a2a:    b918        ..      CBNZ     r0,0x2029a34 ; apUART_BaudRateSet + 64
        0x02029a2c:    e7ff        ..      B        0x2029a2e ; apUART_BaudRateSet + 58
        0x02029a2e:    9801        ..      LDR      r0,[sp,#4]
        0x02029a30:    b910        ..      CBNZ     r0,0x2029a38 ; apUART_BaudRateSet + 68
        0x02029a32:    e7ff        ..      B        0x2029a34 ; apUART_BaudRateSet + 64
        0x02029a34:    e7ff        ..      B        0x2029a36 ; apUART_BaudRateSet + 66
        0x02029a36:    e7fe        ..      B        0x2029a36 ; apUART_BaudRateSet + 66
        0x02029a38:    9801        ..      LDR      r0,[sp,#4]
        0x02029a3a:    f64f71ff    O..q    MOV      r1,#0xffff
        0x02029a3e:    4288        .B      CMP      r0,r1
        0x02029a40:    d104        ..      BNE      0x2029a4c ; apUART_BaudRateSet + 88
        0x02029a42:    e7ff        ..      B        0x2029a44 ; apUART_BaudRateSet + 80
        0x02029a44:    9905        ..      LDR      r1,[sp,#0x14]
        0x02029a46:    2000        .       MOVS     r0,#0
        0x02029a48:    6288        .b      STR      r0,[r1,#0x28]
        0x02029a4a:    e007        ..      B        0x2029a5c ; apUART_BaudRateSet + 104
        0x02029a4c:    9901        ..      LDR      r1,[sp,#4]
        0x02029a4e:    9802        ..      LDR      r0,[sp,#8]
        0x02029a50:    1a40        @.      SUBS     r0,r0,r1
        0x02029a52:    9002        ..      STR      r0,[sp,#8]
        0x02029a54:    9800        ..      LDR      r0,[sp,#0]
        0x02029a56:    9905        ..      LDR      r1,[sp,#0x14]
        0x02029a58:    6288        .b      STR      r0,[r1,#0x28]
        0x02029a5a:    e7ff        ..      B        0x2029a5c ; apUART_BaudRateSet + 104
        0x02029a5c:    9805        ..      LDR      r0,[sp,#0x14]
        0x02029a5e:    6ac0        .j      LDR      r0,[r0,#0x2c]
        0x02029a60:    9905        ..      LDR      r1,[sp,#0x14]
        0x02029a62:    62c8        .b      STR      r0,[r1,#0x2c]
        0x02029a64:    b006        ..      ADD      sp,sp,#0x18
        0x02029a66:    4770        pG      BX       lr
    apUART_Check_TXFIFO_FULL
        0x02029a68:    b081        ..      SUB      sp,sp,#4
        0x02029a6a:    9000        ..      STR      r0,[sp,#0]
        0x02029a6c:    9800        ..      LDR      r0,[sp,#0]
        0x02029a6e:    6980        .i      LDR      r0,[r0,#0x18]
        0x02029a70:    f3c01040    ..@.    UBFX     r0,r0,#5,#1
        0x02029a74:    b001        ..      ADD      sp,sp,#4
        0x02029a76:    4770        pG      BX       lr
    apUART_Initialize
        0x02029a78:    b580        ..      PUSH     {r7,lr}
        0x02029a7a:    b084        ..      SUB      sp,sp,#0x10
        0x02029a7c:    9003        ..      STR      r0,[sp,#0xc]
        0x02029a7e:    9102        ..      STR      r1,[sp,#8]
        0x02029a80:    9201        ..      STR      r2,[sp,#4]
        0x02029a82:    9903        ..      LDR      r1,[sp,#0xc]
        0x02029a84:    2000        .       MOVS     r0,#0
        0x02029a86:    6308        .c      STR      r0,[r1,#0x30]
        0x02029a88:    9903        ..      LDR      r1,[sp,#0xc]
        0x02029a8a:    6448        Hd      STR      r0,[r1,#0x44]
        0x02029a8c:    9903        ..      LDR      r1,[sp,#0xc]
        0x02029a8e:    6388        .c      STR      r0,[r1,#0x38]
        0x02029a90:    9903        ..      LDR      r1,[sp,#0xc]
        0x02029a92:    6048        H`      STR      r0,[r1,#4]
        0x02029a94:    9903        ..      LDR      r1,[sp,#0xc]
        0x02029a96:    6248        Hb      STR      r0,[r1,#0x24]
        0x02029a98:    9903        ..      LDR      r1,[sp,#0xc]
        0x02029a9a:    6288        .b      STR      r0,[r1,#0x28]
        0x02029a9c:    9903        ..      LDR      r1,[sp,#0xc]
        0x02029a9e:    62c8        .b      STR      r0,[r1,#0x2c]
        0x02029aa0:    9803        ..      LDR      r0,[sp,#0xc]
        0x02029aa2:    9a02        ..      LDR      r2,[sp,#8]
        0x02029aa4:    68d1        .h      LDR      r1,[r2,#0xc]
        0x02029aa6:    6912        .i      LDR      r2,[r2,#0x10]
        0x02029aa8:    f7ffffa4    ....    BL       apUART_BaudRateSet ; 0x20299f4
        0x02029aac:    9802        ..      LDR      r0,[sp,#8]
        0x02029aae:    f890c000    ....    LDRB     r12,[r0,#0]
        0x02029ab2:    7841        Ax      LDRB     r1,[r0,#1]
        0x02029ab4:    7883        .x      LDRB     r3,[r0,#2]
        0x02029ab6:    78c2        .x      LDRB     r2,[r0,#3]
        0x02029ab8:    2080        .       MOVS     r0,#0x80
        0x02029aba:    ea001041    ..A.    AND      r0,r0,r1,LSL #5
        0x02029abe:    ea40104c    @.L.    ORR      r0,r0,r12,LSL #5
        0x02029ac2:    ea401003    @...    ORR      r0,r0,r3,LSL #4
        0x02029ac6:    ea4000c2    @...    ORR      r0,r0,r2,LSL #3
        0x02029aca:    f0010103    ....    AND      r1,r1,#3
        0x02029ace:    ea400041    @.A.    ORR      r0,r0,r1,LSL #1
        0x02029ad2:    9903        ..      LDR      r1,[sp,#0xc]
        0x02029ad4:    62c8        .b      STR      r0,[r1,#0x2c]
        0x02029ad6:    9802        ..      LDR      r0,[sp,#8]
        0x02029ad8:    f8b00009    ....    LDRH     r0,[r0,#9]
        0x02029adc:    0400        ..      LSLS     r0,r0,#16
        0x02029ade:    ba00        ..      REV      r0,r0
        0x02029ae0:    9903        ..      LDR      r1,[sp,#0xc]
        0x02029ae2:    6348        Hc      STR      r0,[r1,#0x34]
        0x02029ae4:    9801        ..      LDR      r0,[sp,#4]
        0x02029ae6:    9903        ..      LDR      r1,[sp,#0xc]
        0x02029ae8:    6388        .c      STR      r0,[r1,#0x38]
        0x02029aea:    9902        ..      LDR      r1,[sp,#8]
        0x02029aec:    7908        .y      LDRB     r0,[r1,#4]
        0x02029aee:    f891c005    ....    LDRB     r12,[r1,#5]
        0x02029af2:    798b        .y      LDRB     r3,[r1,#6]
        0x02029af4:    79ca        .y      LDRB     r2,[r1,#7]
        0x02029af6:    0240        @.      LSLS     r0,r0,#9
        0x02029af8:    ea40200c    @..     ORR      r0,r0,r12,LSL #8
        0x02029afc:    4418        .D      ADD      r0,r0,r3
        0x02029afe:    ea4030c2    @..0    ORR      r0,r0,r2,LSL #15
        0x02029b02:    7a09        .z      LDRB     r1,[r1,#8]
        0x02029b04:    ea403081    @..0    ORR      r0,r0,r1,LSL #14
        0x02029b08:    9903        ..      LDR      r1,[sp,#0xc]
        0x02029b0a:    6308        .c      STR      r0,[r1,#0x30]
        0x02029b0c:    b004        ..      ADD      sp,sp,#0x10
        0x02029b0e:    bd80        ..      POP      {r7,pc}
    app_main
        0x02029b10:    b580        ..      PUSH     {r7,lr}
        0x02029b12:    b088        ..      SUB      sp,sp,#0x20
        0x02029b14:    f649410d    I..A    MOV      r1,#0x9c0d
        0x02029b18:    f2c02102    ...!    MOVT     r1,#0x202
        0x02029b1c:    2004        .       MOVS     r0,#4
        0x02029b1e:    2200        ."      MOVS     r2,#0
        0x02029b20:    9207        ..      STR      r2,[sp,#0x1c]
        0x02029b22:    f7f5f84f    ..O.    BL       platform_set_evt_callback ; 0x201ebc4
        0x02029b26:    9a07        ..      LDR      r2,[sp,#0x1c]
        0x02029b28:    f64931ed    I..1    MOV      r1,#0x9bed
        0x02029b2c:    f2c02102    ...!    MOVT     r1,#0x202
        0x02029b30:    2005        .       MOVS     r0,#5
        0x02029b32:    f7f5f847    ..G.    BL       platform_set_evt_callback ; 0x201ebc4
        0x02029b36:    9a07        ..      LDR      r2,[sp,#0x1c]
        0x02029b38:    f6494165    I.eA    MOV      r1,#0x9c65
        0x02029b3c:    f2c02102    ...!    MOVT     r1,#0x202
        0x02029b40:    2007        .       MOVS     r0,#7
        0x02029b42:    f7f5f83f    ..?.    BL       platform_set_evt_callback ; 0x201ebc4
        0x02029b46:    9a07        ..      LDR      r2,[sp,#0x1c]
        0x02029b48:    f64951a1    I..Q    MOV      r1,#0x9da1
        0x02029b4c:    f2c02102    ...!    MOVT     r1,#0x202
        0x02029b50:    2002        .       MOVS     r0,#2
        0x02029b52:    9004        ..      STR      r0,[sp,#0x10]
        0x02029b54:    f7f5f836    ..6.    BL       platform_set_evt_callback ; 0x201ebc4
        0x02029b58:    9a07        ..      LDR      r2,[sp,#0x1c]
        0x02029b5a:    f24a0169    J.i.    MOV      r1,#0xa069
        0x02029b5e:    f2c02102    ...!    MOVT     r1,#0x202
        0x02029b62:    2003        .       MOVS     r0,#3
        0x02029b64:    9005        ..      STR      r0,[sp,#0x14]
        0x02029b66:    f7f5f82d    ..-.    BL       platform_set_evt_callback ; 0x201ebc4
        0x02029b6a:    9a07        ..      LDR      r2,[sp,#0x1c]
        0x02029b6c:    f6494181    I..A    MOV      r1,#0x9c81
        0x02029b70:    f2c02102    ...!    MOVT     r1,#0x202
        0x02029b74:    4610        .F      MOV      r0,r2
        0x02029b76:    f7f5f825    ..%.    BL       platform_set_evt_callback ; 0x201ebc4
        0x02029b7a:    f000fab7    ....    BL       setup_peripherals ; 0x202a0ec
        0x02029b7e:    f64500c4    E...    MOV      r0,#0x58c4
        0x02029b82:    f2c20000    ....    MOVT     r0,#0x2000
        0x02029b86:    9003        ..      STR      r0,[sp,#0xc]
        0x02029b88:    f000fba0    ....    BL       trace_rtt_init ; 0x202a2cc
        0x02029b8c:    9a03        ..      LDR      r2,[sp,#0xc]
        0x02029b8e:    f64941b5    I..A    MOV      r1,#0x9cb5
        0x02029b92:    f2c02102    ...!    MOVT     r1,#0x202
        0x02029b96:    2008        .       MOVS     r0,#8
        0x02029b98:    f7f5f814    ....    BL       platform_set_evt_callback ; 0x201ebc4
        0x02029b9c:    9804        ..      LDR      r0,[sp,#0x10]
        0x02029b9e:    9907        ..      LDR      r1,[sp,#0x1c]
        0x02029ba0:    f7f4fefa    ....    BL       platform_config ; 0x201e998
        0x02029ba4:    9a05        ..      LDR      r2,[sp,#0x14]
        0x02029ba6:    9907        ..      LDR      r1,[sp,#0x1c]
        0x02029ba8:    2001        .       MOVS     r0,#1
        0x02029baa:    9006        ..      STR      r0,[sp,#0x18]
        0x02029bac:    f7faf956    ..V.    BL       xQueueGenericCreate ; 0x2023e5c
        0x02029bb0:    9b07        ..      LDR      r3,[sp,#0x1c]
        0x02029bb2:    4601        .F      MOV      r1,r0
        0x02029bb4:    9806        ..      LDR      r0,[sp,#0x18]
        0x02029bb6:    f64502c0    E...    MOV      r2,#0x58c0
        0x02029bba:    f2c20200    ....    MOVT     r2,#0x2000
        0x02029bbe:    6011        .`      STR      r1,[r2,#0]
        0x02029bc0:    4669        iF      MOV      r1,sp
        0x02029bc2:    604b        K`      STR      r3,[r1,#4]
        0x02029bc4:    6008        .`      STR      r0,[r1,#0]
        0x02029bc6:    f64950b5    I..P    MOV      r0,#0x9db5
        0x02029bca:    f2c02002    ...     MOVT     r0,#0x202
        0x02029bce:    f64a71b3    J..q    MOV      r1,#0xafb3
        0x02029bd2:    f2c02102    ...!    MOVT     r1,#0x202
        0x02029bd6:    f44f62a0    O..b    MOV      r2,#0x500
        0x02029bda:    f7fafe6b    ..k.    BL       xTaskCreate ; 0x20248b4
        0x02029bde:    9807        ..      LDR      r0,[sp,#0x1c]
        0x02029be0:    b008        ..      ADD      sp,sp,#0x20
        0x02029be2:    bd80        ..      POP      {r7,pc}
    app_timer_callback
        0x02029be4:    b081        ..      SUB      sp,sp,#4
        0x02029be6:    9000        ..      STR      r0,[sp,#0]
        0x02029be8:    b001        ..      ADD      sp,sp,#4
        0x02029bea:    4770        pG      BX       lr
    cb_assertion
        0x02029bec:    b580        ..      PUSH     {r7,lr}
        0x02029bee:    b082        ..      SUB      sp,sp,#8
        0x02029bf0:    9001        ..      STR      r0,[sp,#4]
        0x02029bf2:    9100        ..      STR      r1,[sp,#0]
        0x02029bf4:    9801        ..      LDR      r0,[sp,#4]
        0x02029bf6:    6801        .h      LDR      r1,[r0,#0]
        0x02029bf8:    6842        Bh      LDR      r2,[r0,#4]
        0x02029bfa:    f64a709c    J..p    MOV      r0,#0xaf9c
        0x02029bfe:    f2c02002    ...     MOVT     r0,#0x202
        0x02029c02:    f7f4ffa1    ....    BL       platform_printf ; 0x201eb48
        0x02029c06:    e7ff        ..      B        0x2029c08 ; cb_assertion + 28
        0x02029c08:    e7fe        ..      B        0x2029c08 ; cb_assertion + 28
        0x02029c0a:    0000        ..      MOVS     r0,r0
    cb_hard_fault
        0x02029c0c:    b570        p.      PUSH     {r4-r6,lr}
        0x02029c0e:    b088        ..      SUB      sp,sp,#0x20
        0x02029c10:    9007        ..      STR      r0,[sp,#0x1c]
        0x02029c12:    9106        ..      STR      r1,[sp,#0x18]
        0x02029c14:    f8ddc01c    ....    LDR      r12,[sp,#0x1c]
        0x02029c18:    f8cdc014    ....    STR      r12,[sp,#0x14]
        0x02029c1c:    f8dc1018    ....    LDR      r1,[r12,#0x18]
        0x02029c20:    f8dc2014    ...     LDR      r2,[r12,#0x14]
        0x02029c24:    f8dc301c    ...0    LDR      r3,[r12,#0x1c]
        0x02029c28:    f8dc0000    ....    LDR      r0,[r12,#0]
        0x02029c2c:    f8dce004    ....    LDR      lr,[r12,#4]
        0x02029c30:    f8dc4008    ...@    LDR      r4,[r12,#8]
        0x02029c34:    f8dc500c    ...P    LDR      r5,[r12,#0xc]
        0x02029c38:    f8dc6010    ...`    LDR      r6,[r12,#0x10]
        0x02029c3c:    46ec        .F      MOV      r12,sp
        0x02029c3e:    f8cc6010    ...`    STR      r6,[r12,#0x10]
        0x02029c42:    f8cc500c    ...P    STR      r5,[r12,#0xc]
        0x02029c46:    f8cc4008    ...@    STR      r4,[r12,#8]
        0x02029c4a:    f8cce004    ....    STR      lr,[r12,#4]
        0x02029c4e:    f8cc0000    ....    STR      r0,[r12,#0]
        0x02029c52:    f64a7024    J.$p    MOV      r0,#0xaf24
        0x02029c56:    f2c02002    ...     MOVT     r0,#0x202
        0x02029c5a:    f7f4ff75    ..u.    BL       platform_printf ; 0x201eb48
        0x02029c5e:    e7ff        ..      B        0x2029c60 ; cb_hard_fault + 84
        0x02029c60:    e7fe        ..      B        0x2029c60 ; cb_hard_fault + 84
        0x02029c62:    0000        ..      MOVS     r0,r0
    cb_heap_out_of_mem
        0x02029c64:    b580        ..      PUSH     {r7,lr}
        0x02029c66:    b082        ..      SUB      sp,sp,#8
        0x02029c68:    9001        ..      STR      r0,[sp,#4]
        0x02029c6a:    9100        ..      STR      r1,[sp,#0]
        0x02029c6c:    9901        ..      LDR      r1,[sp,#4]
        0x02029c6e:    f64a7090    J..p    MOV      r0,#0xaf90
        0x02029c72:    f2c02002    ...     MOVT     r0,#0x202
        0x02029c76:    f7f4ff67    ..g.    BL       platform_printf ; 0x201eb48
        0x02029c7a:    e7ff        ..      B        0x2029c7c ; cb_heap_out_of_mem + 24
        0x02029c7c:    e7fe        ..      B        0x2029c7c ; cb_heap_out_of_mem + 24
        0x02029c7e:    0000        ..      MOVS     r0,r0
    cb_putc
        0x02029c80:    b580        ..      PUSH     {r7,lr}
        0x02029c82:    b082        ..      SUB      sp,sp,#8
        0x02029c84:    9001        ..      STR      r0,[sp,#4]
        0x02029c86:    9100        ..      STR      r1,[sp,#0]
        0x02029c88:    e7ff        ..      B        0x2029c8a ; cb_putc + 10
        0x02029c8a:    f2410000    A...    MOVW     r0,#0x1000
        0x02029c8e:    f2c40001    ....    MOVT     r0,#0x4001
        0x02029c92:    f7fffee9    ....    BL       apUART_Check_TXFIFO_FULL ; 0x2029a68
        0x02029c96:    2801        .(      CMP      r0,#1
        0x02029c98:    d101        ..      BNE      0x2029c9e ; cb_putc + 30
        0x02029c9a:    e7ff        ..      B        0x2029c9c ; cb_putc + 28
        0x02029c9c:    e7f5        ..      B        0x2029c8a ; cb_putc + 10
        0x02029c9e:    9801        ..      LDR      r0,[sp,#4]
        0x02029ca0:    7801        .x      LDRB     r1,[r0,#0]
        0x02029ca2:    f2410000    A...    MOVW     r0,#0x1000
        0x02029ca6:    f2c40001    ....    MOVT     r0,#0x4001
        0x02029caa:    f7fffc31    ..1.    BL       UART_SendData ; 0x2029510
        0x02029cae:    2000        .       MOVS     r0,#0
        0x02029cb0:    b002        ..      ADD      sp,sp,#8
        0x02029cb2:    bd80        ..      POP      {r7,pc}
    cb_trace_rtt
        0x02029cb4:    b580        ..      PUSH     {r7,lr}
        0x02029cb6:    b086        ..      SUB      sp,sp,#0x18
        0x02029cb8:    9005        ..      STR      r0,[sp,#0x14]
        0x02029cba:    9104        ..      STR      r1,[sp,#0x10]
        0x02029cbc:    f64e5004    N..P    MOV      r0,#0xed04
        0x02029cc0:    f2ce0000    ....    MOVT     r0,#0xe000
        0x02029cc4:    6800        .h      LDR      r0,[r0,#0]
        0x02029cc6:    f36f205f    o._     BFC      r0,#9,#23
        0x02029cca:    fab0f080    ....    CLZ      r0,r0
        0x02029cce:    0940        @.      LSRS     r0,r0,#5
        0x02029cd0:    f88d000b    ....    STRB     r0,[sp,#0xb]
        0x02029cd4:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x02029cd8:    b128        (.      CBZ      r0,0x2029ce6 ; cb_trace_rtt + 50
        0x02029cda:    e7ff        ..      B        0x2029cdc ; cb_trace_rtt + 40
        0x02029cdc:    f7f4fee2    ....    BL       platform_get_gen_os_driver ; 0x201eaa4
        0x02029ce0:    6b40        @k      LDR      r0,[r0,#0x34]
        0x02029ce2:    4780        .G      BLX      r0
        0x02029ce4:    e7ff        ..      B        0x2029ce6 ; cb_trace_rtt + 50
        0x02029ce6:    2000        .       MOVS     r0,#0
        0x02029ce8:    f7fff8d6    ....    BL       SEGGER_RTT_GetAvailWriteSpace ; 0x2028e98
        0x02029cec:    9003        ..      STR      r0,[sp,#0xc]
        0x02029cee:    9905        ..      LDR      r1,[sp,#0x14]
        0x02029cf0:    8908        ..      LDRH     r0,[r1,#8]
        0x02029cf2:    8949        I.      LDRH     r1,[r1,#0xa]
        0x02029cf4:    4408        .D      ADD      r0,r0,r1
        0x02029cf6:    9903        ..      LDR      r1,[sp,#0xc]
        0x02029cf8:    4288        .B      CMP      r0,r1
        0x02029cfa:    da0e        ..      BGE      0x2029d1a ; cb_trace_rtt + 102
        0x02029cfc:    e7ff        ..      B        0x2029cfe ; cb_trace_rtt + 74
        0x02029cfe:    9805        ..      LDR      r0,[sp,#0x14]
        0x02029d00:    6801        .h      LDR      r1,[r0,#0]
        0x02029d02:    8902        ..      LDRH     r2,[r0,#8]
        0x02029d04:    2000        .       MOVS     r0,#0
        0x02029d06:    9001        ..      STR      r0,[sp,#4]
        0x02029d08:    f7fff8dc    ....    BL       SEGGER_RTT_Write ; 0x2028ec4
        0x02029d0c:    9801        ..      LDR      r0,[sp,#4]
        0x02029d0e:    9a05        ..      LDR      r2,[sp,#0x14]
        0x02029d10:    6851        Qh      LDR      r1,[r2,#4]
        0x02029d12:    8952        R.      LDRH     r2,[r2,#0xa]
        0x02029d14:    f7fff8d6    ....    BL       SEGGER_RTT_Write ; 0x2028ec4
        0x02029d18:    e7ff        ..      B        0x2029d1a ; cb_trace_rtt + 102
        0x02029d1a:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x02029d1e:    b128        (.      CBZ      r0,0x2029d2c ; cb_trace_rtt + 120
        0x02029d20:    e7ff        ..      B        0x2029d22 ; cb_trace_rtt + 110
        0x02029d22:    f7f4febf    ....    BL       platform_get_gen_os_driver ; 0x201eaa4
        0x02029d26:    6b80        .k      LDR      r0,[r0,#0x38]
        0x02029d28:    4780        .G      BLX      r0
        0x02029d2a:    e7ff        ..      B        0x2029d2c ; cb_trace_rtt + 120
        0x02029d2c:    2000        .       MOVS     r0,#0
        0x02029d2e:    b006        ..      ADD      sp,sp,#0x18
        0x02029d30:    bd80        ..      POP      {r7,pc}
        0x02029d32:    0000        ..      MOVS     r0,r0
    config_uart
        0x02029d34:    b580        ..      PUSH     {r7,lr}
        0x02029d36:    b088        ..      SUB      sp,sp,#0x20
        0x02029d38:    9007        ..      STR      r0,[sp,#0x1c]
        0x02029d3a:    9106        ..      STR      r1,[sp,#0x18]
        0x02029d3c:    2003        .       MOVS     r0,#3
        0x02029d3e:    f88d0004    ....    STRB     r0,[sp,#4]
        0x02029d42:    2200        ."      MOVS     r2,#0
        0x02029d44:    f88d2005    ...     STRB     r2,[sp,#5]
        0x02029d48:    2001        .       MOVS     r0,#1
        0x02029d4a:    f88d0006    ....    STRB     r0,[sp,#6]
        0x02029d4e:    f88d2007    ...     STRB     r2,[sp,#7]
        0x02029d52:    f88d0008    ....    STRB     r0,[sp,#8]
        0x02029d56:    f88d0009    ....    STRB     r0,[sp,#9]
        0x02029d5a:    f88d000a    ....    STRB     r0,[sp,#0xa]
        0x02029d5e:    f88d200b    ...     STRB     r2,[sp,#0xb]
        0x02029d62:    f88d200c    ...     STRB     r2,[sp,#0xc]
        0x02029d66:    f88d000d    ....    STRB     r0,[sp,#0xd]
        0x02029d6a:    f88d000e    ....    STRB     r0,[sp,#0xe]
        0x02029d6e:    9807        ..      LDR      r0,[sp,#0x1c]
        0x02029d70:    9004        ..      STR      r0,[sp,#0x10]
        0x02029d72:    9806        ..      LDR      r0,[sp,#0x18]
        0x02029d74:    9005        ..      STR      r0,[sp,#0x14]
        0x02029d76:    f2410000    A...    MOVW     r0,#0x1000
        0x02029d7a:    f2c40001    ....    MOVT     r0,#0x4001
        0x02029d7e:    a901        ..      ADD      r1,sp,#4
        0x02029d80:    f7fffe7a    ..z.    BL       apUART_Initialize ; 0x2029a78
        0x02029d84:    b008        ..      ADD      sp,sp,#0x20
        0x02029d86:    bd80        ..      POP      {r7,pc}
    fputc
        0x02029d88:    b580        ..      PUSH     {r7,lr}
        0x02029d8a:    b082        ..      SUB      sp,sp,#8
        0x02029d8c:    9001        ..      STR      r0,[sp,#4]
        0x02029d8e:    9100        ..      STR      r1,[sp,#0]
        0x02029d90:    a801        ..      ADD      r0,sp,#4
        0x02029d92:    2100        .!      MOVS     r1,#0
        0x02029d94:    f7ffff74    ..t.    BL       cb_putc ; 0x2029c80
        0x02029d98:    9801        ..      LDR      r0,[sp,#4]
        0x02029d9a:    b002        ..      ADD      sp,sp,#8
        0x02029d9c:    bd80        ..      POP      {r7,pc}
        0x02029d9e:    0000        ..      MOVS     r0,r0
    on_deep_sleep_wakeup
        0x02029da0:    b580        ..      PUSH     {r7,lr}
        0x02029da2:    b082        ..      SUB      sp,sp,#8
        0x02029da4:    9001        ..      STR      r0,[sp,#4]
        0x02029da6:    9100        ..      STR      r1,[sp,#0]
        0x02029da8:    f000f9a0    ....    BL       setup_peripherals ; 0x202a0ec
        0x02029dac:    2000        .       MOVS     r0,#0
        0x02029dae:    b002        ..      ADD      sp,sp,#8
        0x02029db0:    bd80        ..      POP      {r7,pc}
        0x02029db2:    0000        ..      MOVS     r0,r0
    packet_schedule_task
        0x02029db4:    b580        ..      PUSH     {r7,lr}
        0x02029db6:    b082        ..      SUB      sp,sp,#8
        0x02029db8:    9001        ..      STR      r0,[sp,#4]
        0x02029dba:    e7ff        ..      B        0x2029dbc ; packet_schedule_task + 8
        0x02029dbc:    f64500c0    E...    MOV      r0,#0x58c0
        0x02029dc0:    f2c20000    ....    MOVT     r0,#0x2000
        0x02029dc4:    6800        .h      LDR      r0,[r0,#0]
        0x02029dc6:    f04f31ff    O..1    MOV      r1,#0xffffffff
        0x02029dca:    f7fafc63    ..c.    BL       xQueueSemaphoreTake ; 0x2024694
        0x02029dce:    9000        ..      STR      r0,[sp,#0]
        0x02029dd0:    9800        ..      LDR      r0,[sp,#0]
        0x02029dd2:    2801        .(      CMP      r0,#1
        0x02029dd4:    d001        ..      BEQ      0x2029dda ; packet_schedule_task + 38
        0x02029dd6:    e7ff        ..      B        0x2029dd8 ; packet_schedule_task + 36
        0x02029dd8:    e7f0        ..      B        0x2029dbc ; packet_schedule_task + 8
        0x02029dda:    e7ef        ..      B        0x2029dbc ; packet_schedule_task + 8
    peripherals_spi_dma_to_txfifo
        0x02029ddc:    b580        ..      PUSH     {r7,lr}
        0x02029dde:    b08e        ..      SUB      sp,sp,#0x38
        0x02029de0:    900d        ..      STR      r0,[sp,#0x34]
        0x02029de2:    910c        ..      STR      r1,[sp,#0x30]
        0x02029de4:    920b        ..      STR      r2,[sp,#0x2c]
        0x02029de6:    2000        .       MOVS     r0,#0
        0x02029de8:    900a        ..      STR      r0,[sp,#0x28]
        0x02029dea:    9a0c        ..      LDR      r2,[sp,#0x30]
        0x02029dec:    9b0b        ..      LDR      r3,[sp,#0x2c]
        0x02029dee:    4669        iF      MOV      r1,sp
        0x02029df0:    6048        H`      STR      r0,[r1,#4]
        0x02029df2:    6008        .`      STR      r0,[r1,#0]
        0x02029df4:    a804        ..      ADD      r0,sp,#0x10
        0x02029df6:    9003        ..      STR      r0,[sp,#0xc]
        0x02029df8:    2103        .!      MOVS     r1,#3
        0x02029dfa:    f7fefce7    ....    BL       DMA_PrepareMem2Peripheral ; 0x20287cc
        0x02029dfe:    9903        ..      LDR      r1,[sp,#0xc]
        0x02029e00:    980d        ..      LDR      r0,[sp,#0x34]
        0x02029e02:    f7fefbe3    ....    BL       DMA_EnableChannel ; 0x20285cc
        0x02029e06:    b00e        ..      ADD      sp,sp,#0x38
        0x02029e08:    bd80        ..      POP      {r7,pc}
        0x02029e0a:    0000        ..      MOVS     r0,r0
    peripherals_spi_isr
        0x02029e0c:    b580        ..      PUSH     {r7,lr}
        0x02029e0e:    b08a        ..      SUB      sp,sp,#0x28
        0x02029e10:    9009        ..      STR      r0,[sp,#0x24]
        0x02029e12:    f24e0000    N...    MOVW     r0,#0xe000
        0x02029e16:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029e1a:    f7fffd0d    ....    BL       apSSP_GetIntRawStatus ; 0x2029838
        0x02029e1e:    9008        ..      STR      r0,[sp,#0x20]
        0x02029e20:    f89d0020    .. .    LDRB     r0,[sp,#0x20]
        0x02029e24:    06c0        ..      LSLS     r0,r0,#27
        0x02029e26:    2800        .(      CMP      r0,#0
        0x02029e28:    d540        @.      BPL      0x2029eac ; peripherals_spi_isr + 160
        0x02029e2a:    e7ff        ..      B        0x2029e2c ; peripherals_spi_isr + 32
        0x02029e2c:    f24e0000    N...    MOVW     r0,#0xe000
        0x02029e30:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029e34:    9002        ..      STR      r0,[sp,#8]
        0x02029e36:    f7fffcf1    ....    BL       apSSP_GetDataNumInRxFifo ; 0x202981c
        0x02029e3a:    9006        ..      STR      r0,[sp,#0x18]
        0x02029e3c:    f000f892    ....    BL       peripherals_spi_read_data ; 0x2029f64
        0x02029e40:    f000f868    ..h.    BL       peripherals_spi_push_data ; 0x2029f14
        0x02029e44:    9802        ..      LDR      r0,[sp,#8]
        0x02029e46:    9906        ..      LDR      r1,[sp,#0x18]
        0x02029e48:    9103        ..      STR      r1,[sp,#0xc]
        0x02029e4a:    f7fffd03    ....    BL       apSSP_GetSlaveTxDataCnt ; 0x2029854
        0x02029e4e:    4601        .F      MOV      r1,r0
        0x02029e50:    9802        ..      LDR      r0,[sp,#8]
        0x02029e52:    9104        ..      STR      r1,[sp,#0x10]
        0x02029e54:    f7fffcf6    ....    BL       apSSP_GetSlaveRxDataCnt ; 0x2029844
        0x02029e58:    9903        ..      LDR      r1,[sp,#0xc]
        0x02029e5a:    9a04        ..      LDR      r2,[sp,#0x10]
        0x02029e5c:    4603        .F      MOV      r3,r0
        0x02029e5e:    f64a70ed    J..p    MOV      r0,#0xafed
        0x02029e62:    f2c02002    ...     MOVT     r0,#0x202
        0x02029e66:    f000fa39    ..9.    BL       __0printf ; 0x202a2dc
        0x02029e6a:    2000        .       MOVS     r0,#0
        0x02029e6c:    9007        ..      STR      r0,[sp,#0x1c]
        0x02029e6e:    e7ff        ..      B        0x2029e70 ; peripherals_spi_isr + 100
        0x02029e70:    9807        ..      LDR      r0,[sp,#0x1c]
        0x02029e72:    284f        O(      CMP      r0,#0x4f
        0x02029e74:    d812        ..      BHI      0x2029e9c ; peripherals_spi_isr + 144
        0x02029e76:    e7ff        ..      B        0x2029e78 ; peripherals_spi_isr + 108
        0x02029e78:    9907        ..      LDR      r1,[sp,#0x1c]
        0x02029e7a:    f2457080    E..p    MOVW     r0,#0x5780
        0x02029e7e:    f2c20000    ....    MOVT     r0,#0x2000
        0x02029e82:    f8501021    P.!.    LDR      r1,[r0,r1,LSL #2]
        0x02029e86:    f64a70e5    J..p    MOV      r0,#0xafe5
        0x02029e8a:    f2c02002    ...     MOVT     r0,#0x202
        0x02029e8e:    f000fa25    ..%.    BL       __0printf ; 0x202a2dc
        0x02029e92:    e7ff        ..      B        0x2029e94 ; peripherals_spi_isr + 136
        0x02029e94:    9807        ..      LDR      r0,[sp,#0x1c]
        0x02029e96:    3001        .0      ADDS     r0,#1
        0x02029e98:    9007        ..      STR      r0,[sp,#0x1c]
        0x02029e9a:    e7e9        ..      B        0x2029e70 ; peripherals_spi_isr + 100
        0x02029e9c:    f24e0000    N...    MOVW     r0,#0xe000
        0x02029ea0:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029ea4:    2110        .!      MOVS     r1,#0x10
        0x02029ea6:    f7fffc5b    ..[.    BL       apSSP_ClearIntStatus ; 0x2029760
        0x02029eaa:    e02f        /.      B        0x2029f0c ; peripherals_spi_isr + 256
        0x02029eac:    f89d0020    .. .    LDRB     r0,[sp,#0x20]
        0x02029eb0:    0740        @.      LSLS     r0,r0,#29
        0x02029eb2:    2800        .(      CMP      r0,#0
        0x02029eb4:    d514        ..      BPL      0x2029ee0 ; peripherals_spi_isr + 212
        0x02029eb6:    e7ff        ..      B        0x2029eb8 ; peripherals_spi_isr + 172
        0x02029eb8:    f24e0000    N...    MOVW     r0,#0xe000
        0x02029ebc:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029ec0:    9001        ..      STR      r0,[sp,#4]
        0x02029ec2:    f7fffcab    ....    BL       apSSP_GetDataNumInRxFifo ; 0x202981c
        0x02029ec6:    9005        ..      STR      r0,[sp,#0x14]
        0x02029ec8:    9905        ..      LDR      r1,[sp,#0x14]
        0x02029eca:    f64a70d4    J..p    MOV      r0,#0xafd4
        0x02029ece:    f2c02002    ...     MOVT     r0,#0x202
        0x02029ed2:    f7f4fe39    ..9.    BL       platform_printf ; 0x201eb48
        0x02029ed6:    9801        ..      LDR      r0,[sp,#4]
        0x02029ed8:    2104        .!      MOVS     r1,#4
        0x02029eda:    f7fffc41    ..A.    BL       apSSP_ClearIntStatus ; 0x2029760
        0x02029ede:    e014        ..      B        0x2029f0a ; peripherals_spi_isr + 254
        0x02029ee0:    f89d0020    .. .    LDRB     r0,[sp,#0x20]
        0x02029ee4:    0700        ..      LSLS     r0,r0,#28
        0x02029ee6:    2800        .(      CMP      r0,#0
        0x02029ee8:    d50e        ..      BPL      0x2029f08 ; peripherals_spi_isr + 252
        0x02029eea:    e7ff        ..      B        0x2029eec ; peripherals_spi_isr + 224
        0x02029eec:    f64a70c5    J..p    MOV      r0,#0xafc5
        0x02029ef0:    f2c02002    ...     MOVT     r0,#0x202
        0x02029ef4:    f7f4fe28    ..(.    BL       platform_printf ; 0x201eb48
        0x02029ef8:    f24e0000    N...    MOVW     r0,#0xe000
        0x02029efc:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029f00:    2108        .!      MOVS     r1,#8
        0x02029f02:    f7fffc2d    ..-.    BL       apSSP_ClearIntStatus ; 0x2029760
        0x02029f06:    e7ff        ..      B        0x2029f08 ; peripherals_spi_isr + 252
        0x02029f08:    e7ff        ..      B        0x2029f0a ; peripherals_spi_isr + 254
        0x02029f0a:    e7ff        ..      B        0x2029f0c ; peripherals_spi_isr + 256
        0x02029f0c:    2000        .       MOVS     r0,#0
        0x02029f0e:    b00a        ..      ADD      sp,sp,#0x28
        0x02029f10:    bd80        ..      POP      {r7,pc}
        0x02029f12:    0000        ..      MOVS     r0,r0
    peripherals_spi_push_data
        0x02029f14:    b580        ..      PUSH     {r7,lr}
        0x02029f16:    b084        ..      SUB      sp,sp,#0x10
        0x02029f18:    f245512c    E.,Q    MOV      r1,#0x552c
        0x02029f1c:    f2c20100    ....    MOVT     r1,#0x2000
        0x02029f20:    6808        .h      LDR      r0,[r1,#0]
        0x02029f22:    3001        .0      ADDS     r0,#1
        0x02029f24:    6008        .`      STR      r0,[r1,#0]
        0x02029f26:    b2c2        ..      UXTB     r2,r0
        0x02029f28:    f64500c8    E...    MOV      r0,#0x58c8
        0x02029f2c:    f2c20000    ....    MOVT     r0,#0x2000
        0x02029f30:    9001        ..      STR      r0,[sp,#4]
        0x02029f32:    f44f71a0    O..q    MOV      r1,#0x140
        0x02029f36:    9102        ..      STR      r1,[sp,#8]
        0x02029f38:    f7fef8a0    ....    BL       __aeabi_memset ; 0x202807c
        0x02029f3c:    f24e0000    N...    MOVW     r0,#0xe000
        0x02029f40:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029f44:    9000        ..      STR      r0,[sp,#0]
        0x02029f46:    2101        .!      MOVS     r1,#1
        0x02029f48:    f7fffd30    ..0.    BL       apSSP_SetTxDmaEn ; 0x20299ac
        0x02029f4c:    9800        ..      LDR      r0,[sp,#0]
        0x02029f4e:    2150        P!      MOVS     r1,#0x50
        0x02029f50:    f7fffd16    ....    BL       apSSP_SetTransferControlWrTranCnt ; 0x2029980
        0x02029f54:    9901        ..      LDR      r1,[sp,#4]
        0x02029f56:    9a02        ..      LDR      r2,[sp,#8]
        0x02029f58:    2000        .       MOVS     r0,#0
        0x02029f5a:    f7ffff3f    ..?.    BL       peripherals_spi_dma_to_txfifo ; 0x2029ddc
        0x02029f5e:    b004        ..      ADD      sp,sp,#0x10
        0x02029f60:    bd80        ..      POP      {r7,pc}
        0x02029f62:    0000        ..      MOVS     r0,r0
    peripherals_spi_read_data
        0x02029f64:    b580        ..      PUSH     {r7,lr}
        0x02029f66:    b082        ..      SUB      sp,sp,#8
        0x02029f68:    f24e0000    N...    MOVW     r0,#0xe000
        0x02029f6c:    f2c40000    ....    MOVT     r0,#0x4000
        0x02029f70:    9000        ..      STR      r0,[sp,#0]
        0x02029f72:    2101        .!      MOVS     r1,#1
        0x02029f74:    9101        ..      STR      r1,[sp,#4]
        0x02029f76:    f7fffcbb    ....    BL       apSSP_SetRxDmaEn ; 0x20298f0
        0x02029f7a:    9800        ..      LDR      r0,[sp,#0]
        0x02029f7c:    2150        P!      MOVS     r1,#0x50
        0x02029f7e:    f7fffced    ....    BL       apSSP_SetTransferControlRdTranCnt ; 0x202995c
        0x02029f82:    9801        ..      LDR      r0,[sp,#4]
        0x02029f84:    f2457180    E..q    MOVW     r1,#0x5780
        0x02029f88:    f2c20100    ....    MOVT     r1,#0x2000
        0x02029f8c:    f44f72a0    O..r    MOV      r2,#0x140
        0x02029f90:    f000f802    ....    BL       peripherals_spi_rxfifo_to_dma ; 0x2029f98
        0x02029f94:    b002        ..      ADD      sp,sp,#8
        0x02029f96:    bd80        ..      POP      {r7,pc}
    peripherals_spi_rxfifo_to_dma
        0x02029f98:    b580        ..      PUSH     {r7,lr}
        0x02029f9a:    b08e        ..      SUB      sp,sp,#0x38
        0x02029f9c:    900d        ..      STR      r0,[sp,#0x34]
        0x02029f9e:    910c        ..      STR      r1,[sp,#0x30]
        0x02029fa0:    920b        ..      STR      r2,[sp,#0x2c]
        0x02029fa2:    2000        .       MOVS     r0,#0
        0x02029fa4:    900a        ..      STR      r0,[sp,#0x28]
        0x02029fa6:    990c        ..      LDR      r1,[sp,#0x30]
        0x02029fa8:    9b0b        ..      LDR      r3,[sp,#0x2c]
        0x02029faa:    466a        jF      MOV      r2,sp
        0x02029fac:    6050        P`      STR      r0,[r2,#4]
        0x02029fae:    6010        .`      STR      r0,[r2,#0]
        0x02029fb0:    a804        ..      ADD      r0,sp,#0x10
        0x02029fb2:    9003        ..      STR      r0,[sp,#0xc]
        0x02029fb4:    2213        ."      MOVS     r2,#0x13
        0x02029fb6:    f7fefc75    ..u.    BL       DMA_PreparePeripheral2Mem ; 0x20288a4
        0x02029fba:    9903        ..      LDR      r1,[sp,#0xc]
        0x02029fbc:    980d        ..      LDR      r0,[sp,#0x34]
        0x02029fbe:    f7fefb05    ....    BL       DMA_EnableChannel ; 0x20285cc
        0x02029fc2:    b00e        ..      ADD      sp,sp,#0x38
        0x02029fc4:    bd80        ..      POP      {r7,pc}
        0x02029fc6:    0000        ..      MOVS     r0,r0
    pin_id_for_input_source
        0x02029fc8:    b088        ..      SUB      sp,sp,#0x20
        0x02029fca:    9006        ..      STR      r0,[sp,#0x18]
        0x02029fcc:    f88d1017    ....    STRB     r1,[sp,#0x17]
        0x02029fd0:    9806        ..      LDR      r0,[sp,#0x18]
        0x02029fd2:    17c1        ..      ASRS     r1,r0,#31
        0x02029fd4:    eb007051    ..Qp    ADD      r0,r0,r1,LSR #29
        0x02029fd8:    10c0        ..      ASRS     r0,r0,#3
        0x02029fda:    9004        ..      STR      r0,[sp,#0x10]
        0x02029fdc:    9806        ..      LDR      r0,[sp,#0x18]
        0x02029fde:    f0000107    ....    AND      r1,r0,#7
        0x02029fe2:    2080        .       MOVS     r0,#0x80
        0x02029fe4:    40c8        .@      LSRS     r0,r0,r1
        0x02029fe6:    9003        ..      STR      r0,[sp,#0xc]
        0x02029fe8:    2000        .       MOVS     r0,#0
        0x02029fea:    9002        ..      STR      r0,[sp,#8]
        0x02029fec:    f89d0017    ....    LDRB     r0,[sp,#0x17]
        0x02029ff0:    3801        .8      SUBS     r0,#1
        0x02029ff2:    9001        ..      STR      r0,[sp,#4]
        0x02029ff4:    f89d0017    ....    LDRB     r0,[sp,#0x17]
        0x02029ff8:    f64a4206    J..B    MOV      r2,#0xac06
        0x02029ffc:    f2c02202    ..."    MOVT     r2,#0x202
        0x0202a000:    2113        .!      MOVS     r1,#0x13
        0x0202a002:    fb102001    ...     SMLABB   r0,r0,r1,r2
        0x0202a006:    9000        ..      STR      r0,[sp,#0]
        0x0202a008:    9800        ..      LDR      r0,[sp,#0]
        0x0202a00a:    9904        ..      LDR      r1,[sp,#0x10]
        0x0202a00c:    5c40        @\      LDRB     r0,[r0,r1]
        0x0202a00e:    9903        ..      LDR      r1,[sp,#0xc]
        0x0202a010:    4208        .B      TST      r0,r1
        0x0202a012:    d104        ..      BNE      0x202a01e ; pin_id_for_input_source + 86
        0x0202a014:    e7ff        ..      B        0x202a016 ; pin_id_for_input_source + 78
        0x0202a016:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x0202a01a:    9007        ..      STR      r0,[sp,#0x1c]
        0x0202a01c:    e020         .      B        0x202a060 ; pin_id_for_input_source + 152
        0x0202a01e:    e7ff        ..      B        0x202a020 ; pin_id_for_input_source + 88
        0x0202a020:    9801        ..      LDR      r0,[sp,#4]
        0x0202a022:    2800        .(      CMP      r0,#0
        0x0202a024:    d419        ..      BMI      0x202a05a ; pin_id_for_input_source + 146
        0x0202a026:    e7ff        ..      B        0x202a028 ; pin_id_for_input_source + 96
        0x0202a028:    9801        ..      LDR      r0,[sp,#4]
        0x0202a02a:    f64a4206    J..B    MOV      r2,#0xac06
        0x0202a02e:    f2c02202    ..."    MOVT     r2,#0x202
        0x0202a032:    2113        .!      MOVS     r1,#0x13
        0x0202a034:    fb002001    ...     MLA      r0,r0,r1,r2
        0x0202a038:    9000        ..      STR      r0,[sp,#0]
        0x0202a03a:    9800        ..      LDR      r0,[sp,#0]
        0x0202a03c:    9904        ..      LDR      r1,[sp,#0x10]
        0x0202a03e:    5c40        @\      LDRB     r0,[r0,r1]
        0x0202a040:    9903        ..      LDR      r1,[sp,#0xc]
        0x0202a042:    4208        .B      TST      r0,r1
        0x0202a044:    d004        ..      BEQ      0x202a050 ; pin_id_for_input_source + 136
        0x0202a046:    e7ff        ..      B        0x202a048 ; pin_id_for_input_source + 128
        0x0202a048:    9802        ..      LDR      r0,[sp,#8]
        0x0202a04a:    3001        .0      ADDS     r0,#1
        0x0202a04c:    9002        ..      STR      r0,[sp,#8]
        0x0202a04e:    e7ff        ..      B        0x202a050 ; pin_id_for_input_source + 136
        0x0202a050:    e7ff        ..      B        0x202a052 ; pin_id_for_input_source + 138
        0x0202a052:    9801        ..      LDR      r0,[sp,#4]
        0x0202a054:    3801        .8      SUBS     r0,#1
        0x0202a056:    9001        ..      STR      r0,[sp,#4]
        0x0202a058:    e7e2        ..      B        0x202a020 ; pin_id_for_input_source + 88
        0x0202a05a:    9802        ..      LDR      r0,[sp,#8]
        0x0202a05c:    9007        ..      STR      r0,[sp,#0x1c]
        0x0202a05e:    e7ff        ..      B        0x202a060 ; pin_id_for_input_source + 152
        0x0202a060:    9807        ..      LDR      r0,[sp,#0x1c]
        0x0202a062:    b008        ..      ADD      sp,sp,#0x20
        0x0202a064:    4770        pG      BX       lr
        0x0202a066:    0000        ..      MOVS     r0,r0
    query_deep_sleep_allowed
        0x0202a068:    b082        ..      SUB      sp,sp,#8
        0x0202a06a:    9001        ..      STR      r0,[sp,#4]
        0x0202a06c:    9100        ..      STR      r1,[sp,#0]
        0x0202a06e:    2000        .       MOVS     r0,#0
        0x0202a070:    b002        ..      ADD      sp,sp,#8
        0x0202a072:    4770        pG      BX       lr
    set_reg_bit
        0x0202a074:    b083        ..      SUB      sp,sp,#0xc
        0x0202a076:    9002        ..      STR      r0,[sp,#8]
        0x0202a078:    f88d1007    ....    STRB     r1,[sp,#7]
        0x0202a07c:    f88d2006    ...     STRB     r2,[sp,#6]
        0x0202a080:    f89d1006    ....    LDRB     r1,[sp,#6]
        0x0202a084:    2001        .       MOVS     r0,#1
        0x0202a086:    4088        .@      LSLS     r0,r0,r1
        0x0202a088:    9000        ..      STR      r0,[sp,#0]
        0x0202a08a:    9802        ..      LDR      r0,[sp,#8]
        0x0202a08c:    6800        .h      LDR      r0,[r0,#0]
        0x0202a08e:    9900        ..      LDR      r1,[sp,#0]
        0x0202a090:    4388        .C      BICS     r0,r0,r1
        0x0202a092:    f89d1007    ....    LDRB     r1,[sp,#7]
        0x0202a096:    f89d2006    ...     LDRB     r2,[sp,#6]
        0x0202a09a:    4091        .@      LSLS     r1,r1,r2
        0x0202a09c:    4308        .C      ORRS     r0,r0,r1
        0x0202a09e:    9902        ..      LDR      r1,[sp,#8]
        0x0202a0a0:    6008        .`      STR      r0,[r1,#0]
        0x0202a0a2:    b003        ..      ADD      sp,sp,#0xc
        0x0202a0a4:    4770        pG      BX       lr
        0x0202a0a6:    0000        ..      MOVS     r0,r0
    set_reg_bits
        0x0202a0a8:    b085        ..      SUB      sp,sp,#0x14
        0x0202a0aa:    9004        ..      STR      r0,[sp,#0x10]
        0x0202a0ac:    9103        ..      STR      r1,[sp,#0xc]
        0x0202a0ae:    f88d200b    ...     STRB     r2,[sp,#0xb]
        0x0202a0b2:    f88d300a    ...0    STRB     r3,[sp,#0xa]
        0x0202a0b6:    f89d100b    ....    LDRB     r1,[sp,#0xb]
        0x0202a0ba:    2001        .       MOVS     r0,#1
        0x0202a0bc:    4088        .@      LSLS     r0,r0,r1
        0x0202a0be:    3801        .8      SUBS     r0,#1
        0x0202a0c0:    9001        ..      STR      r0,[sp,#4]
        0x0202a0c2:    9801        ..      LDR      r0,[sp,#4]
        0x0202a0c4:    f89d100a    ....    LDRB     r1,[sp,#0xa]
        0x0202a0c8:    4088        .@      LSLS     r0,r0,r1
        0x0202a0ca:    43c0        .C      MVNS     r0,r0
        0x0202a0cc:    9000        ..      STR      r0,[sp,#0]
        0x0202a0ce:    9804        ..      LDR      r0,[sp,#0x10]
        0x0202a0d0:    6800        .h      LDR      r0,[r0,#0]
        0x0202a0d2:    9900        ..      LDR      r1,[sp,#0]
        0x0202a0d4:    4008        .@      ANDS     r0,r0,r1
        0x0202a0d6:    9903        ..      LDR      r1,[sp,#0xc]
        0x0202a0d8:    9a01        ..      LDR      r2,[sp,#4]
        0x0202a0da:    4011        .@      ANDS     r1,r1,r2
        0x0202a0dc:    f89d200a    ...     LDRB     r2,[sp,#0xa]
        0x0202a0e0:    4091        .@      LSLS     r1,r1,r2
        0x0202a0e2:    4308        .C      ORRS     r0,r0,r1
        0x0202a0e4:    9904        ..      LDR      r1,[sp,#0x10]
        0x0202a0e6:    6008        .`      STR      r0,[r1,#0]
        0x0202a0e8:    b005        ..      ADD      sp,sp,#0x14
        0x0202a0ea:    4770        pG      BX       lr
    setup_peripherals
        0x0202a0ec:    b580        ..      PUSH     {r7,lr}
        0x0202a0ee:    b084        ..      SUB      sp,sp,#0x10
        0x0202a0f0:    2004        .       MOVS     r0,#4
        0x0202a0f2:    f7feff6f    ..o.    BL       SYSCTRL_ClearClkGateMulti ; 0x2028fd4
        0x0202a0f6:    f2436000    C..`    MOVW     r0,#0x3600
        0x0202a0fa:    f2c0106e    ..n.    MOVT     r0,#0x16e
        0x0202a0fe:    f44f31e1    O..1    MOV      r1,#0x1c200
        0x0202a102:    f7fffe17    ....    BL       config_uart ; 0x2029d34
        0x0202a106:    f000f829    ..).    BL       setup_peripherals_spi ; 0x202a15c
        0x0202a10a:    f64930e5    I..0    MOV      r0,#0x9be5
        0x0202a10e:    f2c02002    ...     MOVT     r0,#0x202
        0x0202a112:    4669        iF      MOV      r1,sp
        0x0202a114:    6008        .`      STR      r0,[r1,#0]
        0x0202a116:    f64a70b1    J..p    MOV      r0,#0xafb1
        0x0202a11a:    f2c02002    ...     MOVT     r0,#0x202
        0x0202a11e:    f44f6180    O..a    MOV      r1,#0x400
        0x0202a122:    2300        .#      MOVS     r3,#0
        0x0202a124:    9302        ..      STR      r3,[sp,#8]
        0x0202a126:    461a        .F      MOV      r2,r3
        0x0202a128:    f7fafe30    ..0.    BL       xTimerCreate ; 0x2024d8c
        0x0202a12c:    4601        .F      MOV      r1,r0
        0x0202a12e:    f245707c    E.|p    MOV      r0,#0x577c
        0x0202a132:    f2c20000    ....    MOVT     r0,#0x2000
        0x0202a136:    6001        .`      STR      r1,[r0,#0]
        0x0202a138:    6800        .h      LDR      r0,[r0,#0]
        0x0202a13a:    9003        ..      STR      r0,[sp,#0xc]
        0x0202a13c:    f7fafc34    ..4.    BL       xTaskGetTickCount ; 0x20249a8
        0x0202a140:    9b02        ..      LDR      r3,[sp,#8]
        0x0202a142:    4602        .F      MOV      r2,r0
        0x0202a144:    9803        ..      LDR      r0,[sp,#0xc]
        0x0202a146:    46ec        .F      MOV      r12,sp
        0x0202a148:    f04f31ff    O..1    MOV      r1,#0xffffffff
        0x0202a14c:    f8cc1000    ....    STR      r1,[r12,#0]
        0x0202a150:    2101        .!      MOVS     r1,#1
        0x0202a152:    f7fafe87    ....    BL       xTimerGenericCommand ; 0x2024e64
        0x0202a156:    b004        ..      ADD      sp,sp,#0x10
        0x0202a158:    bd80        ..      POP      {r7,pc}
        0x0202a15a:    0000        ..      MOVS     r0,r0
    setup_peripherals_spi
        0x0202a15c:    b580        ..      PUSH     {r7,lr}
        0x0202a15e:    b082        ..      SUB      sp,sp,#8
        0x0202a160:    f000f830    ..0.    BL       setup_peripherals_spi_pin ; 0x202a1c4
        0x0202a164:    f000f81a    ....    BL       setup_peripherals_spi_module ; 0x202a19c
        0x0202a168:    f7fff956    ..V.    BL       SYSCTRL_GetPLLClk ; 0x2029418
        0x0202a16c:    4601        .F      MOV      r1,r0
        0x0202a16e:    f64a70b5    J..p    MOV      r0,#0xafb5
        0x0202a172:    f2c02002    ...     MOVT     r0,#0x202
        0x0202a176:    f7f4fce7    ....    BL       platform_printf ; 0x201eb48
        0x0202a17a:    f44f6000    O..`    MOV      r0,#0x800
        0x0202a17e:    f7feff29    ..).    BL       SYSCTRL_ClearClkGateMulti ; 0x2028fd4
        0x0202a182:    2001        .       MOVS     r0,#1
        0x0202a184:    f7fefbe8    ....    BL       DMA_Reset ; 0x2028958
        0x0202a188:    2000        .       MOVS     r0,#0
        0x0202a18a:    f7fefbe5    ....    BL       DMA_Reset ; 0x2028958
        0x0202a18e:    f7fffee9    ....    BL       peripherals_spi_read_data ; 0x2029f64
        0x0202a192:    f7fffebf    ....    BL       peripherals_spi_push_data ; 0x2029f14
        0x0202a196:    b002        ..      ADD      sp,sp,#8
        0x0202a198:    bd80        ..      POP      {r7,pc}
        0x0202a19a:    0000        ..      MOVS     r0,r0
    setup_peripherals_spi_module
        0x0202a19c:    b580        ..      PUSH     {r7,lr}
        0x0202a19e:    b086        ..      SUB      sp,sp,#0x18
        0x0202a1a0:    f64a31ce    J..1    MOV      r1,#0xabce
        0x0202a1a4:    f2c02102    ...!    MOVT     r1,#0x202
        0x0202a1a8:    a801        ..      ADD      r0,sp,#4
        0x0202a1aa:    9000        ..      STR      r0,[sp,#0]
        0x0202a1ac:    2214        ."      MOVS     r2,#0x14
        0x0202a1ae:    f7fdff53    ..S.    BL       __aeabi_memcpy ; 0x2028058
        0x0202a1b2:    9900        ..      LDR      r1,[sp,#0]
        0x0202a1b4:    f24e0000    N...    MOVW     r0,#0xe000
        0x0202a1b8:    f2c40000    ....    MOVT     r0,#0x4000
        0x0202a1bc:    f7fffada    ....    BL       apSSP_DeviceParametersSet ; 0x2029774
        0x0202a1c0:    b006        ..      ADD      sp,sp,#0x18
        0x0202a1c2:    bd80        ..      POP      {r7,pc}
    setup_peripherals_spi_pin
        0x0202a1c4:    b580        ..      PUSH     {r7,lr}
        0x0202a1c6:    b088        ..      SUB      sp,sp,#0x20
        0x0202a1c8:    f2420000    B...    MOVW     r0,#0x2000
        0x0202a1cc:    f2c00020    .. .    MOVT     r0,#0x20
        0x0202a1d0:    f7feff00    ....    BL       SYSCTRL_ClearClkGateMulti ; 0x2028fd4
        0x0202a1d4:    205c        \       MOVS     r0,#0x5c
        0x0202a1d6:    2102        .!      MOVS     r1,#2
        0x0202a1d8:    f7fefbf6    ....    BL       PINCTRL_Pull ; 0x20289c8
        0x0202a1dc:    205d        ]       MOVS     r0,#0x5d
        0x0202a1de:    2101        .!      MOVS     r1,#1
        0x0202a1e0:    9104        ..      STR      r1,[sp,#0x10]
        0x0202a1e2:    f7fefbf1    ....    BL       PINCTRL_Pull ; 0x20289c8
        0x0202a1e6:    9804        ..      LDR      r0,[sp,#0x10]
        0x0202a1e8:    466a        jF      MOV      r2,sp
        0x0202a1ea:    2108        .!      MOVS     r1,#8
        0x0202a1ec:    6091        .`      STR      r1,[r2,#8]
        0x0202a1ee:    2109        .!      MOVS     r1,#9
        0x0202a1f0:    9107        ..      STR      r1,[sp,#0x1c]
        0x0202a1f2:    6051        Q`      STR      r1,[r2,#4]
        0x0202a1f4:    210b        .!      MOVS     r1,#0xb
        0x0202a1f6:    9106        ..      STR      r1,[sp,#0x18]
        0x0202a1f8:    6011        .`      STR      r1,[r2,#0]
        0x0202a1fa:    2107        .!      MOVS     r1,#7
        0x0202a1fc:    9105        ..      STR      r1,[sp,#0x14]
        0x0202a1fe:    220a        ."      MOVS     r2,#0xa
        0x0202a200:    230c        .#      MOVS     r3,#0xc
        0x0202a202:    f7fefc71    ..q.    BL       PINCTRL_SelSpiIn ; 0x2028ae8
        0x0202a206:    9907        ..      LDR      r1,[sp,#0x1c]
        0x0202a208:    9805        ..      LDR      r0,[sp,#0x14]
        0x0202a20a:    f7fefd71    ..q.    BL       PINCTRL_SetPadMux ; 0x2028cf0
        0x0202a20e:    9906        ..      LDR      r1,[sp,#0x18]
        0x0202a210:    9807        ..      LDR      r0,[sp,#0x1c]
        0x0202a212:    f7fefd6d    ..m.    BL       PINCTRL_SetPadMux ; 0x2028cf0
        0x0202a216:    9807        ..      LDR      r0,[sp,#0x1c]
        0x0202a218:    f649610d    I..a    MOV      r1,#0x9e0d
        0x0202a21c:    f2c02102    ...!    MOVT     r1,#0x202
        0x0202a220:    2200        ."      MOVS     r2,#0
        0x0202a222:    f7f4fcd9    ....    BL       platform_set_irq_callback ; 0x201ebd8
        0x0202a226:    b008        ..      ADD      sp,sp,#0x20
        0x0202a228:    bd80        ..      POP      {r7,pc}
        0x0202a22a:    0000        ..      MOVS     r0,r0
    source_id_on_pin
        0x0202a22c:    b085        ..      SUB      sp,sp,#0x14
        0x0202a22e:    f88d000f    ....    STRB     r0,[sp,#0xf]
        0x0202a232:    f88d100e    ....    STRB     r1,[sp,#0xe]
        0x0202a236:    f89d000f    ....    LDRB     r0,[sp,#0xf]
        0x0202a23a:    282a        *(      CMP      r0,#0x2a
        0x0202a23c:    db04        ..      BLT      0x202a248 ; source_id_on_pin + 28
        0x0202a23e:    e7ff        ..      B        0x202a240 ; source_id_on_pin + 20
        0x0202a240:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x0202a244:    9004        ..      STR      r0,[sp,#0x10]
        0x0202a246:    e03e        >.      B        0x202a2c6 ; source_id_on_pin + 154
        0x0202a248:    f89d000f    ....    LDRB     r0,[sp,#0xf]
        0x0202a24c:    f64a4206    J..B    MOV      r2,#0xac06
        0x0202a250:    f2c02202    ..."    MOVT     r2,#0x202
        0x0202a254:    2113        .!      MOVS     r1,#0x13
        0x0202a256:    fb102001    ...     SMLABB   r0,r0,r1,r2
        0x0202a25a:    9002        ..      STR      r0,[sp,#8]
        0x0202a25c:    2000        .       MOVS     r0,#0
        0x0202a25e:    9001        ..      STR      r0,[sp,#4]
        0x0202a260:    f89d000e    ....    LDRB     r0,[sp,#0xe]
        0x0202a264:    3801        .8      SUBS     r0,#1
        0x0202a266:    9000        ..      STR      r0,[sp,#0]
        0x0202a268:    9802        ..      LDR      r0,[sp,#8]
        0x0202a26a:    f89d100e    ....    LDRB     r1,[sp,#0xe]
        0x0202a26e:    08ca        ..      LSRS     r2,r1,#3
        0x0202a270:    5c80        .\      LDRB     r0,[r0,r2]
        0x0202a272:    f0010207    ....    AND      r2,r1,#7
        0x0202a276:    2180        .!      MOVS     r1,#0x80
        0x0202a278:    40d1        .@      LSRS     r1,r1,r2
        0x0202a27a:    4208        .B      TST      r0,r1
        0x0202a27c:    d104        ..      BNE      0x202a288 ; source_id_on_pin + 92
        0x0202a27e:    e7ff        ..      B        0x202a280 ; source_id_on_pin + 84
        0x0202a280:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x0202a284:    9004        ..      STR      r0,[sp,#0x10]
        0x0202a286:    e01e        ..      B        0x202a2c6 ; source_id_on_pin + 154
        0x0202a288:    e7ff        ..      B        0x202a28a ; source_id_on_pin + 94
        0x0202a28a:    9800        ..      LDR      r0,[sp,#0]
        0x0202a28c:    2800        .(      CMP      r0,#0
        0x0202a28e:    d417        ..      BMI      0x202a2c0 ; source_id_on_pin + 148
        0x0202a290:    e7ff        ..      B        0x202a292 ; source_id_on_pin + 102
        0x0202a292:    9802        ..      LDR      r0,[sp,#8]
        0x0202a294:    9900        ..      LDR      r1,[sp,#0]
        0x0202a296:    17ca        ..      ASRS     r2,r1,#31
        0x0202a298:    eb017252    ..Rr    ADD      r2,r1,r2,LSR #29
        0x0202a29c:    10d2        ..      ASRS     r2,r2,#3
        0x0202a29e:    5c80        .\      LDRB     r0,[r0,r2]
        0x0202a2a0:    f0010207    ....    AND      r2,r1,#7
        0x0202a2a4:    2180        .!      MOVS     r1,#0x80
        0x0202a2a6:    40d1        .@      LSRS     r1,r1,r2
        0x0202a2a8:    4208        .B      TST      r0,r1
        0x0202a2aa:    d004        ..      BEQ      0x202a2b6 ; source_id_on_pin + 138
        0x0202a2ac:    e7ff        ..      B        0x202a2ae ; source_id_on_pin + 130
        0x0202a2ae:    9801        ..      LDR      r0,[sp,#4]
        0x0202a2b0:    3001        .0      ADDS     r0,#1
        0x0202a2b2:    9001        ..      STR      r0,[sp,#4]
        0x0202a2b4:    e7ff        ..      B        0x202a2b6 ; source_id_on_pin + 138
        0x0202a2b6:    e7ff        ..      B        0x202a2b8 ; source_id_on_pin + 140
        0x0202a2b8:    9800        ..      LDR      r0,[sp,#0]
        0x0202a2ba:    3801        .8      SUBS     r0,#1
        0x0202a2bc:    9000        ..      STR      r0,[sp,#0]
        0x0202a2be:    e7e4        ..      B        0x202a28a ; source_id_on_pin + 94
        0x0202a2c0:    9801        ..      LDR      r0,[sp,#4]
        0x0202a2c2:    9004        ..      STR      r0,[sp,#0x10]
        0x0202a2c4:    e7ff        ..      B        0x202a2c6 ; source_id_on_pin + 154
        0x0202a2c6:    9804        ..      LDR      r0,[sp,#0x10]
        0x0202a2c8:    b005        ..      ADD      sp,sp,#0x14
        0x0202a2ca:    4770        pG      BX       lr
    trace_rtt_init
        0x0202a2cc:    b580        ..      PUSH     {r7,lr}
        0x0202a2ce:    b082        ..      SUB      sp,sp,#8
        0x0202a2d0:    9001        ..      STR      r0,[sp,#4]
        0x0202a2d2:    f7fefdf3    ....    BL       SEGGER_RTT_Init ; 0x2028ebc
        0x0202a2d6:    b002        ..      ADD      sp,sp,#8
        0x0202a2d8:    bd80        ..      POP      {r7,pc}
        0x0202a2da:    0000        ..      MOVS     r0,r0
    $t
    i.__0printf
    __0printf
    __1printf
    __2printf
    __c89printf
    printf
        0x0202a2dc:    b40f        ..      PUSH     {r0-r3}
        0x0202a2de:    4b05        .K      LDR      r3,[pc,#20] ; [0x202a2f4] = 0x2029d89
        0x0202a2e0:    b510        ..      PUSH     {r4,lr}
        0x0202a2e2:    a903        ..      ADD      r1,sp,#0xc
        0x0202a2e4:    4a04        .J      LDR      r2,[pc,#16] ; [0x202a2f8] = 0x20005528
        0x0202a2e6:    9802        ..      LDR      r0,[sp,#8]
        0x0202a2e8:    f000f8da    ....    BL       _printf_core ; 0x202a4a0
        0x0202a2ec:    bc10        ..      POP      {r4}
        0x0202a2ee:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    $d
        0x0202a2f2:    0000        ..      DCW    0
        0x0202a2f4:    02029d89    ....    DCD    33725833
        0x0202a2f8:    20005528    (U.     DCD    536892712
    $t
    i.__scatterload_copy
    __scatterload_copy
        0x0202a2fc:    e002        ..      B        0x202a304 ; __scatterload_copy + 8
        0x0202a2fe:    c808        ..      LDM      r0!,{r3}
        0x0202a300:    1f12        ..      SUBS     r2,r2,#4
        0x0202a302:    c108        ..      STM      r1!,{r3}
        0x0202a304:    2a00        .*      CMP      r2,#0
        0x0202a306:    d1fa        ..      BNE      0x202a2fe ; __scatterload_copy + 2
        0x0202a308:    4770        pG      BX       lr
    i.__scatterload_null
    __scatterload_null
        0x0202a30a:    4770        pG      BX       lr
    i.__scatterload_zeroinit
    __scatterload_zeroinit
        0x0202a30c:    2000        .       MOVS     r0,#0
        0x0202a30e:    e001        ..      B        0x202a314 ; __scatterload_zeroinit + 8
        0x0202a310:    c101        ..      STM      r1!,{r0}
        0x0202a312:    1f12        ..      SUBS     r2,r2,#4
        0x0202a314:    2a00        .*      CMP      r2,#0
        0x0202a316:    d1fb        ..      BNE      0x202a310 ; __scatterload_zeroinit + 4
        0x0202a318:    4770        pG      BX       lr
        0x0202a31a:    0000        ..      MOVS     r0,r0
    i._fp_digits
    _fp_digits
        0x0202a31c:    e92d5fff    -.._    PUSH     {r0-r12,lr}
        0x0202a320:    b082        ..      SUB      sp,sp,#8
        0x0202a322:    2100        .!      MOVS     r1,#0
        0x0202a324:    e9dd3004    ...0    LDRD     r3,r0,[sp,#0x10]
        0x0202a328:    0d02        ..      LSRS     r2,r0,#20
        0x0202a32a:    f8ddb040    ..@.    LDR      r11,[sp,#0x40]
        0x0202a32e:    4303        .C      ORRS     r3,r3,r0
        0x0202a330:    d018        ..      BEQ      0x202a364 ; _fp_digits + 72
        0x0202a332:    f6445010    D..P    MOV      r0,#0x4d10
        0x0202a336:    f2a232ff    ...2    SUB      r2,r2,#0x3ff
        0x0202a33a:    4342        BC      MULS     r2,r0,r2
        0x0202a33c:    1415        ..      ASRS     r5,r2,#16
        0x0202a33e:    9811        ..      LDR      r0,[sp,#0x44]
        0x0202a340:    2801        .(      CMP      r0,#1
        0x0202a342:    d01f        ..      BEQ      0x202a384 ; _fp_digits + 104
        0x0202a344:    eba5000b    ....    SUB      r0,r5,r11
        0x0202a348:    1c40        @.      ADDS     r0,r0,#1
        0x0202a34a:    ea5f0a00    _...    MOVS     r10,r0
        0x0202a34e:    f04f0600    O...    MOV      r6,#0
        0x0202a352:    4f4e        NO      LDR      r7,[pc,#312] ; [0x202a48c] = 0x40140000
        0x0202a354:    f8df9138    ..8.    LDR      r9,[pc,#312] ; [0x202a490] = 0x3ff00000
        0x0202a358:    46b0        .F      MOV      r8,r6
        0x0202a35a:    4650        PF      MOV      r0,r10
        0x0202a35c:    d515        ..      BPL      0x202a38a ; _fp_digits + 110
        0x0202a35e:    f1ca0400    ....    RSB      r4,r10,#0
        0x0202a362:    e013        ..      B        0x202a38c ; _fp_digits + 112
        0x0202a364:    9811        ..      LDR      r0,[sp,#0x44]
        0x0202a366:    2401        .$      MOVS     r4,#1
        0x0202a368:    a34a        J.      ADR      r3,{pc}+0x12c ; 0x202a494
        0x0202a36a:    2801        .(      CMP      r0,#1
        0x0202a36c:    d101        ..      BNE      0x202a372 ; _fp_digits + 86
        0x0202a36e:    ea6f010b    o...    MVN      r1,r11
        0x0202a372:    9802        ..      LDR      r0,[sp,#8]
        0x0202a374:    9a11        ..      LDR      r2,[sp,#0x44]
        0x0202a376:    e9c03100    ...1    STRD     r3,r1,[r0,#0]
        0x0202a37a:    e9c04202    ...B    STRD     r4,r2,[r0,#8]
        0x0202a37e:    b006        ..      ADD      sp,sp,#0x18
        0x0202a380:    e8bd9ff0    ....    POP      {r4-r12,pc}
        0x0202a384:    f1cb0000    ....    RSB      r0,r11,#0
        0x0202a388:    e7df        ..      B        0x202a34a ; _fp_digits + 46
        0x0202a38a:    4604        .F      MOV      r4,r0
        0x0202a38c:    2100        .!      MOVS     r1,#0
        0x0202a38e:    4a40        @J      LDR      r2,[pc,#256] ; [0x202a490] = 0x3ff00000
        0x0202a390:    1849        I.      ADDS     r1,r1,r1
        0x0202a392:    eb425004    B..P    ADC      r0,r2,r4,LSL #20
        0x0202a396:    e9cd1000    ....    STRD     r1,r0,[sp,#0]
        0x0202a39a:    e012        ..      B        0x202a3c2 ; _fp_digits + 166
        0x0202a39c:    07e0        ..      LSLS     r0,r4,#31
        0x0202a39e:    d007        ..      BEQ      0x202a3b0 ; _fp_digits + 148
        0x0202a3a0:    4632        2F      MOV      r2,r6
        0x0202a3a2:    463b        ;F      MOV      r3,r7
        0x0202a3a4:    4640        @F      MOV      r0,r8
        0x0202a3a6:    4649        IF      MOV      r1,r9
        0x0202a3a8:    f7fef85e    ..^.    BL       __aeabi_dmul ; 0x2028468
        0x0202a3ac:    4680        .F      MOV      r8,r0
        0x0202a3ae:    4689        .F      MOV      r9,r1
        0x0202a3b0:    4632        2F      MOV      r2,r6
        0x0202a3b2:    463b        ;F      MOV      r3,r7
        0x0202a3b4:    4610        .F      MOV      r0,r2
        0x0202a3b6:    4619        .F      MOV      r1,r3
        0x0202a3b8:    f7fef856    ..V.    BL       __aeabi_dmul ; 0x2028468
        0x0202a3bc:    4606        .F      MOV      r6,r0
        0x0202a3be:    460f        .F      MOV      r7,r1
        0x0202a3c0:    1064        d.      ASRS     r4,r4,#1
        0x0202a3c2:    2c00        .,      CMP      r4,#0
        0x0202a3c4:    d1ea        ..      BNE      0x202a39c ; _fp_digits + 128
        0x0202a3c6:    e9dd0104    ....    LDRD     r0,r1,[sp,#0x10]
        0x0202a3ca:    e9dd2300    ...#    LDRD     r2,r3,[sp,#0]
        0x0202a3ce:    f1ba0f00    ....    CMP      r10,#0
        0x0202a3d2:    da06        ..      BGE      0x202a3e2 ; _fp_digits + 198
        0x0202a3d4:    f7fef848    ..H.    BL       __aeabi_dmul ; 0x2028468
        0x0202a3d8:    4642        BF      MOV      r2,r8
        0x0202a3da:    464b        KF      MOV      r3,r9
        0x0202a3dc:    f7fef844    ..D.    BL       __aeabi_dmul ; 0x2028468
        0x0202a3e0:    e005        ..      B        0x202a3ee ; _fp_digits + 210
        0x0202a3e2:    f7fdff0d    ....    BL       __aeabi_ddiv ; 0x2028200
        0x0202a3e6:    4642        BF      MOV      r2,r8
        0x0202a3e8:    464b        KF      MOV      r3,r9
        0x0202a3ea:    f7fdff09    ....    BL       __aeabi_ddiv ; 0x2028200
        0x0202a3ee:    4604        .F      MOV      r4,r0
        0x0202a3f0:    460e        .F      MOV      r6,r1
        0x0202a3f2:    2200        ."      MOVS     r2,#0
        0x0202a3f4:    4b28        (K      LDR      r3,[pc,#160] ; [0x202a498] = 0x43f00000
        0x0202a3f6:    f7fef8c1    ....    BL       __aeabi_cdrcmple ; 0x202857c
        0x0202a3fa:    d803        ..      BHI      0x202a404 ; _fp_digits + 232
        0x0202a3fc:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x0202a400:    4601        .F      MOV      r1,r0
        0x0202a402:    e007        ..      B        0x202a414 ; _fp_digits + 248
        0x0202a404:    2200        ."      MOVS     r2,#0
        0x0202a406:    4b25        %K      LDR      r3,[pc,#148] ; [0x202a49c] = 0x3fe00000
        0x0202a408:    4620         F      MOV      r0,r4
        0x0202a40a:    4631        1F      MOV      r1,r6
        0x0202a40c:    f7fdfe51    ..Q.    BL       __aeabi_dadd ; 0x20280b2
        0x0202a410:    f7fef89c    ....    BL       __aeabi_d2ulz ; 0x202854c
        0x0202a414:    2410        .$      MOVS     r4,#0x10
        0x0202a416:    e009        ..      B        0x202a42c ; _fp_digits + 272
        0x0202a418:    2c00        .,      CMP      r4,#0
        0x0202a41a:    db0a        ..      BLT      0x202a432 ; _fp_digits + 278
        0x0202a41c:    220a        ."      MOVS     r2,#0xa
        0x0202a41e:    2300        .#      MOVS     r3,#0
        0x0202a420:    f7fdff73    ..s.    BL       __aeabi_uldivmod ; 0x202830a
        0x0202a424:    9b03        ..      LDR      r3,[sp,#0xc]
        0x0202a426:    3230        02      ADDS     r2,r2,#0x30
        0x0202a428:    551a        .U      STRB     r2,[r3,r4]
        0x0202a42a:    1e64        d.      SUBS     r4,r4,#1
        0x0202a42c:    ea500201    P...    ORRS     r2,r0,r1
        0x0202a430:    d1f2        ..      BNE      0x202a418 ; _fp_digits + 252
        0x0202a432:    1c64        d.      ADDS     r4,r4,#1
        0x0202a434:    9a03        ..      LDR      r2,[sp,#0xc]
        0x0202a436:    f1c40311    ....    RSB      r3,r4,#0x11
        0x0202a43a:    4414        .D      ADD      r4,r4,r2
        0x0202a43c:    9a11        ..      LDR      r2,[sp,#0x44]
        0x0202a43e:    2a01        .*      CMP      r2,#1
        0x0202a440:    d003        ..      BEQ      0x202a44a ; _fp_digits + 302
        0x0202a442:    2201        ."      MOVS     r2,#1
        0x0202a444:    4308        .C      ORRS     r0,r0,r1
        0x0202a446:    d10d        ..      BNE      0x202a464 ; _fp_digits + 328
        0x0202a448:    e00a        ..      B        0x202a460 ; _fp_digits + 324
        0x0202a44a:    4308        .C      ORRS     r0,r0,r1
        0x0202a44c:    d004        ..      BEQ      0x202a458 ; _fp_digits + 316
        0x0202a44e:    2000        .       MOVS     r0,#0
        0x0202a450:    f04f0b11    O...    MOV      r11,#0x11
        0x0202a454:    9011        ..      STR      r0,[sp,#0x44]
        0x0202a456:    e772        r.      B        0x202a33e ; _fp_digits + 34
        0x0202a458:    eba3050b    ....    SUB      r5,r3,r11
        0x0202a45c:    1e6d        m.      SUBS     r5,r5,#1
        0x0202a45e:    e00d        ..      B        0x202a47c ; _fp_digits + 352
        0x0202a460:    455b        [E      CMP      r3,r11
        0x0202a462:    dd04        ..      BLE      0x202a46e ; _fp_digits + 338
        0x0202a464:    f04f0200    O...    MOV      r2,#0
        0x0202a468:    f1050501    ....    ADD      r5,r5,#1
        0x0202a46c:    e004        ..      B        0x202a478 ; _fp_digits + 348
        0x0202a46e:    da03        ..      BGE      0x202a478 ; _fp_digits + 348
        0x0202a470:    f04f0200    O...    MOV      r2,#0
        0x0202a474:    f1a50501    ....    SUB      r5,r5,#1
        0x0202a478:    2a00        .*      CMP      r2,#0
        0x0202a47a:    d0ec        ..      BEQ      0x202a456 ; _fp_digits + 314
        0x0202a47c:    9802        ..      LDR      r0,[sp,#8]
        0x0202a47e:    9911        ..      LDR      r1,[sp,#0x44]
        0x0202a480:    e9c03102    ...1    STRD     r3,r1,[r0,#8]
        0x0202a484:    e9c04500    ...E    STRD     r4,r5,[r0,#0]
        0x0202a488:    e779        y.      B        0x202a37e ; _fp_digits + 98
    $d
        0x0202a48a:    0000        ..      DCW    0
        0x0202a48c:    40140000    ...@    DCD    1075052544
        0x0202a490:    3ff00000    ...?    DCD    1072693248
        0x0202a494:    00000030    0...    DCD    48
        0x0202a498:    43f00000    ...C    DCD    1139802112
        0x0202a49c:    3fe00000    ...?    DCD    1071644672
    $t
    i._printf_core
    _printf_core
        0x0202a4a0:    e92d4fff    -..O    PUSH     {r0-r11,lr}
        0x0202a4a4:    b095        ..      SUB      sp,sp,#0x54
        0x0202a4a6:    469b        .F      MOV      r11,r3
        0x0202a4a8:    4689        .F      MOV      r9,r1
        0x0202a4aa:    4606        .F      MOV      r6,r0
        0x0202a4ac:    2500        .%      MOVS     r5,#0
        0x0202a4ae:    e20f        ..      B        0x202a8d0 ; _printf_core + 1072
        0x0202a4b0:    2825        %(      CMP      r0,#0x25
        0x0202a4b2:    d177        w.      BNE      0x202a5a4 ; _printf_core + 260
        0x0202a4b4:    2400        .$      MOVS     r4,#0
        0x0202a4b6:    4627        'F      MOV      r7,r4
        0x0202a4b8:    4af8        .J      LDR      r2,[pc,#992] ; [0x202a89c] = 0x12809
        0x0202a4ba:    2101        .!      MOVS     r1,#1
        0x0202a4bc:    9405        ..      STR      r4,[sp,#0x14]
        0x0202a4be:    e000        ..      B        0x202a4c2 ; _printf_core + 34
        0x0202a4c0:    4304        .C      ORRS     r4,r4,r0
        0x0202a4c2:    f8163f01    ...?    LDRB     r3,[r6,#1]!
        0x0202a4c6:    3b20         ;      SUBS     r3,r3,#0x20
        0x0202a4c8:    fa01f003    ....    LSL      r0,r1,r3
        0x0202a4cc:    4210        .B      TST      r0,r2
        0x0202a4ce:    d1f7        ..      BNE      0x202a4c0 ; _printf_core + 32
        0x0202a4d0:    7830        0x      LDRB     r0,[r6,#0]
        0x0202a4d2:    282a        *(      CMP      r0,#0x2a
        0x0202a4d4:    d011        ..      BEQ      0x202a4fa ; _printf_core + 90
        0x0202a4d6:    f06f032f    o./.    MVN      r3,#0x2f
        0x0202a4da:    7830        0x      LDRB     r0,[r6,#0]
        0x0202a4dc:    f1a00230    ..0.    SUB      r2,r0,#0x30
        0x0202a4e0:    2a09        .*      CMP      r2,#9
        0x0202a4e2:    d816        ..      BHI      0x202a512 ; _printf_core + 114
        0x0202a4e4:    9a05        ..      LDR      r2,[sp,#0x14]
        0x0202a4e6:    f0440402    D...    ORR      r4,r4,#2
        0x0202a4ea:    eb020282    ....    ADD      r2,r2,r2,LSL #2
        0x0202a4ee:    eb030242    ..B.    ADD      r2,r3,r2,LSL #1
        0x0202a4f2:    4410        .D      ADD      r0,r0,r2
        0x0202a4f4:    1c76        v.      ADDS     r6,r6,#1
        0x0202a4f6:    9005        ..      STR      r0,[sp,#0x14]
        0x0202a4f8:    e7ef        ..      B        0x202a4da ; _printf_core + 58
        0x0202a4fa:    f8592b04    Y..+    LDR      r2,[r9],#4
        0x0202a4fe:    9205        ..      STR      r2,[sp,#0x14]
        0x0202a500:    2a00        .*      CMP      r2,#0
        0x0202a502:    da03        ..      BGE      0x202a50c ; _printf_core + 108
        0x0202a504:    4250        PB      RSBS     r0,r2,#0
        0x0202a506:    f4445400    D..T    ORR      r4,r4,#0x2000
        0x0202a50a:    9005        ..      STR      r0,[sp,#0x14]
        0x0202a50c:    f0440402    D...    ORR      r4,r4,#2
        0x0202a510:    1c76        v.      ADDS     r6,r6,#1
        0x0202a512:    7830        0x      LDRB     r0,[r6,#0]
        0x0202a514:    282e        .(      CMP      r0,#0x2e
        0x0202a516:    d116        ..      BNE      0x202a546 ; _printf_core + 166
        0x0202a518:    f8160f01    ....    LDRB     r0,[r6,#1]!
        0x0202a51c:    f0440404    D...    ORR      r4,r4,#4
        0x0202a520:    282a        *(      CMP      r0,#0x2a
        0x0202a522:    d00d        ..      BEQ      0x202a540 ; _printf_core + 160
        0x0202a524:    f06f022f    o./.    MVN      r2,#0x2f
        0x0202a528:    7830        0x      LDRB     r0,[r6,#0]
        0x0202a52a:    f1a00330    ..0.    SUB      r3,r0,#0x30
        0x0202a52e:    2b09        .+      CMP      r3,#9
        0x0202a530:    d809        ..      BHI      0x202a546 ; _printf_core + 166
        0x0202a532:    eb070387    ....    ADD      r3,r7,r7,LSL #2
        0x0202a536:    eb020343    ..C.    ADD      r3,r2,r3,LSL #1
        0x0202a53a:    18c7        ..      ADDS     r7,r0,r3
        0x0202a53c:    1c76        v.      ADDS     r6,r6,#1
        0x0202a53e:    e7f3        ..      B        0x202a528 ; _printf_core + 136
        0x0202a540:    f8597b04    Y..{    LDR      r7,[r9],#4
        0x0202a544:    1c76        v.      ADDS     r6,r6,#1
        0x0202a546:    7830        0x      LDRB     r0,[r6,#0]
        0x0202a548:    286c        l(      CMP      r0,#0x6c
        0x0202a54a:    d00f        ..      BEQ      0x202a56c ; _printf_core + 204
        0x0202a54c:    dc06        ..      BGT      0x202a55c ; _printf_core + 188
        0x0202a54e:    284c        L(      CMP      r0,#0x4c
        0x0202a550:    d017        ..      BEQ      0x202a582 ; _printf_core + 226
        0x0202a552:    2868        h(      CMP      r0,#0x68
        0x0202a554:    d00d        ..      BEQ      0x202a572 ; _printf_core + 210
        0x0202a556:    286a        j(      CMP      r0,#0x6a
        0x0202a558:    d114        ..      BNE      0x202a584 ; _printf_core + 228
        0x0202a55a:    e004        ..      B        0x202a566 ; _printf_core + 198
        0x0202a55c:    2874        t(      CMP      r0,#0x74
        0x0202a55e:    d010        ..      BEQ      0x202a582 ; _printf_core + 226
        0x0202a560:    287a        z(      CMP      r0,#0x7a
        0x0202a562:    d10f        ..      BNE      0x202a584 ; _printf_core + 228
        0x0202a564:    e00d        ..      B        0x202a582 ; _printf_core + 226
        0x0202a566:    f4441400    D...    ORR      r4,r4,#0x200000
        0x0202a56a:    e00a        ..      B        0x202a582 ; _printf_core + 226
        0x0202a56c:    f4441480    D...    ORR      r4,r4,#0x100000
        0x0202a570:    e001        ..      B        0x202a576 ; _printf_core + 214
        0x0202a572:    f4441440    D.@.    ORR      r4,r4,#0x300000
        0x0202a576:    7872        rx      LDRB     r2,[r6,#1]
        0x0202a578:    4282        .B      CMP      r2,r0
        0x0202a57a:    d102        ..      BNE      0x202a582 ; _printf_core + 226
        0x0202a57c:    f5041480    ....    ADD      r4,r4,#0x100000
        0x0202a580:    1c76        v.      ADDS     r6,r6,#1
        0x0202a582:    1c76        v.      ADDS     r6,r6,#1
        0x0202a584:    7830        0x      LDRB     r0,[r6,#0]
        0x0202a586:    2866        f(      CMP      r0,#0x66
        0x0202a588:    d00b        ..      BEQ      0x202a5a2 ; _printf_core + 258
        0x0202a58a:    dc13        ..      BGT      0x202a5b4 ; _printf_core + 276
        0x0202a58c:    2858        X(      CMP      r0,#0x58
        0x0202a58e:    d077        w.      BEQ      0x202a680 ; _printf_core + 480
        0x0202a590:    dc09        ..      BGT      0x202a5a6 ; _printf_core + 262
        0x0202a592:    2800        .(      CMP      r0,#0
        0x0202a594:    d075        u.      BEQ      0x202a682 ; _printf_core + 482
        0x0202a596:    2845        E(      CMP      r0,#0x45
        0x0202a598:    d0f6        ..      BEQ      0x202a588 ; _printf_core + 232
        0x0202a59a:    2846        F(      CMP      r0,#0x46
        0x0202a59c:    d0f4        ..      BEQ      0x202a588 ; _printf_core + 232
        0x0202a59e:    2847        G(      CMP      r0,#0x47
        0x0202a5a0:    d11a        ..      BNE      0x202a5d8 ; _printf_core + 312
        0x0202a5a2:    e19d        ..      B        0x202a8e0 ; _printf_core + 1088
        0x0202a5a4:    e018        ..      B        0x202a5d8 ; _printf_core + 312
        0x0202a5a6:    2863        c(      CMP      r0,#0x63
        0x0202a5a8:    d035        5.      BEQ      0x202a616 ; _printf_core + 374
        0x0202a5aa:    2864        d(      CMP      r0,#0x64
        0x0202a5ac:    d079        y.      BEQ      0x202a6a2 ; _printf_core + 514
        0x0202a5ae:    2865        e(      CMP      r0,#0x65
        0x0202a5b0:    d112        ..      BNE      0x202a5d8 ; _printf_core + 312
        0x0202a5b2:    e195        ..      B        0x202a8e0 ; _printf_core + 1088
        0x0202a5b4:    2870        p(      CMP      r0,#0x70
        0x0202a5b6:    d073        s.      BEQ      0x202a6a0 ; _printf_core + 512
        0x0202a5b8:    dc08        ..      BGT      0x202a5cc ; _printf_core + 300
        0x0202a5ba:    2867        g(      CMP      r0,#0x67
        0x0202a5bc:    d0f1        ..      BEQ      0x202a5a2 ; _printf_core + 258
        0x0202a5be:    2869        i(      CMP      r0,#0x69
        0x0202a5c0:    d06f        o.      BEQ      0x202a6a2 ; _printf_core + 514
        0x0202a5c2:    286e        n(      CMP      r0,#0x6e
        0x0202a5c4:    d00d        ..      BEQ      0x202a5e2 ; _printf_core + 322
        0x0202a5c6:    286f        o(      CMP      r0,#0x6f
        0x0202a5c8:    d106        ..      BNE      0x202a5d8 ; _printf_core + 312
        0x0202a5ca:    e0b5        ..      B        0x202a738 ; _printf_core + 664
        0x0202a5cc:    2873        s(      CMP      r0,#0x73
        0x0202a5ce:    d02c        ,.      BEQ      0x202a62a ; _printf_core + 394
        0x0202a5d0:    2875        u(      CMP      r0,#0x75
        0x0202a5d2:    d075        u.      BEQ      0x202a6c0 ; _printf_core + 544
        0x0202a5d4:    2878        x(      CMP      r0,#0x78
        0x0202a5d6:    d074        t.      BEQ      0x202a6c2 ; _printf_core + 546
        0x0202a5d8:    465a        ZF      MOV      r2,r11
        0x0202a5da:    9917        ..      LDR      r1,[sp,#0x5c]
        0x0202a5dc:    4790        .G      BLX      r2
        0x0202a5de:    1c6d        m.      ADDS     r5,r5,#1
        0x0202a5e0:    e175        u.      B        0x202a8ce ; _printf_core + 1070
        0x0202a5e2:    f3c45002    ...P    UBFX     r0,r4,#20,#3
        0x0202a5e6:    2802        .(      CMP      r0,#2
        0x0202a5e8:    d009        ..      BEQ      0x202a5fe ; _printf_core + 350
        0x0202a5ea:    2803        .(      CMP      r0,#3
        0x0202a5ec:    d00d        ..      BEQ      0x202a60a ; _printf_core + 362
        0x0202a5ee:    f8d91000    ....    LDR      r1,[r9,#0]
        0x0202a5f2:    2804        .(      CMP      r0,#4
        0x0202a5f4:    d00d        ..      BEQ      0x202a612 ; _printf_core + 370
        0x0202a5f6:    600d        .`      STR      r5,[r1,#0]
        0x0202a5f8:    f1090904    ....    ADD      r9,r9,#4
        0x0202a5fc:    e167        g.      B        0x202a8ce ; _printf_core + 1070
        0x0202a5fe:    f8d91000    ....    LDR      r1,[r9,#0]
        0x0202a602:    17ea        ..      ASRS     r2,r5,#31
        0x0202a604:    e9c15200    ...R    STRD     r5,r2,[r1,#0]
        0x0202a608:    e7f6        ..      B        0x202a5f8 ; _printf_core + 344
        0x0202a60a:    f8d91000    ....    LDR      r1,[r9,#0]
        0x0202a60e:    800d        ..      STRH     r5,[r1,#0]
        0x0202a610:    e7f2        ..      B        0x202a5f8 ; _printf_core + 344
        0x0202a612:    700d        .p      STRB     r5,[r1,#0]
        0x0202a614:    e7f0        ..      B        0x202a5f8 ; _printf_core + 344
        0x0202a616:    f8191b04    ....    LDRB     r1,[r9],#4
        0x0202a61a:    f88d1000    ....    STRB     r1,[sp,#0]
        0x0202a61e:    2000        .       MOVS     r0,#0
        0x0202a620:    f88d0001    ....    STRB     r0,[sp,#1]
        0x0202a624:    46ea        .F      MOV      r10,sp
        0x0202a626:    2001        .       MOVS     r0,#1
        0x0202a628:    e003        ..      B        0x202a632 ; _printf_core + 402
        0x0202a62a:    f859ab04    Y...    LDR      r10,[r9],#4
        0x0202a62e:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x0202a632:    0761        a.      LSLS     r1,r4,#29
        0x0202a634:    f04f0100    O...    MOV      r1,#0
        0x0202a638:    d402        ..      BMI      0x202a640 ; _printf_core + 416
        0x0202a63a:    e00d        ..      B        0x202a658 ; _printf_core + 440
        0x0202a63c:    f1080101    ....    ADD      r1,r8,#1
        0x0202a640:    4688        .F      MOV      r8,r1
        0x0202a642:    42b9        .B      CMP      r1,r7
        0x0202a644:    da0f        ..      BGE      0x202a666 ; _printf_core + 454
        0x0202a646:    4580        .E      CMP      r8,r0
        0x0202a648:    dbf8        ..      BLT      0x202a63c ; _printf_core + 412
        0x0202a64a:    f81a1008    ....    LDRB     r1,[r10,r8]
        0x0202a64e:    2900        .)      CMP      r1,#0
        0x0202a650:    d1f4        ..      BNE      0x202a63c ; _printf_core + 412
        0x0202a652:    e008        ..      B        0x202a666 ; _printf_core + 454
        0x0202a654:    f1080101    ....    ADD      r1,r8,#1
        0x0202a658:    4688        .F      MOV      r8,r1
        0x0202a65a:    4281        .B      CMP      r1,r0
        0x0202a65c:    dbfa        ..      BLT      0x202a654 ; _printf_core + 436
        0x0202a65e:    f81a1008    ....    LDRB     r1,[r10,r8]
        0x0202a662:    2900        .)      CMP      r1,#0
        0x0202a664:    d1f6        ..      BNE      0x202a654 ; _printf_core + 436
        0x0202a666:    9805        ..      LDR      r0,[sp,#0x14]
        0x0202a668:    465b        [F      MOV      r3,r11
        0x0202a66a:    eba00708    ....    SUB      r7,r0,r8
        0x0202a66e:    4621        !F      MOV      r1,r4
        0x0202a670:    4638        8F      MOV      r0,r7
        0x0202a672:    9a17        ..      LDR      r2,[sp,#0x5c]
        0x0202a674:    f000fa94    ....    BL       _printf_pre_padding ; 0x202aba0
        0x0202a678:    4428        (D      ADD      r0,r0,r5
        0x0202a67a:    eb000508    ....    ADD      r5,r0,r8
        0x0202a67e:    e007        ..      B        0x202a690 ; _printf_core + 496
        0x0202a680:    e04d        M.      B        0x202a71e ; _printf_core + 638
        0x0202a682:    e129        ).      B        0x202a8d8 ; _printf_core + 1080
        0x0202a684:    e00d        ..      B        0x202a6a2 ; _printf_core + 514
        0x0202a686:    f81a0b01    ....    LDRB     r0,[r10],#1
        0x0202a68a:    465a        ZF      MOV      r2,r11
        0x0202a68c:    9917        ..      LDR      r1,[sp,#0x5c]
        0x0202a68e:    4790        .G      BLX      r2
        0x0202a690:    f1b80801    ....    SUBS     r8,r8,#1
        0x0202a694:    d2f7        ..      BCS      0x202a686 ; _printf_core + 486
        0x0202a696:    465b        [F      MOV      r3,r11
        0x0202a698:    4621        !F      MOV      r1,r4
        0x0202a69a:    4638        8F      MOV      r0,r7
        0x0202a69c:    9a17        ..      LDR      r2,[sp,#0x5c]
        0x0202a69e:    e113        ..      B        0x202a8c8 ; _printf_core + 1064
        0x0202a6a0:    e042        B.      B        0x202a728 ; _printf_core + 648
        0x0202a6a2:    220a        ."      MOVS     r2,#0xa
        0x0202a6a4:    9200        ..      STR      r2,[sp,#0]
        0x0202a6a6:    f3c45202    ...R    UBFX     r2,r4,#20,#3
        0x0202a6aa:    f04f0a00    O...    MOV      r10,#0
        0x0202a6ae:    2a02        .*      CMP      r2,#2
        0x0202a6b0:    d008        ..      BEQ      0x202a6c4 ; _printf_core + 548
        0x0202a6b2:    f859cb04    Y...    LDR      r12,[r9],#4
        0x0202a6b6:    2a03        .*      CMP      r2,#3
        0x0202a6b8:    ea4f71ec    O..q    ASR      r1,r12,#31
        0x0202a6bc:    d00a        ..      BEQ      0x202a6d4 ; _printf_core + 564
        0x0202a6be:    e00d        ..      B        0x202a6dc ; _printf_core + 572
        0x0202a6c0:    e029        ).      B        0x202a716 ; _printf_core + 630
        0x0202a6c2:    e02a        *.      B        0x202a71a ; _printf_core + 634
        0x0202a6c4:    f1090107    ....    ADD      r1,r9,#7
        0x0202a6c8:    f0210207    !...    BIC      r2,r1,#7
        0x0202a6cc:    e8f2c102    ....    LDRD     r12,r1,[r2],#8
        0x0202a6d0:    4691        .F      MOV      r9,r2
        0x0202a6d2:    e009        ..      B        0x202a6e8 ; _printf_core + 584
        0x0202a6d4:    fa0ffc8c    ....    SXTH     r12,r12
        0x0202a6d8:    ea4f71ec    O..q    ASR      r1,r12,#31
        0x0202a6dc:    2a04        .*      CMP      r2,#4
        0x0202a6de:    d103        ..      BNE      0x202a6e8 ; _printf_core + 584
        0x0202a6e0:    fa4ffc8c    O...    SXTB     r12,r12
        0x0202a6e4:    ea4f71ec    O..q    ASR      r1,r12,#31
        0x0202a6e8:    2900        .)      CMP      r1,#0
        0x0202a6ea:    da07        ..      BGE      0x202a6fc ; _printf_core + 604
        0x0202a6ec:    460a        .F      MOV      r2,r1
        0x0202a6ee:    2100        .!      MOVS     r1,#0
        0x0202a6f0:    f1dc0c00    ....    RSBS     r12,r12,#0
        0x0202a6f4:    eb610102    a...    SBC      r1,r1,r2
        0x0202a6f8:    222d        -"      MOVS     r2,#0x2d
        0x0202a6fa:    e002        ..      B        0x202a702 ; _printf_core + 610
        0x0202a6fc:    0522        ".      LSLS     r2,r4,#20
        0x0202a6fe:    d504        ..      BPL      0x202a70a ; _printf_core + 618
        0x0202a700:    222b        +"      MOVS     r2,#0x2b
        0x0202a702:    f88d2004    ...     STRB     r2,[sp,#4]
        0x0202a706:    2201        ."      MOVS     r2,#1
        0x0202a708:    e003        ..      B        0x202a712 ; _printf_core + 626
        0x0202a70a:    07e2        ..      LSLS     r2,r4,#31
        0x0202a70c:    d001        ..      BEQ      0x202a712 ; _printf_core + 626
        0x0202a70e:    2220         "      MOVS     r2,#0x20
        0x0202a710:    e7f7        ..      B        0x202a702 ; _printf_core + 610
        0x0202a712:    4690        .F      MOV      r8,r2
        0x0202a714:    e059        Y.      B        0x202a7ca ; _printf_core + 810
        0x0202a716:    210a        .!      MOVS     r1,#0xa
        0x0202a718:    e002        ..      B        0x202a720 ; _printf_core + 640
        0x0202a71a:    2210        ."      MOVS     r2,#0x10
        0x0202a71c:    e00d        ..      B        0x202a73a ; _printf_core + 666
        0x0202a71e:    2110        .!      MOVS     r1,#0x10
        0x0202a720:    f04f0a00    O...    MOV      r10,#0
        0x0202a724:    9100        ..      STR      r1,[sp,#0]
        0x0202a726:    e00b        ..      B        0x202a740 ; _printf_core + 672
        0x0202a728:    2210        ."      MOVS     r2,#0x10
        0x0202a72a:    f04f0a00    O...    MOV      r10,#0
        0x0202a72e:    f0440404    D...    ORR      r4,r4,#4
        0x0202a732:    2708        .'      MOVS     r7,#8
        0x0202a734:    9200        ..      STR      r2,[sp,#0]
        0x0202a736:    e003        ..      B        0x202a740 ; _printf_core + 672
        0x0202a738:    2208        ."      MOVS     r2,#8
        0x0202a73a:    f04f0a00    O...    MOV      r10,#0
        0x0202a73e:    9200        ..      STR      r2,[sp,#0]
        0x0202a740:    f3c45202    ...R    UBFX     r2,r4,#20,#3
        0x0202a744:    2a02        .*      CMP      r2,#2
        0x0202a746:    d005        ..      BEQ      0x202a754 ; _printf_core + 692
        0x0202a748:    f859cb04    Y...    LDR      r12,[r9],#4
        0x0202a74c:    2100        .!      MOVS     r1,#0
        0x0202a74e:    2a03        .*      CMP      r2,#3
        0x0202a750:    d008        ..      BEQ      0x202a764 ; _printf_core + 708
        0x0202a752:    e009        ..      B        0x202a768 ; _printf_core + 712
        0x0202a754:    f1090107    ....    ADD      r1,r9,#7
        0x0202a758:    f0210207    !...    BIC      r2,r1,#7
        0x0202a75c:    e8f2c102    ....    LDRD     r12,r1,[r2],#8
        0x0202a760:    4691        .F      MOV      r9,r2
        0x0202a762:    e005        ..      B        0x202a770 ; _printf_core + 720
        0x0202a764:    fa1ffc8c    ....    UXTH     r12,r12
        0x0202a768:    2a04        .*      CMP      r2,#4
        0x0202a76a:    d101        ..      BNE      0x202a770 ; _printf_core + 720
        0x0202a76c:    f00c0cff    ....    AND      r12,r12,#0xff
        0x0202a770:    f04f0800    O...    MOV      r8,#0
        0x0202a774:    0722        ".      LSLS     r2,r4,#28
        0x0202a776:    d528        (.      BPL      0x202a7ca ; _printf_core + 810
        0x0202a778:    2870        p(      CMP      r0,#0x70
        0x0202a77a:    d006        ..      BEQ      0x202a78a ; _printf_core + 746
        0x0202a77c:    9b00        ..      LDR      r3,[sp,#0]
        0x0202a77e:    f0830310    ....    EOR      r3,r3,#0x10
        0x0202a782:    ea53030a    S...    ORRS     r3,r3,r10
        0x0202a786:    d005        ..      BEQ      0x202a794 ; _printf_core + 756
        0x0202a788:    e00e        ..      B        0x202a7a8 ; _printf_core + 776
        0x0202a78a:    2240        @"      MOVS     r2,#0x40
        0x0202a78c:    f88d2004    ...     STRB     r2,[sp,#4]
        0x0202a790:    2201        ."      MOVS     r2,#1
        0x0202a792:    e008        ..      B        0x202a7a6 ; _printf_core + 774
        0x0202a794:    ea5c0201    \...    ORRS     r2,r12,r1
        0x0202a798:    d006        ..      BEQ      0x202a7a8 ; _printf_core + 776
        0x0202a79a:    2230        0"      MOVS     r2,#0x30
        0x0202a79c:    f88d2004    ...     STRB     r2,[sp,#4]
        0x0202a7a0:    f88d0005    ....    STRB     r0,[sp,#5]
        0x0202a7a4:    2202        ."      MOVS     r2,#2
        0x0202a7a6:    4690        .F      MOV      r8,r2
        0x0202a7a8:    9b00        ..      LDR      r3,[sp,#0]
        0x0202a7aa:    f0830308    ....    EOR      r3,r3,#8
        0x0202a7ae:    ea53030a    S...    ORRS     r3,r3,r10
        0x0202a7b2:    d10a        ..      BNE      0x202a7ca ; _printf_core + 810
        0x0202a7b4:    ea5c0201    \...    ORRS     r2,r12,r1
        0x0202a7b8:    d101        ..      BNE      0x202a7be ; _printf_core + 798
        0x0202a7ba:    0762        b.      LSLS     r2,r4,#29
        0x0202a7bc:    d505        ..      BPL      0x202a7ca ; _printf_core + 810
        0x0202a7be:    2230        0"      MOVS     r2,#0x30
        0x0202a7c0:    f88d2004    ...     STRB     r2,[sp,#4]
        0x0202a7c4:    f04f0801    O...    MOV      r8,#1
        0x0202a7c8:    1e7f        ..      SUBS     r7,r7,#1
        0x0202a7ca:    2858        X(      CMP      r0,#0x58
        0x0202a7cc:    d004        ..      BEQ      0x202a7d8 ; _printf_core + 824
        0x0202a7ce:    a034        4.      ADR      r0,{pc}+0xd2 ; 0x202a8a0
        0x0202a7d0:    9003        ..      STR      r0,[sp,#0xc]
        0x0202a7d2:    a80e        ..      ADD      r0,sp,#0x38
        0x0202a7d4:    9002        ..      STR      r0,[sp,#8]
        0x0202a7d6:    e00d        ..      B        0x202a7f4 ; _printf_core + 852
        0x0202a7d8:    a036        6.      ADR      r0,{pc}+0xdc ; 0x202a8b4
        0x0202a7da:    e7f9        ..      B        0x202a7d0 ; _printf_core + 816
        0x0202a7dc:    4653        SF      MOV      r3,r10
        0x0202a7de:    4660        `F      MOV      r0,r12
        0x0202a7e0:    9a00        ..      LDR      r2,[sp,#0]
        0x0202a7e2:    f7fdfd92    ....    BL       __aeabi_uldivmod ; 0x202830a
        0x0202a7e6:    4684        .F      MOV      r12,r0
        0x0202a7e8:    9803        ..      LDR      r0,[sp,#0xc]
        0x0202a7ea:    5c82        .\      LDRB     r2,[r0,r2]
        0x0202a7ec:    9802        ..      LDR      r0,[sp,#8]
        0x0202a7ee:    1e40        @.      SUBS     r0,r0,#1
        0x0202a7f0:    9002        ..      STR      r0,[sp,#8]
        0x0202a7f2:    7002        .p      STRB     r2,[r0,#0]
        0x0202a7f4:    ea5c0001    \...    ORRS     r0,r12,r1
        0x0202a7f8:    d1f0        ..      BNE      0x202a7dc ; _printf_core + 828
        0x0202a7fa:    9802        ..      LDR      r0,[sp,#8]
        0x0202a7fc:    a906        ..      ADD      r1,sp,#0x18
        0x0202a7fe:    1a08        ..      SUBS     r0,r1,r0
        0x0202a800:    f1000a20    .. .    ADD      r10,r0,#0x20
        0x0202a804:    0760        `.      LSLS     r0,r4,#29
        0x0202a806:    d502        ..      BPL      0x202a80e ; _printf_core + 878
        0x0202a808:    f4243480    $..4    BIC      r4,r4,#0x10000
        0x0202a80c:    e000        ..      B        0x202a810 ; _printf_core + 880
        0x0202a80e:    2701        .'      MOVS     r7,#1
        0x0202a810:    4557        WE      CMP      r7,r10
        0x0202a812:    dd02        ..      BLE      0x202a81a ; _printf_core + 890
        0x0202a814:    eba7000a    ....    SUB      r0,r7,r10
        0x0202a818:    e000        ..      B        0x202a81c ; _printf_core + 892
        0x0202a81a:    2000        .       MOVS     r0,#0
        0x0202a81c:    eb00010a    ....    ADD      r1,r0,r10
        0x0202a820:    9000        ..      STR      r0,[sp,#0]
        0x0202a822:    9805        ..      LDR      r0,[sp,#0x14]
        0x0202a824:    4441        AD      ADD      r1,r1,r8
        0x0202a826:    1a40        @.      SUBS     r0,r0,r1
        0x0202a828:    9005        ..      STR      r0,[sp,#0x14]
        0x0202a82a:    03e0        ..      LSLS     r0,r4,#15
        0x0202a82c:    d406        ..      BMI      0x202a83c ; _printf_core + 924
        0x0202a82e:    465b        [F      MOV      r3,r11
        0x0202a830:    4621        !F      MOV      r1,r4
        0x0202a832:    9a17        ..      LDR      r2,[sp,#0x5c]
        0x0202a834:    9805        ..      LDR      r0,[sp,#0x14]
        0x0202a836:    f000f9b3    ....    BL       _printf_pre_padding ; 0x202aba0
        0x0202a83a:    4405        .D      ADD      r5,r5,r0
        0x0202a83c:    2700        .'      MOVS     r7,#0
        0x0202a83e:    e006        ..      B        0x202a84e ; _printf_core + 942
        0x0202a840:    a801        ..      ADD      r0,sp,#4
        0x0202a842:    465a        ZF      MOV      r2,r11
        0x0202a844:    5dc0        .]      LDRB     r0,[r0,r7]
        0x0202a846:    9917        ..      LDR      r1,[sp,#0x5c]
        0x0202a848:    4790        .G      BLX      r2
        0x0202a84a:    1c6d        m.      ADDS     r5,r5,#1
        0x0202a84c:    1c7f        ..      ADDS     r7,r7,#1
        0x0202a84e:    4547        GE      CMP      r7,r8
        0x0202a850:    dbf6        ..      BLT      0x202a840 ; _printf_core + 928
        0x0202a852:    03e0        ..      LSLS     r0,r4,#15
        0x0202a854:    d50c        ..      BPL      0x202a870 ; _printf_core + 976
        0x0202a856:    465b        [F      MOV      r3,r11
        0x0202a858:    4621        !F      MOV      r1,r4
        0x0202a85a:    9a17        ..      LDR      r2,[sp,#0x5c]
        0x0202a85c:    9805        ..      LDR      r0,[sp,#0x14]
        0x0202a85e:    f000f99f    ....    BL       _printf_pre_padding ; 0x202aba0
        0x0202a862:    4405        .D      ADD      r5,r5,r0
        0x0202a864:    e004        ..      B        0x202a870 ; _printf_core + 976
        0x0202a866:    2030        0       MOVS     r0,#0x30
        0x0202a868:    465a        ZF      MOV      r2,r11
        0x0202a86a:    9917        ..      LDR      r1,[sp,#0x5c]
        0x0202a86c:    4790        .G      BLX      r2
        0x0202a86e:    1c6d        m.      ADDS     r5,r5,#1
        0x0202a870:    9900        ..      LDR      r1,[sp,#0]
        0x0202a872:    1e48        H.      SUBS     r0,r1,#1
        0x0202a874:    9000        ..      STR      r0,[sp,#0]
        0x0202a876:    2900        .)      CMP      r1,#0
        0x0202a878:    dcf5        ..      BGT      0x202a866 ; _printf_core + 966
        0x0202a87a:    e008        ..      B        0x202a88e ; _printf_core + 1006
        0x0202a87c:    9802        ..      LDR      r0,[sp,#8]
        0x0202a87e:    9902        ..      LDR      r1,[sp,#8]
        0x0202a880:    465a        ZF      MOV      r2,r11
        0x0202a882:    7800        .x      LDRB     r0,[r0,#0]
        0x0202a884:    1c49        I.      ADDS     r1,r1,#1
        0x0202a886:    9102        ..      STR      r1,[sp,#8]
        0x0202a888:    9917        ..      LDR      r1,[sp,#0x5c]
        0x0202a88a:    4790        .G      BLX      r2
        0x0202a88c:    1c6d        m.      ADDS     r5,r5,#1
        0x0202a88e:    f1ba0100    ....    SUBS     r1,r10,#0
        0x0202a892:    f1aa0a01    ....    SUB      r10,r10,#1
        0x0202a896:    dcf1        ..      BGT      0x202a87c ; _printf_core + 988
        0x0202a898:    e165        e.      B        0x202ab66 ; _printf_core + 1734
    $d
        0x0202a89a:    0000        ..      DCW    0
        0x0202a89c:    00012809    .(..    DCD    75785
        0x0202a8a0:    33323130    0123    DCD    858927408
        0x0202a8a4:    37363534    4567    DCD    926299444
        0x0202a8a8:    62613938    89ab    DCD    1650538808
        0x0202a8ac:    66656463    cdef    DCD    1717920867
        0x0202a8b0:    00000000    ....    DCD    0
        0x0202a8b4:    33323130    0123    DCD    858927408
        0x0202a8b8:    37363534    4567    DCD    926299444
        0x0202a8bc:    42413938    89AB    DCD    1111570744
        0x0202a8c0:    46454443    CDEF    DCD    1178944579
        0x0202a8c4:    00000000    ....    DCD    0
    $t
        0x0202a8c8:    f000f958    ..X.    BL       _printf_post_padding ; 0x202ab7c
        0x0202a8cc:    4405        .D      ADD      r5,r5,r0
        0x0202a8ce:    1c76        v.      ADDS     r6,r6,#1
        0x0202a8d0:    7830        0x      LDRB     r0,[r6,#0]
        0x0202a8d2:    2800        .(      CMP      r0,#0
        0x0202a8d4:    f47fadec    ....    BNE      0x202a4b0 ; _printf_core + 16
        0x0202a8d8:    b019        ..      ADD      sp,sp,#0x64
        0x0202a8da:    4628        (F      MOV      r0,r5
        0x0202a8dc:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x0202a8e0:    0762        b.      LSLS     r2,r4,#29
        0x0202a8e2:    d400        ..      BMI      0x202a8e6 ; _printf_core + 1094
        0x0202a8e4:    2706        .'      MOVS     r7,#6
        0x0202a8e6:    f1090207    ....    ADD      r2,r9,#7
        0x0202a8ea:    f0220c07    "...    BIC      r12,r2,#7
        0x0202a8ee:    e8fc2302    ...#    LDRD     r2,r3,[r12],#8
        0x0202a8f2:    46e1        .F      MOV      r9,r12
        0x0202a8f4:    f0034800    ...H    AND      r8,r3,#0x80000000
        0x0202a8f8:    ea5f0c08    _...    MOVS     r12,r8
        0x0202a8fc:    d002        ..      BEQ      0x202a904 ; _printf_core + 1124
        0x0202a8fe:    f20f2c70    ..p,    ADR.W    r12,{pc}+0x272 ; 0x202ab70
        0x0202a902:    e00d        ..      B        0x202a920 ; _printf_core + 1152
        0x0202a904:    ea5f5c04    _..\    LSLS     r12,r4,#20
        0x0202a908:    d502        ..      BPL      0x202a910 ; _printf_core + 1136
        0x0202a90a:    f20f2c68    ..h,    ADR.W    r12,{pc}+0x26a ; 0x202ab74
        0x0202a90e:    e007        ..      B        0x202a920 ; _printf_core + 1152
        0x0202a910:    ea5f7cc4    _..|    LSLS     r12,r4,#31
        0x0202a914:    d002        ..      BEQ      0x202a91c ; _printf_core + 1148
        0x0202a916:    f20f2c60    ..`,    ADR.W    r12,{pc}+0x262 ; 0x202ab78
        0x0202a91a:    e001        ..      B        0x202a920 ; _printf_core + 1152
        0x0202a91c:    f2af0c70    ..p.    ADR      r12,{pc}-0x6c ; 0x202a8b0
        0x0202a920:    f04f38ff    O..8    MOV      r8,#0xffffffff
        0x0202a924:    f0234300    #..C    BIC      r3,r3,#0x80000000
        0x0202a928:    f8cdc050    ..P.    STR      r12,[sp,#0x50]
        0x0202a92c:    2865        e(      CMP      r0,#0x65
        0x0202a92e:    d00c        ..      BEQ      0x202a94a ; _printf_core + 1194
        0x0202a930:    dc06        ..      BGT      0x202a940 ; _printf_core + 1184
        0x0202a932:    2845        E(      CMP      r0,#0x45
        0x0202a934:    d009        ..      BEQ      0x202a94a ; _printf_core + 1194
        0x0202a936:    2846        F(      CMP      r0,#0x46
        0x0202a938:    d01d        ..      BEQ      0x202a976 ; _printf_core + 1238
        0x0202a93a:    2847        G(      CMP      r0,#0x47
        0x0202a93c:    d13d        =.      BNE      0x202a9ba ; _printf_core + 1306
        0x0202a93e:    e03d        =.      B        0x202a9bc ; _printf_core + 1308
        0x0202a940:    2866        f(      CMP      r0,#0x66
        0x0202a942:    d018        ..      BEQ      0x202a976 ; _printf_core + 1238
        0x0202a944:    2867        g(      CMP      r0,#0x67
        0x0202a946:    d17e        ~.      BNE      0x202aa46 ; _printf_core + 1446
        0x0202a948:    e038        8.      B        0x202a9bc ; _printf_core + 1308
        0x0202a94a:    2100        .!      MOVS     r1,#0
        0x0202a94c:    2f11        ./      CMP      r7,#0x11
        0x0202a94e:    db01        ..      BLT      0x202a954 ; _printf_core + 1204
        0x0202a950:    2011        .       MOVS     r0,#0x11
        0x0202a952:    e000        ..      B        0x202a956 ; _printf_core + 1206
        0x0202a954:    1c78        x.      ADDS     r0,r7,#1
        0x0202a956:    e9cd0100    ....    STRD     r0,r1,[sp,#0]
        0x0202a95a:    a906        ..      ADD      r1,sp,#0x18
        0x0202a95c:    a80e        ..      ADD      r0,sp,#0x38
        0x0202a95e:    f7fffcdd    ....    BL       _fp_digits ; 0x202a31c
        0x0202a962:    e9dd010f    ....    LDRD     r0,r1,[sp,#0x3c]
        0x0202a966:    9a0e        ..      LDR      r2,[sp,#0x38]
        0x0202a968:    9103        ..      STR      r1,[sp,#0xc]
        0x0202a96a:    2100        .!      MOVS     r1,#0
        0x0202a96c:    9200        ..      STR      r2,[sp,#0]
        0x0202a96e:    f1070a01    ....    ADD      r10,r7,#1
        0x0202a972:    9104        ..      STR      r1,[sp,#0x10]
        0x0202a974:    e04d        M.      B        0x202aa12 ; _printf_core + 1394
        0x0202a976:    f04f4000    O..@    MOV      r0,#0x80000000
        0x0202a97a:    9700        ..      STR      r7,[sp,#0]
        0x0202a97c:    e9cd1001    ....    STRD     r1,r0,[sp,#4]
        0x0202a980:    a906        ..      ADD      r1,sp,#0x18
        0x0202a982:    a80e        ..      ADD      r0,sp,#0x38
        0x0202a984:    f7fffcca    ....    BL       _fp_digits ; 0x202a31c
        0x0202a988:    e9dd020f    ....    LDRD     r0,r2,[sp,#0x3c]
        0x0202a98c:    9203        ..      STR      r2,[sp,#0xc]
        0x0202a98e:    9b0e        ..      LDR      r3,[sp,#0x38]
        0x0202a990:    9911        ..      LDR      r1,[sp,#0x44]
        0x0202a992:    2200        ."      MOVS     r2,#0
        0x0202a994:    f8dda00c    ....    LDR      r10,[sp,#0xc]
        0x0202a998:    9300        ..      STR      r3,[sp,#0]
        0x0202a99a:    9204        ..      STR      r2,[sp,#0x10]
        0x0202a99c:    b911        ..      CBNZ     r1,0x202a9a4 ; _printf_core + 1284
        0x0202a99e:    1c79        y.      ADDS     r1,r7,#1
        0x0202a9a0:    eb000a01    ....    ADD      r10,r0,r1
        0x0202a9a4:    ebb7000a    ....    SUBS     r0,r7,r10
        0x0202a9a8:    d404        ..      BMI      0x202a9b4 ; _printf_core + 1300
        0x0202a9aa:    f1c030ff    ...0    RSB      r0,r0,#0xffffffff
        0x0202a9ae:    f1070a01    ....    ADD      r10,r7,#1
        0x0202a9b2:    9004        ..      STR      r0,[sp,#0x10]
        0x0202a9b4:    ebaa0007    ....    SUB      r0,r10,r7
        0x0202a9b8:    9001        ..      STR      r0,[sp,#4]
        0x0202a9ba:    e044        D.      B        0x202aa46 ; _printf_core + 1446
        0x0202a9bc:    2f01        ./      CMP      r7,#1
        0x0202a9be:    da00        ..      BGE      0x202a9c2 ; _printf_core + 1314
        0x0202a9c0:    2701        .'      MOVS     r7,#1
        0x0202a9c2:    2100        .!      MOVS     r1,#0
        0x0202a9c4:    2f11        ./      CMP      r7,#0x11
        0x0202a9c6:    dd01        ..      BLE      0x202a9cc ; _printf_core + 1324
        0x0202a9c8:    2011        .       MOVS     r0,#0x11
        0x0202a9ca:    e000        ..      B        0x202a9ce ; _printf_core + 1326
        0x0202a9cc:    4638        8F      MOV      r0,r7
        0x0202a9ce:    e9cd0100    ....    STRD     r0,r1,[sp,#0]
        0x0202a9d2:    a906        ..      ADD      r1,sp,#0x18
        0x0202a9d4:    a80e        ..      ADD      r0,sp,#0x38
        0x0202a9d6:    f7fffca1    ....    BL       _fp_digits ; 0x202a31c
        0x0202a9da:    e9dd010f    ....    LDRD     r0,r1,[sp,#0x3c]
        0x0202a9de:    9a0e        ..      LDR      r2,[sp,#0x38]
        0x0202a9e0:    9103        ..      STR      r1,[sp,#0xc]
        0x0202a9e2:    2100        .!      MOVS     r1,#0
        0x0202a9e4:    9104        ..      STR      r1,[sp,#0x10]
        0x0202a9e6:    9200        ..      STR      r2,[sp,#0]
        0x0202a9e8:    46ba        .F      MOV      r10,r7
        0x0202a9ea:    0721        !.      LSLS     r1,r4,#28
        0x0202a9ec:    d40c        ..      BMI      0x202aa08 ; _printf_core + 1384
        0x0202a9ee:    9903        ..      LDR      r1,[sp,#0xc]
        0x0202a9f0:    4551        QE      CMP      r1,r10
        0x0202a9f2:    da00        ..      BGE      0x202a9f6 ; _printf_core + 1366
        0x0202a9f4:    468a        .F      MOV      r10,r1
        0x0202a9f6:    f1ba0f01    ....    CMP      r10,#1
        0x0202a9fa:    dd05        ..      BLE      0x202aa08 ; _printf_core + 1384
        0x0202a9fc:    9a00        ..      LDR      r2,[sp,#0]
        0x0202a9fe:    f1aa0101    ....    SUB      r1,r10,#1
        0x0202aa02:    5c51        Q\      LDRB     r1,[r2,r1]
        0x0202aa04:    2930        0)      CMP      r1,#0x30
        0x0202aa06:    d008        ..      BEQ      0x202aa1a ; _printf_core + 1402
        0x0202aa08:    42b8        .B      CMP      r0,r7
        0x0202aa0a:    da02        ..      BGE      0x202aa12 ; _printf_core + 1394
        0x0202aa0c:    f1100f04    ....    CMN      r0,#4
        0x0202aa10:    da06        ..      BGE      0x202aa20 ; _printf_core + 1408
        0x0202aa12:    2101        .!      MOVS     r1,#1
        0x0202aa14:    e9cd1001    ....    STRD     r1,r0,[sp,#4]
        0x0202aa18:    e015        ..      B        0x202aa46 ; _printf_core + 1446
        0x0202aa1a:    f1aa0101    ....    SUB      r1,r10,#1
        0x0202aa1e:    e7e9        ..      B        0x202a9f4 ; _printf_core + 1364
        0x0202aa20:    2800        .(      CMP      r0,#0
        0x0202aa22:    dc05        ..      BGT      0x202aa30 ; _printf_core + 1424
        0x0202aa24:    9904        ..      LDR      r1,[sp,#0x10]
        0x0202aa26:    4401        .D      ADD      r1,r1,r0
        0x0202aa28:    9104        ..      STR      r1,[sp,#0x10]
        0x0202aa2a:    ebaa0100    ....    SUB      r1,r10,r0
        0x0202aa2e:    e002        ..      B        0x202aa36 ; _printf_core + 1430
        0x0202aa30:    1c41        A.      ADDS     r1,r0,#1
        0x0202aa32:    4551        QE      CMP      r1,r10
        0x0202aa34:    dd00        ..      BLE      0x202aa38 ; _printf_core + 1432
        0x0202aa36:    468a        .F      MOV      r10,r1
        0x0202aa38:    9904        ..      LDR      r1,[sp,#0x10]
        0x0202aa3a:    1a40        @.      SUBS     r0,r0,r1
        0x0202aa3c:    1c40        @.      ADDS     r0,r0,#1
        0x0202aa3e:    9001        ..      STR      r0,[sp,#4]
        0x0202aa40:    f04f4000    O..@    MOV      r0,#0x80000000
        0x0202aa44:    9002        ..      STR      r0,[sp,#8]
        0x0202aa46:    0720         .      LSLS     r0,r4,#28
        0x0202aa48:    d404        ..      BMI      0x202aa54 ; _printf_core + 1460
        0x0202aa4a:    9801        ..      LDR      r0,[sp,#4]
        0x0202aa4c:    4550        PE      CMP      r0,r10
        0x0202aa4e:    db01        ..      BLT      0x202aa54 ; _printf_core + 1460
        0x0202aa50:    f8cd8004    ....    STR      r8,[sp,#4]
        0x0202aa54:    2000        .       MOVS     r0,#0
        0x0202aa56:    f88d004f    ..O.    STRB     r0,[sp,#0x4f]
        0x0202aa5a:    9802        ..      LDR      r0,[sp,#8]
        0x0202aa5c:    f10d074f    ..O.    ADD      r7,sp,#0x4f
        0x0202aa60:    f1b04f00    ...O    CMP      r0,#0x80000000
        0x0202aa64:    d025        %.      BEQ      0x202aab2 ; _printf_core + 1554
        0x0202aa66:    202b        +       MOVS     r0,#0x2b
        0x0202aa68:    900e        ..      STR      r0,[sp,#0x38]
        0x0202aa6a:    9802        ..      LDR      r0,[sp,#8]
        0x0202aa6c:    f04f0802    O...    MOV      r8,#2
        0x0202aa70:    2800        .(      CMP      r0,#0
        0x0202aa72:    da0c        ..      BGE      0x202aa8e ; _printf_core + 1518
        0x0202aa74:    4240        @B      RSBS     r0,r0,#0
        0x0202aa76:    9002        ..      STR      r0,[sp,#8]
        0x0202aa78:    202d        -       MOVS     r0,#0x2d
        0x0202aa7a:    900e        ..      STR      r0,[sp,#0x38]
        0x0202aa7c:    e007        ..      B        0x202aa8e ; _printf_core + 1518
        0x0202aa7e:    210a        .!      MOVS     r1,#0xa
        0x0202aa80:    9802        ..      LDR      r0,[sp,#8]
        0x0202aa82:    f7fdfc2c    ..,.    BL       __aeabi_uidiv ; 0x20282de
        0x0202aa86:    3130        01      ADDS     r1,r1,#0x30
        0x0202aa88:    9002        ..      STR      r0,[sp,#8]
        0x0202aa8a:    f8071d01    ....    STRB     r1,[r7,#-1]!
        0x0202aa8e:    f1b80100    ....    SUBS     r1,r8,#0
        0x0202aa92:    f1a80801    ....    SUB      r8,r8,#1
        0x0202aa96:    dcf2        ..      BGT      0x202aa7e ; _printf_core + 1502
        0x0202aa98:    9802        ..      LDR      r0,[sp,#8]
        0x0202aa9a:    2800        .(      CMP      r0,#0
        0x0202aa9c:    d1ef        ..      BNE      0x202aa7e ; _printf_core + 1502
        0x0202aa9e:    1e79        y.      SUBS     r1,r7,#1
        0x0202aaa0:    980e        ..      LDR      r0,[sp,#0x38]
        0x0202aaa2:    7008        .p      STRB     r0,[r1,#0]
        0x0202aaa4:    7830        0x      LDRB     r0,[r6,#0]
        0x0202aaa6:    f0000020    .. .    AND      r0,r0,#0x20
        0x0202aaaa:    f0400045    @.E.    ORR      r0,r0,#0x45
        0x0202aaae:    f8070d02    ....    STRB     r0,[r7,#-2]!
        0x0202aab2:    a812        ..      ADD      r0,sp,#0x48
        0x0202aab4:    1bc0        ..      SUBS     r0,r0,r7
        0x0202aab6:    f1000807    ....    ADD      r8,r0,#7
        0x0202aaba:    9814        ..      LDR      r0,[sp,#0x50]
        0x0202aabc:    7800        .x      LDRB     r0,[r0,#0]
        0x0202aabe:    b100        ..      CBZ      r0,0x202aac2 ; _printf_core + 1570
        0x0202aac0:    2001        .       MOVS     r0,#1
        0x0202aac2:    eb00010a    ....    ADD      r1,r0,r10
        0x0202aac6:    9801        ..      LDR      r0,[sp,#4]
        0x0202aac8:    eb0171e0    ...q    ADD      r1,r1,r0,ASR #31
        0x0202aacc:    9805        ..      LDR      r0,[sp,#0x14]
        0x0202aace:    4441        AD      ADD      r1,r1,r8
        0x0202aad0:    1a40        @.      SUBS     r0,r0,r1
        0x0202aad2:    1e40        @.      SUBS     r0,r0,#1
        0x0202aad4:    9005        ..      STR      r0,[sp,#0x14]
        0x0202aad6:    03e0        ..      LSLS     r0,r4,#15
        0x0202aad8:    d406        ..      BMI      0x202aae8 ; _printf_core + 1608
        0x0202aada:    465b        [F      MOV      r3,r11
        0x0202aadc:    4621        !F      MOV      r1,r4
        0x0202aade:    9a17        ..      LDR      r2,[sp,#0x5c]
        0x0202aae0:    9805        ..      LDR      r0,[sp,#0x14]
        0x0202aae2:    f000f85d    ..].    BL       _printf_pre_padding ; 0x202aba0
        0x0202aae6:    4405        .D      ADD      r5,r5,r0
        0x0202aae8:    9814        ..      LDR      r0,[sp,#0x50]
        0x0202aaea:    7800        .x      LDRB     r0,[r0,#0]
        0x0202aaec:    b118        ..      CBZ      r0,0x202aaf6 ; _printf_core + 1622
        0x0202aaee:    465a        ZF      MOV      r2,r11
        0x0202aaf0:    9917        ..      LDR      r1,[sp,#0x5c]
        0x0202aaf2:    4790        .G      BLX      r2
        0x0202aaf4:    1c6d        m.      ADDS     r5,r5,#1
        0x0202aaf6:    03e0        ..      LSLS     r0,r4,#15
        0x0202aaf8:    d524        $.      BPL      0x202ab44 ; _printf_core + 1700
        0x0202aafa:    465b        [F      MOV      r3,r11
        0x0202aafc:    4621        !F      MOV      r1,r4
        0x0202aafe:    9a17        ..      LDR      r2,[sp,#0x5c]
        0x0202ab00:    9805        ..      LDR      r0,[sp,#0x14]
        0x0202ab02:    f000f84d    ..M.    BL       _printf_pre_padding ; 0x202aba0
        0x0202ab06:    4405        .D      ADD      r5,r5,r0
        0x0202ab08:    e01c        ..      B        0x202ab44 ; _printf_core + 1700
        0x0202ab0a:    9804        ..      LDR      r0,[sp,#0x10]
        0x0202ab0c:    2800        .(      CMP      r0,#0
        0x0202ab0e:    db07        ..      BLT      0x202ab20 ; _printf_core + 1664
        0x0202ab10:    e9dd0103    ....    LDRD     r0,r1,[sp,#0xc]
        0x0202ab14:    4288        .B      CMP      r0,r1
        0x0202ab16:    dd03        ..      BLE      0x202ab20 ; _printf_core + 1664
        0x0202ab18:    9800        ..      LDR      r0,[sp,#0]
        0x0202ab1a:    5c40        @\      LDRB     r0,[r0,r1]
        0x0202ab1c:    9917        ..      LDR      r1,[sp,#0x5c]
        0x0202ab1e:    e001        ..      B        0x202ab24 ; _printf_core + 1668
        0x0202ab20:    9917        ..      LDR      r1,[sp,#0x5c]
        0x0202ab22:    2030        0       MOVS     r0,#0x30
        0x0202ab24:    465a        ZF      MOV      r2,r11
        0x0202ab26:    4790        .G      BLX      r2
        0x0202ab28:    9804        ..      LDR      r0,[sp,#0x10]
        0x0202ab2a:    f1050501    ....    ADD      r5,r5,#1
        0x0202ab2e:    1c40        @.      ADDS     r0,r0,#1
        0x0202ab30:    9004        ..      STR      r0,[sp,#0x10]
        0x0202ab32:    9801        ..      LDR      r0,[sp,#4]
        0x0202ab34:    1e40        @.      SUBS     r0,r0,#1
        0x0202ab36:    9001        ..      STR      r0,[sp,#4]
        0x0202ab38:    d104        ..      BNE      0x202ab44 ; _printf_core + 1700
        0x0202ab3a:    202e        .       MOVS     r0,#0x2e
        0x0202ab3c:    465a        ZF      MOV      r2,r11
        0x0202ab3e:    9917        ..      LDR      r1,[sp,#0x5c]
        0x0202ab40:    4790        .G      BLX      r2
        0x0202ab42:    1c6d        m.      ADDS     r5,r5,#1
        0x0202ab44:    f1ba0100    ....    SUBS     r1,r10,#0
        0x0202ab48:    f1aa0a01    ....    SUB      r10,r10,#1
        0x0202ab4c:    dcdd        ..      BGT      0x202ab0a ; _printf_core + 1642
        0x0202ab4e:    e005        ..      B        0x202ab5c ; _printf_core + 1724
        0x0202ab50:    f8170b01    ....    LDRB     r0,[r7],#1
        0x0202ab54:    465a        ZF      MOV      r2,r11
        0x0202ab56:    9917        ..      LDR      r1,[sp,#0x5c]
        0x0202ab58:    4790        .G      BLX      r2
        0x0202ab5a:    1c6d        m.      ADDS     r5,r5,#1
        0x0202ab5c:    f1b80100    ....    SUBS     r1,r8,#0
        0x0202ab60:    f1a80801    ....    SUB      r8,r8,#1
        0x0202ab64:    dcf4        ..      BGT      0x202ab50 ; _printf_core + 1712
        0x0202ab66:    465b        [F      MOV      r3,r11
        0x0202ab68:    4621        !F      MOV      r1,r4
        0x0202ab6a:    9a17        ..      LDR      r2,[sp,#0x5c]
        0x0202ab6c:    9805        ..      LDR      r0,[sp,#0x14]
        0x0202ab6e:    e6ab        ..      B        0x202a8c8 ; _printf_core + 1064
    $d
        0x0202ab70:    0000002d    -...    DCD    45
        0x0202ab74:    0000002b    +...    DCD    43
        0x0202ab78:    00000020     ...    DCD    32
    $t
    i._printf_post_padding
    _printf_post_padding
        0x0202ab7c:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x0202ab80:    4604        .F      MOV      r4,r0
        0x0202ab82:    2500        .%      MOVS     r5,#0
        0x0202ab84:    461e        .F      MOV      r6,r3
        0x0202ab86:    4617        .F      MOV      r7,r2
        0x0202ab88:    0488        ..      LSLS     r0,r1,#18
        0x0202ab8a:    d404        ..      BMI      0x202ab96 ; _printf_post_padding + 26
        0x0202ab8c:    e005        ..      B        0x202ab9a ; _printf_post_padding + 30
        0x0202ab8e:    4639        9F      MOV      r1,r7
        0x0202ab90:    2020                MOVS     r0,#0x20
        0x0202ab92:    47b0        .G      BLX      r6
        0x0202ab94:    1c6d        m.      ADDS     r5,r5,#1
        0x0202ab96:    1e64        d.      SUBS     r4,r4,#1
        0x0202ab98:    d5f9        ..      BPL      0x202ab8e ; _printf_post_padding + 18
        0x0202ab9a:    4628        (F      MOV      r0,r5
        0x0202ab9c:    e8bd81f0    ....    POP      {r4-r8,pc}
    i._printf_pre_padding
    _printf_pre_padding
        0x0202aba0:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x0202aba4:    4604        .F      MOV      r4,r0
        0x0202aba6:    2500        .%      MOVS     r5,#0
        0x0202aba8:    461e        .F      MOV      r6,r3
        0x0202abaa:    4690        .F      MOV      r8,r2
        0x0202abac:    03c8        ..      LSLS     r0,r1,#15
        0x0202abae:    d501        ..      BPL      0x202abb4 ; _printf_pre_padding + 20
        0x0202abb0:    2730        0'      MOVS     r7,#0x30
        0x0202abb2:    e000        ..      B        0x202abb6 ; _printf_pre_padding + 22
        0x0202abb4:    2720         '      MOVS     r7,#0x20
        0x0202abb6:    0488        ..      LSLS     r0,r1,#18
        0x0202abb8:    d504        ..      BPL      0x202abc4 ; _printf_pre_padding + 36
        0x0202abba:    e005        ..      B        0x202abc8 ; _printf_pre_padding + 40
        0x0202abbc:    4641        AF      MOV      r1,r8
        0x0202abbe:    4638        8F      MOV      r0,r7
        0x0202abc0:    47b0        .G      BLX      r6
        0x0202abc2:    1c6d        m.      ADDS     r5,r5,#1
        0x0202abc4:    1e64        d.      SUBS     r4,r4,#1
        0x0202abc6:    d5f9        ..      BPL      0x202abbc ; _printf_pre_padding + 28
        0x0202abc8:    4628        (F      MOV      r0,r5
        0x0202abca:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d.realdata
    .L__const.setup_peripherals_spi_module.pParam
        0x0202abce:    0005        ..      DCW    5
        0x0202abd0:    011f0000    ....    DCD    18808832
        0x0202abd4:    00500000    ..P.    DCD    5242880
        0x0202abd8:    00000050    P...    DCD    80
        0x0202abdc:    01000010    ....    DCD    16777232
        0x0202abe0:    0000        ..      DCW    0
    PINCTRL_SelSpiIn.bit_offset_tab
        0x0202abe2:    0f0a        ..      DCW    3850
        0x0202abe4:    0a050014    ....    DCD    168099860
        0x0202abe8:    0f0a140f    ....    DCD    252318735
        0x0202abec:    0500        ..      DCW    1280
    PINCTRL_SelSpiIn.reg_tab
        0x0202abee:    0000        ..      DCW    0
        0x0202abf0:    01010100    ....    DCD    16843008
        0x0202abf4:    02020101    ....    DCD    33685761
        0x0202abf8:    0202        ..      DCW    514
    PINCTRL_SelSpiIn.source_tab
        0x0202abfa:    5756        VW      DCW    22358
        0x0202abfc:    5b5a5958    XYZ[    DCD    1532647768
        0x0202ac00:    61605d5c    \]`a    DCD    1633705308
        0x0202ac04:    5f5e        ^_      DCW    24414
    io_output_source_map
        0x0202ac06:    ffff        ..      DCW    65535
        0x0202ac08:    aaaafaff    ....    DCD    2863332095
        0x0202ac0c:    0200c048    H...    DCD    33603656
        0x0202ac10:    ffffff0f    ....    DCD    4294967055
        0x0202ac14:    87030000    ....    DCD    2265120768
        0x0202ac18:    ffffffe0    ....    DCD    4294967264
        0x0202ac1c:    245555f5    .UU$    DCD    609572341
        0x0202ac20:    0f0100a0    ....    DCD    251723936
        0x0202ac24:    80feffff    ....    DCD    2164195327
        0x0202ac28:    e0a70300    ....    DCD    3769041664
        0x0202ac2c:    faffffff    ....    DCD    4211081215
        0x0202ac30:    9090a8aa    ....    DCD    2425399466
        0x0202ac34:    ff8f0000    ....    DCD    4287561728
        0x0202ac38:    0040feff    ..@.    DCD    4259583
        0x0202ac3c:    ffe09703    ....    DCD    4292908803
        0x0202ac40:    55f5ffff    ...U    DCD    1442185215
        0x0202ac44:    00884856    VH..    DCD    8931414
        0x0202ac48:    ffff4f00    .O..    DCD    4294921984
        0x0202ac4c:    030020fe    . ..    DCD    50340094
        0x0202ac50:    ffffe0c7    ....    DCD    4294959303
        0x0202ac54:    a9aafaff    ....    DCD    2846554879
        0x0202ac58:    00008426    &...    DCD    33830
        0x0202ac5c:    feffff2f    /...    DCD    4278189871
        0x0202ac60:    87030010    ....    DCD    2265120784
        0x0202ac64:    ffffffe0    ....    DCD    4294967264
        0x0202ac68:    925455f5    .UT.    DCD    2455000565
        0x0202ac6c:    1f000082    ....    DCD    520093826
        0x0202ac70:    08feffff    ....    DCD    150929407
        0x0202ac74:    e08f0300    ....    DCD    3767468800
        0x0202ac78:    faffffff    ....    DCD    4211081215
        0x0202ac7c:    814aaaaa    ..J.    DCD    2169154218
        0x0202ac80:    ff0f0200    ....    DCD    4279173632
        0x0202ac84:    0004feff    ....    DCD    327423
        0x0202ac88:    ffe08703    ....    DCD    4292904707
        0x0202ac8c:    55f5ffff    ...U    DCD    1442185215
        0x0202ac90:    80802655    U&..    DCD    2155882069
        0x0202ac94:    ffff0f01    ....    DCD    4294905601
        0x0202ac98:    030002fe    ....    DCD    50332414
        0x0202ac9c:    ffffe0a7    ....    DCD    4294959271
        0x0202aca0:    a8aafaff    ....    DCD    2829777663
        0x0202aca4:    00408092    ..@.    DCD    4227218
        0x0202aca8:    feffff8f    ....    DCD    4278189967
        0x0202acac:    97030001    ....    DCD    2533556225
        0x0202acb0:    ffffffe0    ....    DCD    4294967264
        0x0202acb4:    4a5655f5    .UVJ    DCD    1247172085
        0x0202acb8:    4f002080    . .O    DCD    1325408384
        0x0202acbc:    00feffff    ....    DCD    16711679
        0x0202acc0:    e0c70380    ....    DCD    3771138944
        0x0202acc4:    faffffff    ....    DCD    4211081215
        0x0202acc8:    8026a9aa    ..&.    DCD    2150017450
        0x0202accc:    ff2f0010    ../.    DCD    4281270288
        0x0202acd0:    4000feff    ...@    DCD    1073807103
        0x0202acd4:    ffe08703    ....    DCD    4292904707
        0x0202acd8:    55f5ffff    ...U    DCD    1442185215
        0x0202acdc:    08809154    T...    DCD    142643540
        0x0202ace0:    ffff1f00    ....    DCD    4294909696
        0x0202ace4:    032000fe    .. .    DCD    52429054
        0x0202ace8:    ffffe08f    ....    DCD    4294959247
        0x0202acec:    aaaafaff    ....    DCD    2863332095
        0x0202acf0:    00048049    I...    DCD    294985
        0x0202acf4:    feffff0f    ....    DCD    4278189839
        0x0202acf8:    87031000    ....    DCD    2265124864
        0x0202acfc:    ffffffe0    ....    DCD    4294967264
        0x0202ad00:    255555f5    .UU%    DCD    626349557
        0x0202ad04:    0f000280    ....    DCD    251658880
        0x0202ad08:    00feffff    ....    DCD    16711679
        0x0202ad0c:    e0870308    ....    DCD    3766944520
        0x0202ad10:    faffffff    ....    DCD    4211081215
        0x0202ad14:    8091a8aa    ....    DCD    2157029546
        0x0202ad18:    ff0f0001    ....    DCD    4279173121
        0x0202ad1c:    0400feff    ....    DCD    67174143
        0x0202ad20:    ffe08703    ....    DCD    4292904707
        0x0202ad24:    55f5ffff    ...U    DCD    1442185215
        0x0202ad28:    00804956    VI..    DCD    8407382
        0x0202ad2c:    ffff0f80    ....    DCD    4294905728
        0x0202ad30:    130200fe    ....    DCD    318898430
        0x0202ad34:    ffffe087    ....    DCD    4294959239
        0x0202ad38:    a9aafaff    ....    DCD    2846554879
        0x0202ad3c:    40008025    %..@    DCD    1073774629
        0x0202ad40:    feffff0f    ....    DCD    4278189839
        0x0202ad44:    870b0100    ....    DCD    2265645312
        0x0202ad48:    ffffffe0    ....    DCD    4294967264
        0x0202ad4c:    915455f5    .UT.    DCD    2438223349
        0x0202ad50:    0f240080    ..$.    DCD    254017664
        0x0202ad54:    00feffff    ....    DCD    16711679
        0x0202ad58:    e0878700    ....    DCD    3766978304
        0x0202ad5c:    000000c8    ....    DCD    200
        0x0202ad60:    00000000    ....    DCD    0
        0x0202ad64:    00010000    ....    DCD    65536
        0x0202ad68:    00000000    ....    DCD    0
        0x0202ad6c:    d0000000    ....    DCD    3489660928
        0x0202ad70:    00000000    ....    DCD    0
        0x0202ad74:    00000000    ....    DCD    0
        0x0202ad78:    00000200    ....    DCD    512
        0x0202ad7c:    00000000    ....    DCD    0
        0x0202ad80:    00c40000    ....    DCD    12845056
        0x0202ad84:    00000000    ....    DCD    0
        0x0202ad88:    00000000    ....    DCD    0
        0x0202ad8c:    00008000    ....    DCD    32768
        0x0202ad90:    00000000    ....    DCD    0
        0x0202ad94:    ffffff00    ....    DCD    4294967040
        0x0202ad98:    48aaaafa    ...H    DCD    1219144442
        0x0202ad9c:    0f100080    ....    DCD    252706944
        0x0202ada0:    00feffff    ....    DCD    16711679
        0x0202ada4:    e0874300    .C..    DCD    3766960896
        0x0202ada8:    f5ffffff    ....    DCD    4127195135
        0x0202adac:    80245555    UU$.    DCD    2149864789
        0x0202adb0:    ff0f0800    ....    DCD    4279175168
        0x0202adb4:    0000feff    ....    DCD    65279
        0x0202adb8:    c0e08723    #...    DCD    3235940131
        0x0202adbc:    00000000    ....    DCD    0
        0x0202adc0:    00400000    ..@.    DCD    4194304
        0x0202adc4:    00000000    ....    DCD    0
        0x0202adc8:    00000001    ....    DCD    1
        0x0202adcc:    00c00000    ....    DCD    12582912
        0x0202add0:    00000000    ....    DCD    0
        0x0202add4:    00002000    . ..    DCD    8192
        0x0202add8:    00000000    ....    DCD    0
        0x0202addc:    00000080    ....    DCD    128
        0x0202ade0:    0000c000    ....    DCD    49152
        0x0202ade4:    00000000    ....    DCD    0
        0x0202ade8:    00000010    ....    DCD    16
        0x0202adec:    40000000    ...@    DCD    1073741824
        0x0202adf0:    00000000    ....    DCD    0
        0x0202adf4:    000000c2    ....    DCD    194
        0x0202adf8:    00000000    ....    DCD    0
        0x0202adfc:    40000000    ...@    DCD    1073741824
        0x0202ae00:    00000000    ....    DCD    0
        0x0202ae04:    c1000000    ....    DCD    3238002688
        0x0202ae08:    00000000    ....    DCD    0
        0x0202ae0c:    00000000    ....    DCD    0
        0x0202ae10:    00200000    .. .    DCD    2097152
        0x0202ae14:    00000000    ....    DCD    0
        0x0202ae18:    80c00000    ....    DCD    2160066560
        0x0202ae1c:    00000000    ....    DCD    0
        0x0202ae20:    00000000    ....    DCD    0
        0x0202ae24:    00001000    ....    DCD    4096
        0x0202ae28:    00000000    ....    DCD    0
        0x0202ae2c:    0000c000    ....    DCD    49152
        0x0202ae30:    00000000    ....    DCD    0
        0x0202ae34:    00000008    ....    DCD    8
        0x0202ae38:    20000000    ...     DCD    536870912
        0x0202ae3c:    00000000    ....    DCD    0
        0x0202ae40:    000000c0    ....    DCD    192
        0x0202ae44:    04000000    ....    DCD    67108864
        0x0202ae48:    00000000    ....    DCD    0
        0x0202ae4c:    00100000    ....    DCD    1048576
        0x0202ae50:    ff000000    ....    DCD    4278190080
        0x0202ae54:    aafaffff    ....    DCD    2868576255
        0x0202ae58:    008290a8    ....    DCD    8556712
        0x0202ae5c:    ffff0f00    ....    DCD    4294905600
        0x0202ae60:    030008fe    ....    DCD    50333950
        0x0202ae64:    00c0e087    ....    DCD    12640391
        0x0202ae68:    00000000    ....    DCD    0
        0x0202ae6c:    00000100    ....    DCD    256
        0x0202ae70:    00000000    ....    DCD    0
        0x0202ae74:    00000004    ....    DCD    4
        0x0202ae78:    0000c000    ....    DCD    49152
        0x0202ae7c:    00000000    ....    DCD    0
        0x0202ae80:    00008000    ....    DCD    32768
        0x0202ae84:    02000000    ....    DCD    33554432
        0x0202ae88:    00000000    ....    DCD    0
        0x0202ae8c:    f5ffffff    ....    DCD    4127195135
        0x0202ae90:    804b5655    UVK.    DCD    2152420949
        0x0202ae94:    ff0f0040    @...    DCD    4279173184
        0x0202ae98:    0001feff    ....    DCD    130815
        0x0202ae9c:    ffe08703    ....    DCD    4292904707
        0x0202aea0:    aafaffff    ....    DCD    2868576255
        0x0202aea4:    208027a9    .'.     DCD    545269673
        0x0202aea8:    ffff0f00    ....    DCD    4294905600
        0x0202aeac:    038000fe    ....    DCD    58720510
        0x0202aeb0:    00c0e087    ....    DCD    12640391
        0x0202aeb4:    00000000    ....    DCD    0
        0x0202aeb8:    00100000    ....    DCD    1048576
        0x0202aebc:    00000000    ....    DCD    0
        0x0202aec0:    00004000    .@..    DCD    16384
        0x0202aec4:    0000c000    ....    DCD    49152
        0x0202aec8:    00000000    ....    DCD    0
        0x0202aecc:    00000800    ....    DCD    2048
        0x0202aed0:    00000000    ....    DCD    0
        0x0202aed4:    00000020     ...    DCD    32
        0x0202aed8:    000000c0    ....    DCD    192
        0x0202aedc:    00000000    ....    DCD    0
        0x0202aee0:    00000004    ....    DCD    4
        0x0202aee4:    10000000    ....    DCD    268435456
        0x0202aee8:    c0000000    ....    DCD    3221225472
        0x0202aeec:    00000000    ....    DCD    0
        0x0202aef0:    02000000    ....    DCD    33554432
        0x0202aef4:    00000000    ....    DCD    0
        0x0202aef8:    00080000    ....    DCD    524288
        0x0202aefc:    00c00000    ....    DCD    12582912
        0x0202af00:    00000000    ....    DCD    0
        0x0202af04:    00010000    ....    DCD    65536
        0x0202af08:    00000000    ....    DCD    0
        0x0202af0c:    00000400    ....    DCD    1024
        0x0202af10:    0000c000    ....    DCD    49152
        0x0202af14:    00000000    ....    DCD    0
        0x0202af18:    00800000    ....    DCD    8388608
        0x0202af1c:    00000000    ....    DCD    0
        0x0202af20:    00000002    ....    DCD    2
    .L.str.2
        0x0202af24:    44524148    HARD    DCD    1146241352
        0x0202af28:    4c554146    FAUL    DCD    1280655686
        0x0202af2c:    500a3a54    T:.P    DCD    1342847572
        0x0202af30:    203a2043    C :     DCD    540680259
        0x0202af34:    30257830    0x%0    DCD    807761968
        0x0202af38:    4c0a5838    8X.L    DCD    1275746360
        0x0202af3c:    203a2052    R :     DCD    540680274
        0x0202af40:    30257830    0x%0    DCD    807761968
        0x0202af44:    500a5838    8X.P    DCD    1342855224
        0x0202af48:    203a5253    SR:     DCD    540693075
        0x0202af4c:    30257830    0x%0    DCD    807761968
        0x0202af50:    520a5838    8X.R    DCD    1376409656
        0x0202af54:    203a2030    0 :     DCD    540680240
        0x0202af58:    30257830    0x%0    DCD    807761968
        0x0202af5c:    520a5838    8X.R    DCD    1376409656
        0x0202af60:    203a2031    1 :     DCD    540680241
        0x0202af64:    30257830    0x%0    DCD    807761968
        0x0202af68:    520a5838    8X.R    DCD    1376409656
        0x0202af6c:    203a2032    2 :     DCD    540680242
        0x0202af70:    30257830    0x%0    DCD    807761968
        0x0202af74:    500a5838    8X.P    DCD    1342855224
        0x0202af78:    203a2033    3 :     DCD    540680243
        0x0202af7c:    30257830    0x%0    DCD    807761968
        0x0202af80:    520a5838    8X.R    DCD    1376409656
        0x0202af84:    203a3231    12:     DCD    540684849
        0x0202af88:    30257830    0x%0    DCD    807761968
        0x0202af8c:    000a5838    8X..    DCD    677944
    .L.str.4
        0x0202af90:    4d4f4f5b    [OOM    DCD    1297043291
        0x0202af94:    2040205d    ] @     DCD    541073501
        0x0202af98:    000a6425    %d..    DCD    680997
    .L.str.3
        0x0202af9c:    5353415b    [ASS    DCD    1397965147
        0x0202afa0:    49545245    ERTI    DCD    1230262853
        0x0202afa4:    205d4e4f    ON]     DCD    542985807
        0x0202afa8:    73252040    @ %s    DCD    1931812928
        0x0202afac:    0a64253a    :%d.    DCD    174335290
        0x0202afb0:    00          .       DCB    0
    .L.str
        0x0202afb1:    6100        a.      DCB    97,0
    .L.str.1
        0x0202afb3:    70          p       DCB    112
        0x0202afb4:    00          .       DCB    0
    .L.str
        0x0202afb5:    207365       se     DCB    32,115,101
        0x0202afb8:    20707574    tup     DCD    544241012
        0x0202afbc:    206b6c63    clk     DCD    543911011
        0x0202afc0:    0a206425    %d .    DCD    169894949
        0x0202afc4:    00          .       DCB    0
    .L.str.4
        0x0202afc5:    747820      tx      DCB    116,120,32
        0x0202afc8:    666c6168    half    DCD    1718378856
        0x0202afcc:    66696620     fif    DCD    1718183456
        0x0202afd0:    000a206f    o ..    DCD    663663
    .L.str.3
        0x0202afd4:    68207872    rx h    DCD    1746958450
        0x0202afd8:    20666c61    alf     DCD    543583329
        0x0202afdc:    6f666966    fifo    DCD    1868982630
        0x0202afe0:    0a642520     %d.    DCD    174335264
        0x0202afe4:    00          .       DCB    0
    .L.str.1
        0x0202afe5:    203078       0x     DCB    32,48,120
        0x0202afe8:    2d207825    %x -    DCD    757102629
        0x0202afec:    00          .       DCB    0
    .L.str.2
        0x0202afed:    6e756d      num     DCB    110,117,109
        0x0202aff0:    20642520     %d     DCD    543434016
        0x0202aff4:    25206425    %d %    DCD    622879781
        0x0202aff8:    0064        d.      DCW    100
    .L.str
    .L.str.8
        0x0202affa:    4553        SE      DCW    17747
        0x0202affc:    52454747    GGER    DCD    1380271943
        0x0202b000:    00          .       DCB    0
    .L.str.7
        0x0202b001:    525454      RTT     DCB    82,84,84
        0x0202b004:    00          .       DCB    0
    .L.str.6
        0x0202b005:    546572      Ter     DCB    84,101,114
        0x0202b008:    616e696d    mina    DCD    1634625901
        0x0202b00c:    0000006c    l...    DCD    108
    Region$$Table$$Base
        0x0202b010:    0202b030    0...    DCD    33730608
    .L.str.1
        0x0202b014:    20005528    (U.     DCD    536892712
        0x0202b018:    0008        ..      DCW    8
    .L.str.2
        0x0202b01a:    0000        ..      DCW    0
        0x0202b01c:    0202a2fc    ....    DCD    33727228
        0x0202b020:    0202b038    8...    DCD    33730616
    .L.str.3
        0x0202b024:    20005530    0U.     DCD    536892720
        0x0202b028:    000004dc    ....    DCD    1244
        0x0202b02c:    a30c        ..      DCW    41740
    .L.str.4
        0x0202b02e:    0202        ..      DCW    514
    .L.str.5
    Region$$Table$$Limit

** Section #2 'RW_IRAM1' (SHT_PROGBITS) [SHF_ALLOC + SHF_WRITE]
    Size   : 8 bytes (alignment 8)
    Address: 0x20005528


** Section #3 'RW_IRAM1' (SHT_NOBITS) [SHF_ALLOC + SHF_WRITE]
    Size   : 1244 bytes (alignment 8)
    Address: 0x20005530


** Section #4 '.debug_abbrev' (SHT_PROGBITS)
    Size   : 3291 bytes


** Section #5 '.debug_frame' (SHT_PROGBITS)
    Size   : 7080 bytes


** Section #6 '.debug_info' (SHT_PROGBITS)
    Size   : 29562 bytes


** Section #7 '.debug_line' (SHT_PROGBITS)
    Size   : 22775 bytes


** Section #8 '.debug_str' (SHT_PROGBITS)
    Size   : 29668 bytes


** Section #9 '.debug_ranges' (SHT_PROGBITS)
    Size   : 1984 bytes


** Section #10 '.symtab' (SHT_SYMTAB)
    Size   : 9936 bytes (alignment 4)
    String table #11 '.strtab'
    Last local symbol no. 182


** Section #11 '.strtab' (SHT_STRTAB)
    Size   : 12792 bytes


** Section #12 '.note' (SHT_NOTE)
    Size   : 28 bytes (alignment 4)


** Section #13 '.comment' (SHT_PROGBITS)
    Size   : 1620 bytes


** Section #14 '.shstrtab' (SHT_STRTAB)
    Size   : 136 bytes


