
int at_sendrecv(spi_ctrl *spictrl,char *at_cmd,int timeout)

{
  int iVar1;
  
  iVar1 = at_send(spictrl,at_cmd,timeout);
  if (iVar1 != 0) {
    return iVar1;
  }
  iVar1 = at_recv(spictrl);
  return iVar1;
}

