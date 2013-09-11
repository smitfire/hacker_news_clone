class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :post
  belongs_to :user
  has_many :commentvotes

  def rating
    rating = 0
    self.commentvotes.each do |commentvote|
      rating += commentvote.up.to_i
      rating -= commentvote.down.to_i
    end
    rating
  end

end
