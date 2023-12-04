using BenchmarkTools

function solve_pe001(N::Integer) :: Integer
    multiples_sum = 0
    for i in 1:(N - 1)
        if mod(i, 3) == 0 || mod(i, 5) == 0
            multiples_sum += i
        end
    end
    return multiples_sum
end

if abspath(PROGRAM_FILE) == @__FILE__
    # The sum of all natural numbers below 10 that are multiples of 3 or 5 is 23.
    @assert solve_pe001(10) == 23

    N = 1000
    solution = solve_pe001(N) # 233168
    println("Solution:   $solution")
    print("Benchmark:")
    @btime solve_pe001(N)
end
