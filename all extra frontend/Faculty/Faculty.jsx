import React, { useEffect, useState } from 'react'
import './Faculty.css'
import Slider from '../Slider/Slider'
import Navbar from '../Slider/Navbar'
import axios from 'axios';
import Cookies from 'js-cookie'

function Faculty() {
  const [FacultyData,setFacultyData]=useState(null);
  useEffect(() => {
    const fetchData = () => {
      const facultyInfo = { 'faculty_id': Cookies.get('faculty_id') };
      axios.post(`http://localhost:5000/facultydata`, facultyInfo)
        .then(response => {
          console.log(response.data);
          setFacultyData(response.data);
        }).catch(error => {
          console.log(error);
        })


    }
    fetchData();
  }, [])
  return (
    <>
    <Navbar logo="Faculty Panel"/>
    <Slider/>
        <div className="content-container">
        <h2>WELCOME TO FACULTY Dashboard</h2>
        {FacultyData && FacultyData.length > 0 ? (
          <div className="form grid">
            <h2> Basic Information</h2>
            <div className='input'>
              <label htmlFor="First_name">First Name:</label>
              <input type="text" name="first_name" value={FacultyData[0].first_name} readOnly />
            </div>
            <div className='input'>
              <label htmlFor="Last_name">Last Name:</label>
              <input type="text" name="last_name" value={FacultyData[0].last_name} readOnly />
            </div>
            <div className='input'>
              <label htmlFor="Address">Address:</label>
              <input type="text" name="address" value={FacultyData[0].address} readOnly />
            </div>
            <div className='input'>
              <label htmlFor="gender">Gender:</label>
              <input type="text" name="gender" value={FacultyData[0].gender} readOnly />
            </div>
            <div className='input'>
              <label htmlFor="email">Email id:</label>
              <input type="text" name="email" value={FacultyData[0].email} readOnly />
            </div>
            <div className='input'>
              <label htmlFor="phone">Phone no:</label>
              <input type="text" name="phone" value={FacultyData[0].phone_number} readOnly />
            </div>
            <div className='input'>
              <label htmlFor="department">Deaprtment Name:</label>
              <input type="text" name="department" value={FacultyData[0].department_name} readOnly />
            </div>
          




          </div>
        ) : (<p className='No_result'>NO record Found</p>)}

    </div>
    </>
  )
}

export default Faculty