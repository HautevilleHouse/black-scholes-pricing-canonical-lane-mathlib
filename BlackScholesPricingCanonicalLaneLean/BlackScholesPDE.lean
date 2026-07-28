import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BlackScholesPricingCanonicalLaneLean

structure BlackScholesPDEPackage (S : StochasticProcessPackage) where
  riskFreeRate : ℝ
  volatility : ℝ
  optionPayoff : S.stateSpace → ℝ
  pdeSolution : ℝ → S.stateSpace → ℝ
  pdeSatisfied : Prop

structure BlackScholesPDEEvidence {S : StochasticProcessPackage} (B : BlackScholesPDEPackage S) where
  pdeSatisfiedClosed : B.pdeSatisfied

def BlackScholesPDEClosed {S : StochasticProcessPackage} (B : BlackScholesPDEPackage S) : Prop :=
  B.pdeSatisfied

theorem black_scholes_pde_closed_from_evidence {S : StochasticProcessPackage} (B : BlackScholesPDEPackage S) (E : BlackScholesPDEEvidence B) :
    BlackScholesPDEClosed B := by
  exact E.pdeSatisfiedClosed

end BlackScholesPricingCanonicalLaneLean
end HautevilleHouse
