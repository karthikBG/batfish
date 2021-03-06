package batfish.representation.juniper;

public class SubnetOps  {
   
   public static String convertSubnet(String s) {
      String result = "";
      int sval = Integer.parseInt(s);
      if ((sval >= 0) && (sval <= 8)) {

         if (sval == 0) {
            result += "0";
         }
         else if (sval == 1) {
            result += "128";
         }
         else if (sval == 2) {
            result += "192";
         }
         else if (sval == 3) {
            result += "224";
         }
         else if (sval == 4) {
            result += "240";
         }
         else if (sval == 5) {
            result += "248";
         }
         else if (sval == 6) {
            result += "252";
         }
         else if (sval == 7) {
            result += "254";
         }
         else if (sval == 8) {
            result += "255";
         }
         result += ".0.0.0";

      }
      else if ((sval >= 9) && (sval <= 16)) {

         result += "255.";
         if (sval == 9) {
            result += "128";
         }
         else if (sval == 10) {
            result += "192";
         }
         else if (sval == 11) {
            result += "224";
         }
         else if (sval == 12) {
            result += "240";
         }
         else if (sval == 13) {
            result += "248";
         }
         else if (sval == 14) {
            result += "252";
         }
         else if (sval == 15) {
            result += "254";
         }
         else if (sval == 16) {
            result += "255";
         }
         result += ".0.0";

      }
      else if ((sval >= 17) && (sval <= 24)) {

         result += "255.255.";
         if (sval == 17) {
            result += "128";
         }
         else if (sval == 18) {
            result += "192";
         }
         else if (sval == 19) {
            result += "224";
         }
         else if (sval == 20) {
            result += "240";
         }
         else if (sval == 21) {
            result += "248";
         }
         else if (sval == 22) {
            result += "252";
         }
         else if (sval == 23) {
            result += "254";
         }
         else if (sval == 24) {
            result += "255";
         }
         result += ".0";

      }
      else if ((sval >= 25) && (sval <= 32)) {
         result += "255.255.255.";
         if (sval == 25) {
            result += "128";
         }
         else if (sval == 26) {
            result += "192";
         }
         else if (sval == 27) {
            result += "224";
         }
         else if (sval == 28) {
            result += "240";
         }
         else if (sval == 29) {
            result += "248";
         }
         else if (sval == 30) {
            result += "252";
         }
         else if (sval == 31) {
            result += "254";
         }
         else if (sval == 32) {
            result += "255";
         }

      }
      else {
         throw new Error ("bad subnet value");
      }
      return result;
   }
}