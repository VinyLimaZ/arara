module Arara
  class DataTableHeaderSortButtonComponent < ActionView::Component::Base
    include Arara::BaseComponent

    attr_reader :label

    def initialize(label: label, **kw)
      super(tag: "button", **kw)
      @label = label
    end

    def default_html_class
      "mdc-icon-button material-icons mdc-data-table__sort-icon-button"
    end

    def html_options
      opts = super
      opts.merge!('aria-label': "Sort by #{label}", 'aria-describedby': "#{label}-status-label")
      opts
    end
  end
end
