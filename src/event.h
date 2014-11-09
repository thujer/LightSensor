

void event_send(unsigned char event_id);
char event_get();
void event_init();


extern char   idata  event_in_buffer;                      // pocet udalosti v bufferu
extern bit           event_overflow;                       // priznak prepisu udalosti
