class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
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
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(message_params)
      flash[:success] = 'タスク更新'
      redirect_to @task
    else
      flash.now[:danger] = '失敗、、'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    
    @task.destroy
    flash[:success] = '削除完了'
    redirect_to tasks_url
  end
end

 def message_params
    params.require(:task).permit(:content)
  end