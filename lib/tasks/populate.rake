require 'qfcdata'

namespace :populate do
  task :qfc => :environment do
    data = QfcData.parse_to_model
    Product.create(data)
  end
end
