import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.MarkovCore

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure MarkovSpace where
  carrier : Type
  sigmaAlgebra : SigmaAlgebra carrier
  probabilityMeasure : Measure carrier

structure MarkovAdmittedObject where
  stateSpace : MarkovSpace
  observationSpace : MarkovSpace
  hiddenMarkovModel : HiddenMarkovModel stateSpace.ProbabilityMeasure observationSpace.ProbabilityMeasure
  posteriorEstimate : FilteredEstimate stateSpace.ProbabilityMeasure
  convergenceGuaranteed : Prop
  conclusion : convergenceGuaranteed

structure MarkovEndgameState where
  object : MarkovAdmittedObject

def MarkovWitnessClosed (O : MarkovAdmittedObject) : Prop :=
  O.convergenceGuaranteed

end MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean
end HautevilleHouse