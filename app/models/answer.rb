class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :answer, :presence => true

  def best
    self.update(:best => true)
  end
end
