class RemoveColumnIdFromReplies < ActiveRecord::Migration[6.1]
  def change
    remove_column :replies, :column_id, :integer
  end
end
