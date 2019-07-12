class CreateJoinTableCitiesCompanies < ActiveRecord::Migration[5.2]
  def change
    create_join_table :cities, :companies do |t|
      t.bigint :city_id, index: true
      t.bigint :company_id, index: true
    end
  end
end
