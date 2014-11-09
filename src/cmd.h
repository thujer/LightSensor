#define uchar unsigned char
#define uint unsigned int

#ifndef __CMD_H__
    #define __CMD_H__

    uchar *cmd_getpar(uchar index);
    uint   cmd_getparnum(uchar index, uchar omez);
    uchar  cmd_detect(char *cmd_tab, uchar get_char);
    void   cmd_init();
    /*char   cmd_par_count();*/
    uchar  up_char(uchar ch);
    bit    cmd_validate_test(char *cmd_tab, int cmd_tab_size);

    extern char cmd_par_buf_cnt;

#endif
