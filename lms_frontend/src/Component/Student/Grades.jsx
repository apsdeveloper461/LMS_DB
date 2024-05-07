import React, { useEffect, useState } from 'react'
import Navbar from '../Slider/Navbar'
import Slider from '../Slider/Slider'
import parsedToStudentSlider from './menu'

function Grades() {
  const[gradesData,setGradesData]=useState(NULL);
  useEffect(()=>{
    const studentInfo={
       'student_id':Cookies.get('student_id')
    }
    axios.post('http://127.0.0.1:8000/api/student/grades',studentInfo)
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

        
<div class="table-container">
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
            <tr>
                <td>Data 1</td>
                <td>Data 2</td>
                <td>Data 3</td>
                <td>Data 4</td>
            </tr>
        </tbody>
    </table>
</div>
        
    </div>
    </>
  )
}

export default Grades