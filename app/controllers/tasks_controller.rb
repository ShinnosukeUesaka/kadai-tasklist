class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  # why :set_task??? not set_task
  
  
  def index
    @tasks = current_user.tasks.all
  end

  def show
    
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      flash[:success] = '作成完了'
      redirect_to @task
    else
      flash.now[:danger] = '作成失敗、、'
      render :new
    end
  end

  def edit

  end

  def update
    if @task.update(task_params)
      flash[:success] = 'タスク更新'
      redirect_to @task
    else
      flash.now[:danger] = '失敗、、'
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:success] = '削除完了'
    redirect_to tasks_url
  end

  private
  
  def set_task
    #@task = current_user.tasks.find(params[:id]) //deny other user
    @task = User.tasks.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
end