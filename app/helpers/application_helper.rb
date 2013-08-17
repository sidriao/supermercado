# encoding: utf-8
module ApplicationHelper

	def error_messages(variavel_instancia)
      html = ""
      if variavel_instancia.errors.any?
              html << "<div class=\"alert alert-error\" >"
              html << " <a class=\"close\" data-dismiss=\"alert\">&#215;</a>"
                      variavel_instancia.errors.full_messages.each do |msg|
                              html << "  <div id=\"flash_error\">#{msg}</div>"
                      end
              html << "</div>"
      end
      raw html
	end

end
