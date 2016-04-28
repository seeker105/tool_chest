class ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end

  def destroy
    tool = Tool.find( params[:id])
    tool.destroy
    redirect_to tools_path
  end

  def new
    @tool = Tool.new
    # calling Tool.new here creates a blank tool that just allows us to tell
    # the view about the attributes of a 'tool'. It doesn't add to the
    # database. It just lets us tell the view about the attributes of 'tool'
  end

  def tool_params
    params.require(:tool).permit(:name, :price, :quantity)
  end

  # def create
  #   @tool = Tool.new( tool_params )
  #   if @tool.save
  #     redirect_to tool_path(@tool.id)
  #     # rails does know to look for the 'id' field by the route def
  #     # so you can just use @tool, but it's not easy to read
  #   else
  #     render :new
  #   end
  # end

  # def show
  #   @tool = Tool.find(params[:id])
  # end
  #

  #
  # def edit
  #   @tool = Tool.find(params[:id])
  # end
  #
  # def update
  #   @tool = Tool.find( params[:id] )
  #   if @tool.update( tool_params )
  #     redirect_to tool_path( @tool.id )
  #   else
  #     render :edit
  #   end
  # end


  private
  def tool_params
    params.require(:tool).permit(:name, :price, :quantity)
  end

  #can define custom routes besides the basic CRUD
  def custom

  end

end
