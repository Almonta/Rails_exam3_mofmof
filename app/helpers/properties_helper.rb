module PropertiesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      properties_path
    elsif action_name == 'edit'
      properties_path
    end
  end

  def button_text
    if action_name == "new"
      "登録する"
    elsif action_name == "edit"
      "更新する"
    end
  end

end
