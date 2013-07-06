require 'rubygems'
require 'bundler'
require_relative './lib/keg.rb'

Bundler.require

set :database, "sqlite3:///keg.db"

port_str = "/dev/ttyACM0" 
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE
sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

Keg.get_data(sp)

module KegKong
  
  class App < Sinatra::Application

    get '/' do
      erb :keg
    end

  end
end
