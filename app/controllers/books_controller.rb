class BooksController < ApplicationController

  def index 
    books = Book.all
    render json: books
  end

  def prime
  	books = Book.prime
    render json: books
  end
  
end