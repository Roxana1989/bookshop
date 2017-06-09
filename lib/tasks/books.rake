namespace :books do
  desc 'refresh callback data for books'
  task refresh: :environment do
    Book.find_each do |book|
      book.send :setup_has_prime_length_of_name

      book.save!
    end
  end
end
