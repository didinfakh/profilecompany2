import React from 'react';
import CardBenefit from '../cardBenefit';

export default function Page5() {
  return (
    <div className="container-fluid bg-body-secondary">
      <div className="containerSideNumber">
        <div className="sideLine"></div>
        <div className="sideNumber">05</div>
        <div className="sideLine"></div>
      </div>
      <div className="container containerUtama pb-5">
        <h4 className="fontPurple pt-5">benefit</h4>
        <div className="row mt-5">
          <div className="col-md-6">
            <h1 className="fw-bold text-md-start text-center">THIS WHAT DO YOU NEED FROM US</h1>
          </div>
        </div>
        <div className="row mt-5">
          <CardBenefit
            image="https://www.freeiconspng.com/thumbs/3d-cube-png/3d-cube-outline-8.png"
            title="Benefit 1"
            description="Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit vero repellat a quia pariatur et. quaerat delectus."
          />
          <CardBenefit
            image="https://www.freeiconspng.com/thumbs/3d-cube-png/3d-cube-outline-8.png"
            title="Benefit 2"
            description="Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit vero repellat a quia pariatur et. quaerat delectus."
          />
          <CardBenefit
            image="https://www.freeiconspng.com/thumbs/3d-cube-png/3d-cube-outline-8.png"
            title="Benefit 3"
            description="Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit vero repellat a quia pariatur et. quaerat delectus."
          />
        </div>
      </div>
    </div>
  );
}
