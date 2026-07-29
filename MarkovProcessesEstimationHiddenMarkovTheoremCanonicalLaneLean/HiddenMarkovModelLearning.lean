import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean

structure HiddenMarkovModelLearningPackage (A : AdmissibleClass) where
  baumWelchAlgorithm : Prop
  viterbiAlgorithm : Prop
  parameterEstimation : Prop
  modelSelection : Prop

structure HiddenMarkovModelLearningEvidence {A : AdmissibleClass} (L : HiddenMarkovModelLearningPackage A) where
  baumWelchAlgorithmClosed : L.baumWelchAlgorithm
  viterbiAlgorithmClosed : L.viterbiAlgorithm
  parameterEstimationClosed : L.parameterEstimation
  modelSelectionClosed : L.modelSelection

def HiddenMarkovModelLearningClosed {A : AdmissibleClass} (L : HiddenMarkovModelLearningPackage A) : Prop :=
  L.baumWelchAlgorithm ∧ L.viterbiAlgorithm ∧ L.parameterEstimation ∧ L.modelSelection

theorem hidden_markov_model_learning_closed_from_evidence {A : AdmissibleClass}
    (L : HiddenMarkovModelLearningPackage A) (E : HiddenMarkovModelLearningEvidence L) :
    HiddenMarkovModelLearningClosed L := by
  exact And.intro E.baumWelchAlgorithmClosed
    (And.intro E.viterbiAlgorithmClosed
      (And.intro E.parameterEstimationClosed E.modelSelectionClosed))

end MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean
end HautevilleHouse
