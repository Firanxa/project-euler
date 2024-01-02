using BenchmarkTools
using Primes

function solve_pe003(N::Int) :: Int
    # This returns the last element of a sorted vector of the prime factors of N, with
    # multiplicity.
    return factor(Vector, N)[end]
end

if abspath(PROGRAM_FILE) == @__FILE__
    # The largest prime factor of 13195 is 29.
    @assert solve_pe003(13195) == 29

    N = 600851475143
    solution = solve_pe003(N) # 6857
    println("Solution:   $solution")
    print("Benchmark:")
    @btime solve_pe003(N)
end
