module StickyProjects::RoutingPatch

  def self.included(base)
    base.send(:helper_method, :issue_path)
    base.send(:helper_method, :issues_path)
    base.send(:helper_method, :new_issue_time_entry_path)
  end

	#Override routing functions

  def issue_path(*args)
    project_issue_path(params[:project_id] || params[:id], *args)
  end

  def issues_path(*args)
    project_issues_path(params[:project_id] || params[:id], *args)
  end

  def new_issue_time_entry_path(*args)
    new_project_issue_time_entry_path(params[:project_id] || params[:id], *args)
  end

end
