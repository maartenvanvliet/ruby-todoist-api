module JsonResponseHelper
  def json_filename(name)
    File.join('spec/support/responses/', "#{name}.json")
  end

  def json_response_raw(name)
    File.read(json_filename(name))
  end

  def json_response(name)
    JSON.parse(json_response_raw(name)).delete_if { |k, v| v.nil? }
  end

  def resource_without_id(name)
    json_response(name).delete_if { |k, v| k == 'id' }
  end
end