class ConversionController < ApplicationController
  def create
    @new_records = ConvertOutsideInfo.new

  end
end
