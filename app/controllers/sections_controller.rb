class SectionsController < ApplicationController
   before_action :confirm_login
  layout 'admin'
  
  def index
    @sections = Section.sorted
    
  end

  def new
    @section = Section.new 
    @section_count = Section.count + 1
    @pages = Page.sorted
  end
  
  def create
    @section = Section.new(sections_params)
    if @section.save
      redirect_to sections_path
    else
      @section_count = Section.count + 1
      @pages = Page.sorted
      render 'new'
    end
    
  end

  def show
    @section = Section.find(params[:id])
  end
  
  def edit
    @section = Section.find(params[:id])
    @section_count = Section.count
    @pages = Page.sorted
  end
  
  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(sections_params)
      redirect_to section_path(@section)
    else
    @section_count = Section.count
    @pages = Page.sorted
      render 'edit'
    end
  end
  
  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    redirect_to sections_path
    
  end
  
  def delete
    @section = Section.find(params[:id])
  end
  
  
  
  private 
   def sections_params
     params.require(:section).permit(:name, :position, :content_type, :content, :visible)
   end
end
