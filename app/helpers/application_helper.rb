module ApplicationHelper

  def ng_app
    if current_user
      'ng-app=App'
    end
  end

  def ui_view
    if current_user
      '<div ui-view="">'.html_safe
    end
  end

end
