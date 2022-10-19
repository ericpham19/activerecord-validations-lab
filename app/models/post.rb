class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :validate_clickbait?

    CLICKBAIT= [ /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i]

    def validate_clickbait?
        if CLICKBAIT.none? {|patterns| patterns.match title}
            errors.add(:title, "must be clickbait")
        end
    end
end
