class Task < ActiveRecord::Base

  STATUSES = %w(pending completed)

  validates :status,      presence: true, inclusion: { in: STATUSES }
  validates :description, presence: true
  validates :user_id,     presence: true

  state_machine :status, initial: :pending do
    event :complete do
      transition :pending => :completed
    end

    event :reset do
      transition :completed => :pending
    end
  end

end
