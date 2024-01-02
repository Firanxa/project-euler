using BenchmarkTools

function solve_pe005(N::Int) :: Int
    return lcm(1:N)
end

if abspath(PROGRAM_FILE) == @__FILE__
    # The smallest number that is evenly divisible by each number from 1 to 10 is 2520.
    @assert solve_pe005(10) == 2520

    N = 20
    solution = solve_pe005(N) # 232792560
    println("Solution:   $solution")
    print("Benchmark:")
    @btime solve_pe005(N)
end
