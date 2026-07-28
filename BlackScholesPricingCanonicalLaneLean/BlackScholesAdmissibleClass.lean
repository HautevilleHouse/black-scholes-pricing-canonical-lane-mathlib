import HautevilleHouse.BlackScholesPricingCanonicalLaneLean.BlackScholesMathlibObjects

namespace HautevilleHouse
namespace BlackScholesPricingCanonicalLaneLean

structure AdmissibleClass where
  object : BlackScholesAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BlackScholesWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

end BlackScholesPricingCanonicalLaneLean
end HautevilleHouse