package batfish.representation.juniper;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class BGPNeighbor implements Serializable {

   private static final long serialVersionUID = 1L;

   private String _ip;
   private Integer _remoteAS;
   private Integer _localAS;
   private String _localAddress;
   private List<String> _inboundPolicyStatementName;
   private List<String> _outboundPolicyStatementName;

   // not used at this moment
   private String _updateSource;

   public BGPNeighbor(String ip) {
      _ip = ip;
      _inboundPolicyStatementName = new ArrayList<String>();
      _outboundPolicyStatementName = new ArrayList<String>();
      _updateSource = null;
   }

   public void setRemoteAS(int remoteAS) {
      _remoteAS = remoteAS;
   }

   public void setLocalAddress(String localAddress) {
      _localAddress = localAddress;
   }

   public String getLocalAddress() {
      return _localAddress;
   }

   public void setInboundPolicyStatement(List<String> name) {
      _inboundPolicyStatementName.addAll(name);
   }

   public void setOutboundPolicyStatement(List<String> name) {
      _outboundPolicyStatementName.addAll(name);
   }

   public Integer getRemoteAS() {
      return _remoteAS;
   }

   public Integer getLocalAS() {
      return _localAS;
   }

   public String getIP() {
      return _ip;
   }

   public List<String> getInboundPolicyStatement() {
      return _inboundPolicyStatementName;
   }

   public List<String> getOutboundPolicyStatement() {
      return _outboundPolicyStatementName;
   }

   public String getUpdateSource() {
      return _updateSource;
   }

   public void setUpdateSource(String updateSource) {
      _updateSource = updateSource;
   }

}
