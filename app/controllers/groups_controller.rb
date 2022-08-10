class GroupsController < ApplicationController
  def index
    @categories = current_user.groups
  end

  def new
  end

  def show
    id = params[:id]
    @category = Group.find(id)
    @deals = category.deals.order('deals.created_at DESC')
  end
end
