module ToJsonTemplate
  class JSONHandler < ActionView::TemplateHandler
    include ActionView::TemplateHandlers::Compilable
    def compile(template)
      '(' + template.source + ').to_json'
    end
  end

  ActionView::Template.register_template_handler :to_json, JSONHandler

  class JSONPHandler < ActionView::TemplateHandler
    include ActionView::TemplateHandlers::Compilable
    def compile(template)
      <<-EOS
        _json = (#{template.source}).to_json
        if !params[:callback].blank?
          "\#{params[:callback]}(\#{_json})"
        else
          _json
        end
      EOS
    end
  end

  ActionView::Template.register_template_handler :to_jsonp, JSONPHandler
end
