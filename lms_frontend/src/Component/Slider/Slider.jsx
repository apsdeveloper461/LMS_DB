import React, { useState } from 'react'
import { Link } from 'react-router-dom'
import './Slider.css'

function Slider({parsedData}) {
return (
    <>
        <div className="sidebar active">
            <ul>
                {parsedData.map((item, index) => (
                    <li key={index}><Link to={item.link}>{item.content}</Link></li>
                ))}
                <li><Link to="/logout">Log Out</Link></li>
            </ul>
        </div>
    </>
);

}

export default Slider