import BlackScholesPricingCanonicalLaneLean.HeatEquationSolution

/-!
# Option Pricing Formula Package
-/

namespace HautevilleHouse
namespace BlackScholesPricingCanonicalLaneLean

structure OptionPricingFormulaPackage {U : UnderlyingAssetProcessPackage}
    {B : BlackScholesPDEPackage U} {H : HeatEquationSolutionPackage B} where
  callFormula : ℝ → ℝ → ℝ
  putFormula : ℝ → ℝ → ℝ
  formulaValidity : Prop
  derivationFromHeatSolution : Prop

structure OptionPricingFormulaEvidence {U : UnderlyingAssetProcessPackage}
    {B : BlackScholesPDEPackage U} {H : HeatEquationSolutionPackage B}
    (O : OptionPricingFormulaPackage H) where
  formulaValidityClosed : O.formulaValidity
  derivationFromHeatSolutionClosed : O.derivationFromHeatSolution

def OptionPricingFormulaClosed {U : UnderlyingAssetProcessPackage}
    {B : BlackScholesPDEPackage U} {H : HeatEquationSolutionPackage B}
    (O : OptionPricingFormulaPackage H) : Prop :=
  O.formulaValidity ∧ O.derivationFromHeatSolution

theorem option_pricing_formula_closed_from_evidence
    {U : UnderlyingAssetProcessPackage} {B : BlackScholesPDEPackage U}
    {H : HeatEquationSolutionPackage B} (O : OptionPricingFormulaPackage H)
    (E : OptionPricingFormulaEvidence O) : OptionPricingFormulaClosed O := by
  exact And.intro E.formulaValidityClosed E.derivationFromHeatSolutionClosed

end BlackScholesPricingCanonicalLaneLean
end HautevilleHouse