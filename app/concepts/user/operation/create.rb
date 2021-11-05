class User::Operation::Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(User, :new)
      step Contract::Build( constant: User::Contract::Create )
    end
  
    step Nested( Present )
    step Contract::Validate( key: :uer )
    step Contract::Persist( )
    step :notify!
  
    def notify!(options, model:, **)
      options["result.notify"] = Rails.logger.info("New user #{model.title}.")
    end
end