<?php
class ModelCatalogGallerycategory extends Model { 
	public function addGallCategory($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "gall_category SET description = '" . $this->db->escape($data['category_description']) . "',name = '" . $this->db->escape($data['category_name']) . "'");
	}

	public function editGallCategory($category_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "gall_category SET description = '" . $this->db->escape($data['category_description']) . "',name = '" . $this->db->escape($data['category_name']) . "',sort_order = '" . (int)$data['sort_order'] . "' WHERE gall_cat_id = '" . (int)$category_id . "'");
	}
	public function deleteGallCategory($category_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "gall_category WHERE gall_cat_id = '" . (int)$category_id . "'");
	}

	public function getGallCategories($gall_id) {
		$sql = "SELECT g2c.category_id FROM " . DB_PREFIX . "gallery_to_category g2c WHERE g2c.gallery_id = '" . (int)$gall_id . "'";

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getGallCategory($category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gall_category gc WHERE gc.gall_cat_id = '" . (int)$category_id . "'");
		return $query->row;
	}
	public function getFiltGallCategories($data) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gall_category gc WHERE gc.name LIKE '%" . $this->db->escape($data) . "%'");
		return $query->rows;
	}
	public function getGallCategories2($gall_id) {
		$sql = "SELECT g2c.category_id FROM " . DB_PREFIX . "gallery_to_category g2c WHERE g2c.gallery_id = '" . (int)$gall_id . "'";

		$query = $this->db->query($sql);

		return $query->rows;
	}
	
	public function getCategories($data = array()) {
		$sql = "SELECT cp.category_id AS category_id, cd2.name as short_name, GROUP_CONCAT(cd1.name ORDER BY cp.level SEPARATOR '&nbsp;&nbsp;&gt;&nbsp;&nbsp;') AS name, GROUP_CONCAT(cd1.category_id ORDER BY cp.level SEPARATOR '_') AS category_path, c1.parent_id, c1.sort_order, c1.backend_only FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "category c1 ON (cp.category_id = c1.category_id) LEFT JOIN " . DB_PREFIX . "category c2 ON (cp.path_id = c2.category_id) LEFT JOIN " . DB_PREFIX . "category_description cd1 ON (cp.path_id = cd1.category_id) LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (cp.category_id = cd2.category_id) WHERE cd1.language_id = '" . (int)$this->config->get('config_language_id') . "' AND cd2.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (isset($data['backend_only'])) {
			$sql .= " AND c1.backend_only='" . (int)$data['backend_only'] . "'";
		}

		if (!empty($data['filter_name'])) {
			$data['filter_name'] = strtolower($data['filter_name']);
			$sql .= " AND LCASE(cd2.name) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sql .= " GROUP BY cp.category_id";

		$sort_data = array(
			'name',
			'sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY sort_order";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if($data['limit'] > -1){
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}
	
				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}
	
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}
	
	public function getGallCategoriesList($data) {

		$sql = "SELECT * FROM " . DB_PREFIX . "gall_category gc";

		if (isset($data['sort'])) {
			$sql .= " ORDER BY " . $data['sort'] . " " . $data['order'];
		} else {
			$sql .= " ORDER BY sort_order";
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}	
	public function getTotalGallCategories() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "gall_category");

		return $query->row['total'];
	}


	//doubt
	public function getCategoryDescriptions($category_id) {
		$category_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_description WHERE category_id = '" . (int)$category_id . "'");

		foreach ($query->rows as $result) {
			$category_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword'],
				'description'      => $result['description']
			);
		}

		return $category_description_data;
	}

	public function getCategoryFilters($category_id) {
		$category_filter_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_filter WHERE category_id = '" . (int)$category_id . "'");

		foreach ($query->rows as $result) {
			$category_filter_data[] = $result['filter_id'];
		}

		return $category_filter_data;
	}

	public function getCategoryStores($category_id) {
		$category_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_to_store WHERE category_id = '" . (int)$category_id . "'");

		foreach ($query->rows as $result) {
			$category_store_data[] = $result['store_id'];
		}

		return $category_store_data;
	}
	public function getCategoryLayouts($category_id) {
		$category_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_to_layout WHERE category_id = '" . (int)$category_id . "'");

		foreach ($query->rows as $result) {
			$category_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $category_layout_data;
	}
	
}