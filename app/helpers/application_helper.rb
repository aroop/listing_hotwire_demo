module ApplicationHelper
  include Pagy::Frontend

  def header_link(text = nil, link = "#", selected = false, &block)
    text = capture(&block) if block

    default_classes = "inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium"
    selected_classes = "border-indigo-500 text-gray-900"
    unselected_classes = "border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700"
      tag.a(class: class_names(default_classes, selected ? selected_classes : unselected_classes), href: link) do
        text
      end
  end

end
