# To-Do List Rails API Backend

This project is part of a mini-project assigned to learn React + Rails. This project works as an API for the React frontend project in the repository [here](https://github.com/kishan-aghera/todo-list-frontend). The API will be used for user authentication and CRUD operation.

### Project Configuration

This repository uses Ruby 2.7.2, so make sure to have 2.7.2 version installed.

Run the following commands to install necessary dependencies
```bash
# install dependencies mentioned in Gemfile
$ bundle install

# verification of already installed files in node_modules
$ yarn install --check-files
```

### Database Setup
Create and Initialize database.
```bash
# migration of database
$ rails db:migrate
```

### Starting the server
To start the server on localhost run the command below. The server will start on port 3001 as the frontend app will use port 3000.
```bash
$ rails s
```

*Note*: The server for this app will not generate any view as it works as an API. You need to clone and use this [app](https://github.com/kishan-aghera/todo-list-frontend) for view.
