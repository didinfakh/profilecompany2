import React from 'react';
interface props {
  image: string;
  title: string;
  description?: string;
}

const CardBenefit: React.FC<props> = (props) => {
  return (
    <div className="col-md-4 mt-md-0 mt-3">
      <div className="card  px-2 pt-2 border-0">
        <div className="card-body">
          <div className="row">
            <div className="col-3 bg-body-secondary p-2">
              <img src={props.image} className="card-img-top rounded" alt="..." />
            </div>
          </div>
          <h5 className={`mt-3 card-title ${!props.description && 'text-center'}`}>{props.title}</h5>
          <p className=" mt-3 card-text">{props.description}</p>
        </div>
      </div>
    </div>
  );
};
export default CardBenefit;
