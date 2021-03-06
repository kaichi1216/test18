class TasksController < ApplicationController
  before_action :find_task, :only => [:show, :edit, :update, :destroy, :start, :done]
  before_action :search_params, :only => [:index, :search]
  before_action :authenticate_user

  def index
  end

  def search
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save 
      redirect_to tasks_path, notice: t('.notice')
    else  
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: t('.notice')
    else  
      render :edit
    end
  end

  def destroy
    if @task.destroy
      notice = t('.notice')
    else 
      notice = t('.not_success')
    end
      redirect_to tasks_path, notice: notice
  end

  def start
    @task.start! if @task.pending?
    redirect_back(fallback_location: :root_path)
  end

  def done
    @task.done! if @task.completed?
    redirect_back(fallback_location: :root_path)
  end

    
  private
    
  def task_params
    params.require(:task).permit(:task, :content, :deadline, :state, :priority, {tag_items:[]})
  end

  def find_task
    @task = Task.find_by(id: params[:id])
  end

  def search_params
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true).includes(:tags, :user).where(user: current_user).page(params[:page]).per(10).ordered(sort_params)
  end
  #要宣告一個擁有多字串的 Array 陣列時，使用 %w
  def sort_params
    field, order = params[:sort].to_s.split('_')
    return unless field.in?(%w[state deadline priority])
    return unless order.in?(%w[asc desc])
  
    "#{field} #{order.upcase}"
  end
end
