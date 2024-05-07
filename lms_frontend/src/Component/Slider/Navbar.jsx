import React from 'react';
import { Link } from 'react-router-dom';
import './Navbar.css'
import cookies from 'js-cookie'
import Cookies from 'js-cookie';

function Navbar(props) {
const {logo}=props;

  return (
    <nav>
      <div className="navbar-container">
        <div className="logo">{logo}</div>
        <div className='ul'>
          <div className='li'>{Cookies.get('name')}</div>
          <div className="dpbg li">
            <div className="dp">
            </div>
          </div>

        </div>


      </div>
    </nav>
  );
}

export default Navbar;
