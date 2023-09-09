import Link from 'next/link';
import React from 'react';

function Page1() {
  return (
    <>
      <div className="container-fluid containerImageBuilding" id=" Home">
        <div className="containerSideNumber">
          <div className="sideLine"></div>
          <div className="sideNumber">01</div>
          <div className="sideLine"></div>
        </div>
        <div className="row d-flex justify-content-end">
          <div id="containerBackgroundImageBuilding" className="col-md-6">
            <div className="triangle d-none d-md-flex"></div>
          </div>
        </div>
      </div>
      <div id="containerTextPage1" className="container d-flex  align-items-md-start align-items-center justify-content-center">
        <h1 className=" bigText pe-md-3 m-0 px-4 px-md-0   bg-white fw-bold text-md-start d-inline-block text-center">LOREM IPSUM</h1>
        <h1 className=" bigText pe-md-3 m-0 px-4 px-md-0 bg-white fw-bold text-md-start d-inline-block text-center">DOLOR SIT AMET</h1>
        <div className="row d-flex d-md-block justify-content-center">
          <div className="col-md-6 mt-md-0 mt-3">
            <p className="text-center text-md-start textResponsiveWhite">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Facere voluptatum in placeat non illum aut nesciunt! Animi magni eaque asperiores.</p>
          </div>
        </div>
        <Link href="#ContactUs" className="buttonPurple pt-2 pb-2 text-white mt-3 text-decoration-none">
          Get In Touch
        </Link>
      </div>
    </>
  );
}

export default Page1;
