# rails-webapp-sample

## Preface
This sample project uses Ruby on Rails. It provides only Web API. So, I recommend using a [vuejs-webapp-sample](https://github.com/ybkuroki/vuejs-webapp-sample) project as Web UI.

## Install
Perform the following steps:

1. Download and install [Ruby](https://www.ruby-lang.org/en/).
1. Download and install [Rails](https://rubyonrails.org/).
    ```bash
    gem install rails
    gem install bundler
    ```
1. Download and install [Visual Studio Code(VS Code)](https://code.visualstudio.com).
1. Download and install dependencies.(**Only development environment**)
    ```bash
    bundle install --without=production
    ```
    If install dependencies in the **production server**:
    ```bash
    bundle install
    ```

## Starting Server
Perform the following steps:

1. Clone this repository.
1. Start the development server.
    ```bash
    rails s -p 8080
    ```
1. When startup is complete, the console shows the following message:
    ```
    => Booting Puma
    => Rails 5.2.0 application starting in development 
    => Run `rails server -h` for more startup options
    Puma starting in single mode...
    * Version 3.11.4 (ruby 2.5.1-p57), codename: Love Song
    * Min threads: 5, max threads: 5
    * Environment: development
    * Listening on tcp://localhost:8080
    Use Ctrl-C to stop
    ```

## Project Map
The follwing figure is the map of this sample project.

```
- rails-webapp-sample
  - app
    + controllers           … Define controllers.
    + models                … Define models.
    + services              … Define services.
  + config                  … Define configurations such as database connections, dependency libraries, and routings.
  + db                      … Define SQL files to migrate models to the database.
  - Gemfile                 … Define Rails Libraries.
```

## Services
This sample provides 3 services: book management, account management, and master management.

### Book Management
There are the following services in the book management.

|Service Name|HTTP Method|URL|Parameter|Summary|
|:---|:---:|:---|:---|:---|
|List Service|GET|``/api/book/list``|Page|Get a list of books.|
|Regist Service|POST|``/api/book/new``|Book|Regist a book data.|
|Edit Service|POST|``/api/book/edit``|Book|Edit a book data.|
|Delete Service|POST|``/api/book/delete``|Book|Delete a book data.|
|Search Title Service|GET|``/api/book/search``|Keyword, Page|Search a title with  the specified keyword.|
|Report Service(No implementation)|GET|``/api/book/allListPdfReport``|Nothing|Output a list of books to the PDF file.|

### Account Management
There are the following services in the Account management.

|Service Name|HTTP Method|URL|Parameter|Summary|
|:---|:---:|:---|:---|:---|
|Login Service|POST|``/api/account/login``|Session ID, User Name, Password|Session authentication with username and password.|
|Logout Service|POST|``/api/account/logout``|Session ID|Logout a user.|
|Login Status Check Service|GET|``/api/account/loginStatus``|Session ID|Check if the user is logged in.|
|Login Username Service|GET|``/api/account/loginAccount``|Session ID|Get the login user's username.|

### Master Management
There are the following services in the Master management.

|Service Name|HTTP Method|URL|Parameter|Summary|
|:---|:---:|:---|:---|:---|
|Category List Service|GET|``/api/master/category``|Nothing|Get a list of categories.|
|Format List Service|GET|``/api/master/format``|Nothing|Get a list of formats.|

## Libraries
This sample uses the following libraries.

|Library Name|Version|Summary|
|:---|:---:|:---|
|rails|5.2.0|Rails|
|sqlite3|1.3.13|Provides the database connection service.|
|kaminari|1.1.1|Provides the concept of pagination.|
|rack-cors|1.0.2|Library handling for CROS.|

## License
The License of this sample is *MIT License*.
