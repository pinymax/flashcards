class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(cards_params)
    @card.review_date = Time.now+3.days
    @card.save
    redirect_to @card
  end

  def show
    @card = Card.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def cards_params
    params.require(:card).permit(:original_text, :translated_text)
  end
end
