student = User.create(
	first_name: "Abby", 
	last_name: "Howell", 
	is_admin: false, 
	telephone: nil, 
	email: nil, 
	street_address: nil, 
	city: nil, 
	state: nil, 
	zip_code: nil, 
	emergency_contact: nil, 
	emergency_contact_phone: nil, 
	github_url: "https://api.github.com/users/abigezunt", 
	html_url: "https://github.com/abigezunt", 
	repos_url: "https://api.github.com/users/abigezunt/repos", 
	gists_url: "https://api.github.com/users/abigezunt/gists{/gist_id}", 
	avatar_url: "https://0.gravatar.com/avatar/afb9c4e3401a6e54d045299f25cfbecf?d=https%3A%2F%2Fidenticons.github.com%2F5c284cd1782086a873770ab06d629e36.png&r=x", 
	public_repos: 88, 
	followers: 14, 
	following: 17, 
	github_id: 5377229, 
	github_login: "abigezunt", 
	gravatar_id: 0, 
	followers_url: "https://api.github.com/users/abigezunt/followers", 
	following_url: "https://api.github.com/users/abigezunt/following{/other_user}", 
	starred_url: "https://api.github.com/users/abigezunt/starred{/owner}{/repo}", 
	subscriptions_url: "https://api.github.com/users/abigezunt/subscriptions", 
	organizations_url: "https://api.github.com/users/abigezunt/orgs", 
	events_url: "https://api.github.com/users/abigezunt/events{/privacy}", 
	received_events_url: "https://api.github.com/users/abigezunt/received_events", 
	type: "User", 
	site_admin: "f", 
	public_gists: "0", 
	created_github_profile: "2013-09-03 23:06:57", 
	last_updated_github_at: "2013-11-21 21:07:38", 
	biography: "Words words words")

teacher = User.create(
  first_name: "David",
  last_name: "Fisher",
  email: "tibbon@gmail.com",
  github_url: "https://api.github.com/users/tibbon", 
	html_url: "https://github.com/tibbon", 
	repos_url: "https://api.github.com/users/tibbon/repos", 
	gists_url: "https://api.github.com/users/tibbon/gists{/gist_id}", 
	avatar_url: "http://placekitten.com/400/500", 
	public_repos: 88, 
	followers: 14, 
	following: 17, 
	github_id: 5377229, 
	github_login: "tibbon", 
	gravatar_id: 0, 
	followers_url: "https://api.github.com/users/tibbon/followers", 
	following_url: "https://api.github.com/users/tibbon/following{/other_user}", 
	starred_url: "https://api.github.com/users/tibbon/starred{/owner}{/repo}", 
	subscriptions_url: "https://api.github.com/users/tibbon/subscriptions", 
	organizations_url: "https://api.github.com/users/tibbon/orgs", 
	events_url: "https://api.github.com/users/tibbon/events{/privacy}", 
	received_events_url: "https://api.github.com/users/tibbon/received_events", 
	type: "User", 
	site_admin: "f", 
	public_gists: "0", 
	created_github_profile: "2013-09-03 23:06:57", 
	last_updated_github_at: "2013-11-21 21:07:38", 
	biography: "Words words words")

a_course = Course.create(name: "WDI", location: "Boston", session: 'Fall 2013', start_date: Date.today - 1.months, end_date: Date.today + 2.months)
CourseMembership.create(user: student, course: a_course, role: 'student')

first_assignment = Assignment.create(
	course_id: Course.first.id,
	title: "Whatever",
	description: "More words",
	github_login: "tibbon",
	github_repo: "ga-homework-reddit-hn-rails-ajax",
	due_date: Date.today,
	assignment_type: "homework"
)

Contribution.create(
	finished: true,
	repo_fork: "",
	travis_data: "",
	assignment_id: first_assignment.id,
	user_id: student.id,
	url: "https://github.com/abigezunt/ga-homework-reddit-hn-rails-ajax/",
	status: "done"
)

OneOnOne.create(
	student_id: student.id,
	teacher_id: teacher.id,
	date: Date.today,
	notes: "words words words this student is kinda awesome"
)
