class AddIndexToDiplomas < ActiveRecord::Migration[5.2]
  def change
  	add_reference :diplomas, :doctors, foreign_key: true
  	add_reference :diplomas, :specialties, foreign_key: true
  end
end