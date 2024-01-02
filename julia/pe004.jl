using BenchmarkTools

function _is_palindromic(n::Int) :: Bool
    # This is the most straightforward way to determine whether an integer is palindromic.
    # return digits(n) == reverse(digits(n))

    # Assigning the digits vector to a variable ultimately requires fewer allocations than
    # above.
    # v = digits(n)
    # return v == reverse(v)
    
    # Alternatively, comparing digits from opposite ends moving inward in a single pass is
    # more verbose, but faster and more memory efficient.
    digits_n = digits(n)
    half_length = div(ndigits(n), 2)
    for i in 1:half_length
        if digits_n[i] != digits_n[end - i + 1]
            return false
        end
    end
    return true
end

function solve_pe004(N::Int) :: Int
    largest_palindrome = 0
    # Iterate over the range of N-digit numbers. Memoise which products have already been
    # tested using a hash map.
    product_map = Dict{Int, Bool}()
    for i in 10^(N - 1):(10^N - 1), j in 10^(N - 1):(10^N - 1)
        n = i * j
        if !haskey(product_map, n)
            if _is_palindromic(n) && n > largest_palindrome
                largest_palindrome = n
            end
            product_map[n] = true
        end
    end
    return largest_palindrome
end

if abspath(PROGRAM_FILE) == @__FILE__
    # The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 * 99.
    @assert solve_pe004(2) == 9009

    N = 3
    solution = solve_pe004(N) # 906609
    println("Solution:   $solution")
    print("Benchmark:")
    @btime solve_pe004(N)
end
