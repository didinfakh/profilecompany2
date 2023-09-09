import React from 'react';
import Card from '../card';

export default function Page4() {
  return (
    <div className="container-fluid bg-body-secondary">
      <div className="containerSideNumber">
        <div className="sideLine"></div>
        <div className="sideNumber">04</div>
        <div className="sideLine"></div>
      </div>
      <div className="row">
        <div className="col-md-11 ms-auto p-0">
          <div className="container-fluid containerUtama">
            <div className="row">
              <div className="col-12">
                <h4 className="fontPurple mt-5">material</h4>
              </div>
            </div>
            <div className="row mt-5 d-flex justify-content-md-between justify-content-center">
              <div className="col-md-5 text-md-start text-center">
                <h1 className="fw-bold">THIS WHAT WE CAN DO FOR YOU!! </h1>
              </div>
            </div>
            <div className="row mt-5">
              <Card
                image="https://media.istockphoto.com/id/1313352860/id/foto/set-close-up-dari-diameter-yang-berbeda-tabung-bulat-logam-ilustrasi-3d-industri.jpg?s=612x612&w=0&k=20&c=WQHNqDW1hELcwjyF9a5KzpAxEllZ2wpm4lYkxcVbeU4="
                title="create pipe"
              />
              <Card
                image="https://media.istockphoto.com/id/1402667848/id/foto/tukang-ledeng-di-tempat-kerja-di-kamar-mandi-layanan-perbaikan-pipa-merakit.jpg?s=612x612&w=0&k=20&c=PuJ4Fq90tZrmJ-qdIluubc-U5Fpi0j6R835IN53rCKo="
                title="fixed pipe"
              />
              <Card
                image="https://media.istockphoto.com/id/1250837651/id/foto/peralatan-pemurnian-minyak-close-up-pipa-industri-dari-pabrik-kilang-minyak-detail-pipa-minyak.jpg?s=1024x1024&w=is&k=20&c=EVriN4F9b43yGK8Md1eE9Qq0u9inOTgou82fQhVCZ0s="
                title="pabrik pipe"
              />
              <Card image="https://plus.unsplash.com/premium_photo-1682145396728-e5a802f28166?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGlwZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60" title="instalation pipe" />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
