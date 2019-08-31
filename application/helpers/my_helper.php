<?php
defined('BASEPATH') or exit('No direct script access allowed');

if (!function_exists('image')) {
    function image($post_id = null, $image_type = 'medium')
    {
        $image = glob("assets/user/img/berita/{$post_id}/*-{$image_type}.*")[0];
        if (!$image) {
            $image = glob("assets/user/img/berita/{$image_type}.*")[0];
        }
        return base_url($image);
    }
}
if (!function_exists('getimage')) {
    function getimage($post_id = null, $image_type = 'medium')
    {
        $image = glob("assets/user/img/kop/{$post_id}/*-{$image_type}.*")[0];
        if (!$image) {
            $image = glob("assets/user/img/kop/{$image_type}.*")[0];
        }
        return base_url($image);
    }
}
if (!function_exists('image_slider')) {
    function image_slider($post_id = null, $image_type = 'medium')
    {
        $image = glob("assets/user/img/slider/{$post_id}/*-{$image_type}.*")[0];
        if (!$image) {
            $image = glob("assets/user/img/slider/{$image_type}.*")[0];
        }
        return base_url($image);
    }
}
if (!function_exists('tgl_indo')) {
    function tgl_indo($tanggal)
    {
        $tanggal = date('d-m-Y', strtotime($tanggal));
        $bulan = array(
            1 => 'Januari',
            2 => 'Februari',
            3 => 'Maret',
            4 => 'April',
            5 => 'Mei',
            6 => 'Juni',
            7 => 'Juli',
            8 => 'Agustus',
            9 => 'September',
            10 => 'Oktober',
            11 => 'November',
            12 => 'Desember',
        );
        $pecahkan = explode('-', $tanggal);
        return $pecahkan[0] . ' ' . $bulan[(int) $pecahkan[1]] . ' ' . $pecahkan[2];
    }
}

if (!function_exists('ambil_hari')) {
    function ambil_hari($tanggal)
    {
        $day = date('D', strtotime($tanggal));
        $dayList = array(
            'Sun' => 'Minggu',
            'Mon' => 'Senin',
            'Tue' => 'Selasa',
            'Wed' => 'Rabu',
            'Thu' => 'Kamis',
            'Fri' => 'Jumat',
            'Sat' => 'Sabtu',
        );
        return $dayList[$day];
    }
}
if (!function_exists('getmail')) {
    function getmail($mail)
    {

        return $dayList[$day];
    }
}

if (!function_exists('penyebut')) {
    function penyebut($nilai)
    {
        $nilai = abs($nilai);
        $huruf = array("", "satu", "dua", "tiga", "empat", "lima", "enam", "tujuh", "delapan", "sembilan", "sepuluh", "sebelas");
        $temp = "";
        if ($nilai < 12) {
            $temp = " " . $huruf[$nilai];
        } else if ($nilai < 20) {
            $temp = penyebut($nilai - 10) . " belas";
        } else if ($nilai < 100) {
            $temp = penyebut($nilai / 10) . " puluh" . penyebut($nilai % 10);
        } else if ($nilai < 200) {
            $temp = " seratus" . penyebut($nilai - 100);
        } else if ($nilai < 1000) {
            $temp = penyebut($nilai / 100) . " ratus" . penyebut($nilai % 100);
        } else if ($nilai < 2000) {
            $temp = " seribu" . penyebut($nilai - 1000);
        } else if ($nilai < 1000000) {
            $temp = penyebut($nilai / 1000) . " ribu" . penyebut($nilai % 1000);
        } else if ($nilai < 1000000000) {
            $temp = penyebut($nilai / 1000000) . " juta" . penyebut($nilai % 1000000);
        } else if ($nilai < 1000000000000) {
            $temp = penyebut($nilai / 1000000000) . " milyar" . penyebut(fmod($nilai, 1000000000));
        } else if ($nilai < 1000000000000000) {
            $temp = penyebut($nilai / 1000000000000) . " trilyun" . penyebut(fmod($nilai, 1000000000000));
        }
        return $temp;
    }
}

if (!function_exists('terbilang')) {
    function terbilang($niali)
    {
        if ($niali < 0) {
            $hasil = "minus " . trim(penyebut($niali));
        } else {
            $hasil = trim(penyebut($niali));
        }
        return $hasil;
    }
}

if (!function_exists('rupiah')) {
    function rupiah($niali)
    {
        $hasil_rupiah = "Rp " . number_format($niali, 2, ',', '.');
        return $hasil_rupiah;
    }
}

if (!function_exists('jm_tanggal')) {
    function jm_tanggal($tanggal, $tambah)
    {
        $nilai = date('d-m-Y', strtotime('+' . $tambah . 'days', strtotime($tanggal))); //operasi penjumlahan tanggal
        return $nilai;
    }
}

if (!function_exists('tm_biaya')) {
    function tm_biaya($key)
    {
        $CI = &get_instance();
        $t = $CI->db->get_where('setting', array('tittle' => $key));
        return $t;
    }
}
if (!function_exists('get_metsos')) {
    function get_metsos($key)
    {
        $CI = &get_instance();
        $t = $CI->db->get_where('sekolah', array('header' => $key))->row();
        return $t->value;
    }
}
if (!function_exists('get_biaya')) {
    function get_biaya($key)
    {
        $CI = &get_instance();
        $t = $CI->db->get_where('setting', array('tittle' => $key))->result();
        $data = array();
        foreach ($t as $ke) {
            $row = array();
            $row = $ke->content;
            $data[] = $row;
        }
        return $data;
    }
}
if (!function_exists('getname')) {
    function getname($table, $key)
    {
        $CI = &get_instance();
        $t = $CI->db->get_where($table, $key)->row();
        $tampil = $t->nama;
        $tampil = explode(',', $tampil);
        return array($tampil[0], $tampil[1], $tampil[2]);
    }
}
if (!function_exists('getnames')) {
    function getnames($table)
    {
        $CI = &get_instance();
        $t = $CI->db->get($table)->row();
        $tampil = $t->nama;
        $tampil = explode(',', $tampil);
        return array($tampil[0], $tampil[1], $tampil[2]);
    }
}
if (!function_exists('getstatus')) {
    function getstatus($key)
    {
        $CI = &get_instance();
        $t1 = $CI->db->get_where('ayah', $key)->num_rows();
        $t2 = $CI->db->get_where('ibu', $key)->num_rows();
        $t3 = $CI->db->get_where('calon_siswa', $key)->num_rows();
        $t4 = $CI->db->get_where('biaya', $key)->num_rows();
        if ($t1 >= 1 and $t2 >= 1 and $t3 >= 1 and $t4 >= 1) {
            return true;
        } else {
            return false;
        }
    }
}
if (!function_exists('getalamat')) {
    function getalamat($table, $key)
    {
        $CI = &get_instance();
        $t = $CI->db->get_where($table, $key)->row();
        $tampil = $t->alamat;
        $tampil = explode(',', $tampil);
        return array($tampil[0], $tampil[1], $tampil[2], $tampil[3], $tampil[4], $tampil[5]);
    }
}
if (!function_exists('finalisasi')) {
    function finalisasi($key)
    {
        $CI = &get_instance();
        $a = $CI->db->get_where('daftar', $key)->row();
        $tampil = $a->ket;
        if ($tampil == 0) {
            return true;
        } else {
            return false;
        }

    }
}
function konfirm($key){
    $CI = &get_instance();
    $t = $CI->db->query("SELECT *FROM setting WHERE tittle = '" . $key . "' ")->row();
    $tampil = $t->content;
    $tampil = explode('/', $tampil);
    $ukuran = array($tampil[0], $tampil[1], $tampil[2], $tampil[3]);
    return $ukuran;
}
if (!function_exists('truncate')) {
    function truncate($html, $length = 100, $ending = '...')
    {
        if (!is_string($html)) {
            trigger_error('Function \'truncate_html\' expects argument 1 to be an string', E_USER_ERROR);
            return false;
        }

        if (mb_strlen(strip_tags($html)) <= $length) {
            return $html;
        }
        $total = mb_strlen($ending);
        $open_tags = array();
        $return = '';
        $finished = false;
        $final_segment = '';
        $self_closing_elements = array(
            'area', 'base', 'br', 'col', 'frame', 'hr', 'img', 'input', 'link', 'meta', 'param',
        );
        $inline_containers = array(
            'a', 'b', 'abbr', 'cite', 'em', 'i', 'kbd', 'span', 'strong', 'sub', 'sup',
        );
        while (!$finished) {
            if (preg_match('/^<(\w+)[^>]*>/', $html, $matches)) {
                if (!in_array($matches[1], $self_closing_elements)) {
                    $open_tags[] = $matches[1];
                }
                $html = substr_replace($html, '', 0, strlen($matches[0]));
                $return .= $matches[0];
            } elseif (preg_match('/^<\/(\w+)>/', $html, $matches)) {
                $key = array_search($matches[1], $open_tags);
                if ($key !== false) {
                    unset($open_tags[$key]);
                }
                $html = substr_replace($html, '', 0, strlen($matches[0]));
                $return .= $matches[0];
            } else {
                if (preg_match('/^([^<]+)(<\/?(\w+)[^>]*>)?/', $html, $matches)) {
                    $segment = $matches[1];
                    $segment_length = mb_strlen(preg_replace('/&[0-9a-z]{2,8};|&#[0-9]{1,7};|&#x[0-9a-f]{1,6};/i', ' ', $segment));
                    if ($segment_length + $total > $length) {
                        $remainder = $length - $total;
                        $entities_length = 0;
                        if (preg_match_all('/&[0-9a-z]{2,8};|&#[0-9]{1,7};|&#x[0-9a-f]{1,6};/i', $segment, $entities, PREG_OFFSET_CAPTURE)) {
                            foreach ($entities[0] as $entity) {
                                if ($entity[1] + 1 - $entities_length <= $remainder) {
                                    $remainder--;
                                    $entities_length += mb_strlen($entity[0]);
                                } else {
                                    break;
                                }
                            }
                        }
                        $finished = true;
                        $final_segment = mb_substr($segment, 0, $remainder + $entities_length);
                    } else {
                        $return .= $segment;
                        $total += $segment_length;
                        $html = substr_replace($html, '', 0, strlen($segment));
                    }
                } else {
                    $finshed = true;
                }
            }
        }
        if (strpos($final_segment, ' ') === false && preg_match('/<(\w+)[^>]*>$/', $return)) {
            $return = preg_replace('/<(\w+)[^>]*>$/', '', $return);
            $key = array_search($matches[3], $open_tags);
            if ($key !== false) {
                unset($open_tags[$key]);
            }
        } else {
            $return .= mb_substr($final_segment, 0, mb_strrpos($final_segment, ' '));
        }
        $return = trim($return);
        $len = strlen($return);
        $last_char = substr($return, $len - 1, 1);
        if (!preg_match('/[a-zA-Z0-9]/', $last_char)) {
            $return = substr_replace($return, '', $len - 1, 1);
        }
        $closing_tags = array_reverse($open_tags);
        $ending_added = false;
        foreach ($closing_tags as $tag) {
            if (!in_array($tag, $inline_containers) && !$ending_added) {
                $return .= $ending;
                $ending_added = true;
            }
            $return .= '</' . $tag . '>';
        }
        return $return;
    }
}
function hitung_umur($birthday){
    // Convert Ke Date Time
    $biday = new DateTime($birthday);
    $today = new DateTime();
    
    $diff = $today->diff($biday);
    return $diff->y;
}

	function FormatNoTrans($num){
        $num=$num+1;
        switch (strlen($num))
        {
            case 1 : $NoTrans = "000".$num; break;
            case 2 : $NoTrans = "00".$num; break;
            case 3 : $NoTrans = "0".$num; break;
            
            default: $NoTrans = $num;   
        }      
        return $NoTrans;
    }
/* End of file my_helper.php */
/* Location: ./application/helpers/my_helper.php */
