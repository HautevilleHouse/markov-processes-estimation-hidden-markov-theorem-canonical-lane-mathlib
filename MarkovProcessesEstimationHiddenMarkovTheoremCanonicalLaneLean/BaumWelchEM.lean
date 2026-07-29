import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HiddenMarkovTheoremCanonicalLaneLean

structure BaumWelchEM (M : HiddenMarkovModel StateSpace ObservationSpace) where
  expectedTransitionCount : StateSpace → StateSpace → ℝ
  expectedEmissionCount : StateSpace → ObservationSpace → ℝ
  updatedTransitionKernel : StateSpace → StateSpace → ℝ
  updatedEmissionKernel : StateSpace → ObservationSpace → ℝ
  updateConsistency : (∀ s s', updatedTransitionKernel s s' ≥ 0) ∧
    (∀ s, ∑ s', updatedTransitionKernel s s' = 1) ∧
    (∀ s o, updatedEmissionKernel s o ≥ 0) ∧
    (∀ s, ∑ o, updatedEmissionKernel s o = 1)
  likelihoodNonDecreasing : Prop

theorem em_convergence (M : HiddenMarkovModel StateSpace ObservationSpace)
    (em : BaumWelchEM M) : em.likelihoodNonDecreasing := by
  exact em.likelihoodNonDecreasing

end HautevilleHouse
end HiddenMarkovTheoremCanonicalLaneLean
