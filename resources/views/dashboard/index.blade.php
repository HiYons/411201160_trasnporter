@extends('layouts.layout')
@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-6">
              <!-- small box -->
              <div class="small-box bg-success">
                <div class="inner">
                  <p>3 Bulan Terakhir</p>
                  <h2>Total Pengiriman</h2>
                  <h3>{{ $countVisit }}</h3>
                  
                </div>
                <div class="icon">
                  <i class="ion ion-bag"></i>
                </div>
                <a href="{{ url('pengiriman') }}" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-6">
              <!-- small box -->
              <div class="small-box bg-primary">
                <div class="inner">
                  <p>Lokasi Terbanyak 1 Tahun Terakhir</p>
                  <h2>{{ $trendLokasi[0]->nama_lokasi }} </h2>
                  <h3>{{ $trendLokasi[0]->total }}<sup style="font-size: 20px"></sup></h3>
                </div>
                <div class="icon">
                  <i class="ion ion-stats-bars"></i>
                </div>
                <a href="" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-6">
              <!-- small box -->
              <div class="small-box bg-purple">
                <div class="inner">
                  <p>Total Sales</p>
                  <h2>Keseluruhan</h2>
                  <h3>{{ $countSales }}</h3>
  
                  
                </div>
                <div class="icon">
                  <i class="ion ion-person-add"></i>
                </div>
                <a href="" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-6">
              <!-- small box -->
              <div class="small-box bg-danger">
                <div class="inner">
                  <p>Barang Terbanyak 1 Tahun Terakhir</p>
                  <h2>{{ $trendBarang[0]->nama_barang }} </h2>
                  <h3>{{ $trendBarang[0]->total }}<sup style="font-size: 20px"></sup></h3>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
                <a href="" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <!-- ./col -->
          </div>
        <div class="row">


            <div class="card-body">
                <div class="col-md-6 col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div id="pie_chart" style="width:500px; height:450px;"></div>
                                </div>
                                <div class="col-md-6">
                                    <div id="pie_outlet" style="width:500px; height:450px;"></div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
@endsection
@section('custom-page-script')
    <script src="{{ asset('js/code.highcharts.com_highcharts.js') }}"></script>
    <script src="{{ asset('js/code.highcharts.com_modules_exporting.js') }}"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            // UNTUK AMBIL DATA BARANG
            var barang = <?php echo json_encode($listBarang); ?>;
            var options = {
                chart: {
                    renderTo: 'pie_chart',
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },

                title: {
                    text: 'Data Barang'
                },
                tooltip: {
                    pointFormat: '{series.nama_barang}:<b>{point.percentage:.0f}%</b> <br> Count:<b>{series.total}</b>',
                    percentageDecimals: 2
                },
                series: [{
                    type: 'pie',
                    name: 'Total Persentase'
                }]
            }

            // KOMPONEN UTAMA - UNTUK LIST DATA DARI CONTROLLER
            myarray = [];
            $.each(barang, function(index, val) {
                myarray[index] = [val.nama_barang, val.total];
            });

            options.series[0].data = myarray;
            chart = new Highcharts.Chart(options);

            //GET DATA LOKASI
            var lokasi = <?php echo json_encode($listLokasi); ?>;
            var options_lokasi = {
                chart: {
                    renderTo: 'pie_outlet',
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },

                title: {
                    text: 'Data Lokasi'
                },
                tooltip: {
                    pointFormat: '{series.nama_lokasi}:<b>{point.percentage:.0f}%</b> <br> Count:<b>{series.total}</b>',
                    percentageDecimals: 3
                },


                series: [{
                    type: 'pie',
                    name: 'Total Persentase'
                }]
            }

            // KOMPONEN UTAMA - UNTUK LIST DATA DARI CONTROLLER
            array_lokasi = [];
            $.each(lokasi, function(index, val) {
                array_lokasi[index] = [val.nama_lokasi, val.total];
            });

            options_lokasi.series[0].data = array_lokasi;
            chart = new Highcharts.Chart(options_lokasi);

        });
    </script>
@endsection
