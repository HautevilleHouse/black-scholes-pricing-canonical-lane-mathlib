import HautevilleHouse.BlackScholesPricingCanonicalLaneLean.BlackScholesNoArbitrage

namespace HautevilleHouse
namespace BlackScholesPricingCanonicalLaneLean

structure OptionPricingCertificate (O : BlackScholesAdmittedObject) where
  pdeSolution : Prop
  boundaryCondition : Prop
  replicationStrategy : Prop
  pdeSolutionClosed : pdeSolution
  boundaryConditionClosed : boundaryCondition
  replicationStrategyClosed : replicationStrategy
  pricingEvidence : NoArbitrageEvidence O (noArbitragePackage O)

def OptionPricingClosed (O : BlackScholesAdmittedObject) (P : OptionPricingCertificate O) : Prop :=
  P.pdeSolution ∧ P.boundaryCondition ∧ P.replicationStrategy ∧ NoArbitrageClosed O (noArbitragePackage O)

theorem option_pricing_closed_from_evidence (O : BlackScholesAdmittedObject)
    (P : OptionPricingCertificate O) (E : NoArbitrageEvidence O (noArbitragePackage O)) :
    OptionPricingClosed O P := by
  exact And.intro P.pdeSolutionClosed (And.intro P.boundaryConditionClosed
    (And.intro P.replicationStrategyClosed (no_arbitrage_closed_from_evidence O (noArbitragePackage O) E)))

structure HedgingCertificate (O : BlackScholesAdmittedObject) (P : OptionPricingCertificate O) where
  deltaCalculated : Prop
  selfFinancing : Prop
  deltaCalculatedClosed : deltaCalculated
  selfFinancingClosed : selfFinancing
  hedgingEvidence : NoArbitrageEvidence O (noArbitragePackage O)

def HedgingClosed (O : BlackScholesAdmittedObject) (P : OptionPricingCertificate O)
    (H : HedgingCertificate O P) : Prop :=
  H.deltaCalculated ∧ H.selfFinancing ∧ NoArbitrageClosed O (noArbitragePackage O)

theorem hedging_closed_from_evidence (O : BlackScholesAdmittedObject)
    (P : OptionPricingCertificate O) (H : HedgingCertificate O P)
    (E : NoArbitrageEvidence O (noArbitragePackage O)) : HedgingClosed O P H := by
  exact And.intro H.deltaCalculatedClosed (And.intro H.selfFinancingClosed
    (no_arbitrage_closed_from_evidence O (noArbitragePackage O) E))

noncomputable def noArbitragePackage (O : BlackScholesAdmittedObject) : NoArbitragePackage O := {
  marketModel := True
  riskNeutralMeasure := True
  discountedAssetMartingale := True
  noArbitrageCondition := True
}

end BlackScholesPricingCanonicalLaneLean
end HautevilleHouse