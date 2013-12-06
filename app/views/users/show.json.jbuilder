json.id @user.id
json.name @user.name
json.email @user.email
json.phone @user.telephone
json.emergency_name @user.emergency_contact
json.emergency_hone @user.emergency_contact_phone
json.bio @user.biography
json.homework @user.hw_percent
json.quiz @user.quiz_percent
json.present @user.days_present
json.late @user.days_late
json.absent @user.days_absent
json.one_on_ones @user.one_on_ones do |one_on_one|
	json.id one_on_one.id
	json.teacher one_on_one.teacher.name
	json.date one_on_one.date.strftime("%m/%d/%Y")
	json.notes one_on_one.notes
	json.student_concerns one_on_one.student_concerns
	json.teacher_concerns one_on_one.teacher_concerns
	json.course one_on_one.course.name_location
end 