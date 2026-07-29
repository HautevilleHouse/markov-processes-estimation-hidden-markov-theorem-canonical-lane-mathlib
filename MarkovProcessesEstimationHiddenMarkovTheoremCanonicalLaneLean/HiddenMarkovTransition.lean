import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean

structure HiddenMarkovTransitionPackage where
  stateSpace : Type u
  observationSpace : Type v
  transitionKernel : stateSpace → stateSpace → Prop
  emissionKernel : stateSpace → observationSpace → Prop
  initialDistribution : stateSpace → Prop
  transitionLawful : ∀ s t, transitionKernel s t → Prop
  emissionLawful : ∀ s o, emissionKernel s o → Prop

structure HiddenMarkovTransitionEvidence (H : HiddenMarkovTransitionPackage) where
  transitionLawfulClosed : H.transitionLawful
  emissionLawfulClosed : H.emissionLawful

def HiddenMarkovTransitionClosed (H : HiddenMarkovTransitionPackage) : Prop :=
  H.transitionLawful ∧ H.emissionLawful

theorem hidden_markov_transition_closed_from_evidence
    (H : HiddenMarkovTransitionPackage) (E : HiddenMarkovTransitionEvidence H) :
    HiddenMarkovTransitionClosed H := by
  exact And.intro E.transitionLawfulClosed E.emissionLawfulClosed

end MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean
end HautevilleHouse