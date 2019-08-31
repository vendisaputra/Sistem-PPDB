<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Modalmain extends CI_Model {

    public function addData($table, $data) {
        return $this->db->insert($table, $data);
    }
    public function getData($table){
    	return $this->db->get($table);
    }
    public function whereData($table,$where){
    	return $this->db->get_where($table,$where);
    }
    public function updateData($table, $data, $where) {
        return $this->db->update($table, $data, $where);
    }
    public function getData_sort($table,$limit,$order_by,$ket='ASC',$where){
        $this->db->where($where);
        $this->db->order_by($order_by, $ket);
        $this->db->limit($limit);
        return $this->db->get($table);
    }
    public function search_get_data($table,$where,$limi=NULL,$offset=NULL,$order_by,$ket='ASC'){
        $this->db->order_by($order_by, $ket);
        return $this->db->get_where($table,$where,$limi,$offset);
    }
    public function searchGet($table,$limit=NULL,$offset=NULL,$order_by,$ket='ASC'){
        $this->db->order_by($order_by, $ket);
        $this->db->limit($limit,$offset);
        return $this->db->get($table);
    }
    public function getLike($table,$title=NULL,$match=NULL,$limit=NULL,$offset=NULL,$order_by,$ket='ASC'){
        $this ->db ->like ($title[0],$match);
        $this->db->or_like($title[1],$match);
        $this->db->or_like($title[2],$match);
        $this->db->order_by($order_by, $ket);
        $this->db->limit($limit,$offset);
        return $this->db->get($table);
    }
    public function show_data($table,$where,$order_by,$ket='ASC'){
        $this->db->order_by($order_by, $ket);
        return $this->db->get_where($table,$where);
    }
    public function show_data_order($table,$order_by,$ket='ASC'){
        $this->db->order_by($order_by, $ket);
        return $this->db->get($table);
    }
    function create() {
        $this->db->select('id_content, tgl_terbit');
        $this->db->from('content');
        $this->db->order_by('id_content',"ASC");
        $query = $this->db->get();
        return $query->result();
    }
}