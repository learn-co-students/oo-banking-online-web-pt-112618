require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status
#sender and receiver are an instance of Bank acount
  def initialize(sender, receiver, amount)
    #binding.pry
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
#binding.pry
#calling on a instance of BankAccount.valid?
    sender.valid?
    receiver.valid?
  end

  def execute_transaction
    if sender.valid? && sender.balance > amount && @status == "pending"
      sender.balance -= amount  #sender balance should be deducted
      receiver.balance += amount
      @status = "complete"
  #transfer can only happen once
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
    end
    @status = "reversed"
  end

end
