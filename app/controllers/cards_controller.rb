class CardsController < ApplicationController

  before_action :find_card, only: [:show, :edit, :update, :destroy]

  def random_card
    offset = rand(Card.checktime.count)
    @train = Card.checktime.offset(offset).first
    return @train
  end

  def index_train
    random_card()
    unless @train.nil?
     long_transl = @train.translated_text.split(" ")
     if params[:transl] == long_transl[0]
       flash[:notice] = "Good"
       @train.review_date = Time.now + 3.days
       @train.save
       redirect_to root_url
     end
    end
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
