import scala.collection.mutable.Queue

object TransactionStatus extends Enumeration {
  val SUCCESS, PENDING, FAILED = Value
}

class TransactionQueue {

  private val queue = Queue[Transaction]()

  def pop: Transaction = queue.synchronized {
    queue.dequeue()
  }

  def isEmpty: Boolean = queue.synchronized {
    queue.isEmpty
  }

  def push(transaction: Transaction): Unit = queue.synchronized {
    queue += transaction
  }

  def peek: Transaction = queue.head

  def iterator: Iterator[Transaction] = queue.iterator

}

class Transaction(val transactionsQueue: TransactionQueue,
                  val processedTransactions: TransactionQueue,
                  val from: Account,
                  val to: Account,
                  val amount: Double,
                  val allowedAttempts: Int) extends Runnable {

  var status: TransactionStatus.Value = TransactionStatus.PENDING
  var attempt = 0

  override def run(): Unit = {

    def doTransaction(): Unit = {
      if (attempt < allowedAttempts) {
        attempt += 1

        // This sleep will only affect transactions with previously unsuccessful attempts,
        // allowing other transactions to complete before trying again.
        if(attempt > 1) Thread.sleep(100)

        val withdrawalResult = from.withdraw(amount)

        withdrawalResult match {
          case Left(_) => {
            to.deposit(amount)
            status = TransactionStatus.SUCCESS
          }
          case Right(message) => {
            // Error handling here
          }
        }
      } else {
        status = TransactionStatus.FAILED
      }
    }

    doTransaction()
  }
}
