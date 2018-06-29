class TemplatesController < ApplicationController
  before_action :set_template, only: [:edit, :update, :destroy, :preview]
  
  def index
    @templates = Template.all
  end

  def preview
    @data = template_data
    respond_to do |format|
      @data = OpenStruct.new(@data)
      format.html { render pdf: 'Sample',
                           template: 'templates/preview',
                           layout: false,
                           page_size: 'A5',
                           margin: { top: 0, bottom: 0, right: 0, left: 0 },
                           show_as_html: true,
                           orientation: :landscape,
                           print_media_type: true,
                           background: true,
                           no_background: false }
      format.pdf do
        @preview = Document::PDF.call(template: @template, data: @data).data
        send_data @preview,
                  filename: "Preview #{@template.name}.pdf",
                  type: 'application/pdf' 
      end
    end     
  end

  def new
    @template = Template.new
  end

  def create
    @template = Template.create(template_params)
    redirect_to templates_path
  end

  def edit
  end

  def update
    if @template.update(template_params)
      flash.now[:info] = 'Templated Updated'
    else
      flash.now[:danger] = "Unable to update template. #{@template.full_messages.errors.to_sentence}"
    end
    redirect_to templates_path
  end

  def destroy

  end

  private 

  def set_template
    template_id = params[:id] || params[:template_id]
    @template = Template.find_by(id: template_id)
    unless @template.present?
      flash.now[:notice] = 'Template not found'
      redirect_back(fallback_location: root_path  )
    end
  end

  def template_params
    params.require(:template).permit!
  end

  def template_data
    { name: 'Sample Name',
      city: 'Sample City',
      primary_role: 'Sample Role',
      additional_roles: 'Extra roles' }
  end
end
