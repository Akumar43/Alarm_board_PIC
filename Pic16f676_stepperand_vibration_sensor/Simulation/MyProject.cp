#line 1 "D:/Proteus_projects/Pic16f676_stepperand_vibration_sensor/Simulation/MyProject.c"

void main() {
long unsigned int i=0;
unsigned led=0;
TRISC=0b00001110;
ANSEL=0b11100000;
TRISA=0x00;
CMCON = 0x00;
ADC_Init();
PORTA=0x00;
 while(1)
 {

 i=ADC_Read(7);
 delay_ms(300);
 if(i<512)
 {
 led |= 1 << 2;
 }
 else
 {
 led &= ~(1 << 2);
 }

 i=ADC_Read(6);
 if(i<512)
 {
 led |= 1 << 1;
 }
 else
 {
 led &= ~(1 << 1);
 }

 i=ADC_Read(5);
 if(i<512)
 {
 led |= 1 << 0;
 }
 else
 {
 led &= ~(1 << 0);
 }
 PORTA=led;

 }
}
