require_dependency 'application'

class VaporExtension < Radiant::Extension
  version "1.0"
  description "Manage redirects without creating useless pages"
  url "http://saturnflyer.com/"
  
  define_routes do |map|
    map.namespace :admin do |admin|
      admin.resources 'flow_meters'
    end
  end
  
  def activate
    admin.tabs.add "Vapor Redirects", "/admin/flow_meters", :after => "Layouts", :visibility => [:admin]
    
    SiteController.send :include, Vapor::ControllerExtensions
  end
  
  def deactivate
    # admin.tabs.remove "Vapor"
  end
  
end