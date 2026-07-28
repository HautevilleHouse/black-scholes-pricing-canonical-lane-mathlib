import Lake
open Lake
package black_scholes_pricing_canonical_lane_mathlib where
  version := "0.1.0"
require canonicalLaneMathlib from git "https://github.com/HautevilleHouse/canonical-lane-mathlib.git"
@[default_target]
lean_lib black_scholes_pricing_canonical_lane_mathlib
