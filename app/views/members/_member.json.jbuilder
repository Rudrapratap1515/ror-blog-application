json.extract! member, :id, :name, :password, :email, :age, :role_id, :address, :contact, :created_at, :updated_at
json.url member_url(member, format: :json)
