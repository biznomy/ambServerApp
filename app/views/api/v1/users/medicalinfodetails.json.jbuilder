json.code 0
json.medicaldetails(@medicaldetails) do |medical|
  json.id medical.userprofile.id
  json.medical_info  medical.userprofile.medical_info
end