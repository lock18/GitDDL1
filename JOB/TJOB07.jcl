//TJOB07 JOB (BENCHMARK),'ISPW TRAINING',NOTIFY=&SYSUID,
//         CLASS=A,MSGCLASS=H,MSGLEVEL=(1,1),TIME=(0,09)
//*
//TREXX07  EXEC PGM=IKJEFT07,DYNAMNBR=20,REGION=2048K
//SYSPROC  DD DISP=SHR,DSN=#HLQ.#APL.PRD.CLST
//ISPPROF  DD DSN=&&ISPPROF,DISP=(NEW,PASS),
//            UNIT=SYSDA,
//            SPACE=(TRK,(1,1,1)),
//            DCB=(RECFM=FB,LRECL=80,BLKSIZE=9040)
//ISPTLIB  DD DSN=&&ISPPROF,DISP=(OLD,DELETE),
//            UNIT=AFF=ISPPROF,VOL=REF=*.ISPPROF
//         DD DISP=SHR,DSN=ISP.SISPTENU
//ISPPLIB  DD DISP=SHR,DSN=ISP.SISPPENU
//ISPSLIB  DD DISP=SHR,DSN=ISP.SISPSENU
//ISPMLIB  DD DISP=SHR,DSN=ISP.SISPMENU
//ISPLOG   DD SYSOUT=*,DCB=(RECFM=FB,LRECL=120,DSORG=PS)
//ISPTABL  DD DSN=&&ISPTABL,DISP=(MOD,PASS),UNIT=SYSDA,
//         SPACE=(TRK,(1,1,1)),DCB=(RECFM=FB,LRECL=80,BLKSIZE=0)
//SYSTSPRT DD DSN=&&TEMP,
//            DCB=(RECFM=FB,LRECL=80,DSORG=PS,BLKSIZE=6000),
//            DISP=(NEW,KEEP),SPACE=(TRK,(1,1),RLSE)
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSTSIN  DD *
  PROFILE MSGID
  ISPSTART  CMD(%TREXX07)
/*
//*==================================================
//* EXECUTE THE PROGRAM TPROG07 TO PRODUCE THE REPORT
//*==================================================
//PROCESS  EXEC PGM=TPROG07
//STEPLIB   DD DISP=SHR,DSN=#HLQ.#APL.PRD.LOAD
//INPUT     DD DISP=(OLD,PASS),DSN=&&TEMP
//OUTPUT    DD SYSOUT=*
//SYSOUT    DD SYSOUT=*