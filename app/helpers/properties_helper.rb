module PropertiesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      properties_path
    elsif action_name == 'edit'
      properties_path
    end
  end
end
