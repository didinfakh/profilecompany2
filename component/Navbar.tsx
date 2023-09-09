'use client';
import React from 'react';
import { useState } from 'react';
import 'bootstrap/dist/js/bootstrap.bundle';

export default function Navbar() {
  const [active, setActive] = useState<string>('Home');
  return (
    <nav className="navbar navbar-expand-lg bg-white container-fluid fixed-top z-1">
      <div className="container">
        <a className="navbar-brand bg-dark-subtle p-2" href="#">
          Logo Here
        </a>
        <button className="navbar-toggler ms-auto me-2" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
          <span className="navbar-toggler-icon"></span>
        </button>
        <div className="collapse navbar-collapse" id="navbarNavDropdown">
          <ul className="navbar-nav ms-auto">
            <li className="nav-item">
              <a
                className={`nav-link ${active == 'Home' && 'active'}`}
                aria-current="page"
                onClick={() => {
                  setActive('Home');
                }}
                href="#Home"
              >
                Home
              </a>
            </li>
            <li className="nav-item">
              <a
                className={`nav-link ${active == 'Service' && 'active'}`}
                aria-current="page"
                onClick={() => {
                  setActive('Service');
                }}
                href="#Service"
              >
                Service
              </a>
            </li>
            <li className="nav-item">
              <a
                className={`nav-link ${active == 'AboutUs' && 'active'}`}
                aria-current="page"
                onClick={() => {
                  setActive('AboutUs');
                }}
                href="#AboutUs"
              >
                About Us
              </a>
            </li>
          </ul>
        </div>
        <a className="text-decoration-none text-white buttonPurple p-2" href="#ContactUs">
          Contact Us
        </a>
      </div>
    </nav>
  );
}
