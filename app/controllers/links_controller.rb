class LinksController < ApplicationController
  before_action :not_signed_in?

  def index
    if params[:tag]
      @links = current_user.links.tagged_with(params[:tag])
    else
      @links = current_user.links
    end
  end

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.build(link_params)
    @link.title, @link.url = get_title_and_url(@link.url) if @link.valid?
    if @link.save
      flash[:success] = "New link successfully added"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @link = Link.find_by(id: params[:id])
  end

  def update
    @link = Link.find_by(id: params[:id])
    if @link.update_attributes(link_params)
      flash[:success] = "Link successfully updated"
      redirect_to root_path
    else
      flash.now[:error] = "Form contains some errors"
      render 'update'
    end
  end

  def destroy
    Link.destroy(params[:id])
    redirect_to current_user
  end

  private

  def link_params
    params.require(:link).permit(:url, :title, :about, :tag_list)
  end
end