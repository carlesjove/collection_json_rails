module CollectionJson::Rails
  module Support
    def route(href)
      if href.is_a?(Symbol)
        ::Rails.application.routes.url_helpers.send(href)
      else
        href
      end
    end

    def rewrite_href_of(hash)
      params = hash.extract_params
      href = route(params[:properties][:href])
      hash[params[:name]][:href] = href
      hash
    end
  end
end

