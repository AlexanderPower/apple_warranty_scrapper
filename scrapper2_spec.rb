require_relative 'scrapper2'

describe 'scrapper2' do
	context 'get_expiration_date_by_imei' do
		it "imei 013977000323877" do
			expect(get_expiration_date_by_imei '013977000323877').to eq DateTime.parse '2016-08-10'
		end
		it "imei 013896000639712" do
			expect(get_expiration_date_by_imei '013896000639712').to eq 'Expired'
		end
		it "imei 123" do
			expect{get_expiration_date_by_imei '123'}.to raise_error
		end
	end
end
