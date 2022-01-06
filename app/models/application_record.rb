class ApplicationRecord < ActiveRecord::Base
  include LegacyTimestampColumns

  self.abstract_class = true

  log_changes

  # implement to support an effective_resource no-op cancel operation
  def cancel! ; true; end

end
