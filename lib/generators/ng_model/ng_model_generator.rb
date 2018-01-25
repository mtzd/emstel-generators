class NgModelGenerator < Rails::Generators::NamedBase

  desc "create a typescript model file"
  def create_typescript_model
    begin
      types = { 'datetime': 'Date', 'String': 'string', 'integer': 'number',
                'text': 'string', 'uuid': 'string', 'decimal': 'number' }

      @model_name = file_name.singularize.camelize
      @attributes = @model_name.constantize.columns.reject{|r| r.name.end_with?("_id")}.collect do |c|
          { name: c.name.camelize(:lower), type: types[c.type],
            rails_name: c.name }
      end

      @associations = @model_name.constantize.reflect_on_all_associations(:has_many).collect do |c|
        name = c.name.to_s
        { name: name.camelize(:lower), rails_name: name,
          model: name.singularize.camelize,
          file: name.singularize.dasherize }
      end

      @belongs_to = @model_name.constantize.reflect_on_all_associations(:belongs_to).collect do |c|
        name = c.name.to_s
        { name: name.camelize(:lower), rails_name: name,
          model: name.singularize.camelize,
          file: name.singularize.dasherize }
      end

      template_file_path = "#{File.dirname(__FILE__)}/templates/ng_model.erb"
      template = File.read(template_file_path)
      create_file "tmp/ng/#{file_name.dasherize}.ts", ERB.new(template, 0, "-").result(binding)
    rescue NameError
      puts "Model not found"
    end
  end

end
