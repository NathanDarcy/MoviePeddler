<%@ include file="/WEB-INF/jsp/_include.jspf" %>

<div class="col-6 mx-auto">
    <h2>Welcome to The Movie Peddler
        <hr/>
        <small class="text-muted">
           We have some movies for you to buy.
            <br>
            Please 
            <a href="<c:url value="loginpage"/>">login</a> 
            or 
            <a href="<c:url value="registerpage"/>">register</a> with our site to buy our movies.
        </small>
    </h2>

    <br><hr/><br>
    <h2> About this project </h2>
    <p>
        This is a Java Model View Controller (MVC) application that uses MySQL and Hibernate ORM for the model layer, JSP and Bootstrap
        for the view layer, and Spring Boot for the server layer. Users can log in, view a list of products (movies),
        add them to a shopping cart, and simulate purchases by checkout (no money is collected). After submitting an "order",
        users can view their order history, as well as the details of each order. <br><br>

        All HTTP requests are handled through the "MainController," and Database access is handled through Hibernate using
        Spring's CRUDRepository. The project is configured to work on a local Tomcat 8.5.11 Server.<br><br>

        The front end is a combination of JSP and bootstrap, in order to keep the design mobile friendly. Upon resizing the window,
        the navbar will transition to one appropriate for mobile devices.<br><br>

        This was originally a Semester project for an elective class at UMSL, that I have since maintained and added onto as
        a portfolio project.

    </p>
</div>