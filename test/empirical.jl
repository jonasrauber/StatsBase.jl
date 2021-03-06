
using StatsBase
using Base.Test

fnecdf = ecdf(randn(10000000))
@test_approx_eq_eps fnecdf([-1.96, -1.644854, -1.281552, -0.6744898, 0, 0.6744898, 1.281552, 1.644854, 1.96]) [0.025, 0.05, 0.1, 0.25, 0.5, 0.75, 0.9, 0.95, 0.975] 1e-3
@test_approx_eq_eps fnecdf(1.96) 0.975 1e-3
@test_approx_eq fnecdf([-1.96, -1.644854, -1.281552, -0.6744898, 0, 0.6744898, 1.281552, 1.644854, 1.96]) map(fnecdf, [-1.96, -1.644854, -1.281552, -0.6744898, 0, 0.6744898, 1.281552, 1.644854, 1.96])

fnecdf = ecdf([0.5])
@test fnecdf([zeros(5000), ones(5000)]) == [zeros(5000), ones(5000)]

# TODO: test KDE
