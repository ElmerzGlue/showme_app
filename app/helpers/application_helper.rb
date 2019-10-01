module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Show Me Mock Trial"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end


    def bg_image(title)
      asset_path title + '.jpg'
    rescue Sprockets::Rails::Helper::AssetNotFound
      asset_path 'default.jpg'
    end

    def day_of_comp
      Time.new(2019, 10, 4, 18)
    end

end
