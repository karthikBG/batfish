package batfish.logicblox;

import java.util.Map;

import batfish.representation.Edge;
import batfish.representation.Topology;

public class TopologyFactExtractor {

   private Topology _topology;

   public TopologyFactExtractor(Topology topology) {
      _topology = topology;
   }

   public void writeFacts(Map<String, StringBuilder> factBins) {
      StringBuilder wSamePhysicalSegment = factBins.get("SamePhysicalSegment");
      for (Edge e : _topology.getEdges()) {
         wSamePhysicalSegment.append(e.getNode1() + "|" + e.getInt1() + "|"
               + e.getNode2() + "|" + e.getInt2() + "\n");
      }
   }
}
