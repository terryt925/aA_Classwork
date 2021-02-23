class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.string :username, unique:true

      t.timestamps
    end
  end

  def change
    create_table :polls do |t|
      t.string :author_id
      t.string :title

      t.timestamps
    end
  end

  def change
    create_table :questions do |t|
      t.string :poll_id
      t.text :text

      t.timestamps
    end
  end

   def change
    create_table :answerchoices do |t|
      t.string :question_id
      t.string :user_id
      t.text :text

      t.timestamps
    end
  end
  
   def change
    create_table :responses do |t|
      t.string :user_id
      t.string :question_id
      t.string :answerchoice_id

      t.timestamps
    end
  end 

end
