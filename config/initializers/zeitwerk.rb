# config/initializers/zeitwerk.rb
Rails.autoloaders.each do |autoloader|
 autoloader.inflector.inflect(
   'label_pdf' => 'LabelPDF'
 )
end
