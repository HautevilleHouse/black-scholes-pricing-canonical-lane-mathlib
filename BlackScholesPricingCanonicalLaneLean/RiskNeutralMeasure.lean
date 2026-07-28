import HautevilleHouse.BlackScholesPricingCanonicalLaneLean.AdmissibleClass

/-!
# Risk-Neutral Measure Package
-/

namespace HautevilleHouse
namespace BlackScholesPricingCanonicalLaneLean

structure RiskNeutralMeasurePackage (A : AdmissibleClass) where
  numeraire : Type
  discountedPrice : ℝ
  equivalenceToPhysical : Prop
  radonNikodymDerivative : Prop
  martingaleProperty : Prop

structure RiskNeutralMeasureEvidence {A : AdmissibleClass} (R : RiskNeutralMeasurePackage A) where
  equivalenceToPhysicalClosed : R.equivalenceToPhysical
  radonNikodymDerivativeClosed : R.radonNikodymDerivative
  martingalePropertyClosed : R.martingaleProperty

def RiskNeutralMeasureClosed {A : AdmissibleClass} (R : RiskNeutralMeasurePackage A) : Prop :=
  R.equivalenceToPhysical ∧ R.radonNikodymDerivative ∧ R.martingaleProperty

theorem risk_neutral_measure_closed_from_evidence {A : AdmissibleClass} (R : RiskNeutralMeasurePackage A) (E : RiskNeutralMeasureEvidence R) : RiskNeutralMeasureClosed R :=
  And.intro E.equivalenceToPhysicalClosed (And.intro E.radonNikodymDerivativeClosed E.martingalePropertyClosed)

end BlackScholesPricingCanonicalLaneLean
end HautevilleHouse