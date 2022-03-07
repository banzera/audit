class AddHasIssueToSkus < ActiveRecord::Migration[6.1]

  def change
    add_column :tblsku, :has_issue, :boolean, default: false
  end

end
