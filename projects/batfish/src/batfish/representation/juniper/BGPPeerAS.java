package batfish.representation.juniper;

public class BGPPeerAS {
   
   private int _peerASNum;
   
   /* ------------------------------ Constructor ----------------------------*/
   public BGPPeerAS(int a) {
      _peerASNum = a;
   }
   
   /* ----------------------------- Other Methods ---------------------------*/

   /* ---------------------------- Getters/Setters --------------------------*/
   public int get_peerASNum () {
      return _peerASNum;
   }
   
   /* --------------------------- Inherited Methods -------------------------*/  

}
