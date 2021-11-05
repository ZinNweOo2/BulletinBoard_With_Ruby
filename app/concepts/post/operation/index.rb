module Post::Operation
    class Index < Trailblazer::Operation
      step :get_post_list
    
      def get_post_list(options, params:, **)
        options["model"] = Post.all
      end
    end
end