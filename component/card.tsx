import React from 'react';
interface props {
  image: string;
  title: string;
  description?: string;
}

const Card: React.FC<props> = (props) => {
  return (
    <div className="col-md-3 col-6">
      <div className="card  px-2 pt-2 border-0">
        <img src={props.image} className="card-img-top rounded" alt="..." />
        <div className="card-body p-0">
          <h5 className={`card-title text-center ${!props.description ? 'text-center' : 'text-md-start'}`}>{props.title}</h5>
          <p className="card-text text-md-start text-center">{props.description}</p>
        </div>
      </div>
    </div>
  );
};
export default Card;
