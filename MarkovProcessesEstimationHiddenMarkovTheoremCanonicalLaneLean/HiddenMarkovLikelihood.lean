import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean

structure HiddenMarkovLikelihoodPackage (A : AdmissibleClass) where
  likelihoodFunction : Prop
  forwardAlgorithm : Prop
  backwardAlgorithm : Prop
  expectationMaximization : Prop

structure HiddenMarkovLikelihoodEvidence {A : AdmissibleClass} (L : HiddenMarkovLikelihoodPackage A) where
  likelihoodFunctionClosed : L.likelihoodFunction
  forwardAlgorithmClosed : L.forwardAlgorithm
  backwardAlgorithmClosed : L.backwardAlgorithm
  expectationMaximizationClosed : L.expectationMaximization

def HiddenMarkovLikelihoodClosed {A : AdmissibleClass} (L : HiddenMarkovLikelihoodPackage A) : Prop :=
  L.likelihoodFunction ∧ L.forwardAlgorithm ∧ L.backwardAlgorithm ∧ L.expectationMaximization

theorem hidden_markov_likelihood_closed_from_evidence {A : AdmissibleClass}
    (L : HiddenMarkovLikelihoodPackage A) (E : HiddenMarkovLikelihoodEvidence L) :
    HiddenMarkovLikelihoodClosed L := by
  exact And.intro E.likelihoodFunctionClosed
    (And.intro E.forwardAlgorithmClosed
      (And.intro E.backwardAlgorithmClosed E.expectationMaximizationClosed))

end MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean
end HautevilleHouse
