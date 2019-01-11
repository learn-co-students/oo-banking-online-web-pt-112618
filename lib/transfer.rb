class Transfer
  
  attr_reader :receiver, :sender, :amount
  attr_accessor :status
 
 def initialize(sender, receiver, amount)
   @sender = sender
   @receiver = receiver
   @amount = amount
   @status = "pending"
 end
 
 def valid?
   sender.valid? && receiver.valid?
 end
 
 def execute_transaction
   if self.valid? && sender.balance > amount && self.status == "pending"
     receiver.balance += amount
     sender.balance -= amount
     self.status = "complete"
   else
     self.status = "rejected"
     "Transaction rejected. Please check your account balance."
   end
 end
 
 def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      self.status = "rejected"
      "Transaction rejected.  Please check your account balance."
    end
 end
 
end
