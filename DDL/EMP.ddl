CREATE TABLE EMP                                                        00010000
(                                                                       00020000
EMP_NAME   CHAR (15) NOT NULL WITH DEFAULT,                             00030000
EMP_REGION CHAR (5)  NOT NULL WITH DEFAULT,                             00040000
EMP_TYPE   CHAR (1)  NOT NULL WITH DEFAULT,                             00050000
EMP_YRS_SERVICE DECIMAL (9,0) NOT NULL WITH DEFAULT,                    00060000
EMP_WAGES  CHAR (8)  NOT NULL WITH DEFAULT,                             00070000
EMP_OT     CHAR (8)  NOT NULL WITH DEFAULT,                             00080000
EMP_COMM   CHAR (8)  NOT NULL WITH DEFAULT                              00090001
)                                                                       00100001
IN HAUNXGDB.EMPTS                                                       00110001