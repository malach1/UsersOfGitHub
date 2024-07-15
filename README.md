
# Users of GitHub
This is an iOS GitHub client that retrieves users from the GitHub API and display users in a list.  You are able to select or search a user to view the users profile detail and list of repositories.

Clicking on the repository in the list will display a web view to the target repository information on Github web.

## Demo

![UsersOfGitHubFinal](https://github.com/user-attachments/assets/b1dfc41e-d705-4b4b-91b0-59a0a1b01e58)


## Development
This application is a native iOS application developed with SwiftUI but the web view used to display the repository is ported over from UIKit as a ViewRepresentable.

This code base uses the MVVM Architectural Pattern. Uses dependency injection to inject services to be highly modular and testable.

The UI was developed and tested primarily on iPhone 15 sizes so bugs may apply in other device class sizes, this is an improvement to tackle in the future.

## Application Flow
The general application flow is when the application is loading, users are fetched from the GitHub API.  Per page, 50 users are loaded, and pagination is used to load more users in an infinte scroll fashion.  Clicking on a user will reveal target user detail and a list of repositories for the user.  It is also a similar application flow when searching for an individual user by username.  Lastly, clicking on a repository of the target user will show the repository in a webview.

<img width="648" alt="UsersOfGitHub Application Flow" src="https://github.com/user-attachments/assets/4ceb5728-8956-4877-b6a8-230b17e42e68">

_Figure 1 : Application Flow Diagram_
## API

When fetching data from the API, the following are endpoints being communicated to:

**Fetching list of Github users:**  https://api.github.com/users

**Fetching specific user metadata:**  https://api.github.com/users/{login}

**Fetching a specific users list of repositories:** https://api.github.com/users/{login}/repos

<img width="605" alt="Request-Response Data Flow" src="https://github.com/user-attachments/assets/b1dc4c4b-e28a-4f3f-82ce-a271e72b4b9f">

_Figure 2 : Request - Response dataflow diagram_

## Unit Test
Unit Test is included to test View Model functionalities of:

- UserViewModel.Swift
- UserProfileViewModel.Swift
- RepositoryViewModel.Swift
