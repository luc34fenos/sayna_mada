class HomeController < ApplicationController
  def index
    formulaire
  end

  def acce
    @entreprise = Entreprise.all
  end

end
