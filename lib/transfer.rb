require 'pry'
class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    # return from method if it has already been called. is there a better way?
    return if self.status == "complete"

    sender.balance -= amount
    receiver.balance += amount
    self.status = "complete"

    #calls helper method with rejected message if valid? method evaluates to false
    rejected if !valid?
  end

  def rejected
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end
end
