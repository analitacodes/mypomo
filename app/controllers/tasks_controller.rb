class TasksController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_task, only: %i[ show edit update destroy ]

  def index
        @tasks = Task.all # tasks are plural here bc index will show all of the tasks
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private
  def set_task
    @task = task.find(params[:id])
  end

    def task_params
      params.expect(task: [ :name ])
    end
end
