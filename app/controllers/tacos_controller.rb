RANDOM_TACO_URL='http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=taco'

class TacosController < ApplicationController
  before_action :set_taco, only: [:show, :edit, :update, :destroy]

  # GET /tacos
  # GET /tacos.json
  def index
    @tacos = Taco.all
  end

  # GET /tacos/1
  # GET /tacos/1.json
  def show
  end

  # GET /tacos/new
  def new
    @taco = Taco.new
  end

  # GET /tacos/1/edit
  def edit
  end

  # POST /tacos
  # POST /tacos.json
  def create
    response = RestClient.get RANDOM_TACO_URL
    random_taco = JSON.parse(response)['data']

    @taco = Taco.new(title: random_taco['caption'], url: random_taco['image_url'])
    @taco.save
    redirect_to action: 'index'

  end

  # PATCH/PUT /tacos/1
  # PATCH/PUT /tacos/1.json
  def update
    respond_to do |format|
      if @taco.update(taco_params)
        format.html { redirect_to @taco, notice: 'Taco was successfully updated.' }
        format.json { render :show, status: :ok, location: @taco }
      else
        format.html { render :edit }
        format.json { render json: @taco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tacos/1
  # DELETE /tacos/1.json
  def destroy
    @taco.destroy
    respond_to do |format|
      format.html { redirect_to tacos_url, notice: 'Taco was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taco
      @taco = Taco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def taco_params
      params.require(:taco).permit(:title, :url)
    end
end
