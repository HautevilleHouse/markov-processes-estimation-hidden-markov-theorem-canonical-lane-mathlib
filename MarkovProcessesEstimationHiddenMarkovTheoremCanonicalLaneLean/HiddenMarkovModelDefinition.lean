import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean

structure HiddenMarkovModelPackage where
  stateSpace : Type u
  observationSpace : Type v
  transitionKernel : stateSpace → stateSpace → ℝ
  emissionKernel : stateSpace → observationSpace → ℝ
  initialDistribution : stateSpace → ℝ
  transitionKernelStochastic : ∀ s, ∑ t, transitionKernel s t = 1
  emissionKernelStochastic : ∀ s, ∑ o, emissionKernel s o = 1
  initialDistributionProb : ∑ s, initialDistribution s = 1

structure HiddenMarkovModelEvidence (H : HiddenMarkovModelPackage) where
  transitionKernelStochasticClosed : H.transitionKernelStochastic
  emissionKernelStochasticClosed : H.emissionKernelStochastic
  initialDistributionProbClosed : H.initialDistributionProb

def HiddenMarkovModelClosed (H : HiddenMarkovModelPackage) : Prop :=
  H.transitionKernelStochastic ∧ H.emissionKernelStochastic ∧ H.initialDistributionProb

theorem hidden_markov_model_closed_from_evidence (H : HiddenMarkovModelPackage) (E : HiddenMarkovModelEvidence H) : HiddenMarkovModelClosed H := by
  exact And.intro E.transitionKernelStochasticClosed (And.intro E.emissionKernelStochasticClosed E.initialDistributionProbClosed)

end MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean
end HautevilleHouse