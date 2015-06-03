require_relative 'scrapper2'

imei_list=%w(013977000323877 013896000639712)

imei_list.each do |imei|	
	puts get_expiration_date_by_imei imei
end
