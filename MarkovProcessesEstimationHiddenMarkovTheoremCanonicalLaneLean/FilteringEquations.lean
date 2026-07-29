import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean

structure FilteringEquationsPackage (A : AdmissibleClass) where
  forwardEquation : Prop
  backwardEquation : Prop
  smoothingEquation : Prop
  recursionConvergence : Prop

structure FilteringEquationsEvidence {A : AdmissibleClass} (F : FilteringEquationsPackage A) where
  forwardEquationClosed : F.forwardEquation
  backwardEquationClosed : F.backwardEquation
  smoothingEquationClosed : F.smoothingEquation
  recursionConvergenceClosed : F.recursionConvergence

def FilteringEquationsClosed {A : AdmissibleClass} (F : FilteringEquationsPackage A) : Prop :=
  F.forwardEquation ∧ F.backwardEquation ∧ F.smoothingEquation ∧ F.recursionConvergence

theorem filtering_equations_closed_from_evidence {A : AdmissibleClass}
    (F : FilteringEquationsPackage A) (E : FilteringEquationsEvidence F) :
    FilteringEquationsClosed F := by
  exact And.intro E.forwardEquationClosed
    (And.intro E.backwardEquationClosed
      (And.intro E.smoothingEquationClosed E.recursionConvergenceClosed))

end MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean
end HautevilleHouse
