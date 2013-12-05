json.array! @users do |user|
  json.name user.first_name
  json.homework user.hw_percent
  json.quiz user.quiz_percent
  json.present user.days_present
  json.late user.days_late
  json.absent user.days_absent
  json.one_on_ones user.one_on_ones.count
end