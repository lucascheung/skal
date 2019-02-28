class BarsController < ApplicationController
  def show
    @bar = Bar.all.sample
  end
end
