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
    self.sender.balance -= self.amount 
    self.receiver.balance += self.amount
  end 
end
