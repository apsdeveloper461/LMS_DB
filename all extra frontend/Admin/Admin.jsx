import React from 'react'
import './Admin.css'
import Slider from '../Slider/Slider'
import Navbar from '../Slider/Navbar'

function Admin() {
  return (
    <>
    <Navbar/>
    <Slider/>
    <div className="content-container">
    <h2>WELCOME TO ADMIN</h2>
        <p>This is your dashboard where you can access various features.</p>
    </div>
    </>
  )
}

export default Admin