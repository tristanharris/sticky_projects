module StickyProjects::IssuesControllerPatch

  def self.included(base)
    base.send(:before_filter, :find_optional_project, :except => [:new, :create])

    base.class_eval do
      alias_method_chain :show, :sticky_project
		end
  end

	def show_with_sticky_project
    return render_404 unless @project.nil? || @issue.project == @project || @issue.project.ancestors.include?(@project)
		show_without_sticky_project
	end

end

