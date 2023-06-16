class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[ show edit update destroy ]
    def index
        @portfolio_items = Portfolio.all
    end

    def new
        @portfolio_item = Portfolio.new
    end

    def create
        @portfolio = Portfolio.new(portfolio_params)
    
        respond_to do |format|
          if @portfolio.save
            format.html { redirect_to portfolios_path, notice: "Portfolio was successfully created." }
            format.json { render :show, status: :created, location: @portfolio }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @portfolio.errors, status: :unprocessable_entity }
          end
        end
    end

    def edit
    end

    def update
      respond_to do |format|
        if @portfolio_item.update(portfolio_params)
          format.html { redirect_to portfolios_path, notice: "Portfolio was successfully updated." }
          format.json { render :show, status: :ok, location: @portfolio_item }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
        end
      end
    end

    def show      
    end

    def destroy 
      # Destroy/delete the record 
      @portfolio_item.destroy

      # Redirect
      respond_to do |format|
        format.html { redirect_to portfolios_url, notice: "Portfolio item was successfully destroyed." }
        format.json { head :no_content }
      end    
    end

    private
    def set_portfolio
      # perform the lookup
      @portfolio_item = Portfolio.find(params[:id])
    end 

    def portfolio_params
        params.require(:portfolio).permit(:title, :subtitle ,:body)
    end
end
