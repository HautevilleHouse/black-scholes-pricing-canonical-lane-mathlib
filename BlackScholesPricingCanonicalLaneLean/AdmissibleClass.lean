import BlackScholesPricingCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace BlackScholesPricingCanonicalLaneLean

structure AdmissibleClass where
  object : BlackScholesAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BlackScholesWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BlackScholesPricingCanonicalLaneLean
end HautevilleHouse