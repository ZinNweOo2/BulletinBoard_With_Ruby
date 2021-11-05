module User::Contract
    class Create < Reform::Form

      property :name
      property :email
      property :password
      property :profile
      property :type
      property :phone
      property :address
      property :dob
      property :create_user_id
      property :updated_user_id

      validates :name,
                :email,
                :password,
                :profile,
                :type,
                :phone,
                :address,
                :dob,presence: true

    end
end