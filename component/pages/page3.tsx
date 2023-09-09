import Link from 'next/link';
import React from 'react';

export default function Page3() {
  return (
    <div className="container-fluid containerPage3" id="AboutUs">
      <div className="containerSideNumber">
        <div className="sideLine"></div>
        <div className="sideNumber">02</div>
        <div className="sideLine"></div>
      </div>
      <div className="row">
        <div className="col-md-11 ms-auto p-0">
          <div className="container-fluid containerUtama">
            <div className="row bg-warning d-flex justify-content-end">
              <div className="col-md-6 position-absolute me-md-5" id="containerImagePage3"></div>
            </div>
            <div className="row mt-5 pt-3">
              <div className="col-md-7 position-absolute text-white">
                <h4>About us</h4>
                <h1 className="textPage3 mt-5 d-md-inline-block text-md-start text-center">LOREM IMPSUM DOLOR SIT AMET.</h1>
                <h1 className="textPage3 d-md-inline-block text-md-start text-center">CONSECTECTUSR ADISIP ELIT</h1>
                <h1 className="textPage3 d-md-inline-block text-md-start text-center">EXERCITATIOM.</h1>
                <div className="row">
                  <div className="col-md-8 mt-5 text-md-start text-center">
                    <p className="">
                      Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quidem quaerat aut enim assumenda veritatis distinctio illum nulla quibusdam consectetur quo! Dolor quod laboriosam, velit quasi illo, fuga nulla ipsam dolorem
                      consequatur distinctio, modi maiores praesentium! Nihil sunt placeat similique numquam.
                    </p>
                  </div>
                  <div className="d-flex justify-content-center justify-content-md-start">
                    <Link href="/eror" className=" font-purple buttonPurple bg-white text-decoration-none">
                      See Detail
                    </Link>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
