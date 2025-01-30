"""
    INT

A Julia package for Bayesian inference of timescales in time series data.

# Features
- Standard techniques for INT calculation: ACW-50, ACW-0, FOOOF
- Approximate Bayesian Computation (ABC) for parameter inference
- ADVI for variational inference
- Multiple model types:
  - Single timescale
  - Single timescale with oscillations
  - Models supporting missing data
- Summary statistics using periodogram, Welch (from DSP.jl) and Lomb-Scargle (from LombScargle.jl):
  - Autocorrelation function (ACF)
  - Power spectral density (PSD)

# Submodules
- `Models`: Abstract model types and interfaces
- `ABC`: Approximate Bayesian Computation algorithms
- `TuringBackend`: Turing.jl integration for ADVI
- `SummaryStats`: ACF and PSD implementations
- `Distances`: Distance metrics for ABC
- `Utils`: Utility functions for analysis
- `OrnsteinUhlenbeck`: OU process generation using DifferentialEquations.jl
- `OneTimescale`: Single timescale model
- `OneTimescaleAndOsc`: Single timescale with oscillations
- `OneTimescaleWithMissing`: Single timescale with missing data
- `OneTimescaleAndOscWithMissing`: Single timescale and oscillations with missing data
"""
module INT

using Revise
using Reexport
using Statistics
using Distributions

include("core/model.jl")
@reexport using .Models

include("core/abc.jl")
@reexport using .ABC

include("stats/summary.jl")
@reexport using .SummaryStats

include("stats/distances.jl")
@reexport using .Distances

include("utils/utils.jl")
@reexport using .Utils

include("utils/ou_process.jl")
@reexport using .OrnsteinUhlenbeck

include("models/two_timescale.jl")
@reexport using .TwoTimescaleModels

include("models/one_timescale.jl")
@reexport using .OneTimescale

include("models/one_timescale_and_osc.jl")
@reexport using .OneTimescaleAndOsc

include("models/one_timescale_with_missing.jl")
@reexport using .OneTimescaleWithMissing

include("models/one_timescale_and_osc_with_missing.jl")
@reexport using .OneTimescaleAndOscWithMissing

include("core/turing_backend.jl")
@reexport using .TuringBackend

export AbstractTimescaleModel,
       BaseModel,
       generate_ou_process,
       linear_distance,
       logarithmic_distance,
       OneTimescaleModel,
       TwoTimescaleModel,
       OneTimescaleAndOscModel

end # module