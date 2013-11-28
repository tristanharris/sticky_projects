module StickyProjects::SearchControllerPatch

  def self.included(base)
    base.class_eval do
      alias_method_chain :index, :sticky_project
		end
  end

	def index_with_sticky_project
		index_without_sticky_project
		# override quick jump to an issue
    if @question.match(/^#?(\d+)$/) && (issue = Issue.visible.find_by_id($1.to_i))
			self.response_body = nil
      args = {:controller => "issues", :action => "show", :id => issue}
      args[:project_id] = @project if @project && issue.project.ancestors.include?(@project)
      redirect_to args
      return
    end
	end

end


