<%@ include file="/WEB-INF/jsp/_include.jspf" %>

<form:form cssClass="" modelAttribute="registrationform" method="POST" action="register">
    <div class="col-6 mx-auto form-group">
        <form:label path="loginid">Username:</form:label>
        <form:input cssClass="form-control" cssErrorClass="form-control border border-danger" path="loginid" placeholder="User Name"/>
        <form:errors path="loginid"/>
    </div>

    <div class="col-6 mx-auto form-group">
        <form:label path="password">Password:</form:label>
        <form:password cssClass="form-control" cssErrorClass="form-control border border-danger" path="password" placeholder="Password"/>
        <form:errors path="password"/>
    </div>

    <div class="col-6 mx-auto form-group">
        <form:label path="firstname">First Name:</form:label>
        <form:input cssClass="form-control" cssErrorClass="form-control border border-danger" path="firstname" placeholder="First Name"/>
        <form:errors cssClass="text-danger" path="firstname"/>
    </div>

    <div class="col-6 mx-auto form-group">
        <form:label path="lastname">Last Name:</form:label>
        <form:input cssClass="form-control" cssErrorClass="form-control border border-danger" path="lastname" placeholder="Last Name"/>
        <form:errors cssClass="text-danger" path="lastname"/>
    </div>

    <div class="col-6 mx-auto form-group">
        <form:label path="address">Address:</form:label>
        <form:input cssClass="form-control" cssErrorClass="form-control border border-danger" path="address" placeholder="Address"/>
        <form:errors cssClass="text-danger" path="address"/>
    </div>

    <div class="col-6 mx-auto form-group">
        <form:label path="city">City:</form:label>
        <form:input cssClass="form-control" cssErrorClass="form-control border border-danger" path="city" placeholder="City"/>
        <form:errors cssClass="text-danger" path="city"/>
    </div>

    <div class="col-6 mx-auto form-group">
        <form:label path="state">State:</form:label>
        <form:input cssClass="form-control" cssErrorClass="form-control border border-danger" path="state" placeholder="State"/>
        <form:errors cssClass="text-danger" path="state"/>
    </div>


    <div class="col-6 mx-auto form-group">
        <form:label path="zipcode">Zip:</form:label>
        <form:input cssClass="form-control" cssErrorClass="form-control border border-danger"  path="zipcode" placeholder="Zip Code"/>
        <form:errors cssClass="text-danger" path="zipcode"/>
    </div>
    <div class="col-6 mx-auto form-group">
        <button class="btn btn-primary" type="submit" name="submit">Register</button>
    </div>
</form:form>