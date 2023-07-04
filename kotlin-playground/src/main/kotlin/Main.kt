import java.math.BigInteger
import java.math.BigInteger.*

fun main() {
    print(fib(n = 10000))
}

tailrec fun fib(
    n: Int,
    curr: BigInteger = ONE,
    last: BigInteger = ZERO,
): BigInteger =
    if (n <= 0) curr else fib(n - 1, curr + last, curr)
