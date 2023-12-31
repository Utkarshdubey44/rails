class FriendsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_detail, only: %i[ show edit update destroy ]


  def index
    @personal_details = current_user.friends.all
  end

  
  def show
  end


  def new
    @personal_detail = current_user.friends.new
  end


  def edit
  end

  def create
    @personal_detail = current_user.friends.new(personal_detail_params)

    respond_to do |format|
      if @personal_detail.save
        format.html { redirect_to friend_url(@personal_detail), notice: "Personal detail was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @personal_detail.update(personal_detail_params)
        format.html { redirect_to friend_url(@personal_detail), notice: "Personal detail was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @personal_detail.destroy

    respond_to do |format|
      format.html { redirect_to friends_path, notice: "Personal detail was successfully deleted." }
    end
  end

  private

    def set_detail
      begin
        @personal_detail = current_user.friends.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        render :index, alert: 'Personal detail not found.' # Redirect to an appropriate page or handle the situation differently.
      end
    end

    def personal_detail_params
      params.require(:friend).permit(:name, :gender, :phone, :description)
    end
  end
