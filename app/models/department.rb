class Department < ActiveRecord::Base
  acts_as_paranoid

  validates :name, presence: true

  has_many :departments_users
  has_many :users, through: :departments_users

  has_many :departments_tags
  has_many :categories, through: :departments_tags

  belongs_to :property

  default_scope { where(property_id: Property.current_id) }
end