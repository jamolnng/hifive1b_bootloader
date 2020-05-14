
int spi_transceive_one(spi_ctrl *spictrl,int num_xfers,int check_ready)

{
  undefined *puVar1;
  undefined *puVar2;
  int iVar3;
  
  wait_ms(5);
  spictrl->csmode = spictrl->csmode & 0xfffffffc | 2;
  if (0 < num_xfers) {
    puVar1 = &gp0xfffff888;
    puVar2 = &gp0xfffff8c8;
    do {
      iVar3 = 0x1e;
      *(undefined *)&spictrl->txdata = *puVar1;
      do {
        iVar3 = iVar3 + -1;
      } while (iVar3 != 0);
      if ((undefined *)(num_xfers + -1) == puVar2 + -(int)&gp0xfffff8c8) {
        spictrl->csmode = spictrl->csmode & 0xfffffffc;
      }
      do {
      } while ((int)spictrl->rxdata < 0);
      *puVar2 = (char)spictrl->rxdata;
      puVar2 = puVar2 + 1;
      puVar1 = puVar1 + 1;
    } while (puVar2 != &gp0xfffff8c8 + num_xfers);
  }
  return 0;
}

