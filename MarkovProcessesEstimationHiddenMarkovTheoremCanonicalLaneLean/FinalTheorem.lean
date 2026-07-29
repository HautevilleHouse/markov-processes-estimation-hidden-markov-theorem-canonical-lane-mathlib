import MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean.AdmissibleClass
import MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean.BridgeLemmas
import MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean

def ConstrainedHiddenMarkovClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_hidden_markov_endgame (A : AdmissibleClass) :
    ConstrainedHiddenMarkovClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean
end HautevilleHouse