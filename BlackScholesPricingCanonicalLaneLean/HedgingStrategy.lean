import HautevilleHouse.BlackScholesPricingCanonicalLaneLean.RiskNeutralMeasure

/-!
# Hedging Strategy Package
-/

namespace HautevilleHouse
namespace BlackScholesPricingCanonicalLaneLean

structure HedgingStrategyPackage {A : AdmissibleClass} (R : RiskNeutralMeasurePackage A) where
  deltaHedge : Prop
  portfolioValue : ℝ → ℝ → ℝ
  selfFinancing : Prop
  replicatesClaim : Prop
  completeness : Prop

structure HedgingStrategyEvidence {A : AdmissibleClass} {R : RiskNeutralMeasurePackage A} (H : HedgingStrategyPackage R) where
  deltaHedgeClosed : H.deltaHedge
  selfFinancingClosed : H.selfFinancing
  replicatesClaimClosed : H.replicatesClaim
  completenessClosed : H.completeness

def HedgingStrategyClosed {A : AdmissibleClass} {R : RiskNeutralMeasurePackage A} (H : HedgingStrategyPackage R) : Prop :=
  H.deltaHedge ∧ H.selfFinancing ∧ H.replicatesClaim ∧ H.completeness

theorem hedging_strategy_closed_from_evidence {A : AdmissibleClass} {R : RiskNeutralMeasurePackage A} (H : HedgingStrategyPackage R) (E : HedgingStrategyEvidence H) : HedgingStrategyClosed H :=
  And.intro E.deltaHedgeClosed (And.intro E.selfFinancingClosed (And.intro E.replicatesClaimClosed E.completenessClosed))

end BlackScholesPricingCanonicalLaneLean
end HautevilleHouse