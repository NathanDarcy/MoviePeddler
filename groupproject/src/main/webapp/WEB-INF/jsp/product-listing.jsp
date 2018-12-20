<%@ include file="/WEB-INF/jsp/_include.jspf" %>



<div class="container">
  <div class="row">
    <c:forEach  var="product" items="${products}">
      <c:set var="scitem" value="${shoppingcart.findItem(product.partnumber)}"></c:set>
      <div class="card col-6 col-sm-4 col-md-3 col-lg-2  m-3">
        <div class="card-body">
          <div class="card-name font-weight-bold">${product.name}</div>
          <img alt="" src="${product.image}" height="70" width="50">
          <div class="row">
            <div class="col-6">
            <button type="button" data-toggle="modal" data-partnumber="${product.partnumber}" 
              data-target="#productDetailsModal" class="btn btn-primary btn-sm mt-1">
              <i class="fa fa-info-circle"></i>
              View
            </button>
            </div>
            <div class="col-6">
              <c:if test="${not empty scitem}">
                <div class="fa-2x" name="You have ${scitem.quantity} of these items in your cart.">
                 <span class="fa-layers fa-fw">
                    <i class="fas fa-shopping-cart"></i>
                    <span class="fa-layers-text fa-inverse" data-fa-transform="shrink-8 up-2 right-1" style="font-weight:900">${scitem.quantity}</span>
                  </span>
                </div>
              </c:if>
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>

<div class="modal fade" id="productDetailsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-name" id="exampleModalLabel">Modal name</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="row">
            <div class="col-6">
              <img alt="" src="" style="max-height: 100%; max-width: 100%;"/>
            </div>
            <div class="col-6 container">
              
               <div class="col-12 mb-1" id="movie-plot"></div>
               <div class="col-12" id="movie-rated"></div>
               <div class="col-12" id="movie-year"></div>
               <div class=col-12 id="movie-price"></div>
               
               
               <form id="shoppingcartform" class="form-group col-12 row" action="updateShoppingCartItem" method="post" autocomplete="off">
                <input id="shpcrtfrm_partnumber" type="hidden" name="partnumber" value="">
                <label for="shpcrtfrm_quantity" class="col-6 font-weight-bold"> Quantity:</label>
                <input id="shpcrtfrm_quantity" type="number" class="form-control col-6" name="quantity" value="0" min="0">
                
               </form>
            </div>
            
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="$('#shoppingcartform').submit();">Update Cart</button>
      </div>
    </div>
  </div>
</div>



<script>

  $(document).ready(function(){
    
  });
  
  $('#productDetailsModal').on('show.bs.modal', function (event) {
      var button = $(event.relatedTarget) // Button that triggered the modal
      var partnumber = button.data('partnumber') // Extract info from data-* attributes

      var modal = $(this)
      $.ajax({
            url: "viewProductDetails?partnumber="+partnumber,
             
          }).done(function(data) {
            modal.find('.modal-name').text(data.name);
            modal.find('.modal-body img').attr('src',data.image);
            modal.find('.modal-body div#movie-plot').text(data.plot);
            modal.find('.modal-body div#movie-price').html("<span class='font-weight-bold  mr-2'>Price:</span>$"+data.price);
            modal.find('.modal-body div#movie-rated').html("<span class='font-weight-bold  mr-2'>Rating:</span>"+data.rated);
            modal.find('.modal-body div#movie-year').html("<span class='font-weight-bold  mr-2'>Year:</span>"+data.year);
            

            modal.find('.modal-body #shoppingcartform input#shpcrtfrm_partnumber').attr('value',data.partnumber);
            modal.find('.modal-body #shoppingcartform input#shpcrtfrm_quantity').attr('value',data.quantity);
          });
      
//      modal.find('.modal-name').text('New message to ' + recipient)
//      modal.find('.modal-body input').val(recipient)
    }); 
  

</script>


