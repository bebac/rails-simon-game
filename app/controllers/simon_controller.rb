class SimonController < ApplicationController

  COLORS = { 0 => "green", 1 => "red", 2 => "yellow", 3 => "blue" } 

  def index
  end

  def start
    @sequence = session[:sequence] = [ COLORS[rand(4)] ]

    respond_to do |format|
      format.js
    end
  end

  def replay
    @index = params[:index].to_i
    @color = params[:color]
    @sequence = session[:sequence]

    expected = @sequence[@index]

    #logger.info("sequence: #{@sequence.inspect}, expected color: #{expected}")

    @index += 1

    respond_to do |format|
      format.js do
        if @color == expected
          render :replay_correct
        else
          render :replay_wrong
        end
      end
    end
  end

  def continue
    @sequence = session[:sequence]
    @sequence << COLORS[rand(4)]

    #logger.info("sequence: #{@sequence.inspect}")

    respond_to do |format|
      format.js { render :start }
    end
  end

end
