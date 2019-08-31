<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Modalmain extends CI_Model {

    public function addData($table, $data) {
        return $this->db->insert($table, $data);
    }
    public function getData($table) {
        return $this->db->get($table);
    }
    public function deleteData($table,$where){
        return $this->db->delete($table,$where);
    }
    public function getDatasortir($table, $where) {
        return $this->db->get_where($table,$where);      
    }
    public function updateData($table, $data, $where) {
        return $this->db->update($table, $data, $where);
    }
    public function show_data_order($table,$order_by,$ket='ASC'){
        $this->db->order_by($order_by, $ket);
        return $this->db->get($table);
    }
    public function mdir($lokasi="",$folder = "") {
        $structure = $lokasi.$folder;
        if (!file_exists($structure)) {
            @mkdir($structure, 0777, true);
            @fwrite(fopen($structure . "/index.html", "w"), "Directory access is forbidden.");
        }
        return $structure;
    }
    public function remdir($lokasi="",$folder = '') {
        $path  = $lokasi.$folder;
        $files = @glob($path . '/*');
        foreach ($files as $file) {
            @is_dir($file) ? remove_dir($file) : @unlink($file);
        }
        @rmdir($path);
        return $path;
    }
    public function clear(){
        $this->db->empty_table('daftar');
    }

}