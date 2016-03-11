class AddPasswordtoUsers < ActiveRecord::Migration

  def change

    #To add a column in the database, we went in the bash and typed 'rails generate migration AddPasswordtoUsers password:string:column' then it creates this file, then we added more columns and then db:rake migrate in bash.
      #How to migrate columns:  http://guides.rubyonrails.org/active_record_migrations.html

      add_column :users, :password, :string
      add_column :users, :full_name, :string
      add_column :users, :address, :string
      add_column :users, :city, :string
      add_column :users, :postal, :string
      add_column :users, :country, :string
      add_column :users, :email, :string

  end
end
