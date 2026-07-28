import HautevilleHouse.BlackScholesPricingCanonicalLaneLean.BlackScholesAnalyticProof

namespace HautevilleHouse
namespace BlackScholesPricingCanonicalLaneLean

structure OptionPricingEvidenceTerms {O : BlackScholesAdmittedObject}
    (P : OptionPricingCertificate O) where
  pdeSolution : P.pdeSolution
  boundaryCondition : P.boundaryCondition
  replicationStrategy : P.replicationStrategy
  pricingClosed : OptionPricingClosed O P

def OptionPricingCertificate.evidenceTerms {O : BlackScholesAdmittedObject}
    (P : OptionPricingCertificate O) : OptionPricingEvidenceTerms P := {
  pdeSolution := P.pdeSolutionClosed
  boundaryCondition := P.boundaryConditionClosed
  replicationStrategy := P.replicationStrategyClosed
  pricingClosed := option_pricing_closed_from_evidence O P P.pricingEvidence
}

structure HedgingEvidenceTerms {O : BlackScholesAdmittedObject}
    {P : OptionPricingCertificate O} (H : HedgingCertificate O P) where
  deltaCalculated : H.deltaCalculated
  selfFinancing : H.selfFinancing
  hedgingClosed : HedgingClosed O P H

def HedgingCertificate.evidenceTerms {O : BlackScholesAdmittedObject}
    {P : OptionPricingCertificate O} (H : HedgingCertificate O P) : HedgingEvidenceTerms H := {
  deltaCalculated := H.deltaCalculatedClosed
  selfFinancing := H.selfFinancingClosed
  hedgingClosed := hedging_closed_from_evidence O P H H.hedgingEvidence
}

end BlackScholesPricingCanonicalLaneLean
end HautevilleHouse