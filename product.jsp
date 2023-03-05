<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("currentSessionUser")==null)
      response.sendRedirect("/jsp-projek/login.jsp");

%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="dist/css/dashboard.css" crossorigin="anonymous">

    <!-- Select2 -->
    <link href="select2/css/select2.min.css" rel="stylesheet" />
    <!-- end Select2 -->

    <!-- Sweetalert -->
    <link href="sweetalert2/sweetalert2.min.css" rel="stylesheet" />
    <!-- Sweetalert -->

    <title>Hello, world!</title>
  </head>

  <body style="background-color: #f2f3f8">
<jsp:include page="my-header.jsp"/>
    
    <div class="container-fluid">
      <div class="row">
<jsp:include page="my-sidebar.jsp"/>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">

          <div class="card">
            <div class="card-header">
              <h3>PRODUCTS               
                <a href="ProductController?action=ProductAdd" class="btn btn-primary float-right">
                <span data-feather="plus-circle">
                </span>
                ADD PRODUCT</a>
              </h3>
            </div>

            <div class="card-body">
              <div class="table-responsive">
                <br>
                <table class="table table-striped table-sm">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>Product Name</th>
                      <th>Quantity left</th>
                      <th>Ori Price</th>
                      <th>Sell Price</th>
                      <th style="width: 20%;">Action</th>
                    </tr>
                  </thead>
                  <tbody>
	                  <c:forEach items="${products}" var="product">
	                    <tr class="tablerow">
	                      <td></td>
	                      <td><c:out value="${product.product_name}" /></td>
	                      <td><c:out value="${product.product_quantity}" /></td>
	                      <td><c:out value="${product.product_ori_price}" /></td>
	                      <td><c:out value="${product.product_sell_price}" /></td>
	                      <td>
	                        <a href="ProductController?action=ProductView&productid=<c:out value="${product.product_id}" />" class="btn btn-info btn-sm">
	                          <span data-feather="eye"></span>
	                        </a>
	                        <a href="ProductController?action=ProductEdit&productid=<c:out value="${product.product_id}" />" class="btn btn-warning btn-sm">
	                          <span data-feather="edit"></span>
	                        </a>
	                        <button data-product-id="<c:out value="${product.product_id}" />" class="btn btn-danger btn-sm deleteproduct">
	                          <span data-feather="trash"></span>
	                        </button>
	                        <a href="quantity_add.html" class="btn btn-success btn-sm" data-toggle="modal" data-target="#exampleModal">
	                          <span data-feather="plus"></span>
	                        </a> 
	                      </td>
	                    </tr>
	                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>

          </div>

        </main>

      </div>
    </div>

  <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Add Quantity</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <input type="number" class="form-control" id="exampleInputPassword1" placeholder="quantity">
              </div>
            </form>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" data-dismiss="modal">Save changes</button>
          </div>
        </div>
      </div>
    </div>
    <!--end modal -->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

    <!--select2 -->
    <script src="select2/js/select2.min.js"></script>

    <script>
        $(document).ready(function() {
        $('.addproduct').select2(
          {
            width: '80%'
          });
    });
    </script>
    <!-- end Select2 -->

    <!--sweetalert -->
    <script src="sweetalert2/sweetalert2.min.js"></script>
    <!--sweetalert -->

	 <script>
	  $('.deleteproduct').click(function(event){
	      var productId = $(this).data('product-id');
	  swal({
	  title: 'Are you sure?',
	  text: "You won't be able to revert this!",
	  type: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: 'Yes, delete it!'
	  }).then((result) => {
		  if (result.value) {
			    swal(
			      'Deleted!',
			      'Your file has been deleted.',
			      'success'
			    ).then(function() { 
			        $.ajax({
			            type: "GET",
			            url: "ProductController?action=ProductDelete&productid="+ productId,
			            success: function (response) {
			                window.location.href = 'ProductController?action=ProductList';
			                console.log("success");
			            }
			        });
			      })
			  }
			})
	});
	</script>
    
    <script>
    $('.tablerow').each(function (i) {
    	   $("td:first", this).html(i + 1);
    	});
    </script>

  </body>
</html>