<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Languages extends CI_Controller
{
	public $data = [];

	public function __construct()
	{
		parent::__construct();
	}

	function change($language = "") {
		$language = ($language != "") ? $language : "english";
		if($this->languages_model->get_languages('',$language) && file_exists('./application/language/'.$language.'/custom_labels_lang.php')){
			$this->session->set_userdata('lang', $language);
		}
		redirect($_SERVER['HTTP_REFERER']);
	}
}
