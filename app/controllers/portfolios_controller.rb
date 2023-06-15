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

    private
    def set_portfolio
      @portfolio_item = Portfolio.find(params[:id])
    end

    def portfolio_params
        params.require(:portfolio).permit(:title, :subtitle ,:body)
    end
end
