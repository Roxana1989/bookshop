# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170609082001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "body"
  end

  create_table "articles_authors", id: false, force: :cascade do |t|
    t.integer "article_id", null: false
    t.integer "author_id", null: false
    t.index ["article_id", "author_id"], name: "index_articles_authors_on_article_id_and_author_id"
    t.index ["author_id", "article_id"], name: "index_articles_authors_on_author_id_and_article_id"
  end

  create_table "articles_genres", id: false, force: :cascade do |t|
    t.integer "genre_id", null: false
    t.integer "article_id", null: false
    t.index ["article_id", "genre_id"], name: "index_articles_genres_on_article_id_and_genre_id"
    t.index ["genre_id", "article_id"], name: "index_articles_genres_on_genre_id_and_article_id"
  end

  create_table "authors", id: :serial, force: :cascade do |t|
    t.string "name"
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "author_id", null: false
    t.index ["author_id", "book_id"], name: "index_authors_books_on_author_id_and_book_id"
    t.index ["book_id", "author_id"], name: "index_authors_books_on_book_id_and_author_id"
  end

  create_table "books", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "available"
    t.integer "publisher_id"
    t.boolean "has_prime_length_of_name"
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "books_genres", id: false, force: :cascade do |t|
    t.integer "genre_id", null: false
    t.integer "book_id", null: false
    t.index ["book_id", "genre_id"], name: "index_books_genres_on_book_id_and_genre_id"
    t.index ["genre_id", "book_id"], name: "index_books_genres_on_genre_id_and_book_id"
  end

  create_table "genres", id: :serial, force: :cascade do |t|
    t.string "name"
  end

  create_table "lists", id: :serial, force: :cascade do |t|
    t.string "name"
  end

  create_table "publishers", id: :serial, force: :cascade do |t|
    t.string "name"
  end

  create_table "sorts", id: :serial, force: :cascade do |t|
    t.integer "position"
    t.integer "list_id"
    t.integer "book_id"
    t.index ["book_id"], name: "index_sorts_on_book_id"
    t.index ["list_id"], name: "index_sorts_on_list_id"
  end

  add_foreign_key "books", "publishers"
  add_foreign_key "sorts", "books"
  add_foreign_key "sorts", "lists"
end
