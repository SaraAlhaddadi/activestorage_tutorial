class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # to set the role for switch the database.
  connects_to database: {
    writing: :primary,
    reading: :primary_replica
  }
end
