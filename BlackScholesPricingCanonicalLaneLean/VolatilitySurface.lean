import BlackScholesPricingCanonicalLaneLean.OptionPricingFormula

/-!
# Volatility Surface Package
-/

namespace HautevilleHouse
namespace BlackScholesPricingCanonicalLaneLean

structure VolatilitySurfacePackage {U : UnderlyingAssetProcessPackage}
    {B : BlackScholesPDEPackage U} {H : HeatEquationSolutionPackage B}
    {O : OptionPricingFormulaPackage H} where
  impliedVolatility : ℝ → ℝ → ℝ
  surfaceRegularity : Prop
  skewTermStructure : Prop
  calibrationData : Prop

structure VolatilitySurfaceEvidence {U : UnderlyingAssetProcessPackage}
    {B : BlackScholesPDEPackage U} {H : HeatEquationSolutionPackage B}
    {O : OptionPricingFormulaPackage H} (V : VolatilitySurfacePackage O) where
  surfaceRegularityClosed : V.surfaceRegularity
  skewTermStructureClosed : V.skewTermStructure
  calibrationDataClosed : V.calibrationData

def VolatilitySurfaceClosed {U : UnderlyingAssetProcessPackage}
    {B : BlackScholesPDEPackage U} {H : HeatEquationSolutionPackage B}
    {O : OptionPricingFormulaPackage H} (V : VolatilitySurfacePackage O) : Prop :=
  V.surfaceRegularity ∧ V.skewTermStructure ∧ V.calibrationData

theorem volatility_surface_closed_from_evidence
    {U : UnderlyingAssetProcessPackage} {B : BlackScholesPDEPackage U}
    {H : HeatEquationSolutionPackage B} {O : OptionPricingFormulaPackage H}
    (V : VolatilitySurfacePackage O) (E : VolatilitySurfaceEvidence V) :
    VolatilitySurfaceClosed V := by
  exact And.intro E.surfaceRegularityClosed
    (And.intro E.skewTermStructureClosed E.calibrationDataClosed)

end BlackScholesPricingCanonicalLaneLean
end HautevilleHouse