class TasksController < ApplicationController
  def index
    return @tasks = Task.all
  end


  def show
    task_id = params[:id]
    @task = Task.find(task_id)
  end


  def new
    @task = Task.new
  end


  def create
    @task = Task.new(action: params[:task][:action], description: params[:task][:description], completion_date: params[:task][:completion_date])

    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end


  def edit
    @task = Task.find(params[:id])
  end


  def update
    @task = Task.find(params[:id])

    if @task.update(action: params[:task][:action], description: params[:task][:description], completion_date: params[:task][:completion_date])

        redirect_to task_path
    else
      render :edit
    end
  end

  def destroy
    task = Task.find(params[:id])

    task.destroy
    redirect_to tasks_path
  end

end
