require 'rest-client'

def get_expiration_date_by_imei(imei)
	response = RestClient.post 'https://selfsolve.apple.com/wcResults.do', sn: imei, num: '1'#'360849'
	date_string = response[/displayHWSupportInfo.*Estimated Expiration Date:(.*)<br/,1]
	
	date = if date_string
		DateTime.parse date_string.strip
	elsif response[/displayHWSupportInfo\(false/] 
		'Expired'
	else 
		raise "Bad response:\n#{response}"  
	end
	date
end

imei_list=%w(013977000323877 013896000639712)

imei_list.each do |imei|	
	puts get_expiration_date_by_imei imei
end
