class Post < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :comments
  has_many :postvotes

  def rating
    rating = 0
    self.postvotes.each do |postvote|
      rating += postvote.up.to_i
      rating -= postvote.down.to_i
    end
    rating
  end

end
