<?php
	class ControllerCatalogGalleryCategory extends Controller {
		private $error = array();
		
		public function index() {
			$this->load->language('catalog/gallery_category');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('catalog/gallerycategory');
			
			$this->getList();
		}
		
		public function add() {
			$this->load->language('catalog/gallery_category');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('catalog/gallerycategory');
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
				
				$this->model_catalog_gallerycategory->addGallCategory($this->request->post);
				
				$this->session->data['success'] = $this->language->get('text_success');
				
				$url = '';
				
				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}
				
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}
				
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}
				
				//$this->response->redirect($this->url->link('catalog/gallery_category', 'token=' . $this->session->data['token'] . $url, true));
			}
			
			$this->getForm();
		}
		
		public function edit() {
			$this->load->language('catalog/gallery_category');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('catalog/gallerycategory');
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
				$this->model_catalog_gallerycategory->editGallCategory($this->request->get['category_id'], $this->request->post);
				
				$this->session->data['success'] = $this->language->get('text_success');
				
				$url = '';
				
				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}
				
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}
				
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}

				$this->response->redirect($this->url->link('catalog/gallery_category', 'token=' . $this->session->data['token'] . $url, true));
			}
			$this->getForm();
		}
		
		public function delete() {
			$this->load->language('catalog/gallery_category');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('catalog/gallerycategory');
			
			if (isset($this->request->post['selected']) && $this->validateDelete()) {
				foreach ($this->request->post['selected'] as $category_id) {
					$this->model_catalog_gallerycategory->deleteGallCategory($category_id);
				}
				
				$this->session->data['success'] = $this->language->get('text_success');
				
				$url = '';
				
				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}
				
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}
				
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}
				
				$this->response->redirect($this->url->link('catalog/gallery_category', 'token=' . $this->session->data['token'] . $url, true));
			}

			$this->getList();
		}
		
		public function repair() {
			$this->load->language('catalog/gallery_category');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('catalog/gallerycategory');
			
			if ($this->validateRepair()) {
				$this->model_catalog_gallerycategory->repairCategories();
				
				$this->session->data['success'] = $this->language->get('text_success');
				
				$url = '';
				
				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}
				
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}
				
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}
				
				$this->response->redirect($this->url->link('catalog/gallery_category', 'token=' . $this->session->data['token'] . $url, true));
			}
			
			$this->getList();
		}
		
		protected function getList() {
			
			$data['token'] = $this->session->data['token'];
			
			$data['export_url'] = html($this->url->link('catalog/gallery_category/export', 'token=' . $this->session->data['token'], true));
			
			$sort = 'name';
			$order = 'ASC';
			$page = 1;
			
			if (isset($this->request->get['sort'])) {
				$sort = $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$order = $this->request->get['order'];
			}
			
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			}
			
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$data['breadcrumbs'] = array();
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
			);
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/gallery_category', 'token=' . $this->session->data['token'] . $url, true)
			);
			
			$data['add'] = $this->url->link('catalog/gallery_category/add', 'token=' . $this->session->data['token'] . $url, true);
			$data['delete'] = $this->url->link('catalog/gallery_category/delete', 'token=' . $this->session->data['token'] . $url, true);
			$data['repair'] = $this->url->link('catalog/gallery_category/repair', 'token=' . $this->session->data['token'] . $url, true);
			
			$data['categories'] = array();
			
			$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
			);
			
			$category_total = $this->model_catalog_gallerycategory->getTotalGallCategories();
			
			$results = $this->model_catalog_gallerycategory->getGallCategoriesList($filter_data);
			
			$label = $this->language->get('text_backend_only'); 
			// This has span encapsulating the text
			foreach ($results as $result) {
				$data['categories'][] = array(
				'category_id' => $result['gall_cat_id'],
				'name'        => $result['name'],
				'sort_order'  => $result['sort_order'],
				'edit'        => $this->url->link('catalog/gallery_category/edit', 'token=' . $this->session->data['token'] . '&category_id=' . $result['gall_cat_id'] . $url, true),
				'delete'      => $this->url->link('catalog/gallery_category/delete', 'token=' . $this->session->data['token'] . '&category_id=' . $result['gall_cat_id'] . $url, true)
				);
			}

			$data['heading_title'] = $this->language->get('heading_title');
			
			

			$data['text_list'] = $this->language->get('text_list');

			$data['text_no_results'] = $this->language->get('text_no_results');
			$data['text_confirm'] = $this->language->get('text_confirm');
			
			$data['column_name'] = $this->language->get('column_name');
			$data['column_sort_order'] = $this->language->get('column_sort_order');
			$data['column_action'] = $this->language->get('column_action');
			
			$data['button_add'] = $this->language->get('button_add');
			$data['button_edit'] = $this->language->get('button_edit');
			$data['button_delete'] = $this->language->get('button_delete');
			$data['button_rebuild'] = $this->language->get('button_rebuild');
			
			$data['error_warning'] = '';
			$data['success'] = '';
			$data['selected'] = array();
			
			if (isset($this->error['warning'])) {
				$data['error_warning'] = $this->error['warning'];
			}
			
			if (isset($this->session->data['success'])) {
				$data['success'] = $this->session->data['success'];
				
				unset($this->session->data['success']);
			}
			
			if (isset($this->request->post['selected'])) {
				$data['selected'] = (array)$this->request->post['selected'];
			}
			
			$url = '';
			
			if ($order == 'ASC') {
				$url .= '&order=DESC';
			}
			else {
				$url .= '&order=ASC';
			}
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$data['sort_name'] = $this->url->link('catalog/gallery_category', 'token=' . $this->session->data['token'] . '&sort=name' . $url, true);
			$data['sort_sort_order'] = $this->url->link('catalog/gallery_category', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, true);
			
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$pagination = new Pagination();
			$pagination->total = $category_total;
			$pagination->page = $page;
			$pagination->limit = $this->config->get('config_limit_admin');
			$pagination->url = $this->url->link('catalog/gallery_category', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);
			
			$data['pagination'] = $pagination->render();
			
			$data['results'] = sprintf($this->language->get('text_pagination'), ($category_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($category_total - $this->config->get('config_limit_admin'))) ? $category_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $category_total, ceil($category_total / $this->config->get('config_limit_admin')));
			
			$data['sort'] = $sort;
			$data['order'] = $order;
			
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');
			
			$this->response->setOutput($this->load->view('catalog/gallery_category_list', $data));
		}
		
		protected function getForm() {
			$data["base_url"] = HTTPS_CATALOG;
			
			$data['heading_title'] = $this->language->get('heading_title');
			
			$data['text_form'] = !isset($this->request->get['category_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
			$data['text_none'] = $this->language->get('text_none');
			$data['text_default'] = $this->language->get('text_default');
			$data['text_enabled'] = $this->language->get('text_enabled');
			$data['text_disabled'] = $this->language->get('text_disabled');
			
			$data['text_loading'] = $this->language->get('text_loading');
			
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_description'] = $this->language->get('entry_description');
			$data['entry_meta_title'] = $this->language->get('entry_meta_title');
			$data['entry_meta_description'] = $this->language->get('entry_meta_description');
			$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
			$data['entry_keyword'] = $this->language->get('entry_keyword');
			$data['entry_parent'] = $this->language->get('entry_parent');
			$data['entry_filter'] = $this->language->get('entry_filter');
			$data['entry_store'] = $this->language->get('entry_store');
			$data['entry_image'] = $this->language->get('entry_image');
			$data['entry_top'] = $this->language->get('entry_top');
			$data['entry_column'] = $this->language->get('entry_column');
			$data['entry_admin_use'] = $this->language->get('entry_admin_use');
			$data['help_admin_use'] = $this->language->get('help_admin_use');
			$data['entry_sort_order'] = $this->language->get('entry_sort_order');
			$data['entry_status'] = $this->language->get('entry_status');
			$data['entry_layout'] = $this->language->get('entry_layout');
			
			$data['help_filter'] = $this->language->get('help_filter');
			$data['help_keyword'] = $this->language->get('help_keyword');
			$data['help_top'] = $this->language->get('help_top');
			$data['help_column'] = $this->language->get('help_column');
			
			$data['button_save'] = $this->language->get('button_save');
			$data['button_cancel'] = $this->language->get('button_cancel');
			
			$data['tab_general'] = $this->language->get('tab_general');
			$data['tab_data'] = $this->language->get('tab_data');
			$data['tab_design'] = $this->language->get('tab_design');
			
			// Enhanced CKEditor
			if (!file_exists(DIR_CATALOG.'../vqmod/xml/enhanced_file_manager.xml') || file_exists(DIR_CATALOG.'../vqmod/xml/enhanced_file_manager.xml_')) {				
				$data['fm_installed'] = 0;
			}
			if (file_exists(DIR_CATALOG.'../vqmod/xml/enhanced_file_manager.xml') && $this->config->get('fm_installed') == 1) {				
				$data['fm_installed'] = 1;
			}
			
			if ($this->config->get('ea_cke_enable_ckeditor') == 1) {
				$data['ckeditor_enabled'] = 1;
			}
			else {
				$data['ckeditor_enabled'] = 0;
			}
			
			if ($this->config->get('ea_cke_ckeditor_skin')) {
				$data['ckeditor_skin'] = $this->config->get('ea_cke_ckeditor_skin');
			}
			else {
				$data['ckeditor_skin'] = 'moono-lisa';
			}
			
			if ($this->config->get('ea_cke_codemirror_skin')) {
				$data['codemirror_skin'] = $this->config->get('ea_cke_codemirror_skin');
			}
			else {
				$data['codemirror_skin'] = 'eclipse';
			}
			// Enhanced CKEditor	
			
			if (isset($this->error['warning'])) {
				$data['error_warning'] = $this->error['warning'];
			}
			else {
				$data['error_warning'] = '';
			}
			if (isset($this->error['name'])) {
				$data['error_name'] = $this->error['name'];
			}
			else {
				$data['error_name'] = '';
			}
			
			if (isset($this->error['meta_title'])) {
				$data['error_meta_title'] = $this->error['meta_title'];
			}
			else {
				$data['error_meta_title'] = array();
			}
			
			if (isset($this->error['keyword'])) {
				$data['error_keyword'] = $this->error['keyword'];
			}
			else {
				$data['error_keyword'] = '';
			}
			
			if (isset($this->error['parent'])) {
				$data['error_parent'] = $this->error['parent'];
			}
			else {
				$data['error_parent'] = '';
			}
			
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$data['breadcrumbs'] = array();
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
			);
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/gallery_category', 'token=' . $this->session->data['token'] . $url, true)
			);
			
			if (!isset($this->request->get['category_id'])) {
				$data['action'] = $this->url->link('catalog/gallery_category/add', 'token=' . $this->session->data['token'] . $url, true);
			}
			else {
				$data['action'] = $this->url->link('catalog/gallery_category/edit', 'token=' . $this->session->data['token'] . '&category_id=' . $this->request->get['category_id'] . $url, true);
			}
			
			$data['cancel'] = $this->url->link('catalog/gallery_category', 'token=' . $this->session->data['token'] . $url, true);
			
			if (isset($this->request->get['category_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
				$category_info = $this->model_catalog_gallerycategory->getGallCategory($this->request->get['category_id']);
			}
			
			$data['token'] = $this->session->data['token'];
			
			$this->load->model('localisation/language');
			

			if (isset($this->request->get['category_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
				$data['gall_name'] = $category_info['name'];
			}elseif(isset($this->request->post['category_name'])){
				$data['gall_name'] = $this->request->post['category_name'];
			}else{
				$data['gall_name'] = '';
			}
			if (isset($this->request->get['category_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
				$data['gall_description'] = $category_info['description'];
			}elseif(isset($this->request->post['category_description'])){
				$data['gall_description'] = $this->request->post['category_description'];
			}else{
				$data['gall_description'] = '';
			}

			$data['languages'] = $this->model_localisation_language->getLanguages();
			
			if (isset($this->request->post['category_description'])) {
				$data['category_description'] = $this->request->post['category_description'];
			}
			elseif (isset($this->request->get['category_id'])) {
				$data['category_description'] = $this->model_catalog_gallerycategory->getCategoryDescriptions($this->request->get['category_id']);
			}
			else {
				$data['category_description'] = array();
			}
			
			$data['path'] = '';
			$data['parent_id'] = 0;
			
			$this->load->model('catalog/filter');
			
			if (isset($this->request->post['category_filter'])) {
				$filters = $this->request->post['category_filter'];
			}
			elseif (isset($this->request->get['category_id'])) {
				$filters = $this->model_catalog_gallerycategory->getCategoryFilters($this->request->get['category_id']);
			}
			else {
				$filters = array();
			}
			
			$data['category_filters'] = array();
			
			foreach ($filters as $filter_id) {
				$filter_info = $this->model_catalog_filter->getFilter($filter_id);
				
				if ($filter_info) {
					$data['category_filters'][] = array(
					'filter_id' => $filter_info['filter_id'],
					'name'      => $filter_info['group'] . ' &gt; ' . $filter_info['name']
					);
				}
			}
			
			$this->load->model('setting/store');
			
			$data['stores'] = $this->model_setting_store->getStores();
			
			if (isset($this->request->post['category_store'])) {
				$data['category_store'] = $this->request->post['category_store'];
			}
			elseif (isset($this->request->get['category_id'])) {
				$data['category_store'] = $this->model_catalog_gallerycategory->getCategoryStores($this->request->get['category_id']);
			}
			else {
				$data['category_store'] = array(0);
			}
			
			$data['keyword'] = '';
			$data['image'] = '';
			
			
			if (isset($this->request->post['sort_order'])) {
				$data['sort_order'] = $this->request->post['sort_order'];
			}
			elseif (!empty($category_info)) {
				$data['sort_order'] = $category_info['sort_order'];
			}
			else {
				$data['sort_order'] = 0;
			}
			
			
			if (isset($this->request->post['category_layout'])) {
				$data['category_layout'] = $this->request->post['category_layout'];
			}
			elseif (isset($this->request->get['category_id'])) {
				$data['category_layout'] = $this->model_catalog_gallerycategory->getCategoryLayouts($this->request->get['category_id']);
			}
			else {
				$data['category_layout'] = array();
			}
			
			$this->load->model('design/layout');
			
			$data['layouts'] = $this->model_design_layout->getLayouts();
			
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');
			
			$this->response->setOutput($this->load->view('catalog/gallery_category_form', $data));
		}
		
		protected function validateForm() {
			if (!$this->user->hasPermission('modify', 'catalog/gallery_category')) {
				$this->error['warning'] = $this->language->get('error_permission');
			}
			
			$default_language = 1;
			if ((utf8_strlen($this->request->post['category_name']) < 2) || (utf8_strlen($this->request->post['category_name']) > 255)) {
					$this->error['name'] = $this->language->get('error_name');
			}

			// foreach ($this->request->post['category_description'] as $language_id => $value) {
			// 	if ((utf8_strlen($value['name']) < 2) || (utf8_strlen($value['name']) > 255)) {
			// 		$this->error['name'] = $this->language->get('error_name');
			// 	}
			// 	else{
			// 		if( trim($value['meta_title']) == "" ){
			// 			$value['meta_title'] = $this->request->post['category_description'][$language_id]['meta_title']	= $value['name'];
			// 		}
					
			// 		if( $default_language == $language_id && trim($this->request->post["keyword"]) == "" ){
			// 			$this->request->post['keyword'] = generateSlug($value['name']);
			// 		}
			// 	}
				
			// 	if ((utf8_strlen($value['meta_title']) < 3) || (utf8_strlen($value['meta_title']) > 255)) {
			// 		$this->error['meta_title'][$language_id] = $this->language->get('error_meta_title');
			// 	}
			// }
			
			// if (isset($this->request->get['category_id']) && $this->request->post['parent_id']) {
			// 	$results = $this->model_catalog_gallerycategory->getCategoryPath($this->request->post['parent_id']);
				
			// 	foreach ($results as $result) {
			// 		if ($result['path_id'] == $this->request->get['category_id']) {
			// 			$this->error['parent'] = $this->language->get('error_parent');
						
			// 			break;
			// 		}
			// 	}
			// }
			
			if ($this->error && !isset($this->error['warning'])) {
				$this->error['warning'] = $this->language->get('error_warning');
			}
			
			return !$this->error;
		}
		
		protected function validateDelete() {
			if (!$this->user->hasPermission('modify', 'catalog/gallery_category')) {
				$this->error['warning'] = $this->language->get('error_permission');
			}
			return !$this->error;
		}
		public function autocomplete() {
			$json = array();
			
			if (isset($this->request->get['filter_name'])) {
				$this->load->model('catalog/gallerycategory');
				
				$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'sort'        => 'name',
				'order'       => 'ASC',
				'start'       => 0,
				'limit'       => 999
				);
				
				$results = $this->model_catalog_gallerycategory->getFiltGallCategories($this->request->get['filter_name']);
				
				foreach ($results as $result) {
					$json[] = array(
					'category_id' => $result['gall_cat_id'],
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
					);
				}
			}
			
			$sort_order = array();
			
			foreach ($json as $key => $value) {
				$sort_order[$key] = $value['name'];
			}
			
			array_multisort($sort_order, SORT_ASC, $json);
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		
	}
