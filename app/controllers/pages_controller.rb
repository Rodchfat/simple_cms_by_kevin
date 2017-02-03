class PagesController < ApplicationController
   before_action :confirm_login
 layout 'admin'
  
  def index
    @pages = Page.all
    @count = Page.visible.size
    
    
  end

  def new
    @page = Page.new
    @page_count = Page.count + 1
    @subjects = Subject.sorted
  end
  
  def create
    @page = Page.new(pages_params)
    if @page.save
      redirect_to pages_path
    else
      @page_count = Page.count
      @subjects = Subject.sorted

      render 'new'
    end
    
  end

  def show
    @page = Page.find(params[:id])
  end
  
  def edit
    @page = Page.find(params[:id])
    @page_count = Page.count
    @subjects = Subject.sorted
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(pages_params)
      redirect_to page_path(@page)
    else
      @page_count = Page.count
      @subjects = Subject.sorted
      render 'edit'
    end
  end
  
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_path
    
  end
  
  def delete
    @page = Page.find(params[:id])
  end
  
  
  
  private 
   def pages_params
     params.require(:page).permit(:name, :position, :permalink, :visible)
   end
end
