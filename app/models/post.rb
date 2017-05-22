class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait


  def clickbait
    clickbait_keys = ["Won't", "Believe", "Secret", "Top", "Guess"]
    if self.title
      if !self.title.split(" ").any? { |w| clickbait_keys.include?(w) }
        errors.add(:clickbait, "This is not clickbait")
      end
    end
  end

end
