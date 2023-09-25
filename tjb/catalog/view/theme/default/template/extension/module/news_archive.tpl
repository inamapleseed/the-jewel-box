<button id="articles-filter-trigger-open" class="btn btn-primary" onclick="$('#articles-column-left').addClass('open');" ><?= $button_filter; ?></button>
<div id="articles-column-left">
	<button id="articles-filter-trigger-close" class="btn btn-danger fixed position-right-top" onclick="$('#articles-column-left').removeClass('open');"> <i class="fa fa-times"></i> </button>
	<div class="pd-b15">
		<select class="list-group news-ctgr custom-select" onchange="location = this.value">
			<option disabled selected="selected">Category</option>
			<?php foreach ($categories as $c) { ?>
				<option value="<?= $c['url'] ?>"><?= $c['name'] ?>
				</option>
			<?php } ?>
		</select>
	</div>

</div>
<script type="text/javascript">
$(document).ready(function () {
	$('#articles-column-left .toggle').on('click', function(e){
	
		e.preventDefault();
		ele = $(this).parents('.list-group-item');
		
		if(ele.hasClass('active')){
			ele.removeClass('active');
		}
		else{ 
			if(ele.hasClass('.level-1')){
				$('.level-1.active').removeClass('active');
			}
			else if(ele.hasClass('.level-2')){
				$('.level-2.active').removeClass('active');
			}
			
			ele.addClass('active');
		}
	});

});
</script>