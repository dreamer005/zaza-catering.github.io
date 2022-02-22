@extends('layouts.dashboard')
@section('content')
<div class="container-fluid">
  <div class="row">
    <div class="col-6 col-lg-3">
      <div class="small-box bg-primary">
        <div class="inner">
          <h3>5</h3>

          <p>Order Baru</p>
        </div>
        <div class="icon">
          <i class="ion ion-bag"></i>
        </div>
        <a href="/admin/wishlist" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
      </div>
    </div>
    <div class="col-6 col-lg-3">
      <div class="small-box bg-info">
        <div class="inner">
          <h3>5</h3>

          <p>Produk</p>
        </div>
        <div class="icon">
          <i class="ion ion-pie-graph"></i>
        </div>
        <a href="/admin/produk" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
      </div>
    </div>
    <div class="col-6 col-lg-3">
      <div class="small-box bg-warning">
        <div class="inner">
          <h3>5</h3>

          <p>Member</p>
        </div>
        <div class="icon">
          <i class="ion ion-person-add"></i>
        </div>
        <a href="/admin/customer" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
      </div>
    </div>

    <div class="col-6 col-lg-3">
      <div class="small-box bg-success">
        <div class="inner">
          <h3>5</h3>

          <p>Transaksi</p>
        </div>
        <div class="icon">
          <i class="ion ion-stats-bars"></i>
        </div>
        <a href="/admin/transaksi" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
      </div>
    </div>
  </div>
  <!-- table produk baru -->
  <div class="row">
    <div class="col">
      <div class="card">
        <div class="card-header">
          <h4 class="card-title">Produk Baru</h4>
          <div class="card-tools">
            <a href="/admin/produk" class="btn btn-sm btn-primary">
              More
            </a>
          </div>
        </div>
        <div class="card-body">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>No</th>
                <th>Kode</th>
                <th>Nama</th>
                <th>Kategori</th>
                <th>Qty</th>
                <th>Harga</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>001</td>
                <td>Tepung Terigu</td>
                <td>Ingedrients</td>
                <td>10 pack</td>
                <td>10.000</td>
              </tr>
              <tr>
                <td>2</td>
                <td>002</td>
                <td>Telur</td>
                <td>Ingedrients</td>
                <td>10 pack</td>
                <td>20.000</td>
              </tr>
              <tr>
                <td>3</td>
                <td>003</td>
                <td>Donat</td>
                <td>Cookies</td>
                <td>10 pack</td>
                <td>45.000</td>
              </tr>
              <tr>
                <td>4</td>
                <td>004</td>
                <td>Roti Sosis</td>
                <td>Bread</td>
                <td>10 pack</td>
                <td>10.000</td>
              </tr>
              <tr>
                <td>5</td>
                <td>005</td>
                <td>Roti Coklat</td>
                <td>Bread</td>
                <td>10 pack</td>
                <td>10.000</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection