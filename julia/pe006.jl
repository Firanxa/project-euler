using BenchmarkTools

function sum_square(n::Int) :: Int
    if n < 0
        return 0
    end
    # This is the formula for \Sum_{k=1}^n n^2.
    return n * (n + 1) * (2n + 1) / 6
end

function square_sum(n::Int) :: Int
    if n < 0
        return 0
    end
    # This is the formula for \Sum_{k=1}^n n.
    return (n * (n + 1) / 2)^2
end

function solve_pe006(N::Int) :: Int
    return square_sum(N) - sum_square(N)
end

if abspath(PROGRAM_FILE) == @__FILE__
    # The difference between the sum of the squares of the first ten natural numbers and
    # the square of their sum is 3025 - 385 = 2640.
    @assert solve_pe006(10) == 2640

    N = 100
    solution = solve_pe006(N) # 25164150
    println("Solution:   $solution")
    print("Benchmark:")
    @btime solve_pe006(N)    
end
