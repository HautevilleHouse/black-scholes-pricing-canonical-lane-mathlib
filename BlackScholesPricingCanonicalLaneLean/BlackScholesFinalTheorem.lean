import HautevilleHouse.BlackScholesPricingCanonicalLaneLean.BlackScholesAdmissibleClass

namespace HautevilleHouse
namespace BlackScholesPricingCanonicalLaneLean

def ConstrainedBlackScholesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_black_scholes_endgame (A : AdmissibleClass) :
    ConstrainedBlackScholesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BlackScholesPricingCanonicalLaneLean
end HautevilleHouse