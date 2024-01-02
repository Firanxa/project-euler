using BenchmarkTools
using Primes

function solve_pe007(N::Int) :: Int
    # Returns the N-th prime number.
    return prime(N)
end

if abspath(PROGRAM_FILE) == @__FILE__
    # The 6th prime is 13.
    @assert prime(6) == 13

    N = 10001
    solution = solve_pe007(N) # 104743
    println("Solution:   $solution")
    print("Benchmark:")
    @btime solve_pe007(N)        
end
