import Link from 'next/link';
import React from 'react';

export default function MiniPage2() {
  return (
    <div className="container-fluid">
      <div className="containerSideNumber">
        <div className="miniSideLine"></div>
      </div>
      <div id="containerImageMiniPage" className="container-fluid p-0 d-flex align-items-center justify-content-center">
        <div className="container">
          <h4 className=" fontPurple">calculator</h4>
          <div className="row d-flex justify-content-between mt-4">
            <div className="col-md-6">
              <h1 className="fw-bold text-md-start text-center">COIL CALCULATOR LET'S GET STARTED TO TRY</h1>
            </div>
            <div className="col-md-4 d-flex column justify-content-md-end  justify-content-center align-items-center">
              <Link href="/eror" className="buttonPurple px-4 py-2 text-white text-decoration-none">
                Try Calculator
              </Link>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
