json.code 0
json.vendors(@vendors) do |vendor|
	  vendordetail = vendor.vendor
	  json.id vendor.id
	  json.name vendor.vendor.name
	  json.price vendor.vendor.price
	  json.feedback Random.new.rand(0..5) 
	  json.image vendor.vendor.avatar_file_name
end