import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean

structure StateEstimationPackage (A : AdmissibleClass) where
  kalmanFilter : Prop
  particleFilter : Prop
  extendedKalmanFilter : Prop
  unscentedKalmanFilter : Prop

structure StateEstimationEvidence {A : AdmissibleClass} (S : StateEstimationPackage A) where
  kalmanFilterClosed : S.kalmanFilter
  particleFilterClosed : S.particleFilter
  extendedKalmanFilterClosed : S.extendedKalmanFilter
  unscentedKalmanFilterClosed : S.unscentedKalmanFilter

def StateEstimationClosed {A : AdmissibleClass} (S : StateEstimationPackage A) : Prop :=
  S.kalmanFilter ∧ S.particleFilter ∧ S.extendedKalmanFilter ∧ S.unscentedKalmanFilter

theorem state_estimation_closed_from_evidence {A : AdmissibleClass}
    (S : StateEstimationPackage A) (E : StateEstimationEvidence S) :
    StateEstimationClosed S := by
  exact And.intro E.kalmanFilterClosed
    (And.intro E.particleFilterClosed
      (And.intro E.extendedKalmanFilterClosed E.unscentedKalmanFilterClosed))

end MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean
end HautevilleHouse
