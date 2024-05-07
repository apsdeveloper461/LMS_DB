import React, { useEffect, useState } from 'react'
import Navbar from '../Slider/Navbar'
import Slider from '../Slider/Slider'
import Cookies from 'js-cookie'
import axios from 'axios';
import parsedToStudentSlider from './menu';

function Current_course() {
  const [CoursesData, setCoursesData] = useState(null);

  useEffect(() => {
      const studentInfo = {
          'student_id': Cookies.get('student_id')
      };

      axios.post('http://localhost:5000/student/enroll_course', studentInfo)
          .then(response => {
              console.log(response);
              setCoursesData(response.data);
          })
          .catch(error => {
              console.error('Error fetching course data:', error);
          });
  }, []);

  return (
    <>
     <Navbar logo="Student Panel"/>
     <Slider parsedData={parsedToStudentSlider}/>
      <div className="content-container">
        <h1>Current Courses </h1>
        <div className="grid">
                    {CoursesData && CoursesData.length > 0 ? (CoursesData.map(course => (
                        <div className="course-section" key={course.course_id}>
                            <div className="course-box">
                                <h2>{course.course_id} : {course.course_name}</h2>
                                <h4>Instructor: {course.faculty_name}</h4>
                                <h5 className='credit'>Credit Hours: {course.course_credit}</h5>
                                <p>Register Date : {course.enrollment_date}</p>
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

export default Current_course