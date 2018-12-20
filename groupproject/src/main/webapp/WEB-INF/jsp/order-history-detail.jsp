<%@ include file="/WEB-INF/jsp/_include.jspf" %>

<div class="col-6 mx-auto">
    <ul class="list-group  border border-dark mt-1">
        <li class="list-group-item list-group-item-primary  border border-dark text-center">Order ID: ${order.id}</li>
        <li class="list-group-item list-group-item-primary border border-dark text-center">Order Processing
            Date: ${order.orderDate}</li>
        <li class="list-group-item list-group-item-primary border border-dark text-center">Total
            Amount: ${order.totalPrice}</li>
    </ul>

    <hr/>
    <ul class="list-group">
        <c:forEach items="${order.orderItems}" var="orderitem">
            <div>
                <span>
                <li class="list-group-item list-group-item-secondary border border-dark text-center">
                    <strong><c:out value=" ${orderitem.product.name}"/></strong>

                    <img alt="" src="${orderitem.product.image}" height="80" width="60">
                </li>
                </span>
                <li class="list-group-item list-group-item-light border border-dark text-center">
                    product number: ${orderitem.product.partnumber}
                </li>
                <li class="list-group-item list-group-item-light border border-dark text-center">
                    product name: ${orderitem.product.name}
                </li>
                <li class="list-group-item list-group-item-light border border-dark text-center">
                    product price: ${orderitem.product.price}
                </li>

                <li class="list-group-item list-group-item-light border border-dark text-center">
                    quantity: ${orderitem.quantity}
                </li>
                <li class="list-group-item list-group-item-light border border-dark text-center">
                    totalprice: ${orderitem.totalPrice}
                </li>

            </div>

            <br/><br/>


        </c:forEach>
    </ul>
</div>