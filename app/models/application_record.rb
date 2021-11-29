class ApplicationRecord < ActiveRecord::Base
  include LegacyTimestampColumns

  self.abstract_class = true
end
