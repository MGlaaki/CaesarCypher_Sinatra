require 'sinatra'
require 'sinatra/reloader'

def cypher(inputString, shiftFactor=1)
  abc = "abcdefghijklmnopqrstuvwxyz"
  if inputString == nil
    return ""
  end

  for pos in 0...inputString.length
    letterIn = inputString[pos].downcase
    if abc.include?(letterIn)
      indexIn = abc.index(letterIn)
      indexOut = (indexIn + shiftFactor) % 26
      inputString[pos] = (inputString[pos] == letterIn) ? abc[indexOut] : abc[indexOut].upcase
    end
  end

  return inputString
end

get '/' do
  inputString = params["inputString"]
  shiftFactor = params["shift"].to_i
  erb :index, :locals => {:cyphered => cypher(inputString, shiftFactor), :input => inputString}
end
