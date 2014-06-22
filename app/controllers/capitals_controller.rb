class CapitalsController < ApplicationController
  before_action :set_menu
  before_action :set_capital, only: [:show, :edit, :update, :destroy]

  def index
    @capitals = Capital.all
  end

  def show
  end

  def new
    @capital = Capital.new
  end

  def edit
  end

  def create
    @capital = Capital.new(capital_params)

    respond_to do |format|
      if @capital.save
        format.html { redirect_to @capital, notice: 'Capital was successfully created.' }
        format.json { render :show, status: :created, location: @capital }
      else
        format.html { render :new }
        format.json { render json: @capital.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @capital.update(capital_params)
        format.html { redirect_to @capital, notice: 'Capital was successfully updated.' }
        format.json { render :show, status: :ok, location: @capital }
      else
        format.html { render :edit }
        format.json { render json: @capital.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @capital.destroy
    respond_to do |format|
      format.html { redirect_to capitals_url, notice: 'Capital was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_capital
      @capital = Capital.find(params[:id])
    end

    def capital_params
      params.require(:capital).permit(:name)
    end

  def set_menu
    @menu_active = :capital
  end

end
