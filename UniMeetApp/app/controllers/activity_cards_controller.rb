class ActivityCardsController < ApplicationController
  before_action :set_activity_card, only: [:show, :edit, :update, :destroy]

  # GET /activity_cards
  # GET /activity_cards.json
  def index
    @activity_cards = ActivityCard.all
  end

  # GET /activity_cards/1
  # GET /activity_cards/1.json
  def show
  end

  # GET /activity_cards/new
  def new
    @activity_card = ActivityCard.new
  end

  # GET /activity_cards/1/edit
  def edit
  end

  # POST /activity_cards
  # POST /activity_cards.json
  def create
    @activity_card = ActivityCard.new(activity_card_params)

    respond_to do |format|
      if @activity_card.save
        format.html { redirect_to @activity_card, notice: 'Activity card was successfully created.' }
        format.json { render :show, status: :created, location: @activity_card }
      else
        format.html { render :new }
        format.json { render json: @activity_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_cards/1
  # PATCH/PUT /activity_cards/1.json
  def update
    respond_to do |format|
      if @activity_card.update(activity_card_params)
        format.html { redirect_to @activity_card, notice: 'Activity card was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_card }
      else
        format.html { render :edit }
        format.json { render json: @activity_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_cards/1
  # DELETE /activity_cards/1.json
  def destroy
    @activity_card.destroy
    respond_to do |format|
      format.html { redirect_to activity_cards_url, notice: 'Activity card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_card
      @activity_card = ActivityCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_card_params
      params.require(:activity_card).permit(:activity_id)
    end
end
