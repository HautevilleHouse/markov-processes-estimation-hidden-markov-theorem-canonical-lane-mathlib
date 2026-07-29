import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean
end HautevilleHouse