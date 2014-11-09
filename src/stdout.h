

extern char putchar(char c);

extern int  stdout_printf(char (* which_putchar_fp)(char), const char *format, ...);
//extern int  stdout_forward(char (* which_putchar_fp)(char));
extern void stdout_init();

//extern bit  printf_ready;                // printf function enable

