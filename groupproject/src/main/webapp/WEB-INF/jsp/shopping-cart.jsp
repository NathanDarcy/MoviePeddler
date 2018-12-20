<%@ include file="/WEB-INF/jsp/_include.jspf" %>


<c:choose>
    <c:when test="${empty shoppingcart.shoppingCartItems }">

        <div class="col-6 mx-auto">
            <h3>
                There are no items in your shopping cart.
                <hr/>
                <small class="text-muted">Navigate to our product listing page to browse our products!</small>
            </h3>
        </div>
    </c:when>
    <c:otherwise>
        <form:form cssClass="form-group" action="submitOrder" modelAttribute="orderform">
            <c:forEach var="orderitem" items="${orderform.orderItems}" varStatus="status">

                <ul class="list-item-group mt-1">
                    <div class="col-6 mx-auto">
                        <li class="list-group-item list-group-item-secondary border border-dark text-center">
                            <strong>${orderitem.name}</strong>
                            <img alt="" src="${orderitem.image}" height="70" width="50">
                        </li>
                        <li class="list-group-item list-group-item-light border border-dark text-center">
                            Part number: ${orderitem.partnumber}
                        </li>
                        <li class="list-group-item list-group-item-light border border-dark text-center">
                            Quantity: ${orderitem.quantity}

                            <div class="col-6 mx-auto">
                                <form:input cssClass="form-control" path="orderItems[${status.index}].quantity"/>
                                <form:hidden path="orderItems[${status.index}].partnumber"/>
                            </div>
                        </li>
                    </div>
                </ul>

            </c:forEach>
            <div class="col-6 mx-auto">
                <button class="btn btn-primary" type="submit">Submit</button>
            </div>
        </form:form>
        <%-- <form action="submitOrder">
         <c:forEach var="item" items="${shoppingcart.shoppingCartItems}" varStatus="status">
           <div>
             <div>${item.product.partnumber}</div>
             <div>${item.product.name}</div>
             <div>${item.quantity}</div>
             <input type="text" name="orderItems[${status.index}].quantity" value="${item.quantity}">
             <input type="hidden" name="orderItems[${status.index}].partnumber" value="${item.product.partnumber}"/>
           </div>
         </c:forEach>
         <button type="submit">Submit</button>
         </form>
        --%>
    </c:otherwise>

</c:choose>