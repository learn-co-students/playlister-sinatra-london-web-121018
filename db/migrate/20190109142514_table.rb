class Table < ActiveRecord::Migration

  def change

    create_table :artist do |t|
      t.string :name
    end


    create_table :genre do |t|
      t.string :name
    end


    create_table :song do |t|
      t.string :name
    end

  end

end
