class DemoController < ApplicationController
  layout false 
    def index
      render ('demo/index')
    end
    
    def hello
      render ('demo/hello')
      @id = params[:id]
      @page = params[:page]
   
    end
    
    # def another_hello
    #   render 'demo/hello'
    # end
end
