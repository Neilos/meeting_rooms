module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "alert alert-info alert-dismissable"
    when :success then "alert alert-success alert-dismissable"
    when :error then "alert alert-danger alert-dismissable"
    when :alert then "alert alert-danger alert-dismissable"
    end
  end

  def shallow_routing_args(parent, child)
    child.try(:new_record?) ? [parent, child] : child
  end
end
