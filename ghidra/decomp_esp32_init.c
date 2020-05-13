
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int esp32_init(void)

{
  _DAT_1001203c = _DAT_1001203c & 0xfffffdc7;
  _DAT_10012038 = _DAT_10012038 | 0x238;
  _DAT_10012004 = _DAT_10012004 | 0x400;
  _DAT_10024000 = 100;
  _DAT_10024040 = 0x80000;
  _DAT_10024010 = 2;
  _DAT_10024060 = _DAT_10024060 & 0xfffffffe;
  DAT_1002402c = 0;
  _DAT_10024018 = _DAT_10024018 & 0xfffffffc;
  do {
  } while (0 < _DAT_1002404c);
  _puts("\r\n");
  at_sendrecv((spi_ctrl *)&DAT_10024000,"ATE0\r\n",100);
  at_sendrecv((spi_ctrl *)&DAT_10024000,"AT+BLEINIT=0\r\n",100);
  at_sendrecv((spi_ctrl *)&DAT_10024000,"AT+CWMODE=0\r\n",100);
  _puts("\r\n");
  return 0;
}

