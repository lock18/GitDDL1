000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID.    TPROG01.
000300 AUTHOR.        COMPUWARE ISPW TRAINING.
000400 DATE-WRITTEN.  JANUARY 29TH, 1996.
000500 DATE-COMPILED.
000600
000700********************************************************
      * New comment
000800* THIS PROGRAM IS A TRAINING PROGRAM
000900*      WITH A LINK TO TSUBR01
001000*
001100*      AND COPYLIBS   TCPYA01   (HEADER)
001200*                     TCPYB01   (LINK AREA)
001300* ======================================================
001400*  ISPW (TM)
001500*  COPYRIGHT (C) 1986-2016 COMPUWARE CORPORATION.
001600*  UNPUBLISHED RIGHTS RESERVED UNDER THE COPYRIGHT
001700*  LAWS OF THE UNITED STATES.
001800*
001900* ======================================================
002000*                   MODIFICATION  LOG
002100*
002200*  DD/MM/YY  PROGRAMMER  CHANGES
002300*  ********  **********  *******
002400*  96/01/24  ISPW        NEW PROGRAM
002500* ======================================================
002600 ENVIRONMENT DIVISION.
002700 CONFIGURATION SECTION.
002800 SOURCE-COMPUTER. IBM-370.
002900 OBJECT-COMPUTER. IBM-370.
003000
003100 INPUT-OUTPUT SECTION.
003200 FILE-CONTROL.
003300
003400*****************************************************
003500*  FILES USED:
003600*   INPUT   JUST SOME DUMMY DATA TO READ IN
003700*   OUTPUT  A COPY OF THE DUMMY DATA WRITTEN OUT
003800*****************************************************
003900     SELECT INFILE  ASSIGN UT-S-INPUT
004000       ORGANIZATION IS SEQUENTIAL
004100       ACCESS IS SEQUENTIAL.
004200
004300     SELECT OUTFILE ASSIGN UT-S-OUTPUT
004400       ORGANIZATION IS SEQUENTIAL
004500       ACCESS IS SEQUENTIAL.
004600
004700 DATA DIVISION.
004800
004900 FILE SECTION.
005000
005100 FD  INFILE
005200     LABEL RECORDS OMITTED
005300     BLOCK CONTAINS 0 RECORDS
005400     RECORDING MODE IS F
005500     DATA RECORD IS INPUT-REC.
005600
005700 01  INPUT-REC         PIC X(80).
005800
005900 FD  OUTFILE
006000     LABEL RECORDS OMITTED
006100     BLOCK CONTAINS 0 RECORDS
006200     RECORDING MODE IS F
006300     DATA RECORD IS OUTPUT-REC.
006400
006500 01  OUTPUT-REC.
006600     05  CC                PIC X(1).
006700     05  OUTPUT-LINE       PIC X(132).
006800
006900
007000 WORKING-STORAGE SECTION.
007100****************************************************
007200****    THE DATA AREA COPYBOOK
007300****************************************************
007400 COPY TCPYA01.
007500
007600
007700
007800****************************************************
007900**** A COPY MEMBER FOR THE LINKAGE AREA PARAMETERS
008000****************************************************
008100 COPY TCPYB01 .
008200
008300 PROCEDURE DIVISION.
008400
008500 00000-MAIN-PROCEDURE.
008600
008700     OPEN OUTPUT OUTFILE.
008800     MOVE 'R' TO ACTION-FLAG.
008900     CALL 'TSUBR01' USING PASS-ME-AROUND.
009000
009100     IF NOT INFILE-EOF THEN
009200        MOVE TEXT-PORTION TO MESSANGER
009300
009400     MOVE SPACES TO CC.
009500     MOVE STAR-LINE-1 TO OUTPUT-REC.
009600     WRITE OUTPUT-REC.
009700     WRITE OUTPUT-REC.
009800     WRITE OUTPUT-REC.
009900
010000     MOVE SPACES TO BODY-TEXT.
010100     MOVE BODY-LINE TO OUTPUT-REC.
010200     WRITE OUTPUT-REC.
010300
010400     MOVE FLASH-LINE TO OUTPUT-REC.
010500     WRITE OUTPUT-REC.
010600     WRITE OUTPUT-REC.
010700     WRITE OUTPUT-REC.
010800
010900     MOVE SPACES TO BODY-TEXT.
011000     MOVE BODY-LINE TO OUTPUT-REC.
011100     WRITE OUTPUT-REC.
011200     WRITE OUTPUT-REC.
011300
011400     MOVE MESSAGE-LINE TO BODY-TEXT.
011500     MOVE BODY-LINE TO OUTPUT-REC.
011600     WRITE OUTPUT-REC.
011700
011800     MOVE SPACES TO BODY-TEXT.
011900     MOVE BODY-LINE TO OUTPUT-REC.
012000     WRITE OUTPUT-REC.
012100
012200     PERFORM GET-MESSAGE THRU GET-MESSAGE-X
012300        UNTIL INFILE-EOF.
012400
012500     MOVE SPACES TO BODY-TEXT.
012600     MOVE BODY-LINE TO OUTPUT-REC.
012700     WRITE OUTPUT-REC.
012800     WRITE OUTPUT-REC.
012900
013000     MOVE STAR-LINE-1 TO OUTPUT-REC.
013100     WRITE OUTPUT-REC.
013200     WRITE OUTPUT-REC.
013300     WRITE OUTPUT-REC.
013400
013500* CLOSE THE INPUT FILE
013600     MOVE 'C' TO ACTION-FLAG.
013700     CALL 'TSUBR01' USING PASS-ME-AROUND.
013800
013900     CLOSE OUTFILE.
014000     GOBACK.
014100
014200 GET-MESSAGE.
014300        MOVE 'R' TO ACTION-FLAG.
014400        CALL 'TSUBR01' USING PASS-ME-AROUND.
014500           IF NOT INFILE-EOF THEN
014600             MOVE TEXT-PORTION TO BODY-TEXT
014700             MOVE BODY-LINE TO OUTPUT-REC
014800             WRITE OUTPUT-REC.
014900 GET-MESSAGE-X.
015000     EXIT.