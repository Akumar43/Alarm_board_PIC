
void main() {
long unsigned int i=0;
unsigned led=0;
TRISC=0b00001110;
ANSEL=0b11100000;
TRISA=0x00;
CMCON  = 0x00;
ADC_Init();
PORTA=0x00;
   while(1)
     {

     i=ADC_Read(7);      //   AN7 at RC3
     delay_ms(300);
     if(i<512)
     {
      led |= 1 << 2;
     }
     else
     {
      led &= ~(1 << 2);
     }
//////////////////////
  i=ADC_Read(6);          //AN6 at RC2
     if(i<512)
     {
       led |= 1 << 1;
     }
      else
     {
       led &= ~(1 << 1);
     }
////////////////////////
     i=ADC_Read(5);             //AN5 at RC1
     if(i<512)
     {
      led |= 1 << 0;
     }
      else
     {
      led &= ~(1 << 0);
     }
     PORTA=led;
///////////////////////
     }
}