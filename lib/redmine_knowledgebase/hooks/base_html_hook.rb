module RedmineKnowledgebase
  module Hooks
    class BaseHtmlHook < Redmine::Hook::ViewListener
      render_on :view_layouts_base_html_head, :inline => "<%= stylesheet_link_tag 'knowledgebase', :plugin => :redmine_knowledgebase %>"
    end
  end
end
