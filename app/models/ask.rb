class Ask < ApplicationRecord
  validates :title,    presence: true
  validates :text,    presence: true
  belongs_to :user
  has_many :comments,dependent: :destroy
  validates :title,
    length: { minimum: 1, maximum: 30 }
    
    # def self.search(search)
    #   if search != ""
    #     Ask.where('text LIKE(?)', "%#{search}%")
    #   else
    #     Ask.all
    #   end
    # end

    def self.search(search)
      search ? where(['text LIKE(?) OR title LIKE(?)',"%#{search}%","%#{search}%"])  : all
    end
end
