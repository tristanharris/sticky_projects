Rails.configuration.to_prepare do
  ApplicationHelper.send(:include, StickyProjects::ApplicationHelperPatch) unless ApplicationHelper.included_modules.include?(StickyProjects::ApplicationHelperPatch)
  IssuesController.send(:include, StickyProjects::IssuesControllerPatch) unless IssuesController.included_modules.include?(StickyProjects::IssuesControllerPatch)
  SearchController.send(:include, StickyProjects::SearchControllerPatch) unless SearchController.included_modules.include?(StickyProjects::SearchControllerPatch)
end

Redmine::Plugin.register :sticky_projects do
  name 'Sticky Projects plugin'
  author 'Tristan Harris'
	description 'Stay on current project when viewing issues for sub-projects'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
end



