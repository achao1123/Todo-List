class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.xml
	
	before_filter :authenticate_user!
	
  def index
    @tasks = current_user.tasks

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.xml
  def create
    @task = Task.new(params[:task].merge(:user_id => current_user.id))
		
    respond_to do |format|
      if @task.save
        format.html{ redirect_to(@task, :notice => 'Task was successfully created.') }
        format.xml { render :xml => @task, :status => :created, :location => @task }
				format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
				format.js
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to(@task, :notice => 'Task was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { head :ok }
			format.js
    end
  end
	
	def sort_tasks
		order = session[:order] || 'desc'
		session[:order] = session[:order] == 'desc' ? 'asc' : 'desc'
		sort_by = params[:sort_by] || 'title'
		@tasks = Task.find_all_by_user_id(current_user.id, :order => "#{sort_by} #{order}")
		
		respond_to do |format|
			format.html { redirect_to(tasks_url) }
			format.js
		end
	end
end
