class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.groups.includes(:deals, icon_attachment: :blob)
  end

  def show
    id = params[:id]
    @category = Group.find(id)
    @deals = @category.deals.order('deals.created_at DESC')
    @total = 0.0
    @deals.each do |deal|
      @total += deal.amount
    end
  end

  def new
    @group = Group.new
  end

  def create
    redirect_to groups_index_path if Group.create(**group_params, user_id: current_user.id)
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
