
_main:

;MyProject.c,2 :: 		void main() {
;MyProject.c,3 :: 		long unsigned int i=0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
	CLRF       main_i_L0+2
	CLRF       main_i_L0+3
	CLRF       main_led_L0+0
	CLRF       main_led_L0+1
;MyProject.c,5 :: 		TRISC=0b00001110;
	MOVLW      14
	MOVWF      TRISC+0
;MyProject.c,6 :: 		ANSEL=0b11100000;
	MOVLW      224
	MOVWF      ANSEL+0
;MyProject.c,7 :: 		TRISA=0x00;
	CLRF       TRISA+0
;MyProject.c,8 :: 		CMCON  = 0x00;
	CLRF       CMCON+0
;MyProject.c,9 :: 		ADC_Init();
	CALL       _ADC_Init+0
;MyProject.c,10 :: 		PORTA=0x00;
	CLRF       PORTA+0
;MyProject.c,11 :: 		while(1)
L_main0:
;MyProject.c,14 :: 		i=ADC_Read(7);      //   AN7 at RC3
	MOVLW      7
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      main_i_L0+0
	MOVF       R0+1, 0
	MOVWF      main_i_L0+1
	CLRF       main_i_L0+2
	CLRF       main_i_L0+3
;MyProject.c,15 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
;MyProject.c,16 :: 		if(i<512)
	MOVLW      0
	SUBWF      main_i_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      0
	SUBWF      main_i_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      2
	SUBWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      0
	SUBWF      main_i_L0+0, 0
L__main10:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;MyProject.c,18 :: 		led |= 1 << 2;
	BSF        main_led_L0+0, 2
;MyProject.c,19 :: 		}
	GOTO       L_main4
L_main3:
;MyProject.c,22 :: 		led &= ~(1 << 2);
	BCF        main_led_L0+0, 2
;MyProject.c,23 :: 		}
L_main4:
;MyProject.c,25 :: 		i=ADC_Read(6);          //AN6 at RC2
	MOVLW      6
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      main_i_L0+0
	MOVF       R0+1, 0
	MOVWF      main_i_L0+1
	CLRF       main_i_L0+2
	CLRF       main_i_L0+3
;MyProject.c,26 :: 		if(i<512)
	MOVLW      0
	SUBWF      main_i_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      0
	SUBWF      main_i_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      2
	SUBWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      0
	SUBWF      main_i_L0+0, 0
L__main11:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;MyProject.c,28 :: 		led |= 1 << 1;
	BSF        main_led_L0+0, 1
;MyProject.c,29 :: 		}
	GOTO       L_main6
L_main5:
;MyProject.c,32 :: 		led &= ~(1 << 1);
	BCF        main_led_L0+0, 1
;MyProject.c,33 :: 		}
L_main6:
;MyProject.c,35 :: 		i=ADC_Read(5);             //AN5 at RC1
	MOVLW      5
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      main_i_L0+0
	MOVF       R0+1, 0
	MOVWF      main_i_L0+1
	CLRF       main_i_L0+2
	CLRF       main_i_L0+3
;MyProject.c,36 :: 		if(i<512)
	MOVLW      0
	SUBWF      main_i_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      0
	SUBWF      main_i_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      2
	SUBWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      0
	SUBWF      main_i_L0+0, 0
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;MyProject.c,38 :: 		led |= 1 << 0;
	BSF        main_led_L0+0, 0
;MyProject.c,39 :: 		}
	GOTO       L_main8
L_main7:
;MyProject.c,42 :: 		led &= ~(1 << 0);
	BCF        main_led_L0+0, 0
;MyProject.c,43 :: 		}
L_main8:
;MyProject.c,44 :: 		PORTA=led;
	MOVF       main_led_L0+0, 0
	MOVWF      PORTA+0
;MyProject.c,46 :: 		}
	GOTO       L_main0
;MyProject.c,47 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
