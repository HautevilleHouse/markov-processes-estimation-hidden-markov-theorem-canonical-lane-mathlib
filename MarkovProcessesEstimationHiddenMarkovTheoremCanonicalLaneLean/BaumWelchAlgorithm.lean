import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean

structure BaumWelchAlgorithmPackage {H : HiddenMarkovTransitionPackage} where
  observationSequence : List H.observationSpace
  estimatedTransition : H.stateSpace → H.stateSpace → Prop
  estimatedEmission : H.stateSpace → H.observationSpace → Prop
  convergenceGuarantee : Prop
  iterationMap : ℕ → Prop

def BaumWelchAlgorithmClosed {H : HiddenMarkovTransitionPackage} (B : BaumWelchAlgorithmPackage H) : Prop :=
  B.convergenceGuarantee ∧ ∀ n, B.iterationMap n

end MarkovProcessesEstimationHiddenMarkovTheoremCanonicalLaneLean
end HautevilleHouse