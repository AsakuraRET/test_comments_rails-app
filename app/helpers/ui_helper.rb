module UiHelper
  def button_class(variant: :primary, extra_classes: "")
    base = "inline-flex items-center justify-center px-4 py-2 text-sm font-medium rounded-md transition-colors cursor-pointer focus:outline-none focus:ring-2 focus:ring-offset-2"

    theme = case variant
    when :primary
              "bg-indigo-600 text-white hover:bg-indigo-700 focus:ring-indigo-500 border border-transparent"
    when :danger
              "bg-red-600 text-white hover:bg-red-700 focus:ring-red-500 border border-transparent"
    when :secondary
              "bg-white text-gray-700 hover:bg-gray-50 focus:ring-indigo-500 border border-gray-300 shadow-sm"
    when :ghost
              "bg-transparent text-gray-500 hover:text-indigo-600 hover:bg-gray-50 focus:ring-indigo-500"
    else
              ""
    end

    "#{base} #{theme} #{extra_classes}".strip
  end
end
