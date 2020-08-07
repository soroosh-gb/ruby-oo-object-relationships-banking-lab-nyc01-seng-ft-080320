class Transfer

  attr_accessor :sender, :receiver, :status, :amount;

  def initialize(sender, receiver, amount)
    @sender = sender;
    @receiver = receiver;
    @amount = amount;
    @status = 'pending';
  end

  def valid?
     self.sender.valid? and self.receiver.valid?
  end

  def execute_transaction
    if self.valid? and self.sender.balance >= self.amount and self.status == 'pending'
      self.receiver.balance += self.amount;
      self.sender.balance -= self.amount;
      self.status = 'complete';
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

    def reverse_transfer
      if self.status == 'complete' and self.valid?
        self.receiver.balance -= self.amount;
        self.sender.balance += self.amount;
        self.status = 'reversed';
      end
    end
end
