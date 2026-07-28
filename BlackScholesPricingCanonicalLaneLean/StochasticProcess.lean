import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BlackScholesPricingCanonicalLaneLean

structure StochasticProcessPackage where
  timeDomain : Type u
  stateSpace : Type v
  drift : timeDomain → stateSpace → stateSpace
  diffusion : timeDomain → stateSpace → stateSpace → stateSpace
  initialCondition : stateSpace
  itoFormulaCompatible : Prop

structure StochasticProcessEvidence (S : StochasticProcessPackage) where
  driftMeasurable : Prop
  diffusionMeasurable : Prop
  initialConditionFinite : Prop
  itoFormulaCompatibleClosed : S.itoFormulaCompatible
  driftMeasurableTerm : driftMeasurable
  diffusionMeasurableTerm : diffusionMeasurable
  initialConditionFiniteTerm : initialConditionFinite

def StochasticProcessClosed (S : StochasticProcessPackage) : Prop :=
  S.itoFormulaCompatible

theorem stochastic_process_closed_from_evidence (S : StochasticProcessPackage) (E : StochasticProcessEvidence S) :
    StochasticProcessClosed S := by
  exact E.itoFormulaCompatibleClosed

end BlackScholesPricingCanonicalLaneLean
end HautevilleHouse
