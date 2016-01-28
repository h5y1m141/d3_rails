class TechnicalWordsController < ApplicationController
  before_action :set_technical_word, only: [:show, :edit, :update, :destroy]

  # GET /technical_words
  # GET /technical_words.json
  def index
    @technical_words = TechnicalWord.all
  end

  # GET /technical_words/1
  # GET /technical_words/1.json
  def show
  end

  # GET /technical_words/new
  def new
    @technical_word = TechnicalWord.new
  end

  # GET /technical_words/1/edit
  def edit
  end

  # POST /technical_words
  # POST /technical_words.json
  def create
    @technical_word = TechnicalWord.new(technical_word_params)

    respond_to do |format|
      if @technical_word.save
        format.html { redirect_to @technical_word, notice: 'Technical word was successfully created.' }
        format.json { render :show, status: :created, location: @technical_word }
      else
        format.html { render :new }
        format.json { render json: @technical_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /technical_words/1
  # PATCH/PUT /technical_words/1.json
  def update
    respond_to do |format|
      if @technical_word.update(technical_word_params)
        format.html { redirect_to @technical_word, notice: 'Technical word was successfully updated.' }
        format.json { render :show, status: :ok, location: @technical_word }
      else
        format.html { render :edit }
        format.json { render json: @technical_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /technical_words/1
  # DELETE /technical_words/1.json
  def destroy
    @technical_word.destroy
    respond_to do |format|
      format.html { redirect_to technical_words_url, notice: 'Technical word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def relation_words
    technical_word_name = TechnicalWord.where(name: params[:technical_word_name]).first
    if technical_word_name
      render json: { relation_words: TechnicalWordRelation.relation_words(technical_word_name) }
    else
      render json: { relation_words: '' }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technical_word
      @technical_word = TechnicalWord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def technical_word_params
      params.require(:technical_word).permit(:name, :description)
    end
end
