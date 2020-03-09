require 'pry'
require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get "/reversename/:name" do
    @reversed = []
    # binding.pry
    for i in params[:name].split("")
      @reversed.unshift(i)
    end
    @reversed = @reversed.join("")
    "#{@reversed}"
  end

  get "/square/:number" do
    @square = params[:number].to_i**2 
    "#{@square}"
  end

  get "/say/:number/:phrase" do 
    answer_array = []
    array = params.values
    array[0].to_i.times do
      answer_array.push array[1]
    end
    answer_array.join(" ")
    "#{answer_array}"
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do 
    @words = params.values.join(" ") +"."
    "#{@words}"
  end

  get '/:operation/:number1/:number2' do 
    array = params.values 
    if array[0] == "add"
      @answer = array[1].to_i + array[2].to_i
    elsif array[0] == "subtract"
      @answer = array[1].to_i - array[2].to_i
    elsif array[0] == "multiply"
      @answer = array[1].to_i * array[2].to_i
    elsif array[0] == "divide"
      @answer = array[1].to_i / array[2].to_i
    end
    @answer = @answer.to_s
    "#{@answer}"

  end



end