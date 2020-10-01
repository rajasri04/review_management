class AddFinalApprovalToAbstract < ActiveRecord::Migration
  def change
    add_column :abstracts, :final_approval, :boolean
  end
end
