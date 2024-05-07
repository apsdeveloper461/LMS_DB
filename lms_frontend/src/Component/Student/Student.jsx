import React, { useEffect, useState } from 'react'
import './student.css'
import Slider from '../Slider/Slider'
import Navbar from '../Slider/Navbar'
import axios from 'axios';
import Cookies from 'js-cookie'
import parsedToStudentSlider from './menu';

function Student() {

  const [studentData, setStudentData] = useState(null);
  useEffect(() => {
    const fetchData = () => {
      const studentInfo = { 'student_id': Cookies.get('student_id') };
      axios.post(`http://localhost:5000/studentdata`, studentInfo)
        .then(response => {
          // console.log(response.data);
          setStudentData(response.data);
        }).catch(error => {
          console.log(error);
        })


    }
    fetchData();
  }, [])
  return (
    <>
      <Navbar logo="Student Panel" />
      <Slider parsedData={parsedToStudentSlider}/>
      <div className="content-container">
        <h1>WELCOME TO Student Dashboard</h1>
        {studentData && studentData.length > 0 ? (
          <div className="form grid">
            <h2> Basic Information</h2>
            <div className='input'>
              <label htmlFor="First_name">First Name:</label>
              <input type="text" name="first_name" value={studentData[0].first_name} readOnly />
            </div>
            <div className='input'>
              <label htmlFor="Last_name">Last Name:</label>
              <input type="text" name="last_name" value={studentData[0].last_name} readOnly />
            </div>
            <div className='input'>
              <label htmlFor="Address">Address:</label>
              <input type="text" name="address" value={studentData[0].address} readOnly />
            </div>
            <div className='input'>
              <label htmlFor="gender">Gender:</label>
              <input type="text" name="gender" value={studentData[0].gender} readOnly />
            </div>
            <div className='input'>
              <label htmlFor="gender">DOB:</label>
              <input type="text" name="gender" value={studentData[0].date_of_birth} readOnly />
            </div>
            <div className='input'>
              <label htmlFor="email">Email id:</label>
              <input type="text" name="email" value={studentData[0].email} readOnly />
            </div>
            <div className='input'>
              <label htmlFor="phone">Phone no:</label>
              <input type="text" name="phone" value={studentData[0].phone_number} readOnly />
            </div>
            <div className='input'>
              <label htmlFor="Smester">Smester no:</label>
              <input type="text" name="Smester" value={studentData[0].semester} readOnly />
            </div>
            <div className='input'>
              <label htmlFor="department">Deaprtment Name:</label>
              <input type="text" name="department" value={studentData[0].department_name} readOnly />
            </div>
          




          </div>
        ) : (<p className='No_result'>NO record Found</p>)}



      </div>


    </>
  )
}

export default Student