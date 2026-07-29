import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean

structure FilteringEstimationPackage {H : HiddenMarkovTransitionPackage} where
  observations : List H.observationSpace
  posteriorSequence : H.stateSpace → H.stateSpace → Prop
  filterRecursion : ∀ (t : ℕ) (x : H.stateSpace), Prop
  filterInitialized : Prop

def FilteringEstimationClosed {H : HiddenMarkovTransitionPackage} (F : FilteringEstimationPackage H) : Prop :=
  F.filterInitialized ∧ ∀ t x, F.filterRecursion t x

end MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean
end HautevilleHouse