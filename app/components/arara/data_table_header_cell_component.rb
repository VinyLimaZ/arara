module Arara
  class DataTableHeaderCellComponent < ActionView::Component::Base
    include Arara::BaseComponent
    attr_reader :numeric, :sorted, :data_column_id, :sort_direction

    validates :content, presence: true

    def initialize(numeric: false, sorted: false, label: nil, sort_direction: nil, **kw)
      super(tag: "th", **kw)
      @numeric = numeric
      @sorted = sorted
      @label = data_column_id
      @sort_direction = sort_direction
    end

    def default_html_class
      klass = ["mdc-data-table__header-cell"]
      klass << "mdc-data-table__header-cell--numeric" if numeric
      klass << 'mdc-data-table__header-cell--with-sort mdc-data-table__header-cell--sorted mdc-data-table--sortable' if sorted

      klass.join(' ')
    end

    def html_options
      opts = super
      opts.merge!(role: "columnheader", scope: "col")
      opts.merge!('aria-sort': (sort_direction || 'none')) if sorted
      opts.merge!(data: { 'column-id': label }) if data_column_id
      opts
    end
  end
end
