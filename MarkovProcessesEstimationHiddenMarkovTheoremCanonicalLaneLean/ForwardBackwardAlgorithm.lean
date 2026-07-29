import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean.HiddenMarkovModel

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean

structure ForwardBackwardPackage (H : HiddenMarkovModel) where
  forwardProbabilities : Type u
  backwardProbabilities : Type v
  forwardRecurrence : Prop
  backwardRecurrence : Prop
  smoothingRecurrence : Prop

structure ForwardBackwardEvidence {H : HiddenMarkovModel} (F : ForwardBackwardPackage H) where
  forwardRecurrenceClosed : F.forwardRecurrence
  backwardRecurrenceClosed : F.backwardRecurrence
  smoothingRecurrenceClosed : F.smoothingRecurrence

def ForwardBackwardClosed {H : HiddenMarkovModel} (F : ForwardBackwardPackage H) : Prop :=
  F.forwardRecurrence ∧ F.backwardRecurrence ∧ F.smoothingRecurrence

theorem forward_backward_closed_from_evidence {H : HiddenMarkovModel} (F : ForwardBackwardPackage H)
    (E : ForwardBackwardEvidence F) : ForwardBackwardClosed F := by
  exact And.intro E.forwardRecurrenceClosed
    (And.intro E.backwardRecurrenceClosed E.smoothingRecurrenceClosed)

end MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean
end HautevilleHouse