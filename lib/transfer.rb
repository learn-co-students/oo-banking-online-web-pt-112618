class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, status="pending", amount)
    @sender = sender 
    @receiver = receiver 
    @status = status 
    @amount = amount
  end 
  
  def valid? 
    self.sender.valid? 
    self.receiver.valid?
  end 
  
  def execute_transaction 
    if self.valid? == false || self.amount > self.sender.balance
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif 
      self.status == "pending" && self.valid? && self.amount < self.sender.balance
      self.sender.balance -= self.amount 
      self.receiver.balance += self.amount
      self.status = "complete"
    end
  end 
  
  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount 
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end  
  end 
end
