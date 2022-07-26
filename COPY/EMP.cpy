      ******************************************************************
      * DCLGEN TABLE(EMP)                                              *
      *        LIBRARY(HAUNXG0.DEV.COPY(EMP))                          *
      *        LANGUAGE(COBOL)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE EMP TABLE
           ( EMP_NAME                       CHAR(15) NOT NULL,
             EMP_REGION                     CHAR(5) NOT NULL,
             EMP_TYPE                       CHAR(1) NOT NULL,
             EMP_YRS_SERVICE                DECIMAL(9, 0) NOT NULL,
             EMP_WAGES                      CHAR(8) NOT NULL,
             EMP_OT                         CHAR(8) NOT NULL,
             EMP_COMM                       CHAR(8) NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE FTS4DEV.EMP                        *
      ******************************************************************
       01  DCLEMP.
           10 EMP-TB-NAME          PIC X(15).
           10 EMP-TB-REGION        PIC X(5).
           10 EMP-TB-TYPE          PIC X(1).
           10 EMP-TB-YRS-SERVICE   PIC S9(9)V USAGE COMP-3.
           10 EMP-TB-WAGES         PIC X(8).
           10 EMP-TB-OT            PIC X(8).
           10 EMP-TB-COMM          PIC X(8).
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 7       *
      ******************************************************************