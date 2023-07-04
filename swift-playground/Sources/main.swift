import BigInt

func fib(n: Int, curr: Int, prev: Int) -> Int {
    guard n > 0 else {
        return curr
    }
    return fib(n: n - 1, curr: curr + prev, prev: curr)
}


print(fib(n: 10, curr: 1, prev: 0))
