import React from 'react';
import Card from '../card';
import Link from 'next/link';

export default function Page2() {
  return (
    <div className="container-fluid" id="Service">
      <div className="containerSideNumber">
        <div className="sideLine"></div>
        <div className="sideNumber">02</div>
        <div className="sideLine"></div>
      </div>
      <div className="row">
        <div className="col-md-11 ms-auto pb-md-0 pb-5">
          <div className="container-fluid containerUtama">
            <div className="row pt-2">
              <div className="col-12">
                <h4 className="fontPurple mt-5">service</h4>
              </div>
            </div>
            <div className="row mt-5 d-flex justify-content-between">
              <div className="col-md-5">
                <h1 className="fw-bold text-md-start text-center">THIS WHAT WE CAN DO FOR YOU!! </h1>
              </div>
              <div className="col-md-4 fw-bold text-md-start text-center">
                <p>
                  We also a <b>special order</b>
                  <br />
                  Lorem ipsum dolor sit amet consectetur.
                </p>
                <Link href="/eror" className="fontPurple">
                  Click Here
                </Link>
              </div>
            </div>
            <div className="row mt-5">
              <Card
                image="https://media.istockphoto.com/id/1313352860/id/foto/set-close-up-dari-diameter-yang-berbeda-tabung-bulat-logam-ilustrasi-3d-industri.jpg?s=612x612&w=0&k=20&c=WQHNqDW1hELcwjyF9a5KzpAxEllZ2wpm4lYkxcVbeU4="
                title="create pipe"
                description=" Lorem ipsum dolor sit, amet consectetur adipisicing elit. Soluta quaerat possimus atque tenetur, corporis inventore."
              />
              <Card
                image="https://media.istockphoto.com/id/1402667848/id/foto/tukang-ledeng-di-tempat-kerja-di-kamar-mandi-layanan-perbaikan-pipa-merakit.jpg?s=612x612&w=0&k=20&c=PuJ4Fq90tZrmJ-qdIluubc-U5Fpi0j6R835IN53rCKo="
                title="fixed pipe"
                description=" Lorem ipsum dolor sit, amet consectetur adipisicing elit. Soluta quaerat possimus atque tenetur, corporis inventore."
              />
              <Card
                image="https://media.istockphoto.com/id/1250837651/id/foto/peralatan-pemurnian-minyak-close-up-pipa-industri-dari-pabrik-kilang-minyak-detail-pipa-minyak.jpg?s=1024x1024&w=is&k=20&c=EVriN4F9b43yGK8Md1eE9Qq0u9inOTgou82fQhVCZ0s="
                title="pabrik pipe"
                description=" Lorem ipsum dolor sit, amet consectetur adipisicing elit. Soluta quaerat possimus atque tenetur, corporis inventore."
              />
              <Card
                image="https://plus.unsplash.com/premium_photo-1682145396728-e5a802f28166?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGlwZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"
                title="instalation pipe"
                description=" Lorem ipsum dolor sit, amet consectetur adipisicing elit. Soluta quaerat possimus atque tenetur, corporis inventore."
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
