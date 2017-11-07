class Testapi::ApplicationController < ActionController::API
  rescue_from StandardError, with: :render_error

  private

  def render_json(json = {}, options = {})
    render options.merge(json: json)
  end

  def render_object(object = @object)
    render_json(object.attributes)
  end

  def render_error(e)
    render_json({error: e.to_s}, {status: :unprocessable_entity})
  end

  def attributes
    params.fetch(:attributes, {}).permit!.to_h.symbolize_keys
  end
end
