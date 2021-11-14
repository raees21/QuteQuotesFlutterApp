# QuteQuotesFlutterApp

You must build an app to inspire. They say that the modern world is built on the shoulders of giants, and what better way to inspire others than by the quotes of those giants, whatever size they be.

NOTE	
We are not going to pen down specifications in the form of detailed user stories for this project. The high-level feature descriptions should give enough direction, while still allowing room for interpretation and creativity.

Overall Architecture
The overall architecture of your system must have a server that has an HTTP API, and mobile client that calls the server.

The server must use a layered architecture that separates the HTTP code from the domain code and the database access code. This is important because your last task will be to replace the database access code to use an SQL database. Without the clear separation into layers, you will find it much harder to change the database access.

The client must use the MVC and observer patterns, and must be a Flutter mobile application that calls the server.

As you work through this exercise, the specific architecture that you must build will be shown.

Structuring your codebase for submission
Your code repo must have both the server and client code. Use this layout for your code repo.

/app - directory that contains the flutter project
  | - pubspec.yaml
  | - lib
  | etc.
/server - directory that contains the server project
  | - src
  | - pom.xml
  | etc.
  
  PART 1: The QuteQuotes Server
The QuteQuotes server is the same HTTP Server that you built in Iteration 4. To save time, use exactly that code for your server, but rename it to QuteQuotesServer.

Your server architecture should be as follows:

qutequotes server

Ensure the following:

It has a build script.

All unit tests pass.

You are able to run it as a standalone program and access it with curl.

PART 2: A Standalone QuteQuotes Client
You will start by building the QuteQuotes client application as a standalone application. In other words, it will not connect to the server just yet.

Here is an overview of what the app must implement.

The main view of the app must show some collection of quotes; it’s up to you to use a list, cloud, carousel, cards, grid, etc.

A quote must have a text message, and an author name (can be Anonymous). Do not show the Id of the quote in the view.

It must be possible to add new quotes.

When a user taps on a quote, it must show a full screen quote view with the quote and author.

quote app wireframes

The rough wireframes above are meant to give you some ideas, not to be followed blindly. It shows how such an app flow can potentially look. (In the wireframe the view for editing a quote is using a BottomSheet.)

For this app architecture, use the MVC pattern and Observer pattern. Included in the illustration below are some hints as to what classes you should consider.

mvc diag alt

PART 3: Connect the Client and the Server
Now that you have a working version of a standalone app, it’s time to make the app use the server.

Here’s the architecture that you need to build. Note that there is now the HTTP Service component that is responsible for making the HTTP requests. The Controller invokes the HTTP Service. Now you have two design choices (pick one, or try both):

the HTTP Service can return the quotes from the server back to the controller, and the controller manipulates the model; or

The HTTP Service updates the model directly.

qutequotes architecture

For this part:

Get the QuteQuotes server running on your machine.

Configure the ip address and port in your app (you can keep it simple and use a config file or even config class that you update before running the app, but longer term you need to be able to configure this directly in the app’s interface).

Implement the HTTP service class that reads quotes from your QuteQuotes server’s HTTP API and display those.

Adding quotes needs to call the relevant API methods on the server to update the quotes on the server. This should also be handled by the same service class that reads the quotes from the server.

PART 4: A SQL Database for the QuteQuotes Server
Replace the database access code to use a SQL database instead of an in-memory HashMap. You can use an SQLite database. Your architecture for the server should now be as shown below.

qutequotes server sql

NOTE	You do not have to use an object relational mapper for this task. You can use PreparedStatements instead. The choice is yours.
PART 5: Deployment
Package your server as a Docker image. Make sure you do this using a build script.

Package your client using the Flutter command line tools and a build script.

Run your QuteQuotes Server from the Docker image.

Run your QuteQuotes App and have it connect to the server running in the Docker container.

(Optional) Since all the QuteQuote servers are the same, use someone else’s Docker image for the server and run your QuteQuote client against that.
