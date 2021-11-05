class PostsController < ApplicationController
    before_action :authorized, except:[:index,:create, :validate, :destroy]

   def index   
    ctx = Post::Operation::Index.(params: params)
    @post = ctx[:options]
    render @post
   end

    def create
      ctx = Post::Operation::Create.(params: params)  
      @post = ctx[:contract]
      render :new
    end

    def validate
      
    end

    def destroy
      ctx = Post::Operation::Update::Delete.(params: params)
      @post =ctx[:contract]
    #  result = Reset::Operation::Create::Update.(params: params)
    end
    
end
