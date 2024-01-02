using BenchmarkTools

function solve_pe002(N::Int) :: Int
    f1, f2 = 1, 2
    fn = f1 + f2
    
    # This general initialization for the sum of even Fibonacci numbers can handle
    # different initial values of f1 and f2.
    evens_sum = sum(filter(iseven, [f1, f2, fn]))
    while fn < N
        if iseven(fn)
            evens_sum += fn
        end
        f1 = f2
        f2 = fn
        fn = f1 + f2
    end
    return evens_sum
end

if abspath(PROGRAM_FILE) == @__FILE__
    N = 4000000
    solution = solve_pe002(N) # 4613732
    println("Solution:   $solution")
    print("Benchmark:")
    @btime solve_pe002(N)
end
