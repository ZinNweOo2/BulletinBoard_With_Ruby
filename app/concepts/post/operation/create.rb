class Post::Operation::Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Post, :new)
      step Contract::Build( constant: Post::Contract::Create )
    end
  
    step Nested( Present )
    step Contract::Validate( key: :post )
    step Contract::Persist( )
    step :notify!
  
    def notify!(options, model:, **)
      options["result.notify"] = Rails.logger.info("New blog post #{model.title}.")
    end
end