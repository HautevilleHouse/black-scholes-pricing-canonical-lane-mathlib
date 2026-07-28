import BlackScholesPricingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BlackScholesPricingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BlackScholesWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BlackScholesPricingCanonicalLaneLean
end HautevilleHouse