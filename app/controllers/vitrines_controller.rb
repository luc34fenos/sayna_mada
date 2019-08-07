class VitrinesController < ApplicationController

  def index
    @activer = "index"
  end

  def equipe
    @activer = "equipe"
  end

  def simplon
    @activer = "simplon"
  end

  def thp
    @activer = "thp"
  end

end
