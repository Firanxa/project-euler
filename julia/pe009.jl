using BenchmarkTools

function solve_pe009(perimeter::Int) :: Int
    # This solution uses Heron's formula for the area of a triangle. Given the semiperimeter
    # S = perimeter / 2 and that a < b < c, the area of this right triangle is
    #
    #   ab / 2 = Sqrt[S (S - a) (S - b) (S - c)] <- Heron's formula
    #
    # Use this equation to complete the square in the Pythagorean theorem, a^2 + b^2 = c^2.
    # Since a + b + c = 1000 = 2S, we can substitute for c in terms of a and b, then solve
    # for integer values a, b that satisfy the subsequent equation
    #
    #   (a + b^2 = (2S - a - b)^2 + 4Sqrt[S (S - a) (S - b) (a + b - S)]
    #
    S = div(perimeter, 2)
    # Note that a, b <= S.
    for a in 1:S, b in (a + 1):S
        # This ensures a real radicand in Heron's formula.
        if a + b <= S
            continue
        end
        if (a + b)^2 == (2S - a - b)^2 + 4sqrt(S * (S - a) * (S - b) * (a + b - S))
            c = 2S - a - b
            return a * b * c
        end
    end
    return -1
end

if abspath(PROGRAM_FILE) == @__FILE__
    solution = solve_pe009(1000) # 31875000
    println("Solution:   $solution")
    print("Benchmark:")
    @btime solve_pe009(1000)
end
