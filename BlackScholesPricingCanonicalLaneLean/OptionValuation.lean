import HautevilleHouse.BlackScholesPricingCanonicalLaneLean.HedgingStrategy

/-!
# Option Valuation Package (Black-Scholes Formula)
-/

namespace HautevilleHouse
namespace BlackScholesPricingCanonicalLaneLean

structure OptionValuationPackage {A : AdmissibleClass} {R : RiskNeutralMeasurePackage A} {H : HedgingStrategyPackage R} where
  callPrice : ℝ → ℝ → ℝ → ℝ → ℝ
  putPrice : ℝ → ℝ → ℝ → ℝ → ℝ
  bsFormulaCorrect : Prop
  greeks : Prop

structure OptionValuationEvidence {A : AdmissibleClass} {R : RiskNeutralMeasurePackage A} {H : HedgingStrategyPackage R} (O : OptionValuationPackage H) where
  bsFormulaCorrectClosed : O.bsFormulaCorrect
  greeksClosed : O.greeks

def OptionValuationClosed {A : AdmissibleClass} {R : RiskNeutralMeasurePackage A} {H : HedgingStrategyPackage R} (O : OptionValuationPackage H) : Prop :=
  O.bsFormulaCorrect ∧ O.greeks

theorem option_valuation_closed_from_evidence {A : AdmissibleClass} {R : RiskNeutralMeasurePackage A} {H : HedgingStrategyPackage R} (O : OptionValuationPackage H) (E : OptionValuationEvidence O) : OptionValuationClosed O :=
  And.intro E.bsFormulaCorrectClosed E.greeksClosed

end BlackScholesPricingCanonicalLaneLean
end HautevilleHouse