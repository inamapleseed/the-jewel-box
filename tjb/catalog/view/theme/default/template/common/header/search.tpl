<div class="searchBox">
    <button class="dropdownBtn">
        <img src="image/catalog/slicing/header/header-search.png" class="nav-img" alt="search icon">
    </button>

    <div class="close" style="display: none;">&times;</div>
    <div class="searchFunction" id="myDropdown" style="display: none;">
      <div class="searchInput flex">
        <input type="search" name="search" value="<?php echo $search; ?>" autocomplete="off" placeholder="I'm searching for.." class="form-control search-input" />
        <button type="button"><i class="fa fa-search"></i></button>
      </div>
      <div class="searchResults"></div>
    </div>
</div>

<script>
	$(document).ready(function(){
	  $(".dropdownBtn").on("click", function(){
	    $(".searchFunction").toggle();
      $(".close").toggle();
	  });
	});
</script>

<script type="text/javascript">
    $(document).ready(function(){
        
        var delay = (function(){
          var timer = 0;
          return function(callback, ms){
          clearTimeout (timer);
          timer = setTimeout(callback, ms);
         };
        })();

        
        $('.search-input').blur(function(){
             setTimeout(function(){
                  $('.searchResults').slideUp();
             }, 500);
        });
        
        
        $('.search-input').keyup(function() {
             var keyword = $(this).val();
          delay(function(){
              // console.log('aa');
          if(keyword.length !== 0) {
              $.ajax({
                  type: 'GET',
                  url: 'index.php?route=product/search/keyword&search='+encodeURIComponent(keyword),
                  dataType: 'json',
                  beforeSend: function(e){
                        $('.searchResults').slideDown().delay(800);
                        $('.searchResults').html('<p class="text-center">Loading...</p>');
                  },
                  success: function(data) {
                      
                      var content = '';
                     
                      content+= '<div class="bgc_white flex flexSearch">';
                        
                          if(data.category.length > 0) {
                            content+= '<h4>Categories</h4>';
                              content+= '<div class="width_30">';
                                  $.each(data.category, function( index, value ) {
                                      content+= '<div class="res-row">';
                                          content += '<div class="res-name"><a href="'+value.url+'">'+value.name+'</a></div>';
                                      content +='</div>';
                                  });
                              content +='</div>';
                          }
                          if(data.res.length > 0) {
                              if(data.category.length > 0) {
                                  content+= '<div class="width_70">';
                              }else{
                                  content+= '<div class="width_100">';
                              }
                              content+= '<h4>Products</h4>';
                                  $.each(data.res, function( index, value ) {
                                    
                                      content+= '<div class="res-row">';
                                          content += '<div class="res-img-holder flex">';
                                          content += '<div class="res-image"><img src="'+value.image+'" alt="img" class="img-responsive"/></div>';
                                          content += '<div class="res-name"><a href="'+value.url+'">'+value.name+'</a></div>';
                                          content +='</div>';
                                            content += '<div>';
                                          content +='</div>';
                                      content +='</div>';
                                  });
                                  if(data.res.length > 0) {
                                      content+= '<div class="col-sm-12">';
                                          content+= '<div class="all-res">';
                                              content+= '<a href="<?=$search_url?>&search='+keyword+'" class="search-all-btn">See All Products</a>';
                                          content +='</div>';
                                      content +='</div>';
                                  }
                              content +='</div>';
                          }
                          if(data.category.length < 1 && data.res.length < 1){
                              content+= '<div class="width_100">';
                                  content+= '<div class="all-res">';
                                      content+= '<p>No result</p>';
                                  content +='</div>';
                              content +='</div>';
                          }
                      content +='</div>';
                      $('.searchResults').slideDown().delay(800);
                      $('.searchResults').html(content);
                  }
              });
            } else {
                     $('.searchResults').hide();
            }
          }, 700 );
        });
        
    });
</script>

<style type="text/css">
	.searchBox .searchFunction {
	    position: absolute;
	    background-color: #ffffff;
	    min-width: 25%;
	    overflow: auto;
	    z-index: 1;
	    right: 2%;
	    top: 100%;
	    text-align: right;
	    padding: 20px;
	    height: 60vh;
	}
	.dropdownBtn {
	    position: relative;
	    border: none;
	    background-color: transparent;
	}
	.show {display:block;}

	.searchResults {
	    position: absolute;
	    width: calc(100% - 10px);
	    left: 0px;
	    display: none;
	    background: white;
	    padding: 25px 22px;
	}
	.searchInput input.form-control {
	    background-color: transparent;
	    border: none;
	    box-shadow: inset 0 0px 0px rgba(0,0,0,.0);
	    -webkit-box-shadow: inset 0 0px 0px rgba(0,0,0,.0);
	}
	.searchInput button {
	    border: none;
	    background-color: transparent;
	}
	.searchResults h4 {
	    text-align: left;
	    margin-bottom: 15px;
	}
	.width_30, .width_70, .width_100 {
	    margin-bottom: 20px;
	}
	.res-name {
	    text-align: left;
	}
	.flexSearch {
	    flex-direction: column;
	}
	.res-row {
	    margin-bottom: 15px;
	}
	.res-image {
	    width: 30%;
	    margin-right: 15px;
	}
	.res-image img {
	    width: 100%;
	}
	.all-res {
	    color: #231f20;
	    font-weight: 400;
	    text-align: center;
	}
	.all-res  a {
	    color: #231f20;
	    font-weight: 400;
	}
	.img-holder.flex {
	    align-items: center;
	}
</style>

<script type="text/javascript">
  $(document).mouseup(function(e) {
      var container = $(".searchFunction");

      // if the target of the click isn't the container nor a descendant of the container
      if (!container.is(e.target) && container.has(e.target).length === 0) {
          container.hide();
      }
  });

  $(".searchBox .close").click(function(){
    $(".searchFunction").css("display", "none");
    $(this).css("display", "none");
  })
</script>