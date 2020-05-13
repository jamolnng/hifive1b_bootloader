
/* WARNING: Globals starting with '_' overlap smaller symbols at the same
 * address */

int main(void)

{
  uint uVar1;
  uint64_t now;
  uint64_t then;

  if (_DAT_100000bc == -0x2fd84ff9) {
    do {
      uVar1 = (_DAT_0200bff8 + 0x4000 < _DAT_0200bff8) + _DAT_0200bffc;
      if (uVar1 <= _DAT_0200bffc) goto LAB_20000476;
      do {
        do {
        } while (_DAT_0200bffc < uVar1);
      LAB_20000476:
      } while ((uVar1 == _DAT_0200bffc) &&
               (_DAT_0200bff8 < _DAT_0200bff8 + 0x4000));
    } while (true);
  }
  _DAT_10012038 = _DAT_10012038 & 0xffb7ffff;
  uVar1 = (_DAT_0200bff8 + 0x4000 < _DAT_0200bff8) + _DAT_0200bffc;
  do {
    do {
    } while (_DAT_0200bffc < uVar1);
  } while ((uVar1 == _DAT_0200bffc) &&
           (_DAT_0200bff8 < _DAT_0200bff8 + 0x4000));
  _DAT_1001200c = 0;
  _DAT_10012040 = 0;
  _DAT_10012008 = 0;
  if ((_DAT_100000bc == -0x412f4130) || (_DAT_100000bc == -0x2fd84ff9)) {
    _DAT_100000bc = 0;
  } else {
    // sleep instructions
    _DAT_10000120 = 0x18;
    _DAT_10000124 = 0x18;
    _DAT_10000128 = 0x18;
    _DAT_1000012c = 0x18;
    _DAT_10000130 = 0x38;
    _DAT_10000134 = 0x38;
    _DAT_10000138 = 0x38;
    _DAT_1000013c = 0x38;

    _DAT_100000bc = 0xbed0bed0;

    _DAT_10000084 = 0;
    _DAT_1000014c = 0x51f15e;
    _DAT_10000148 = 0;
  }
  uVar1 = (_DAT_0200bff8 + 0x4000 < _DAT_0200bff8) + _DAT_0200bffc;
  do {
    do {
    } while (_DAT_0200bffc < uVar1);
  } while ((uVar1 == _DAT_0200bffc) &&
           (_DAT_0200bff8 < _DAT_0200bff8 + 0x4000));
  bench_rstclk();
  esp32_init();
  (*(code *)&SUB_20010000)(&SUB_20010000);
  return 0x12d687;
}
