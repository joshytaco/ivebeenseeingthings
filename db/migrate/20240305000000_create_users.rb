class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :encrypted_aws_access_key_id
      t.string :encrypted_aws_access_key_id_iv
      t.string :encrypted_aws_secret_access_key
      t.string :encrypted_aws_secret_access_key_iv
      t.string :provider
      t.string :uid
      t.string :name
      t.string :avatar_url

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, [ :provider, :uid ], unique: true
  end
end
