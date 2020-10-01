class AddStudentRefToMessage < ActiveRecord::Migration
  def change
    add_reference :messages, :student,  foreign_key: true
  end
end
