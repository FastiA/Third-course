.ALIASES
R_R2            R2(1=MID 2=VCC ) CN @LAB2.SCHEMATIC1(sch_1):INS26@ANALOG.R.Normal(chips)
R_R3            R3(1=0 2=MID ) CN @LAB2.SCHEMATIC1(sch_1):INS42@ANALOG.R.Normal(chips)
R_R4            R4(1=0 2=OUT ) CN @LAB2.SCHEMATIC1(sch_1):INS58@ANALOG.R.Normal(chips)
C_C1            C1(1=MID 2=OUT ) CN @LAB2.SCHEMATIC1(sch_1):INS83@ANALOG.C.Normal(chips)
D_D1            D1(1=MID 2=VCC ) CN @LAB2.SCHEMATIC1(sch_1):INS108@DIODE.D1N3940.Normal(chips)
D_D2            D2(1=0 2=ICB ) CN @LAB2.SCHEMATIC1(sch_1):INS124@DIODE.D1N3940.Normal(chips)
R_R1            R1(1=IN 2=MID ) CN @LAB2.SCHEMATIC1(sch_1):INS357@ANALOG.R.Normal(chips)
V_V1            V1(+=VCC -=0 ) CN @LAB2.SCHEMATIC1(sch_1):INS539@SOURCE.VDC.Normal(chips)
V_PRINT1          PRINT1(1=MID 2=ICB ) CN @LAB2.SCHEMATIC1(sch_1):INS1925@SPECIAL.IPRINT.Normal(chips)
CN @LAB2.SCHEMATIC1(sch_1):INS1940@SPECIAL.VPRINT1.Normal(chips)
CN @LAB2.SCHEMATIC1(sch_1):INS1951@SPECIAL.VPRINT2.Normal(chips)
V_V2            V2(+=N04672 -=0 ) CN @LAB2.SCHEMATIC1(sch_1):INS4654@SOURCSTM.VSTIM.Normal(chips)
V_Vin           Vin(+=IN -=N04672 ) CN @LAB2.SCHEMATIC1(sch_1):INS5223@SOURCE.VAC.Normal(chips)
_    _(0=0)
_    _(ICb=ICB)
_    _(In=IN)
_    _(Mid=MID)
_    _(Out=OUT)
_    _(Vcc=VCC)
.ENDALIASES
