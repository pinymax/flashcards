class CardsController < ApplicationController

  before_action :find_card, only: [:show, :edit, :update, :destroy]
  def train
    @training_card = Card.random_card.first
  end

  def check_card
    @card = Card.find(params[:id])
    translate = params[:translate]
    Card.checker(@card, translate)
    if @card.review_date == Date.today + 3.days
      flash[:success] = "В точку!"
    else
      flash[:error] = "Неверный перевод"
    end
      redirect_to root_url
  end

  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.create(cards_params)
    @card.save
    if @card.errors.empty?
      redirect_to @card
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    @card.update_attributes(cards_params)
    if @card.errors.empty?
      redirect_to @card
    else
      render "new"
    end
  end

  def destroy
    @card.destroy
    redirect_to action: "index"
  end

  private

  def cards_params
    params.require(:card).permit(:original_text, :translated_text)
  end

  def find_card
    @card = Card.find(params[:id])
  end
end
