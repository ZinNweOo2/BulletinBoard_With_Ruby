module Post::Operation
    class Update < Trailblazer::Operation
      class Present < Trailblazer::Operation
        step :model!
        step self::Contract::Build(constant: Post::Contract::Create)
        def model!(options, params:, **)
          options["model"] = PostService.getPostById(params[:id])
        end
      end
      class Delete < Trailblazer::Operation
        step :delete!
        def delete!(options, params:, **)
          options["model"] = Post.destroy(params[:id])
        end
      end
      step Nested(Present)
      step self::Contract::Validate(key: :post)
      step self::Contract::Persist()
      step :notify!
    
      def notify!(options, model:, **)
        options["result.notify"] = Rails.logger.info("Update blog post #{model.title}.")
      end
    end
  end