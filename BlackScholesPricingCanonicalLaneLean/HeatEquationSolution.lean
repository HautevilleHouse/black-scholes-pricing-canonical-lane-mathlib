import BlackScholesPricingCanonicalLaneLean.BlackScholesPDE

/-!
# Heat Equation Solution Package
-/

namespace HautevilleHouse
namespace BlackScholesPricingCanonicalLaneLean

structure HeatEquationSolutionPackage {U : UnderlyingAssetProcessPackage}
    (B : BlackScholesPDEPackage U) where
  heatEquation : Prop
  transformationApplied : Prop
  solutionExplicit : Prop
  solutionRegularity : Prop

structure HeatEquationSolutionEvidence {U : UnderlyingAssetProcessPackage}
    {B : BlackScholesPDEPackage U} (H : HeatEquationSolutionPackage B) where
  heatEquationClosed : H.heatEquation
  transformationAppliedClosed : H.transformationApplied
  solutionExplicitClosed : H.solutionExplicit
  solutionRegularityClosed : H.solutionRegularity

def HeatEquationSolutionClosed {U : UnderlyingAssetProcessPackage}
    {B : BlackScholesPDEPackage U} (H : HeatEquationSolutionPackage B) : Prop :=
  H.heatEquation ∧ H.transformationApplied ∧ H.solutionExplicit ∧ H.solutionRegularity

theorem heat_equation_solution_closed_from_evidence
    {U : UnderlyingAssetProcessPackage} {B : BlackScholesPDEPackage U}
    (H : HeatEquationSolutionPackage B) (E : HeatEquationSolutionEvidence H) :
    HeatEquationSolutionClosed H := by
  exact And.intro E.heatEquationClosed
    (And.intro E.transformationAppliedClosed
      (And.intro E.solutionExplicitClosed E.solutionRegularityClosed))

end BlackScholesPricingCanonicalLaneLean
end HautevilleHouse