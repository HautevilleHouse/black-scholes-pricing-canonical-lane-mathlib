import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BlackScholesPricingCanonicalLaneLean

structure GeometricBrownianMotion (μ σ : ℝ) where
  drift : ℝ
  volatility : ℝ
  initialValue : ℝ
  samplePath : ℝ → ℝ → ℝ
  continuousTime : Prop
  markovProperty : Prop
  logNormalReturns : Prop

structure BrownianMotion where
  paths : ℝ → ℝ
  independentIncrements : Prop
  stationaryIncrements : Prop
  continuousPaths : Prop
  zeroAtZero : paths 0 = 0

structure StochasticProcessModel where
  asset : GeometricBrownianMotion 0.05 0.2
  riskFreeRate : ℝ
  timeHorizon : ℝ
  marketComplete : Prop
  noArbitrage : Prop

end BlackScholesPricingCanonicalLaneLean
end HautevilleHouse