;//-------------------------------------------------------------------------//
;/////////////////////////////////////////////////////////////////////////////
;// +---------------------------------------------------------------------+ //
;// |                      In Application Programming                     | //
;// |                            MCU: 89LPC922                            | //
;// |                     ------------------------------                  | //
;// |                        Verze 1.02 Build 071111                      | //
;// |                                                                     | //
;// |                         Copyright Tomas Hujer                       | //
;// |                             (c) 2005-2007                           | //
;// |                      thomas.hoodger(at)gmail.com                    | //
;// |                                                                     | //
;// +---------------------------------------------------------------------+ //
;// |  Programovani systemovych registru za behu aplikace, pouziva API    | //
;// |  funkce ISP loaderu                                                 | //
;// +---------------------------------------------------------------------+ //
;//                                                                         //
;//   Version history:                                                      //
;//    1.01             Prvni evolution verze                               //
;//                                                                         //
;//    1.02    071111   Opravena chyba v autorizaci IAP                     //
;//                                                                         //
;//  ---------------------------------------------------------------------  //
;//    TODO:                                                                //
;//                                                                         //
;/////////////////////////////////////////////////////////////////////////////
;//-------------------------------------------------------------------------//

$NOMOD51
$include (REG922.INC)
 
    NAME IAP
 
    PGM_MTP    EQU 01F00H
 
    IAP_CODE     SEGMENT CODE
    
    PUBLIC IAP_reset_boot_status
    PUBLIC IAP_reset_boot_vector
   
    RSEG IAP_CODE

    ;------------------------------;
    ; IAP authorization key        ;
    ;------------------------------;
    IAP_authorization_key:
        mov     R0,     #0FFH           ; IAP authourization key
        mov     @R0,    #96H
        lcall   PGM_MTP
        RET

    ;------------------------------;
    ; set boot status for the ISP  ;
    ;------------------------------;
    IAP_reset_boot_status:
        push    IEN0                    ; save EA Status
        clr     EA                      ; disable int's

        lcall    IAP_authorization_key   ; authorize access

        mov     A,      #02              
        mov     R5,     #01             ; write 01h to status byte  
        mov     R7,     #03
        lcall   PGM_MTP

        pop     IEN0                    ; restore EA status
        RET
            

    ;-----------------------------;
    ; set boot vector for the ISP ;
    ;-----------------------------;
    IAP_reset_boot_vector:
        push    IEN0                    ; save EA Status
        clr     EA                      ; disable int's

        lcall    IAP_authorization_key   ; authorize access

        mov     A,      #02
        mov     R5,     #1FH            ; write bootvec with 1FH
        mov     R7,     #02
        lcall   PGM_MTP

        pop     IEN0                    ; restore EA status

        RET
    
  
  END
