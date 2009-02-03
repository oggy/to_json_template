module ToJsonTemplate
  class Handler < ActionView::TemplateHandler
    include ActionView::TemplateHandlers::Compilable
    def compile(template)
      '(' + template.source + ').to_json'
    end
  end

  ActionView::Template.register_template_handler :to_json, Handler
end
