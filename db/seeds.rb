abby = User.create(
	first_name: nil, 
	last_name: nil, 
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

teddy = User.create(
	first_name: Teddy, 
	last_name: Cleveland, 
	is_admin: false, 
	telephone: nil, 
	email: tcclevela@gmail.com, 
	street_address: nil, 
	city: nil, 
	state: nil, 
	zip_code: nil, 
	emergency_contact: nil, 
	emergency_contact_phone: nil, 
	github_url: "https://api.github.com/users/tcclevela", 
	html_url: "https://github.com/tcclevela", 
	repos_url: "https://api.github.com/users/tcclevela/repos", 
	gists_url: "https://api.github.com/users/tcclevela/gists{/gist_id}", 
	avatar_url: "https://0.gravatar.com/avatar/afb9c4e3401a6e54d045299f25cfbecf?d=https%3A%2F%2Fidenticons.github.com%2F5c284cd1782086a873770ab06d629e36.png&r=x", 
	public_repos: 88, 
	followers: 14, 
	following: 17, 
	github_id: 5377229, 
	github_login: "tcclevela", 
	gravatar_id: 0, 
	followers_url: "https://api.github.com/users/tcclevela/followers", 
	following_url: "https://api.github.com/users/tcclevela/following{/other_user}", 
	starred_url: "https://api.github.com/users/tcclevela/starred{/owner}{/repo}", 
	subscriptions_url: "https://api.github.com/users/tcclevela/subscriptions", 
	organizations_url: "https://api.github.com/users/tcclevela/orgs", 
	events_url: "https://api.github.com/users/tcclevela/events{/privacy}", 
	received_events_url: "https://api.github.com/users/tcclevela/received_events", 
	type: "User", 
	site_admin: "f", 
	public_gists: "0", 
	created_github_profile: "2013-09-03 23:06:57", 
	last_updated_github_at: "2013-11-21 21:07:38", 
	biography: "Words words words")

a_course = Course.create(name: "WDI", location: "Boston", session: 'Fall 2013', start_date: Date.today - 1.months, end_date: Date.today + 2.months)
CourseMembership.create(user: abby, course: a_course, role: 'student')

past_course = Course.create(name: "OLD_WDI", location: "NYC", session: 'Summer 2013', start_date: Date.today - 6.months, end_date: Date.today - 3.months)
CourseMembership.create(user: teddy, course: a_course, role: 'student')

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
	user_id: abby.id,
	url: "https://github.com/abigezunt/ga-homework-reddit-hn-rails-ajax/",
	status: "done"
)
