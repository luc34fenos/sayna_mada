class VitrinesController < ApplicationController

  def index
    @activer = "index"
  end

  def team
    @activer = "team"
  end

  def simplon
    @activer = "simplon"
  end

  def thp
    @activer = "thp"
  end

end
