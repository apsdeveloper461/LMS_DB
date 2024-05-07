import React, { useEffect, useState } from 'react';
import Navbar from '../Slider/Navbar';
import Slider from '../Slider/Slider';
import axios from 'axios';
import Cookies from 'js-cookie';
import parsedToStudentSlider from './menu';

function Course_register() {
    const [CoursesData, setCoursesData] = useState(null);

    useEffect(() => {
        const studentInfo = {
            'department_id': Cookies.get('department_id'),
            'semester': Cookies.get('semester'),
            'student_id':Cookies.get('student_id')
        };

        axios.post('http://localhost:5000/student/register_course', studentInfo)
            .then(response => {
                console.log(response);
                setCoursesData(response.data);
            })
            .catch(error => {
                console.error('Error fetching course data:', error);
            });
    }, []);

    const handleRegisterCourse = (courseId) => {
       let is_register=confirm(`Do You want to register, Whose id is equal to ${courseId} `)
       if(is_register){
        console.log(' Going to registered on database................. ');
        const studentInfo={
         'student_id':Cookies.get('student_id'),
         'course_id':courseId
        }
        axios.post('http://localhost:5000/student/registered_in_course', studentInfo)
        .then(response => {
            console.log(response);
            if(!response.data) alert('no registered')
                else alert("Registeraton done");
        })
        .catch(error => {
            console.error('Error fetching course data:', error);
        });
       }else{
        console.log('not registered');
       }
    };

    return (
        <>
            <Navbar logo="Student Panel" />
            <Slider parsedData={parsedToStudentSlider}/>
            <div className="content-container">
                <h1>Available Courses</h1>
                <div className="grid">
                    {CoursesData && CoursesData.length > 0 ? (CoursesData.map(course => (
                        <div className="course-section" key={course.course_id}>
                            <div className="course-box">
                                <h2>{course.course_id} : {course.course_name}</h2>
                                <h4>Instructor: {course.faculty_name}</h4>
                                <h5 className='credit'>Credit Hours: {course.course_credit}</h5>
                                <button
                                    className="register-btn"
                                    onClick={() => handleRegisterCourse(course.course_id)}
                                >
                                    Register Course
                                </button>
                            </div>
                        </div>
                    ))
                    ) : (
                        <p className='No_result'>No result found</p>
                    )}
                </div>


            </div>


        </>
    );
}

export default Course_register;
