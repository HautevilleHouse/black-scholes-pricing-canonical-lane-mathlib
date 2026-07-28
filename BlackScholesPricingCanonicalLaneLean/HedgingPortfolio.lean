import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BlackScholesPricingCanonicalLaneLean

structure HedgingPortfolio where
  delta : ℝ
  gamma : ℝ
  theta : ℝ
  selfFinancing : Prop
  replicating : Prop
  perfectHedge : Prop

structure HedgingStrategy where
  stockHolding : ℝ → ℝ
  bondHolding : ℝ → ℝ
  portfolioValue : ℝ → ℝ
  continuousRebalancing : Prop
  initialCapital : ℝ
  terminalPayoff : ℝ → ℝ

def HedgingClosed (H : HedgingStrategy) : Prop :=
  H.continuousRebalancing ∧ H.selfFinancing ∧ H.replicating

end BlackScholesPricingCanonicalLaneLean
end HautevilleHouse