using BenchmarkTools

function solve_pe008(N::Int, num::String) :: Int
    max_product = 0
    for i in 1:(length(num) - N)
        num_substring = num[i:(i + N - 1)]
        num_numeric = parse(Int, num_substring)
        product = prod(digits(num_numeric))
        max_product = max(product, max_product)
    end
    return max_product
end

if abspath(PROGRAM_FILE) == @__FILE__
    # Read input and flatten the vector of strings to a single string, `num`.
    num = readlines("../inputs/pe008.txt")
    num = *(num...)
    
    # The four adjacent digits in `num` that have the greatest product are
    # 9 * 9 * 8 * 9 = 5832
    @assert solve_pe008(4, num) == 5832
    
    N = 13
    solution = solve_pe008(N, num) # 23514624000
    println("Solution:   $solution")
    print("Benchmark:")
    @btime solve_pe008(N, num)
end
