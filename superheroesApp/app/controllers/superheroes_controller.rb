class SuperheroesController < ApplicationController
	 before_filter :confirm_logged_in, only: [:new, :show, :edit, :destroy]
  def index
  end

  def edit
  end

  def new
  end

  def show
  end
end
