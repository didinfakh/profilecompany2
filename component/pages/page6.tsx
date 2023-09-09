import React from 'react';

export default function Page6() {
  return (
    <div className="container-fluid containerImagePage6" id="ContactUs">
      <div className="containerSideNumber">
        <div className="sideLine"></div>
        <div className="sideNumber">06</div>
        <div className="sideLine"></div>
      </div>
      <div className="container">
        <div className="row">
          <div className="col-12">
            <h4 className="text-white pt-3 mt-5">contact us</h4>
          </div>
        </div>

        <h1 className="fw-bold text-white mt-5 text-md-start text-center">GET IN TOUCH WITH US</h1>
        <div className="row mt-5">
          <div className="col-md-6">
            <form action="">
              <div className="row">
                <div className="col-12 d-flex justify-content-between">
                  <input type="text" placeholder="Name" style={{ height: '30px' }} className="rounded" id="inputName" />
                  <input type="text" placeholder="Email" style={{ height: '30px' }} className="rounded" id="inputEmail" />
                </div>
              </div>
              <div className="row mt-4">
                <div className="col-12">
                  <input type="text" placeholder="Subject" style={{ width: '100%', height: '30px' }} className="rounded" />
                </div>
              </div>
              <div className="row mt-4">
                <div className="col-12">
                  <textarea placeholder="Messages" style={{ width: '100%', height: '100px' }} className="rounded" />
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
}
