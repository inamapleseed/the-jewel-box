<?php 
class ControllerGalleryAlbum extends Controller {
  public function index() {

    $this->load->language('gallery/gallery');
	
	$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
		 
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_gallery'),
			'href' => $this->url->link('gallery/album')
		);
		$this->document->setTitle('Our Services');
	
	$data['column_left'] = $this->load->controller('common/column_left');
	$data['column_right'] = $this->load->controller('common/column_right');
	$data['content_top'] = $this->load->controller('common/content_top');
	$data['content_bottom'] = $this->load->controller('common/content_bottom');
	$data['footer'] = $this->load->controller('common/footer');
	$data['header'] = $this->load->controller('common/header');
     
	$page = isset($this->request->get['page']) ? $this->request->get['page'] : 1;
	$limit = 12;

	$album_id = isset($this->request->get['album_id']) ? $this->request->get['album_id'] : 0;
	$url = "";
	if(isset($this->request->get['album_id'])){
		$url .= "&album_id=" . $this->request->get['album_id'];
	}
	
	$this->load->model('catalog/gallimage');
	$data['categories'] =  $this->model_catalog_gallimage->getGallCategories();
	foreach ($data['categories'] as $key => $category) {

		$data['categories'][$key]['href'] = $this->url->link('gallery/album','album_id='.$category['gall_cat_id']);

		if($album_id == $category['gall_cat_id']){
			$data['categories'][$key]['active'] = "active";
		}else{
			$data['categories'][$key]['active'] = "";
		}
	}
	$filter_data = array(
		'start' => ($page - 1) * $limit,
		'limit' => $limit,
		'album_id' => $album_id

	);

	$album_total = $this->model_catalog_gallimage->getAlbumTotal($filter_data);
	$results = $this->model_catalog_gallimage->getAlbums($filter_data);

	$data['albums'] = array();

	foreach ($results as $result) {
		$data['albums'][] = array(
			"name"  => $result['name'],
			"status"  => $result['status'],
			"image" => 'image/' . $result['image'],
			"description"  => $result['description'],
			"href" => 	$this->url->link('gallery/gallery','gallimage_id='.$result['gallimage_id'])
		); 
	}
	$pagination = new Pagination();
    $pagination->total = $album_total;
    $pagination->page = $page;
    $pagination->limit = $limit;
    $pagination->text = $this->language->get('text_pagination');
    $pagination->url = $this->url->link('gallery/album', $url . '&page={page}');
    
    if ($limit > $album_total) {
    $data['pagination'] = '';
    $data['results'] = '';    
    } else {
    $data['pagination'] = $pagination->render();   
    $data['results'] = sprintf($this->language->get('text_pagination'), ($album_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($album_total - $limit)) ? $album_total : ((($page - 1) * $limit) + $limit), $album_total, ceil($album_total / $limit));      
    }
    // http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
	// if ($page == 1) {
	//     $this->document->addLink($this->url->link('gallery/album', $url, true), 'canonical');
	// } elseif ($page == 2) {
	//     $this->document->addLink($this->url->link('gallery/album', $url, true), 'prev');
	// } else {
	//     $this->document->addLink($this->url->link('gallery/album', $url . '&page='. ($page - 1), true), 'prev');
	// }

	// if ($limit && ceil($album_total / $limit) > $page) {
	//     $this->document->addLink($this->url->link('gallery/album', $url . '&page='. ($page + 1), true), 'next');
	// }

    if (version_compare(VERSION, '2.2.0.0', '>=')) {
    $this->response->setOutput($this->load->view('gallery/album', $data));    
    } else {   
    if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/gallery/album.tpl')) {
      $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/gallery/album.tpl', $data));
    } else {
      $this->response->setOutput($this->load->view('default/template/gallery/album.tpl', $data));
    }
    }
  }
}
?>