class Document::PDF < ApplicationService
  def initialize(options)
    @data = OpenStruct.new(options[:data])
    @template = options[:template]
    @orientation = options[:orientation] || 'landscape'
    @margin = options[:margin] || { top: 0, bottom: 0, right: 0, left: 0}
    @page_size = options[:page_size] || 'A5'
    @av = ActionView::Base.new
    @av.view_paths = ActionController::Base.view_paths
    @av.class_eval do
      include Rails.application.routes.url_helpers
      include ApplicationHelper
    end
    super(options )
  end

  def call
    pdf
  end

  private

  def pdf
    html_pdf = @av.render 'templates/document',
                          { template: @template, data: @data }
    pdf = WickedPdf.new
                   .pdf_from_string(html_pdf,
                                    orientation: @orientation,
                                    margin: @margin,
                                    page_size: @page_size,
                                    print_media_type: true,
                                    background: true,
                                    images: true,
                                    show_as_html: true,
                                    no_images: false,
                                    no_background: false,
                                    disable_smart_shrinking: true)
    success_response(data: pdf)
  end
end