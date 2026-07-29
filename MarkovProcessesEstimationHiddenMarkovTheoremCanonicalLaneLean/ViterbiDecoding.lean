import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HiddenMarkovTheoremCanonicalLaneLean

structure ViterbiDecoding (M : HiddenMarkovModel StateSpace ObservationSpace) where
  mostLikelyStateSequence : List ObservationSpace → List StateSpace
  optimalityCriterion : ∀ (obs : List ObservationSpace) (seq : List StateSpace),
    if seq = mostLikelyStateSequence obs then True
    else Prob(M, obs, seq) ≤ Prob(M, obs, mostLikelyStateSequence obs)

theorem viterbi_optimality (M : HiddenMarkovModel StateSpace ObservationSpace)
    (v : ViterbiDecoding M) : ∀ obs, ∃ best : List StateSpace,
    ∀ seq : List StateSpace, Prob(M, obs, seq) ≤ Prob(M, obs, best) := by
  intro obs
  refine ⟨v.mostLikelyStateSequence obs, λ seq => ?_⟩
  by_cases h : seq = v.mostLikelyStateSequence obs
  · subst h; exact le_refl _
  · exact v.optimalityCriterion obs seq

end HautevilleHouse
end HiddenMarkovTheoremCanonicalLaneLean
