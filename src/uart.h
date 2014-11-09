
#define uchar unsigned char
#define uint unsigned int

// Definice velikosti bufferu
#define cRECBUFSIZE 5

extern bit         uart_RIBUF;
extern uchar data  uart_RByte;

extern bit         uart_RB_Overflow;
extern bit         uart_SB_Overflow;

void        uart_proc();
void        uart_init();
char        UART(char c);          // putchar compatible

void        uart_disable();
void        uart_enable();
