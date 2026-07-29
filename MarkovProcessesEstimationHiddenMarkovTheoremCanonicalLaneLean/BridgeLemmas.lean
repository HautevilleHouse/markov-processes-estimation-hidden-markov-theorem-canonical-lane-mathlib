import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MarkovWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean
end HautevilleHouse