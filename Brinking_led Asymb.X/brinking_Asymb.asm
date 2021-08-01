STATUS equ 03h ;for selecting bank
    RP0 equ 05
    RP1 equ 06
 PORTA equ 05h ;BANK0
 TRISA equ 85h ;BANK1
 
 
 COUNTER equ 20h  ;The counter for our delay loop
 
  
    org 00h ;The program start from here
 
    clrw ;clear w register 
 
 ; selecting BANK0  
 
    BCF STATUS, RP0 ;RP0=0
    BCF STATUS, RP1 ;RP1=0
   
    CLRF PORTA ;Initialize PORTA
 
 ;Switch to bank 1 for TRISA register 
 
    BSF STATUS, RP0; RP0=1

    CLRF TRISA
    
    MOVLW 0x00  ;clear w register
 
    MOVWF TRISA ; set PORTA as output
 
 ;back to Bank0 for working with PORTA
 
    BCF STATUS, RP0 ;RP0=0
    BCF STATUS, RP1 ;RP1=0
 
 
 START	MOVLW 0x01
	MOVWF PORTA ;Turn ON pin 1 on PORTA
	;delay
	MOVLW 0xff
	MOVWF COUNTER ;set counter 

LOOP1	DECFSZ COUNTER, 1 ;substract by 1,until 0
	GOTO LOOP1
	MOVLW 0x02
	MOVWF PORTA  ;Turn on pin 2 on PORTA
	;delay
	MOVLW 0xff 
	MOVWF COUNTER  ;Set Counter to 0xFF
	
LOOP2	DECFSZ COUNTER, 1 ;substract by 1,until 0
	GOTO LOOP2	     
	MOVLW 0x04
	MOVWF PORTA  ;Turn on pin 3 on PORTA
	;delay
	MOVLW 0xff 
	MOVWF COUNTER  ;Set Counter to 0xFF
	
LOOP3	DECFSZ COUNTER, 1 ;substract by 1,until 0
	GOTO LOOP3
	
	GOTO START 
END 


