<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Helpers\Helper;
use App\Pengiriman;

class PengirimanController extends Controller
{
    public function getPengiriman(){
        $pengiriman = Pengiriman::orderBy("id", "desc")->get();
        return Helper::toJson($pengiriman);
    }

    public function tambahPengiriman(Request $request)
    {

        $pengiriman = new Pengiriman();
        $pengiriman->no_pengiriman = $request->no_pengiriman;
        $pengiriman->tanggal = $request->tanggal;
        $pengiriman->lokasi_id = $request->lokasi_id;
        $pengiriman->barang_id = $request->barang_id;
        $pengiriman->jumlah_barang = $request->jumlah_barang;
        $pengiriman->harga_barang = $request->harga_barang;
        $pengiriman->kurir_id = $request->kurir_id;
        $pengiriman->status = 0;
        $pengiriman->save();
        return Helper::toJson($pengiriman, "Data Pengiriman sudah ditambah");
            
        
    }

    public function ubahStatus(Request $request)
    {

        $pengiriman = Pengiriman::where("id", $request->id)->first();
        $pengiriman->status = $request->status;
        $pengiriman->save();
        return Helper::toJson($pengiriman, "Data status sudah diubah");


    }
}
