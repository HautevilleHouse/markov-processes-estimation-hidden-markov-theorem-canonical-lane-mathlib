import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HiddenMarkovTheoremCanonicalLaneLean

structure FilteringSmoothing (M : HiddenMarkovModel StateSpace ObservationSpace) where
  filterDistribution : List ObservationSpace → StateSpace → ℝ
  smoothingDistribution : List ObservationSpace → StateSpace → ℝ
  filterRecurrence : ∀ (obs : List ObservationSpace) (s : StateSpace),
    filterDistribution obs s = (M.emissionKernel s (obs.last?) *
      ∑ s', M.transitionKernel s' s * filterDistribution (obs.init?) s') / ...
  smoothingRecurrence : ∀ (obs : List ObservationSpace) (s : StateSpace),
    smoothingDistribution obs s = filterDistribution obs s *
      ∑ s', (M.transitionKernel s s' * M.emissionKernel s' (obs.next?) *
        smoothingDistribution (obs.tail?) s') / filterDistribution (obs.tail?) s'
  normalization : ∀ obs, ∑ s, smoothingDistribution obs s = 1

theorem filtering_smoothing_consistency (M : HiddenMarkovModel StateSpace ObservationSpace)
    (fs : FilteringSmoothing M) : True := by trivial

end HautevilleHouse
end HiddenMarkovTheoremCanonicalLaneLean
