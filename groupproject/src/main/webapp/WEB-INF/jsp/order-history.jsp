<%@ include file="/WEB-INF/jsp/_include.jspf" %>


<div class="col-6 mx-auto">
    <hr/>
    <h5 class="text-center"><c:out value="${user.loginId}'s Order History"></c:out></h5>
    <hr/>
</div>

<c:forEach items="${orders}" var="order">
    <div class="col-6 mx-auto">
        <ul class="list-group  border border-dark">
            <li class="list-group-item list-group-item-dark">
                <a href="orderhistorydetailpage?orderid=${order.id}" class="font-weight-bold">
                    Order Id: ${order.id}</a>
            </li>
            <li class="list-group-item list-group-item-secondary">Order Date: ${order.orderDate}</li>
            <li class="list-group-item list-group-item-secondary">Total Price: $${order.totalPrice}</li>
        </ul>
    </div>
</c:forEach>
 
