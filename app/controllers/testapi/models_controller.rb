class Testapi::ModelsController < Testapi::ApplicationController
  before_action :model

  def index
    @objects = model.all.reorder(:id)
    render_json @objects.map(&:attributes)
  end

  def create
    @object = model.create!(attributes)
    render_object
  end

  def show
    @object = model.find(params[:id])
    render_object
  end

  def update
    @object = model.find(params[:id])
    @object.update!(attributes)
    render_object
  end

  def destroy
    @object = model.find(params[:id])
    @object.destroy!
    render_object
  end

  private

  def model
    @model ||= params[:model].to_s.constantize
  end
end
