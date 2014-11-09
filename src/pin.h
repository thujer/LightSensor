

typedef enum {
                PORT_ID_P0,
                PORT_ID_P1
};


typedef enum {
                PIN_TYPE_QUASI_BIDIRECTIONAL,
                PIN_TYPE_PUSH_PULL,
                PIN_TYPE_INPUT_ONLY,
                PIN_TYPE_OPEN_DRAIN
};


void pin_change(char port_id, char pin_id, char state);
unsigned char pin_get_state(char port_id, char pin_id);
void pin_set(char port_id, char pin_id, char pin_type);

