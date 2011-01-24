Gem::Specification.new do |s| 
  s.platform = Gem::Platform::RUBY
  s.name = "mikeycgto-sinatra-rest"
  s.version = "0.4.4"
  s.date = "2010-06-08"  
  s.authors = ["blindgaenger", "kyledrake", "dominiquebrezinski", "mikeycgto"]
  s.email = "blindgaenger@gmail.com"
  s.homepage = "http://github.com/mikeycgto/sinatra-rest"  
  s.summary = "Generates RESTful routes for the models of a Sinatra application (ActiveRecord, DataMapper, Stone)"
  
  s.files = [
    "Rakefile",
    "README.textile",
    "lib/sinatra/rest.rb",
    "lib/sinatra/rest/adapters.rb",
    "lib/sinatra/rest/rest.yaml",
    "test/adapters_spec.rb",
    "test/call_order_spec.rb",
    "test/crud_spec.rb",
    "test/helper.rb",
    "test/helpers_spec.rb",
    "test/inflection_spec.rb",
    "test/routes_spec.rb",
    "test/test_spec.rb",
    "test/views/people/edit.haml",
    "test/views/people/index.haml",
    "test/views/people/new.haml",
    "test/views/people/show.haml",
    "test/views/words/edit.haml",
    "test/views/words/index.haml",
    "test/views/words/new.haml",
    "test/views/words/show.haml"
  ]

  s.require_paths = ["lib"]
  s.add_dependency "sinatra", [">= 0.9.1"]
  s.add_dependency "english", [">= 0.5.0"]

  s.has_rdoc = "false"
end

