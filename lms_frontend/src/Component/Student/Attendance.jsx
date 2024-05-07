import React, { useEffect, useState } from 'react'
import Navbar from '../Slider/Navbar'
import Slider from '../Slider/Slider'
import parsedToStudentSlider from './menu'
import Cookies from 'js-cookie'
import axios from 'axios';
import ProgressStrip from './ProgressStrip'

function Attendance() {
  const [AttendanceData, setAttendanceData] = useState(null);

  useEffect(() => {
      const studentInfo = {
          'student_id': Cookies.get('student_id')
      };

      axios.post('http://localhost:5000/student/attendance', studentInfo)
          .then(response => {
              console.log(response);
              setAttendanceData(response.data);
          })
          .catch(error => {
              console.error('Error fetching course data:', error);
          });
  }, []);

  return (
    <>
    <Navbar logo='Student Panel'/>
    <Slider parsedData={parsedToStudentSlider}/>
    <div className="content-container">
        <h1>Courses Attendance</h1>
        <div className="grid">
                    {AttendanceData && AttendanceData.length > 0 ? (AttendanceData.map(item => (
                        <div className="course-section" key={item.course_id}>
                            <div className="course-box">
                                <h2>{item.course_id} : {item.course_name}</h2>
                                <h4>Instructor: {item.faculty_name}</h4>
                                <div>
                                <h3 style={{color:'#007b69'}}>Attendance Percentage ({item.attendance_percentage}%)</h3>
                                <ProgressStrip value={item.attendance_percentage}/>
                                </div>
                            </div>
                        </div>
                    ))
                    ) : (
                        <p className='No_result'>No result found</p>
                    )}
                </div>
    </div>
    
    </>
  )
}

export default Attendance