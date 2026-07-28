import HautevilleHouse.BlackScholesPricingCanonicalLaneLean.BlackScholesMathlibObjects

namespace HautevilleHouse
namespace BlackScholesPricingCanonicalLaneLean

structure NoArbitragePackage (O : BlackScholesAdmittedObject) where
  marketModel : Prop
  riskNeutralMeasure : Prop
  discountedAssetMartingale : Prop
  noArbitrageCondition : Prop

structure NoArbitrageEvidence (O : BlackScholesAdmittedObject) (N : NoArbitragePackage O) where
  marketModelClosed : N.marketModel
  riskNeutralMeasureClosed : N.riskNeutralMeasure
  discountedAssetMartingaleClosed : N.discountedAssetMartingale
  noArbitrageConditionClosed : N.noArbitrageCondition

def NoArbitrageClosed (O : BlackScholesAdmittedObject) (N : NoArbitragePackage O) : Prop :=
  N.marketModel ∧ N.riskNeutralMeasure ∧ N.discountedAssetMartingale ∧ N.noArbitrageCondition

theorem no_arbitrage_closed_from_evidence (O : BlackScholesAdmittedObject)
    (N : NoArbitragePackage O) (E : NoArbitrageEvidence O N) : NoArbitrageClosed O N := by
  exact And.intro E.marketModelClosed (And.intro E.riskNeutralMeasureClosed
    (And.intro E.discountedAssetMartingaleClosed E.noArbitrageConditionClosed))

end BlackScholesPricingCanonicalLaneLean
end HautevilleHouse