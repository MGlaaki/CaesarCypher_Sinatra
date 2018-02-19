require 'sinatra'
require 'sinatra/reloader'

def cypher(inputString)
  abc = "abcdefghijklmnopqrstuvwxyz"
  if inputString == nil
    return ""
  end

  for pos in 0...inputString.length
    letterIn = inputString[pos].downcase
    if abc.include?(letterIn)
      indexIn = abc.index(letterIn)
      indexOut = (indexIn + 1) % 26
      inputString[pos] = (inputString[pos] == letterIn) ? abc[indexOut] : abc[indexOut].upcase
    end
  end


  return inputString
end

get '/' do
  inputString = params["inputString"]
  erb :index, :locals => {:inputString => cypher(inputString)}
end
