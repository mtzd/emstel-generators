  class ShowContentController < ApplicationController
  
  before_action :find_aal, only: [:show, :update, :destroy]
  @document_fields = [ :example1, :example2 ]

  def index
    aals = blub.all
    render json: { aals: aals }, status: :ok
  end

  def show
    @aal =  blub.find(params[:id])
    render json: document, status: :ok
  end

  def create
    @aal =  blub.new aal_params
    @aal.save ? ok : bad_request
  end

  def update
    @aal.update(aal_params) ? ok : bad_request
  end

  def destroy
    @aal.destroy
    render json: { message: 'res delete' }, status: :ok
  end

  private

  def find_aal
    @aal = blub.find(params[:id])
  end

  def aal_params
    permitted_params = [:example1, :example2]
    params.require(:aal).permit(permitted_params)
  end

  def document
    { aal: @aal.as_json(only: @document_fields) }
  end

  def document_error
    { aal: @aal.as_json(only: @document_fields,
                                              methods: [:errors]) }
  end

end
