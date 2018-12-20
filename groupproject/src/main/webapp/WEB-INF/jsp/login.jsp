<%@ include file="/WEB-INF/jsp/_include.jspf" %>


<form:form cssClass="form-group" modelAttribute="loginForm" method="POST" action="login">
    <div class="col-6 mx-auto">
        <form:label path="loginid">Username:</form:label>
        <form:input cssClass="form-control" path="loginid"/>
        <form:errors path="loginid"/>
    </div>

    <div class="col-6 mx-auto">
        <form:label path="password">Password:</form:label>
        <form:password cssClass="form-control" path="password"/>
        <form:errors path="password"/>
    </div>

    <div class="col-6 mx-auto mt-3">
        <button class="btn btn-primary" type="submit" name="submit">Login</button>
    </div>
</form:form>

<c:if test="${not empty LoginError}">
    <div class="col-6 mx-auto mt-3 text-danger">${LoginError}</div>
</c:if>