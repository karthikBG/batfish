package batfish.representation.juniper;

public class BGPLocalAddress {
   
   private String _localAddress;
   private boolean _isIPV6; // TODO HACK
   
   /* ------------------------------ Constructor ----------------------------*/
   public BGPLocalAddress(String ip, boolean b){
      _localAddress = ip;
      _isIPV6 = b;
   }
   
   /* ----------------------------- Other Methods ---------------------------*/
   
   /* ---------------------------- Getters/Setters --------------------------*/
   public String get_localAddress () {
      return _localAddress;
   }
   public boolean get_isIPV6 () {
	   return _isIPV6;
   }
   /* --------------------------- Inherited Methods -------------------------*/  


}
