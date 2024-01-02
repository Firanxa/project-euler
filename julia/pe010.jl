using BenchmarkTools
using Primes

function solve_pe010(N::Int) :: Int
    # Returns the sum of the collection of primes up to N. This is less memory efficient
    # than iteratively yielding primes with a sieve.
    return sum(primes(N))
end

if abspath(PROGRAM_FILE) == @__FILE__
    # The sum of the primes below 10 equals 17.
    @assert solve_pe010(10) == 17

    N = 2000000
    solution = solve_pe010(N) # 142913828922
    println("Solution:   $solution")
    print("Benchmark:")
    @btime solve_pe010(N)    
end
