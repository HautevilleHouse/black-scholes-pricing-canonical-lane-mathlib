import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BlackScholesPricingCanonicalLaneLean

structure RiskNeutralMeasure where
  density : ℝ → ℝ → ℝ
  isMartingale : Prop
  equivalentToPhysical : Prop
  unique : Prop

structure MartingaleRepresentation where
  integrand : ℝ → ℝ → ℝ
  stochasticIntegral : ℝ → ℝ → ℝ
  martingaleProperty : Prop
  predictable : Prop

def MartingaleMeasureClosed (M : RiskNeutralMeasure) : Prop :=
  M.isMartingale ∧ M.equivalentToPhysical ∧ M.unique

end BlackScholesPricingCanonicalLaneLean
end HautevilleHouse