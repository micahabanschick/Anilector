require 'bundler'
Bundler.require
require 'pry'
require 'nokogiri'
require 'open-uri'
require 'rspec'
require_all 'lib'
=begin 
require 'open-uri'
require 'zlib'

open('Accept-Encoding' => 'gzip, deflate') do |response|
  if response.content_encoding.include?('gzip')
    response = Zlib::GzipReader.new(response)
    response.define_singleton_method(:method_missing) do |name|
      to_io.public_send(name)
    end
  end

  yield response if block_given?

  response
end
=end
