import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BlackScholesPricingCanonicalLaneLean

structure OptionPricingPackage {S : StochasticProcessPackage} {B : BlackScholesPDEPackage S} where
  optionPrice : ℝ → S.stateSpace → ℝ
  hedgingStrategy : ℝ → S.stateSpace → S.stateSpace
  replicatingPortfolio : ℝ → S.stateSpace → ℝ
  priceMatchesPDE : Prop
  hedgeComplete : Prop

structure OptionPricingEvidence {S : StochasticProcessPackage} {B : BlackScholesPDEPackage S} (O : OptionPricingPackage S B) where
  priceMatchesPDEClosed : O.priceMatchesPDE
  hedgeCompleteClosed : O.hedgeComplete

def OptionPricingClosed {S : StochasticProcessPackage} {B : BlackScholesPDEPackage S} (O : OptionPricingPackage S B) : Prop :=
  O.priceMatchesPDE ∧ O.hedgeComplete

theorem option_pricing_closed_from_evidence {S : StochasticProcessPackage} {B : BlackScholesPDEPackage S} (O : OptionPricingPackage S B) (E : OptionPricingEvidence O) :
    OptionPricingClosed O := by
  exact And.intro E.priceMatchesPDEClosed E.hedgeCompleteClosed

end BlackScholesPricingCanonicalLaneLean
end HautevilleHouse
