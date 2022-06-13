
    <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <style><%@include file="../css/checkoutModf.css"%></style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkout</title>


</head>

<body>
<%@include file="includes/navbar.jsp"%>

<div class=" container-fluid my-5 ">
    <div class="row justify-content-center ">
        <div class="col-xl-10">
            <div class="card shadow-lg ">
                <div class="row p-2 mt-3 justify-content-between mx-sm-2">
                   
                <div class="row  mx-auto justify-content-center text-center">
                    <div class="col-12 mt-3 ">
                        <nav aria-label="breadcrumb" class="second ">
                            <ol class="breadcrumb indigo lighten-6 first  ">
                                <li class="breadcrumb-item font-weight-bold "><a class="black-text text-uppercase " href="#"><span class="mr-md-3 mr-1">BACK TO SHOP</span></a><i class="fa fa-angle-double-right " aria-hidden="true"></i></li>
                                <li class="breadcrumb-item font-weight-bold"><a class="black-text text-uppercase" href="#"><span class="mr-md-3 mr-1">SHOPPING BAG</span></a><i class="fa fa-angle-double-right text-uppercase " aria-hidden="true"></i></li>
                                <li class="breadcrumb-item font-weight-bold"><a class="black-text text-uppercase active-2" href="#"><span class="mr-md-3 mr-1">CHECKOUT</span></a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            
                <div class="row justify-content-around">
                    <div class="col-md-5">
                        <div class="card border-0">
                            <div class="card-header pb-0">
                                <h2 class="card-title space ">Checkout</h2>
                                <p class="card-text text-muted mt-4  space">SHIPPING DETAILS</p>
                                <hr class="my-0">
                            </div>
                            <div class="card-body">
                                <div class="row justify-content-between">
                                    <div class="col-auto mt-0"><p><b></b></p></div>
                                    <div class="col-auto"><p><b></b> </p></div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col"><p class="text-muted mb-2">PAYMENT DETAILS</p><hr class="mt-0"></div>
                                </div>
                                <div class="form-group">
                                    <label for="NAME" class="small text-muted mb-1">Entrer votre adresse de livraison</label>
                                    <input type="text" class="form-control form-control-sm" name="NAME" id="NAME" aria-describedby="helpId" placeholder>
                                </div>
                                <div class="form-group">
                                    <label for="NAME" class="small text-muted mb-1">Entrer votre ville</label>
                                    <input type="text" class="form-control form-control-sm" name="NAME" id="NAME" aria-describedby="helpId" placeholder>
                                </div>
                                <div class="row no-gutters">
                                    <div class="col-sm-6 pr-sm-2">
                                        <div class="form-group">
                                            <label for="NAME" class="small text-muted mb-1">Enter city</label>
                                            <input type="text" class="form-control form-control-sm" name="NAME" id="NAME" aria-describedby="helpId" placeholder>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="NAME" class="small text-muted mb-1">Entrer votre pays</label>
                                            <input type="text" class="form-control form-control-sm" name="NAME" id="NAME" aria-describedby="helpId" placeholder>
                                        </div>
                             
                                    </div>
                                                <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="NAME" class="small text-muted mb-1">Numero de Telephone</label>
                                            <input type="text" class="form-control form-control-sm" name="NAME" id="NAME" aria-describedby="helpId" placeholder>
                                        </div>
                                        </div>
                                         <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="NAME" class="small text-muted mb-1">Date de Livraison</label>
                                            <input type="text" class="form-control form-control-sm" name="NAME" id="NAME" aria-describedby="helpId" placeholder>
                                        </div>
                                        </div>
                                </div>
                                <div class="row mb-md-5">
                                    <div class="col">
                                        <button type="button" name="" id="" class="btn  btn-lg btn-block ">pay</button>
                                    </div>
                                </div>    
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="card border-0 ">
                            <div class="card-header card-2">
                                <p class="card-text text-muted mt-md-4  mb-2 space">YOUR ORDER <span class=" small text-muted ml-2 cursor-pointer">EDIT SHOPPING BAG</span> </p>
                                <hr class="my-2">
                            </div>
                            <div class="card-body pt-0">
                                <div class="row  justify-content-between">
                                    <div class="col-auto col-md-7">
                                        <div class="media flex-column flex-sm-row">
                                            <img class=" img-fluid" src="https://i.imgur.com/6oHix28.jpg" width="62" height="62">
                                            <div class="media-body  my-auto">
                                                <div class="row ">
                                                    <div class="col-auto"><p class="mb-0"><b>EC-GO Bag Standard</b></p><small class="text-muted">1 Week Subscription</small></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class=" pl-0 flex-sm-col col-auto  my-auto"> <p class="boxed-1">2</p></div>
                                    <div class=" pl-0 flex-sm-col col-auto  my-auto "><p><b>179 SEK</b></p></div>
                                </div>
                                <hr class="my-2">
                                <div class="row  justify-content-between">
                                    <div class="col-auto col-md-7">
                                        <div class="media flex-column flex-sm-row">
                                            <img class=" img-fluid " src="https://i.imgur.com/9MHvALb.jpg" width="62" height="62">
                                            <div class="media-body  my-auto">
                                                <div class="row ">
                                                    <div class="col"><p class="mb-0"><b>EC-GO Bag Standard</b></p><small class="text-muted">2 Week Subscription</small></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pl-0 flex-sm-col col-auto  my-auto"> <p class="boxed">3</p></div>
                                    <div class="pl-0 flex-sm-col col-auto my-auto"><p><b>179 SEK</b></p></div>
                                </div>
                                <hr class="my-2">
                                <div class="row  justify-content-between">
                                    <div class="col-auto col-md-7">
                                        <div class="media flex-column flex-sm-row">
                                            <img class=" img-fluid " src="https://i.imgur.com/6oHix28.jpg" width="62" height="62">
                                            <div class="media-body  my-auto">
                                                <div class="row ">
                                                    <div class="col"><p class="mb-0"><b>EC-GO Bag Standard</b></p><small class="text-muted">2 Week Subscription</small></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pl-0 flex-sm-col col-auto  my-auto"> <p class="boxed-1">2</p></div>
                                    <div class="pl-0 flex-sm-col col-auto my-auto"><p><b>179 SEK</b></p></div>
                                </div>
                                <hr class="my-2">
                                <div class="row ">
                                    <div class="col">
                                        <div class="row justify-content-between">
                                            <div class="col-4"><p class="mb-1"><b>Subtotal</b></p></div>
                                            <div class="flex-sm-col col-auto"><p class="mb-1"><b>179 SEK</b></p></div>
                                        </div>
                                        <div class="row justify-content-between">
                                            <div class="col"><p class="mb-1"><b>Shipping</b></p></div>
                                            <div class="flex-sm-col col-auto"><p class="mb-1"><b>0 SEK</b></p></div>
                                        </div>
                                        <div class="row justify-content-between">
                                            <div class="col-4"><p ><b>Total</b></p></div>
                                            <div class="flex-sm-col col-auto"><p  class="mb-1"><b>537 SEK</b></p> </div>
                                        </div><hr class="my-0">
                                    </div>
                                </div>
                                <div class="row mb-5 mt-4 ">
                                    <div class="col-md-7 col-lg-6 mx-auto"><button type="button" class="btn btn-block btn-outline-primary btn-lg"></button></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp"%>
</body>
</html>