# frozen_string_literal: true

class DealsController < ApplicationController
  def new
    @deal = Deal.new
    @categories = current_user.groups.all
  end

  def create
    groups = deal_params[:groups]
    group = groups[1]
    deal = Deal.new(name: deal_params[:name], amount: deal_params[:amount], user_id: current_user.id)
    groups[1..].each do |id|
      deal.groups << Group.find(id)
    end
    redirect_to "/groups/show/#{group}" if deal.save
  end

  private

  def deal_params
    params.require(:deal).permit(:name, :amount, groups: [])
  end
end
