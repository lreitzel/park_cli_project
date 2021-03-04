Hello, welcome to NC Park Discovery!

Before beginning the program, run 'bundle install' to get all of the necessary gems for this program.

Next, go to https://www.nps.gov/subjects/developer/get-started.htm and sign up for a key to the National Park Service API. You do not need to provide a reason, but if you do you can say that it is to use a program.

Once you have received your key, you need to create a '.env' file in the root of the park_cli_project folder and add the following:
    NPS_API_KEY = (copy and paste you specific key)

Now you should be able to use run/park_discovery to start the program! If you still experience trouble, please install the dotenv gem onto your computer using 'gem install dotenv -v 2.1.1'

From here, you can scroll up and down through the list to either see all parks and get more information, see all activities and find a park that includes that activity, or exit the program because you have finished.