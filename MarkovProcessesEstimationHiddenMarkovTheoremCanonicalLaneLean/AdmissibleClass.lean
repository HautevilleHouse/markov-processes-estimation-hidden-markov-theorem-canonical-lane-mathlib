import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : MarkovAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MarkovWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean
end HautevilleHouse