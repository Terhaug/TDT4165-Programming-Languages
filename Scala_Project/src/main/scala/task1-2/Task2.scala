import java.util.concurrent.TimeoutException
import java.util.concurrent.atomic.AtomicInteger

import scala.annotation.tailrec
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.DurationInt
import scala.concurrent.{Await, Future}

object Task2 extends App {
  // ------------------- Task 2 a) -------------------

  def threadWrapper(body: => Unit): Thread = {
    new Thread {
      override def run(): Unit = body
    }
  }

  def testFunction(): Unit = {
    println("\nThread has started")
  }

  println("Task 2 a)")
  println("The thread will start after 3 seconds")
  val myThread = threadWrapper(testFunction())
  for (i <- 1 to 3) {
    Thread.sleep(1000)
    print(i + " ")
  }
  myThread.start()
  myThread.join()

  // ------------------- Task 2 b) -------------------

  private var counter: Int = 0

  def increaseCounter(): Unit = {
    counter += 1
  }

  def printCounter(): Unit = {
    println("Counter: " + counter)
  }

  val increaseCounter1 = threadWrapper(increaseCounter())
  val increaseCounter2 = threadWrapper(increaseCounter())
  val printCount = threadWrapper(printCounter())

  println("\nTask 2 b)")
  increaseCounter1.start()
  increaseCounter2.start()
  printCount.start()
  increaseCounter1.join()
  increaseCounter2.join()
  printCount.join()

  println("Counter can be equal 0, 1 or 2 when the counter is printed. \n" +
    "This phenomenon is called race condition where simultaneous actions occur on a shared recourse. \n" +
    "Race conditions can be problematic in for example a situation where you want to withdraw some \n" +
    "amount from your bank account, but at the same time another thread is doing the same, and both\n" +
    "are withdrawing from the original value instead of the updated value from the first thread accessing the original value.")

  // ------------------- Task 2 c) -------------------

  private val counter2C = new AtomicInteger(0)

  // Solved by using a compare-and-swap (CAS) operation.
  @tailrec
  def increaseCounter2C(): Unit = {
    val currentCounter = counter2C.get()
    val updated = currentCounter + 1
    if (counter2C.compareAndSet(currentCounter, updated)) return
    increaseCounter2C()
  }

  def printCounter2C(): Unit = {
    println("Counter: " + counter2C)
  }

  val increaseCounter2C1 = threadWrapper(increaseCounter2C())
  val increaseCounter2C2 = threadWrapper(increaseCounter2C())
  val printCount2C = threadWrapper(printCounter2C())

  println("\nTask 2 c)")
  increaseCounter2C1.start()
  increaseCounter2C2.start()
  printCount2C.start()
  increaseCounter2C1.join()
  increaseCounter2C2.join()
  printCount2C.join()

  // ------------------- Task 2 d) -------------------

  println("\nTask 2 d)")

  object FirstObject {
    lazy val startState = 50
    lazy val start: Int = SecondObject.initialState
  }

  object SecondObject {
    lazy val initialState: Int = FirstObject.startState
  }

  println("Creates a deadlock. Futures timed out after 5 seconds: ")

  object Deadlock {
    def run: Unit = {
      val result = Future.sequence(Seq(
        Future {
          FirstObject.start
        },
        Future {
          SecondObject.initialState
        }
      ))
      Await.result(result, 5.second)
    }
  }

  try {
    Deadlock.run
  } catch {
    case e: TimeoutException => println("A deadlock has occurred: " + e.toString)
  }

  println("\nDeadlocks is a halt in progression caused by two (or more) processes \n" +
    "that each require another processes' resources, before moving forward. Since \n" +
    "each process is waiting to acquire the others resource, but refuses to release their own, \n" +
    "neither can move forward, which results in a deadlock. It's like a Catch 22 where you are \n" +
    "throwing a party but none of the invited guests want to commit unless they know who else is coming.\n" +
    "\n" +
    "The four solutions for handling deadlocks are: \n" +
    "\t- Hold and Wait : a process is prevented from reserving a resource while it is \n" +
    "\t  simultaneously waiting for another. \n" +
    "\t- Mutual exclusion: resources require exclusive access.\n" +
    "\t- No preemption: might some times cause problems, but allowing one resource to \n" +
    "\t  another would solve a deadlock.\n" +
    "\t- Circular waiting: by simply numbering all the resources and allow processes to \n" +
    "\t  request these resources i.e. in an incremental order.\n" +
    "In order to prevent deadlock, you need to eliminate one of the four deadlock conditions."
  )
}
