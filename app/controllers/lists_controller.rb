class ListsController < ApplicationController
  respond_to :json, :html
  # GET /lists
  def index
    @lists = List.all
    respond_with(@lists)
  end

  # GET /lists/1
  def show
    @list = List.find(params[:id])
    respond_with(@list)
  end

  # GET /lists/new
  def new
    @list = List.new
    respond_with(@list)
  end

  # GET /lists/1/edit
  def edit
    @list = List.find(params[:id])
    respond_with(@list)
  end

  # POST /lists
  def create
    @list = List.new(params[:list])
    flash[:notice] = 'List was successfully created.' if @list.save
    respond_with(@list)

    # if @list.save
    #   redirect_to @list, notice: 'List was successfully created.'
    # else
    #   render action: "new"
    # end
  end

  # PUT /lists/1
  def update
    @list = List.find(params[:id])

    flash[:notice] = 'List was successfully updated.' if @list.update_attributes(params[:list])
    respond_with(@list)

    # if @list.update_attributes(params[:list])
    #   redirect_to @list, notice: 'List was successfully updated.'
    # else
    #   render action: "edit"
    # end
  end

  # DELETE /lists/1
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    
    
    respond_to do |format|
      format.html { redirect_to lists_url }
      format.json { render json: @list}
    end

  end
end
