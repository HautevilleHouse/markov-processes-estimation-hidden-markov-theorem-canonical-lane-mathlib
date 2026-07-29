import MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean.ForwardBackwardAlgorithm

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean

structure FilteringPackage {M : HiddenMarkovModel} (F : ForwardBackwardPackage M) where
  filteredDistributions : List (M.stateSpace → ℝ)
  predictionDistributions : List (M.stateSpace → ℝ)
  filterRecursionValid : Prop
  predictionValid : Prop

structure FilteringEvidence {M : HiddenMarkovModel} {F : ForwardBackwardPackage M} (Fil : FilteringPackage M F) where
  filterRecursionValidClosed : Fil.filterRecursionValid
  predictionValidClosed : Fil.predictionValid

def FilteringClosed {M : HiddenMarkovModel} {F : ForwardBackwardPackage M} (Fil : FilteringPackage M F) : Prop :=
  Fil.filterRecursionValid ∧ Fil.predictionValid

theorem filtering_closed_from_evidence {M : HiddenMarkovModel} {F : ForwardBackwardPackage M} (Fil : FilteringPackage M F) (E : FilteringEvidence Fil) :
    FilteringClosed Fil := by
  exact And.intro E.filterRecursionValidClosed E.predictionValidClosed

end MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean
end HautevilleHouse