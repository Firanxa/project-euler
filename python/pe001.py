"""Python solution to Project Euler Problem 1."""

def solve_pe001(n: int) -> int:
    """Sums the multiples of 3 and 5 from 1 through n."""
    multiples_sum = 0
    for i in range(n):
        if i % 3 == 0 or i % 5 == 0:
            multiples_sum += i
    return multiples_sum


if __name__ == '__main__':
    # The sum of all natural numbers below 10 that are multiples of 3 or 5 is 23.
    assert solve_pe001(10) == 23

    N = 1000
    solution = solve_pe001(N) # 233168
    print(solution)
