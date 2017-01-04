require 'qfcdata'
require 'sfwdata'

namespace :populate do
  task :qfc => :environment do
    data = QfcData.parse_to_model
    Product.create(data)
    Rails.logger.info("QFC data added at #{Time.now}")
  end

  task :safeway => :environment do
    data = SfwData.parse_to_model
    Product.create(data)
    Rails.logger.info("Safeway data added at #{Time.now}")
  end
end
