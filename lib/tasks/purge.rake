namespace :purge do
  task :expired => :environment do
    Product.where("valid_til < ?", DateTime.now).delete_all
  end
end
