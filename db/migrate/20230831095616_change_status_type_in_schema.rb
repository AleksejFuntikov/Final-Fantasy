class ChangeStatusTypeInSchema < ActiveRecord::Migration[7.0]
  def change
    def change
      change_column :comments, :status, 'integer USING CAST(status AS integer)'
    end    
  end
end
