<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>aranoz</title>
</head>
<body>
  <jsp:include page="/WEB-INF/views/top.jsp" />
  <!-- breadcrumb start-->
  <!--================Category Product Area =================-->
  <section class="cat_product_area section_padding">
    <div class="container">
      <div class="row">
        <div class="col-lg-3">
          <div class="left_sidebar_area">
            <aside class="left_widgets p_filter_widgets">
              <div class="l_w_title">
                <h3>iii OnlineShop</h3>
              </div>
              <div class="widgets_inner" style="display: none;">
                <ul class="list">
                  <li><a class="category-btn" href="#"
                    data-type="allproducts1">ALL Product</a> <span
                    id="all"> (8)</span></li>
                  <li><a class="category-btn" href="#"
                    data-type="newpd">New</a> <span>(5)</span></li>
                  <li><a class="category-btn" href="#"
                    data-type="allhots">Hot</a> <span>(6)</span></li>
                </ul>
              </div>
            </aside>
            <aside class="left_widgets p_filter_widgets">
              <div class="l_w_title">
                <h3>Brands</h3>
              </div>
              <div class="widgets_inner"style="display: none;" >
                <ul class="list">
                  <li><a class="category2" href="#"
                    data-type="Logitech" data-target="typeL">Logitech</a>
                    <span id="typeL"></span></li>
                  <li><a class="category2" href="#"
                    data-type="TTeSports" data-target="typet">TTeSports</a>
                    <span id="typet"></span></li>
                  <li><a class="category2" href="#"
                    data-type="Razer" data-target="typer">Razer</a>
                    <span id="typer"></span></li>
                </ul>
              </div>
            </aside>
            <aside class="left_widgets p_filter_widgets">
              <div class="l_w_title">
                <h3>Categories</h3>
              </div>
              <div class="widgets_inner" style="display: none;">
                <ul class="list">
                  <li><a class="category3" href="#"
                    data-type="Mouse" data-target="typem">Mouse</a> <span
                    id="typem"></span></li>
                  <li><a class="category3" href="#"
                    data-type="KeyBoard" data-target="typek">KeyBoard</a> <span
                    id="typek"></span></li>
                  <li><a class="category3" href="#"
                    data-type="Headset" data-target="typee">HeadSet</a> <span
                    id="typee"></span></li>
                  <li><a class="category3" href="#"
                    data-type="MousePad" data-target="typeq">Mouse Pad</a>
                    <span id="typeq"></span></li>
                </ul>
              </div>
            </aside>
            <aside
              class="left_widgets p_filter_widgets price_rangs_aside">
              <div class="l_w_title">
                <h3>Price filter</h3>
              </div>
              <div class="widgets_inner">
                <div class="range_item">
                  <!-- <div id="slider-range"></div> -->
                  <input type="text" class="js-range-slider" value="" />
                  <div class="d-flex">
                    <div style="width: 60px" class="price_text">
                      <p>Price :</p>
                    </div>
                    <div style="width: 100px;"
                      class="price_value d-flex justify-content-center">
                      <input type="text" size="20"
                        class="js-input-from1" /> <span>to</span> <input
                        type="text" class="js-input-to2" />
                    </div>
                  </div>
                </div>
              </div>
            </aside>
          </div>
        </div>
        <div class="col-lg-9">
          <div class="row">
            <div class="col-lg-12">
              <div
                class="product_top_bar d-flex justify-content-between align-items-center">
                <div class="single_product_menu">
                  <p>
                    <span id="all1">${count}</span> 
                  </p>
                </div>
                <div style="float: right; cursor: pointer;">
                  <span
                    class="glyphicon glyphicon-shopping-cart my-cart-icon"><span
                    class="badge badge-notify my-cart-badge"></span></span>
                </div>
                <div class="single_product_menu d-flex">
                  
                </div>
                <form action="<c:url value="/product/Querytype.do"/>"
                  class="form-inline my-2 my-lg-0">
                  <div class="single_product_menu d-flex">
                    <div class="input-group">
                      <input name="type" type="text"
                        class="form-control" size="40px" id="search"
                        placeholder="Search" autocomplete="off"
                        aria-describedby="inputGroupPrepend" >
                       <div id="suggestionBox" class="autocomplete-box">
                       </div>
                      <div class="input-group-prepend">
                        <button type="submit" class="input-group-text"
                          id="inputGroupPrepend">
                          <i class="ti-search"></i>
                        </button>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
          <div class="row align-items-center latest_product_inner"
            id="ajax_pd">
            <jsp:include page="fragment_allproducts.jsp" />
          
          </div>
        </div>
      </div>
    </div>
  </section>
  <script>
	//product datails
		$(document).ready(function () {
		  $("#ajax_pd").on("click", ".detail1", function () {
		    const pid = this.id;
		    window.location.href = "<c:url value='/product/ProductDetail.do/'/>" + pid;
		  });
		});

		$(document).ready(function () {
			  $(".l_w_title h3").click(function () {
				  $(this).parent().next(".widgets_inner").slideToggle();
			  });
			});

	</script>
  <script>
	$(document).ready(function () {
		  $(".category-btn").click(function (e) {
		    e.preventDefault(); 
		    const type = $(this).data("type");
		    
		    $.ajax({
		      url: "<c:url value='/product/'/>" + type,
		      type: "GET",
		      success: function (req) {
		        $("#ajax_pd").html(req); 
		        updateWishlistIcons();
		      },
		      error: function () {
		        alert("fail！");
		      }
		    });
		  });
		});

	$(document).ready(function () {
		  $(".category2").click(function (e) {
		    e.preventDefault(); 
		    const type = $(this).data("type");
		    
		    $.ajax({
		      url: "<c:url value='/product/category.do/'/>" + type,
		      type: "GET",
		      success: function (req) {
		    	  console.log(req)
		        $("#ajax_pd").html(req); 
		        updateWishlistIcons();
		      },
		      error: function () {
		        alert("fail！");
		      }
		    });
		  });
		});
	$(document).ready(function () {
		  $(".category3").click(function (e) {
		    e.preventDefault(); 
		    const type = $(this).data("type");
		    
		    $.ajax({
		      url: "<c:url value='/product/type.do/'/>" + type,
		      type: "GET",
		      success: function (htmlData) {
		        $("#ajax_pd").html(htmlData);      
		    	  updateWishlistIcons();
	    	  
		      },
		      error: function () {
		        alert("fail！");
		      }
		    });
		  });
		});
	$(document).ready(function () {
		  $("#wishlists").click(function (e) {
		    e.preventDefault();     
		    $.ajax({
		      url: "<c:url value='/product/colpd/'/>",
		      type: "GET",
		      success: function (req) {
		        $("#ajax_pd").html(req); 
		    	  updateWishlistIcons();
		      },
		      error: function () {

		        alert("fail111！");
		      }
		    });
		  });
		});


	  
	</script>
  <script>
  
  
		//add cart
    $(document).ready(function () {
      $("#ajax_pd").on("click", ".btn_3", function () {
        const pid = this.id;
        if (window.confirm('Do you want to add to your cart?')) {
			;
			$.ajax({
						url : "<c:url value='/product/ProductDetail.do/CartJs.do'/>",
						dataType : "json", 
						async : true, 
						data : {
							"quantity" : 1,
							"pid" : pid
						}, 
						type : "GET", 
						success : function(req) {
						const cartCount = $('#cartcount');							
                        const itemcount = req.orderItems.length;
                        $('#cartcount').text(itemcount)
                        if (itemcount > 0) {
                        	cartCount.addClass('red');
                          } else {
                        	cartCount.removeClass('red');
                          }
                        },
						error : function() {
							console.log("Error!")
						}
					});

		} else {

			return false;
		}
      });
    });
    //search 
    $(function () {
    	  $('#search').on('keyup', function () {
    	    const keyword = $(this).val();
    	    if (keyword.length > 1) {
    	      $.ajax({
    	        url: "<c:url value='/product/autocomplete.do'/>",
    	        type: 'GET',
    	        data: { keyword: keyword },
    	        error : function() {
					console.log("Error!")
				},
    	        success: function (htmlData) {
    	        	  $("#ajax_pd").html(htmlData); 
    	        	  updateWishlistIcons();
    	        }
    	       
    	      });
    	    }else{
    	    	$.ajax({
        	        url: "<c:url value='/product/allproducts1'/>",
        	        type: 'GET',
        	        error : function() {
    				},
        	        success: function (htmlData) {
        	        	  $("#ajax_pd").html(htmlData); 
        	        	  updateWishlistIcons();
        	        }
        	       
        	      });

                }
    	  });
    	});
   

         //show the pd that has been collected
         $(document).ready(function () {
        	 updateWishlistIcons();
             });
             
         function updateWishlistIcons() {
        	 
        	const pdId = $(".pid");
 			const love = $(".add_cart");

 			pdId.each(function(index) {
 				const pid=$(this).text();
                const loveicon=love.eq(index);

 				$.ajax({
 					type : "GET",
 					url : "<c:url value='/product/checkcol'/>",
 					contentType : "application/json",
 					dataType : "json",
 					data : {
 						"pdId" : pid,
 					},
 					success : function(req) {
 						console.log(req)
                        let pcurl;
 						if (req == 1) {
 							pcurl = "<c:url value='/img/love-2.png'/>"

 						} else {
 							pcurl = "<c:url value='/img/Love-1.png'/>"
 						}
 						loveicon.attr("src",pcurl);
 					}
 				});
 			})
        	}
        	         
    //collect function
   
		$(document).ready(function () {
	        $("#ajax_pd").on("mouseenter", ".add_cart", function () {
	          const img = $(this);
	          const src = img.attr("src");

	          if (src.includes("love-2.png")) {
	            //do nothing
	          } else if (src.includes("Love-1.png")) {
	            
	            img.attr("src", "<c:url value='/img/love-3.png'/>");
	          }
	        });

	        $("#ajax_pd").on("mouseleave", ".add_cart", function () {

	          const img = $(this);
	          const src = img.attr("src");

	          if (src.includes("love-3.png")) {
	            
	            img.attr("src", "<c:url value='/img/Love-1.png'/>");
	          }
	        });
	      });

		//collect buttom
        $(document).ready(function () {
        	  $("#ajax_pd").on("click", ".add_cart", function () {
        		  const img = $(this);
    	          const src = img.attr("src");
					if (src.includes("love-2.png")) {                 
                    		
        		    const pid = img.attr("id");

					if (window.confirm('Do you want to cancel?')) {
						img.attr("src", "<c:url value='/img/Love-1.png'/>");
						$.ajax({
							url : "<c:url value = '/product/deletcol'/>", //url
							dataType : "json", 
							async : true, 
							data : {
								"pid" : pid
							}, 
							type : "Get", //request
							success : function(req) {
							
							},
							complete : function() {
								
							},
							error : function() {
								console.log("Error!")
							}
						});

					} else {

						return false;
					}
					
				} else if(src.includes("love-3.png")){
				
					const pid = img.attr("id");
					
					if (window.confirm('Add to your favorite?')) {
						;
						this.src = "<c:url value='/img/love-2.png'/>"
						$.ajax({
							url : "<c:url value='/product/addcol'/>", 
							dataType : "json", 
							async : true, 
							type : "Get",
							data : {
								"pdId" : pid
							}, 
							
							success : function(req) {

							},
							complete : function() {
								
							},
							error : function() {
								console.log("error!")
							}
						});
					} else {

						return false;
					}
					}
			})
		});
        

           
            // pdcount
			$(document).ready(function () {
				  $(".category3").each(function () {
				    const type = $(this).data("type");
				    const target = $(this).data("target");
          
				    $.ajax({
				      url: "<c:url value='/product/showtypecount'/>",
				      dataType: "json",
				      async: true,
				      type: "GET",
				      data: { type: type },
				      success: function (req) {
				    	
				        $("#" + target).text("(" + req + ")");
				      },
				      error: function () {
				        console.log("error：" + type);
				      }
				    });
				  });
				});		
			$(document).ready(function () {
				  $(".category2").each(function () {
				    const type = $(this).data("type");
				    const target = $(this).data("target");
        
				    $.ajax({
				      url: "<c:url value='/product/showcatecount'/>",
				      dataType: "json",
				      async: true,
				      type: "GET",
				      data: { cate: type },
				      success: function (req) {
				    	
				        $("#" + target).text("(" + req + ")");
				      },
				      error: function () {
				        console.log("error：" + type);
				      }
				    });
				  });
				});			
		


		

	</script>
  
</body>
</html>
<!-- jquery plugins here-->
