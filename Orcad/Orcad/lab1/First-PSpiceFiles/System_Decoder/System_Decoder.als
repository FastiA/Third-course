.ALIASES
X_U1            U1(G1bar=N03711 G2bar=N03711 A=HEEL B=N00470 C=N00432 D=N00444 Y0=OUT1 Y1=OUT2 Y2=OUT3 Y3=OUT4 Y4=OUT5 Y5=OUT6
+Y6=OUT7 Y7=OUT8 Y8=OUT9 Y9=OUT10 Y10=OUT11 Y11=OUT12 Y12=OUT13 Y13=OUT14 Y14=OUT15 Y15=OUT16 VCC=$G_DPWR GND=$G_DGND ) CN
+@FIRST.System_Decoder(sch_1):INS191@7400.74154.Normal(chips)
X_U2            U2(CKA=N03656 CKB=HEEL R01=N03711 R02=N03711 QA=HEEL QB=N00470 QC=N00432 QD=N00444 VCC=$G_DPWR GND=$G_DGND ) CN
+@FIRST.System_Decoder(sch_1):INS280@7400.7493A.Normal(chips)
_    B1(RESET=N03711 Folk1=N03656 Folk2=FCLK2 ) CN @FIRST.System_Decoder(sch_1):B1@FIRST.OSC(sch_1)
X_B1_B1U1          B1.B1U1(CKA=N03656 CKB=M_UN0001 R01=N03711 R02=N03711 QA=FCLK2 QB=M_UN0002 QC=M_UN0003 QD=M_UN0004 VCC=$G_DPWR
+GND=$G_DGND ) CN @FIRST.System_Decoder(sch_1):B1@FIRST.OSC(sch_1):INS60@7400.7493A.Normal(chips)
X_B1_B1U2A          B1.B1U2A(A=N03711 Y=B1_N00450 VCC=$G_DPWR GND=$G_DGND ) CN
+@FIRST.System_Decoder(sch_1):B1@FIRST.OSC(sch_1):INS109@7400.7405.Normal(chips)
X_B1_B1U3A          B1.B1U3A(A=B1_N00450 Y=B1_N00460 VCC=$G_DPWR GND=$G_DGND ) CN
+@FIRST.System_Decoder(sch_1):B1@FIRST.OSC(sch_1):INS159@7400.7414.Normal(chips)
X_B1_B1U3B          B1.B1U3B(A=B1_N00460 Y=B1_N00464 VCC=$G_DPWR GND=$G_DGND ) CN
+@FIRST.System_Decoder(sch_1):B1@FIRST.OSC(sch_1):INS196@7400.7414.Normal(chips)
X_B1_B1U3C          B1.B1U3C(A=B1_N00464 Y=N03656 VCC=$G_DPWR GND=$G_DGND ) CN
+@FIRST.System_Decoder(sch_1):B1@FIRST.OSC(sch_1):INS233@7400.7414.Normal(chips)
C_B1_B1C1          B1.B1C1(1=B1_N00450 2=B1_N00464 ) CN
+@FIRST.System_Decoder(sch_1):B1@FIRST.OSC(sch_1):INS540@ANALOG.C.Normal(chips)
R_B1_B1R1          B1.B1R1(1=B1_N00450 2=B1_N00460 ) CN
+@FIRST.System_Decoder(sch_1):B1@FIRST.OSC(sch_1):INS639@ANALOG.R.Normal(chips)
_    _(B1.Folk1=N03656)
_    _(B1.Folk2=FCLK2)
_    _(B1.RESET=N03711)
U_DSTM1          DSTM1(VCC=$G_DPWR GND=$G_DGND OUT=N03711 ) CN @FIRST.System_Decoder(sch_1):INS3768@SOURCSTM.DigStim1.Normal(chips)
_    _(FCLK2=FCLK2)
_    _(Heel=HEEL)
_    _(OUT1=OUT1)
_    _(OUT10=OUT10)
_    _(OUT11=OUT11)
_    _(OUT12=OUT12)
_    _(OUT13=OUT13)
_    _(OUT14=OUT14)
_    _(OUT15=OUT15)
_    _(OUT16=OUT16)
_    _(OUT2=OUT2)
_    _(OUT3=OUT3)
_    _(OUT4=OUT4)
_    _(OUT5=OUT5)
_    _(OUT6=OUT6)
_    _(OUT7=OUT7)
_    _(OUT8=OUT8)
_    _(OUT9=OUT9)
.ENDALIASES