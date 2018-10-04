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
    @task = Task.new(action: params[:task][:action], description: params[:task][:description], completion_date: params[:task][:completion_date], is_complete: "no")


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

    if @task.update(action: params[:task][:action], description: params[:task][:description], completion_date: params[:task][:completion_date], is_complete: params[:task][:is_complete])

        redirect_to task_path
    else
      render :edit
    end
  end


  def mark_complete
    @task = Task.find(params[:id])

    # @task.update(is_complete: 1)
    @task.update(completion_date: Date.today)
    # @task.update_attribute(:is_complete, 1)
    # @task.update_attribute(:completion_date, Date.today)

    redirect_to tasks_path
  end


  def unmark_complete
    @task = Task.find(params[:id])

    @task.update(completion_date: nil)

    redirect_to tasks_path
  end



  def destroy
    task = Task.find(params[:id])

    task.destroy
    redirect_to tasks_path
  end

  # private
  #
  # def task_params
  #   return params.require(:task).permit(
  #     :action,
  #     :description,
  #     :completion_date,
  #     :is_complete
  #     )
  # end
end
