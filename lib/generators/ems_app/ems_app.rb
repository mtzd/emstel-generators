class EmsAppGenerator < Rails::Generators::Base

  desc "Adding my default methods"
  def inject_application_controller_code
    template_file_path = "#{File.dirname(__FILE__)}/templates/ng_service.erb"
    template = File.read(template_file_path)

    inject_into_file 'app/controllers/application_controller.rb',
                     after: "ActionController::Base\n" do <<-'RUBY'
      puts ERB.new(template, 0, "-").result(binding)
      RUBY
    end
  end

end
