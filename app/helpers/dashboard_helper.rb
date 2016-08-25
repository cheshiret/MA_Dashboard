module DashboardHelper
  def bool_to_glyph(value)
 #     value ? "<span class='glyphicon glyphicon-ok' aria-hidden='true'></span>".html_safe : "<span class='glyphicon glyphicon-remove' aria-hidden='true'></span>".html_safe
      if value=="Down"
        "<span class='glyphicon glyphicon-remove' aria-hidden='true'></span>".html_safe

      elsif value=="Unavailable"
        "<span class='glyphicon glyphicon-warning-sign' aria-hidden='true'></span>".html_safe

      else
        "<span class='glyphicon glyphicon-ok' aria-hidden='true'></span>".html_safe


      end

  end

end
