namespace :purge do
  task :expired => :environment do
    Product.delete_all('valid_til < ?', DateTime.now)
  end
end
