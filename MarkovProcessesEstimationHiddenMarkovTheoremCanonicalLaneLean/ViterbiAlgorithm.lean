import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean.HiddenMarkovModel

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean

structure ViterbiPackage (H : HiddenMarkovModel) where
  maxProbabilities : Type u
  argmaxSequence : Type v
  dynamicProgrammingRecurrence : Prop
  pathOptimality : Prop

structure ViterbiEvidence {H : HiddenMarkovModel} (V : ViterbiPackage H) where
  dynamicProgrammingRecurrenceClosed : V.dynamicProgrammingRecurrence
  pathOptimalityClosed : V.pathOptimality

def ViterbiClosed {H : HiddenMarkovModel} (V : ViterbiPackage H) : Prop :=
  V.dynamicProgrammingRecurrence ∧ V.pathOptimality

theorem viterbi_closed_from_evidence {H : HiddenMarkovModel} (V : ViterbiPackage H)
    (E : ViterbiEvidence V) : ViterbiClosed V := by
  exact And.intro E.dynamicProgrammingRecurrenceClosed E.pathOptimalityClosed

end MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean
end HautevilleHouse