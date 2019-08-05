class CreateJoinTableCitiesCompanies < ActiveRecord::Migration[5.2]
  def change
    create_join_table :cities, :companies do |t|
      t.belongs_to :city, 	 index: true
      t.belongs_to :company, index: true
    end
  end
end
