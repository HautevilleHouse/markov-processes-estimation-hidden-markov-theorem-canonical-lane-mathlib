import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean

structure HiddenMarkovModel where
  stateSpace : Type u
  observationSpace : Type v
  transitionKernel : Type w
  emissionKernel : Type x
  initialDistribution : Type y
  hiddenStateSequence : Type z
  observationSequence : Type a
  markovProperty : Prop
  conditionalIndependence : Prop

structure HiddenMarkovEvidence (H : HiddenMarkovModel) where
  markovPropertyClosed : H.markovProperty
  conditionalIndependenceClosed : H.conditionalIndependence

def HiddenMarkovModelClosed (H : HiddenMarkovModel) : Prop :=
  H.markovProperty ∧ H.conditionalIndependence

theorem hidden_markov_model_closed_from_evidence (H : HiddenMarkovModel)
    (E : HiddenMarkovEvidence H) : HiddenMarkovModelClosed H := by
  exact And.intro E.markovPropertyClosed E.conditionalIndependenceClosed

end MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean
end HautevilleHouse