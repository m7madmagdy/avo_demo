class Avo::ToolsController < Avo::ApplicationController
  def custom_dashboard
    @page_title = "Custom dashboard"
    add_breadcrumb "Custom dashboard"
  end
end
