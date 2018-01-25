class NgServiceGenerator < Rails::Generators::Base

  desc "create a angular service file"
  def create_angular_service
    @service_name = ask('Service name? [Default]')
    @service_name = 'Default' if @service_name.blank?

    @url = ask('Url? [/]')
    @url = '/' if @url.blank?

    @http_provider = ask('HttpProvider? [HttpClient]')
    @http_provider = 'HttpClient' if @http_provider.blank?
    @http_import = '@angular/common/http'
    @http_import = ask('Provider import?') if @http_provider != 'Http'

    @model = ask('Default model? [Default]')
    @model = 'Default' if @model.blank?

    template_file_path = "#{File.dirname(__FILE__)}/templates/ng_service.erb"
    template = File.read(template_file_path)
    create_file_name = "tmp/ng/#{@service_name.underscore.dasherize}.service.ts"
    create_file create_file_name, ERB.new(template, 0, "-").result(binding)
  end

end
