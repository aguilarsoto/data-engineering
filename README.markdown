# how to Setup and run the application
## Setup
### Have you tried our heroku setup?
Hi tester. how nice of you to drop by, lets start by saying that I saved you some time and set up the current app on heroku so you don't have to. yeah!!! less work if you want to try our setup on heroku please use this link [http://gentle-frost-3132.herokuapp.com/] and keep reading on the running the app section.


### Seems like you want to setup your own instance.
Well lets keep talking then. the first thing you need to do is clone the repo so open a terminal on your computer and clone the repo (more configuration may be needed if you dont have github and git setup)


 - git clone git@github.com:aguilarsoto/data-engineering.git


Now that you have the repo in your local machine, now you need to 'bundle exec' this will load all the gems on your local repo.


- bundle exec


Now lets setup the db, this repo has PostgreSQL gem installed so I Highly recommend you to use this database but don't feel that this is impose so feel free to setup your desired database if you wish to do so please review the section 3.3 of the tutorial [http://guides.rubyonrails.org/getting_started.html], since this is a very unique file for your specific setup, I'm not providing a definition for it.


Ok we have the db now lets run our migrations this will generate all the association needed to use the site.

- rake db:migrate

Now you can start the server and access it. to start the server you need to

- rails s

Fire your favorite web browser and access the site "localhost:3000", after this you can follow the Running the App instructions but also remember to start your worker so we can process the jobs queued

- rake jobs:work

##Running the App
###SignUp

When accessing the server you are going to be prompted with a sign in page since its your first time using the site click on the 'sign up' link and create a new account to create a new account you are going to need your email, password and in case you want to do openid signins your open id url as your identity url.

###Testing OpenID

After creating your account you are going to be already signed in the site so to test the openID signin click on the signout button and enter your openID information on the identity url section of sign in

###Upload a file and get results
to upload a file go to uploads/new and upload the file you want. this file is going to get queued and processed later on the worker threads, you are going to get prompted with a message telling you if your upload has being processed or not. when processed you are going to get 3 results current file total, current total, and current total of all valid uploads.

the difference in between this three is.
- current file's total is the total revenue of this file
 
- current total is the total of all the uploads on history even the ones that reported errors

- current total of all valid uploads is the sum of all valid uploads that end their process with no errors.

# Challenge for Software Engineer - Big Data 
To better assess a candidates development skills, we would like to provide the following challenge.  You have as much time as you'd like (though we ask that you not spend more than a few hours) and may use any programming language or framework you'd like.  

There are three jobs that both use this challenge:

1. Senior Software Engineer: If you are applying to this position, the email address you should use for submission is [dev.challenges@livingsocial.com](dev.challenges@livingsocial.com).
1. Associate Developer: If you are applying to this position, the email address you should use for submission is [dev.challenges@livingsocial.com](dev.challenges@livingsocial.com).
1. Senior Software Engineer, Big Data (and/or Data Scientist): If you are applying to this position, the email address you should use for submission is [data.challenge@livingsocial.com](mailto:data.challenge@livingsocial.com).

Feel free to email the appropriate address above if you have any questions.

## Submission Instructions
1. First, fork this project on github.  You will need to create an account if you don't already have one.
1. Next, complete the project as described below within your fork.
1. Finally, push all of your changes to your fork on github and submit a pull request.  You should also email the appropriate address listed in the first section and your recruiter to let them know you have submitted a solution.  Make sure to include your github username in your email (so we can match people with pull requests).

## Alternate Submission Instructions (if you don't want to publicize completing the challenge)
1. Clone the repository
1. Next, complete your project as described below within your local repository
1. Email a patch file to the appropriate address listed above ([data.challenge@livingsocial.com](mailto:data.challenge@livingsocial.com) if you are applying for the Big Data position, [dev.challenges@livingsocial.com](dev.challenges@livingsocial.com) if you are applying for the general Senior Software Engineer or Associate Developer position).

## Project Description
Imagine that LivingSocial has just acquired a new company.  Unfortunately, the company has never stored their data in a database and instead uses a plain text file.  We need to create a way for the new subsidiary to import their data into a database.  Your task is to create a web interface that accepts file uploads, normalizes the data, and then stores it in a relational database.

Here's what your web-based application must do:

1. Your app must accept (via a form) a tab delimited file with the following columns: purchaser name, item description, item price, purchase count, merchant address, and merchant name.  You can assume the columns will always be in that order, that there will always be data in each column, and that there will always be a header line.  An example input file named example_input.tab is included in this repo.
1. Your app must parse the given file, normalize the data, and store the information in a relational database.
1. After upload, your application should display the total amount gross revenue represented by the uploaded file.

Your application does not need to:

1. handle authentication or authorization (bonus points if it does, extra bonus points if authentication is via OpenID)
1. be written with any particular language or framework
1. be aesthetically pleasing

Your application should be easy to set up and should run on either Linux or Mac OS X.  It should not require any for-pay software.

## Evaluation
Evaluation of your submission will be based on the following criteria:

1. Did your application fulfill the basic requirements?
1. Did you document the method for setting up and running your application?
1. Did you follow the instructions for submission?
