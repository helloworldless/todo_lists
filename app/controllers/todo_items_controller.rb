class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, only: [:show, :edit, :update, :destroy]
  
  # GET /todo_items
  # GET /todo_items.json
  # def index
  #   @todo_items = TodoItem.all
  # end

  # GET /todo_items/1
  # GET /todo_items/1.json
  def show
  end

  # GET /todo_items/new
  # def new
  #   @todo_item = TodoItem.new
  # end

  def new
    @todo_item = @todo_list.todo_items.new#.create(params[:due_date, :title, :description, :compelted])
  end

  # GET /todo_items/1/edit
  def edit
  end

  def create
    @todo_item = @todo_list.todo_items.new(todo_item_params)
    if @todo_item.save
      redirect_to [@todo_list, @todo_item], notice: "Todo item was successfully created."
    else
      redirect_to @todo_list, notice: "Unable to create Todo Item"
    end
  end

  # POST /todo_items
  # POST /todo_items.json
  # def create
  #   @todo_item = TodoItem.new(todo_item_params)

  #   respond_to do |format|
  #     if @todo_item.save
  #       format.html { redirect_to @todo_item, notice: 'Todo item was successfully created.' }
  #       format.json { render :show, status: :created, location: @todo_item }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @todo_item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def update
    # needed? not mentioned in instructions originally but then says create redirect_to for todo_item#update    
  # end

  # PATCH/PUT /todo_items/1
  # PATCH/PUT /todo_items/1.json
  # def update
  #   respond_to do |format|
  #     if @todo_item.update(todo_item_params)
  #       format.html { redirect_to @todo_item, notice: 'Todo item was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @todo_item }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @todo_item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /todo_items/1
  # PATCH/PUT /todo_items/1.json
  def update
    respond_to do |format|
      if @todo_item.update(todo_item_params)
        format.html { redirect_to @todo_list, notice: 'Todo item was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_list }
      else
        format.html { render :edit }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_items/1
  # PATCH/PUT /todo_items/1.json
  # def update
  #   respond_to do |format|
  #     if @todo_item.update(todo_item_params)
  #       format.html { redirect_to @todo_item, notice: 'Todo item was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @todo_item }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @todo_item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
    # needed? not mentioned in instructions originally but then says create redirect_to for todo_item#destroy    
  # end

  # DELETE /todo_items/1
  # DELETE /todo_items/1.json
  # def destroy
  #   @todo_item.destroy
  #   respond_to do |format|
  #     format.html { redirect_to todo_items_url, notice: 'Todo item was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  def destroy
    @todo_item = @todo_list.todo_items.find(params[:id])
    @todo_item.destroy
    redirect_to @todo_list, notice: "Todo List deleted!"
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
    # def set_todo_item
    #   @todo_item = TodoItem.find(params[:id])
    # end

  private

    def set_todo_list
      @todo_list = TodoList.find(params[:todo_list_id])
    end

    def set_todo_item
      @todo_item = @todo_list.todo_items.find(params[:id])
    end

    def todo_item_params
      params.require(:todo_item).permit(:title, :due_date, :description, :completed)
    end

  #   # Never trust parameters from the scary internet, only allow the white list through.
    # def todo_item_params
    #   params.require(:todo_item).permit(:title, :due_date, :description, :completed)
    # end
end
