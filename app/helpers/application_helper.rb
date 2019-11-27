module ApplicationHelper
  def delete_link(path, class_name = "")
    link_to '<i class="fas fa-trash " title="Delete Details"></i> Delete'.html_safe,
            path,
            method: :delete,
            data: { confirm: "Are you sure?" },
            class: class_name
  end
end
