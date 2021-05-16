class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  def show
    @book = Book.find(params[:id])
  end
  def new
    @book = Book.new
  end
  
  def create
    book = Book.new(book_params)
    book.save
    if book.save
      redirect_to books_path(book.id)
    else
      render :'books/index'
    end
    if book.save
      redirect_to book, flash: { notice: 'Book was successfully created.' }
    else
      redirect_to book_path(book.id)
    end

  end
  
  def edit
    @book = Book.find(params[:id])
  end
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    if book.update(book_params)
      redirect_to book, flash: { notice: 'Book was successfully updated.' }
    else
      redirect_to book_path(book.id)
    end
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
