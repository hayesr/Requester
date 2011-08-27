
# A sample Guardfile# More info at https://github.com/guard/guard#readme


guard 'livereload' do

  watch(%r{app/.+\.(erb|haml)})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{app/assets/(images|javascripts|stylesheets).+\.(css|scss|js|coffee)})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})

end



guard 'test' do

  watch(%r{lib/(.*)\.rb})      { |m| "test/#{m[1]}_test.rb" }
  watch(%r{test/.*_test\.rb})
  watch('test/test_helper.rb') { "test" }

  # Rails example
  watch(%r{app/models/(.*)\.rb})                     { |m| "test/unit/#{m[1]}_test.rb" }
  watch(%r{app/controllers/(.*)\.rb})                { |m| "test/functional/#{m[1]}_test.rb" }
  watch(%r{app/views/.*\.rb})                        { "test/integration" }
  watch('app/controllers/application_controller.rb') { ["test/functional", "test/integration"] }

end

