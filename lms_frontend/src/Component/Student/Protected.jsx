import React, { useEffect } from 'react'
import { useNavigate } from 'react-router-dom';
import Cookies from 'js-cookie';

function Protected(props) {
    const {Component}=props;
    const navigate=useNavigate();
     useEffect(()=>{
        // Cookies.get
       let havecookies=Cookies.get('student_id');
       console.log(havecookies);
       console.log(!havecookies);
        if(!havecookies){
          navigate('/');
        }
    })
  return (
    <>
       <Component/>
    </>
  )
}

export default Protected