import scala.annotation.tailrec

object Task1 extends App {
  // ------------------- Task 1 a) -------------------

  val myArray: Array[Int] = new Array[Int](50)

  for (i <- myArray.indices) {
    myArray(i) = i + 1
  }

  println("Task 1 a)")
  myArray.foreach(number => print(number + " "))

  // ------------------- Task 1 b) -------------------

  def sumArray(array: Array[Int]): Int = {
    var sum = 0
    for (number <- array) {
      sum += number
    }
    sum
  }

  println("\n\nTask 1 b)")
  println("Sum myArray: " + sumArray(myArray))

  // ------------------- Task 1 c) -------------------

  def sumArrayRecursively(array: Array[Int]): Int = {
    // Made function tail recursive, making it memory efficient with very large arrays.
    @tailrec
    def sumArrayRecursivelyAccumulator(array: Array[Int], currentSum: Int): Int = {
      if (array.isEmpty) return currentSum
      sumArrayRecursivelyAccumulator(array.drop(1), currentSum + array(0))
    }

    sumArrayRecursivelyAccumulator(array, 0)
  }

  println("\nTask 1 c)")
  println("Sum recursive myArray: " + sumArrayRecursively(myArray))

  // ------------------- Task 1 d) -------------------

  def fibonacci(index: BigInt): BigInt = {
    // Made function tail recursive, making it memory efficient when calculating very large fibonacci numbers.
    @tailrec
    def fibonacciTailRecursive(index: BigInt, previous: BigInt, current: BigInt): BigInt = {
      if (index <= 0) return current
      fibonacciTailRecursive(index - 1, previous + current, previous)
    }

    fibonacciTailRecursive(index, 1, 0)
  }

  println("\nTask 1 d)")
  println("20 first Fibonacci numbers: ")
  (0 to 19).foreach(n => print(fibonacci(n) + " "))

  println("\n\nInt has the range -2147483648 to 2147483647, while BigInt can hold much larger numbers.\n" +
    "BigInt is build on top of java's BigInteger which has a documented range of \n" +
    "-2^Integer.MAX_VALUE (exclusive) to +2^Integer.MAX_VALUE (exclusive) and a theoretical limit only\n" +
    "restricted by the JVMs available memory. The choice between the two should be done according to need.")

}


