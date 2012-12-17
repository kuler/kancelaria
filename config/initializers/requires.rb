Dir[File.join(Rails.root, 'lib/modules', '*.rb')].each { |f| require f }
