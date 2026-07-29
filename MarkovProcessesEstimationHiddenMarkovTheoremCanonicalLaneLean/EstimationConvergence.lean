import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean.HiddenMarkovModel

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean

structure EstimationConvergencePackage (H : HiddenMarkovModel) where
  likelihoodFunction : Type u
  maximumLikelihoodEstimate : Type v
  consistency : Prop
  asymptoticNormality : Prop
  efficiency : Prop

structure EstimationConvergenceEvidence {H : HiddenMarkovModel} (E : EstimationConvergencePackage H) where
  consistencyClosed : E.consistency
  asymptoticNormalityClosed : E.asymptoticNormality
  efficiencyClosed : E.efficiency

def EstimationConvergenceClosed {H : HiddenMarkovModel} (E : EstimationConvergencePackage H) : Prop :=
  E.consistency ∧ E.asymptoticNormality ∧ E.efficiency

theorem estimation_convergence_closed_from_evidence {H : HiddenMarkovModel}
    (E : EstimationConvergencePackage H) (Ev : EstimationConvergenceEvidence E) :
    EstimationConvergenceClosed E := by
  exact And.intro Ev.consistencyClosed
    (And.intro Ev.asymptoticNormalityClosed Ev.efficiencyClosed)

end MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean
end HautevilleHouse