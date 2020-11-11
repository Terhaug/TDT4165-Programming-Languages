
class Account(val bank: Bank, initialBalance: Double) {

  class Balance(var amount: Double) {}

  val balance = new Balance(initialBalance)

  def withdraw(amount: Double): Either[Unit, String] = balance.synchronized {
    if (amount >= 0 && amount <= getBalanceAmount) {
      balance.amount -= amount
      Left()
    } else {
      Right("Illegal amount; negative balance or amount must be greater than zero")
    }
  }

  def deposit(amount: Double): Either[Unit, String] = balance.synchronized {
    if (amount >= 0) {
      balance.amount += amount
      Left()
    } else {
      Right("Illegal amount; cannot deposit zero or negative numbers")
    }
  }

  def getBalanceAmount: Double = balance.amount

  def transferTo(account: Account, amount: Double): Unit = {
    bank addTransactionToQueue(this, account, amount)
  }
}
