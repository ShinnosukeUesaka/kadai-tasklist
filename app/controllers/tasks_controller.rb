class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end

  def show

  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(message_params)

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
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content)
  end
end