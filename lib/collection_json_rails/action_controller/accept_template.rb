module CollectionJson::Rails
  module AcceptTemplate
    def accept_template!(key)
      return params.require(key) unless template_is_valid?
      parse_template_as_params!(params, key).require(key)
    end

    private

    def template_is_valid?
      params.key?(:template) && params[:template].key?(:data)
    end

    # Parses a Collection+JSON template as the params Rails expects
    #
    # "template": {
    #   "data": [
    #     { "name": "title", "value": "Best title ever" }
    #   ]
    # }
    #
    # "key_name": {
    #   "title": "Best title ever"
    # }
    def parse_template_as_params!(params, key)
      params[:template][:data].each do |d|
        params[key] = Hash.new unless params.key?(key)
        params[key][d[:name]] = d[:value]
      end

      params
    end
  end
end

