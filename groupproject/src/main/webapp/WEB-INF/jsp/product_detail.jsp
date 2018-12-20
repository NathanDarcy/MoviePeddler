<%@ include file="/WEB-INF/jsp/_include.jspf" %>
Product Detail


partnumber = ${product.partnumber}<br/>
name=${product.name}<br/>
qty = ${shoppingcartitem eq null?0:shoppingcartitem.quantity}

<form action="updateShoppingCartItem" method="POST">
  <input type="hidden" name="partnumber" value="${product.partnumber}">
  <input type="text" name="quantity" value="${shoppingcartitem eq null?0:shoppingcartitem.quantity}">
  <button type="submit">Update Order</button>
</form>