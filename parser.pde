//READ DATA FROM SCALE
  //delay(50);//maybe needs to be adjusted
  byte[] inBuffer = new byte[7];
  while (myPort.available () > 13) {
    inBuffer = myPort.readBytes();
    myPort.readBytes(inBuffer);
    if (inBuffer != null) {

      //IF DATA, SAVE TO STRING
      readstr = new String(inBuffer);
      print("Data Received: ");
      print(readstr);

      A = readstr.charAt(0);
      B = readstr.charAt(1);

      //DETERMINE ERROR CODE
      switch (A) {
      case 83:
        switch (B) {
        case 32:
          errcode = 0;
          break;
        case 68:
          errcode = 1;
          break;
        case 73:
          errcode = 2;
          break;
        }
        break;
      default:
        errcode = -1;//int(readstr.substring(1));
        break;
      }
      //PARSE AND CONVERT FLOATING POINT NUMBER
      readfloat = float(readstr.substring(3, (readstr.length()-3)));
      print("Calculated Weight: ");
      weightstring = nfc(readfloat, 1) + " g";
      println(weightstring);
      print("Error Code :");
      println(errcode);
      //println(" g");
