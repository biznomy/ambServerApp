json.code 0
json.extract! @vendor, :id
json.name @vendor.vendor.name
json.price @vendor.vendor.price
json.feedback Random.new.rand(0..5) 
json.image @vendor.vendor.avatar_file_name
json.image @vendor.vendor.description
json.image @vendor.vendor.termcondition