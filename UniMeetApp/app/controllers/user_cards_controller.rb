class UserCardsController < ApplicationController
  before_action :set_user_card, only: [:show, :edit, :update, :destroy]

  # GET /user_cards
  # GET /user_cards.json
  def index
    @user_cards = UserCard.all
  end

  # GET /user_cards/1
  # GET /user_cards/1.json
  def show
  end

  # GET /user_cards/new
  def new
    @user_card = UserCard.new
  end

  # GET /user_cards/1/edit
  def edit
  end

  # POST /user_cards
  # POST /user_cards.json
  def create
    @user_card = UserCard.new(user_card_params)

    respond_to do |format|
      if @user_card.save
        format.html { redirect_to @user_card, notice: 'User card was successfully created.' }
        format.json { render :show, status: :created, location: @user_card }
      else
        format.html { render :new }
        format.json { render json: @user_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_cards/1
  # PATCH/PUT /user_cards/1.json
  def update
    respond_to do |format|
      if @user_card.update(user_card_params)
        format.html { redirect_to @user_card, notice: 'User card was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_card }
      else
        format.html { render :edit }
        format.json { render json: @user_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_cards/1
  # DELETE /user_cards/1.json
  def destroy
    @user_card.destroy
    respond_to do |format|
      format.html { redirect_to user_cards_url, notice: 'User card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_card
      @user_card = UserCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_card_params
      params.require(:user_card).permit(:user_id)
    end
end
