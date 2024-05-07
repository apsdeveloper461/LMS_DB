import React, { useEffect, useState } from 'react'
import Navbar from '../Slider/Navbar'
import Slider from '../Slider/Slider'
import parsedToStudentSlider from './menu'
import Cookies from 'js-cookie'
import axios from 'axios'

function Grades() {
   const[gradesData,setGradesData]=useState({});
   useEffect(()=>{
     const studentInfo={
        'student_id':Cookies.get('student_id')
     }
    axios.post('http://localhost:5000/student/grades',studentInfo)
    .then(res=>{
     console.log(res.data);
     setGradesData(res.data);
     })
    .catch(err=>{
      console.log(err);
    })

  },[])
  return (
    <>
    <Navbar logo="Student Panel"/>
    <Slider parsedData={parsedToStudentSlider}/>
    <div className="content-container">
        <h1>Grades Details</h1>

        
<div className="table-container">
    <table>
        <thead>
            <tr>
                <th><h3>Course_id</h3></th>
                <th><h3>Course Name</h3></th>
                <th><h3>Course Credit</h3></th>
                <th><h3>Grade</h3></th>
            </tr>
        </thead>
        <tbody>
        {gradesData && gradesData.length > 0 ? (gradesData.map(item => (
            <tr>
                <td>{item.course_id}</td>
                <td>{item.course_name}</td>
                <td>{item.course_credit}</td>
                <td>{item.grade}</td>
            </tr>
           ))
          ):
          (
            
             <tr ><td colSpan={4} >No result found</td></tr> 
          )}
          </tbody>
    </table>
</div>
        
    </div>
    </>
  )
}

export default Grades