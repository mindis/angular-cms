###
MainPage view
###
MainPage =
	index: () ->
		browser().navigateTo('/')

LoginPage = 
	login: () ->
	  #element('a[href="#/login"]', 'Login button').click()
		#Enter the test credentials
		input('user.email').enter('admin@email.com')
		input('user.password').enter('admin1234')
		element('.login form button[type="submit"]', 'Click the Login submit button').click()
		
describe "Angular-CMS App", ->
	beforeEach ->
		MainPage.index()

	#Welome Story: the initial page 
	describe 'Welcome Story: the initial page', ->

		it "should display the main index view as default", ->
			expect(browser().location().path()).toEqual '/'

		it 'should have a .navbar-brand on the page', ->
			expect(element('.navbar-brand', 'Site title').count()).toEqual 1

		it 'should have a .login-btn element with a link to the login page', ->
			expect(element('a[href="#/login"]', 'the Login link').count()).toEqual 1
		
		it 'should have a .media element for a feature', ->
			sleep 1
			expect(element('.media').count()).toBeGreaterThan 1
		
		it 'should have a jumbrotron element for feature title and body', ->
			sleep 1
			expect(element('.jumbotron').count()).toEqual 1
		
	
	#The user login implementation
	describe 'Login Story: clicking the .login-btn element...', ->
		
		#Click the login button each time
		beforeEach ->
			element('a[href="#/login"]', 'Login button').click()
		
		#Make sure we end up at the login page to enter our credentials		
		#Make sure there is a username and password input with button
		it 'should have email and password inputs with a button to submit the form', ->
			expect(browser().location().path()).toEqual '/login'		
			expect( element('#login-form', 'Login form').count() ).toEqual 1
			expect(element('input[type="email"]', 'Email input').count()).toEqual 1
			expect(element('input[type="password"]', 'Password input').count()).toEqual 1
			expect(element('button[type="submit"]', 'Submit button').count()).toEqual 1
			
			#Login to the page
			LoginPage.login()
			
			#Wait for the api call to go thru
			sleep 1
			#We should end up at the dashboard page.
			expect(browser().location().path()).toEqual '/dashboard'
	
	#The dashboard implementation
	describe 'Dashboard Story: viewing the dashboard...', ->
		beforeEach ->
			element('a[href="#/login"]', 'Login button').click()
			LoginPage.login()
			sleep 1
		it 'should have a link to the profile page',  ->
			expect(element('.panel', 'Widget Panel').count()).toEqual 2
			expect(element('a[ng-href="#/profile"]', 'the Profile link').count()).toEqual 1
			expect(element('.cms-sidebar-nav', 'Sidebar nav').count()).toEqual 1

	


#