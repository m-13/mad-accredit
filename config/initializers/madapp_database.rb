# template = ERB.new File.new(Rails.root.join('config', 'madapp_database.yml')).read
# processed = YAML.load template.result(binding)
MADAPP_DB = YAML.load(ERB.new(File.new(Rails.root.join('config', 
                                                       'madapp_database.yml')).read).result)[Rails.env.to_s]  