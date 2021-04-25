class ProjectsController < ApplicationController

  #Returns every project
  def index
    @project = Project.all
  end
  
  #Finds a particular project (based on id)
  #so that the view can display this project
  def show
    @project = Project.find(params[:id])
  end
  
  #Creates an object but does NOT
  #store it in the database
  def new
    @project = Project.new
  end
  
  #Creates a new project and stores it in the
  #database
  def create
    @project = Project.new(project_params)
    if @project.save
      flash.alert = "Project was successfully created"
    else
      flash.alert = "Body can't be blank"
    end
    redirect_to new_project_path
  end
  
  #Returns the project that the user requested
  #so that they can consider making changes to
  #project
  def edit 
    @project = Project.find(params[:id])
  end
  
  #Changes the data in the @project variable with
  #the data the user input
  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      flash.alert = "Project was successfully updated"
    else
      flash.alert = "Body can't be blank"
    end
    redirect_to edit_project_path
  end

  #Destroys the object in the database 
  def destroy
    @project = Project.find(params[:id])
    flash.alert = "Project was successfully destroyed"
    @project.destroy
    redirect_to root_path
  end

  #Ensures that the user only provides a title and body for the project
  private
    def project_params 
      params.require(:project).permit(:title, :body)
    end
end
