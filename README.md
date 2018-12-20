# CS5012-GP
Group Project for CS4012/CS5012

# About this project

  This was originally a semester group project from an Enterprise Web Development course at UMSL, which I have kept and continued to add features. This is a Spring Boot project that simulates an e-commerce website that sells movies. It has a mobile responsive front-end through the use of bootstrap, and it utilizes a MySQL Database managed by the Hibernate framework and Spring’s CRUDRepository. All HTTP requests are handled by a Spring Controller. The application is configured to work on a local Tomcat web server.
  
## To Setup/Run This Project


  Please follow the below instructions to run this project successfully.
  1. This application has been tested on a Tomcat 8.5 Web server, it is recommended to use a local Tomcat server instead of the default Spring Boot embedded server.
  2. Use the DB file at /src/main/db/groupproject.sql to create the necessary MySQL database to run this project
  
  Users must log into the project in order to access its list of products. Users can select any number and quantity from a predetermined list of movies and add them to a shopping cart. Upon checkout, an order is generated, and added to order history. No payment is collected. Users can view past orders after they have been submitted through the appropriate link in the navbar.


  *Technologies Used
    Tomcat 8.5 web server
    Spring Boot
    Hibernate
    Bootstrap
