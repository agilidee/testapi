class Testapi::FactoriesController < Testapi::ApplicationController
  def create
    @object = FactoryBot.create(factory, attributes)
    render_object
  end

  private

  def factory
    @factory ||= params[:factory].to_s.to_sym
  end
end
