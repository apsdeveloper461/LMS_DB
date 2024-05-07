import React, { useEffect } from 'react'
import Cookies from 'js-cookie'
import { useNavigate } from 'react-router-dom';

function LogOut() {
    const navigate=useNavigate()
    useEffect(()=>{
        console.log("LogOut")
        localStorage.removeItem("isLoggedIn");
        // Cookies.set('name', name);
        Cookies.remove('name')
        Cookies.remove('student_id');
        Cookies.remove('department_id');
        Cookies.remove('semester');
        // Cookies.remove();
        navigate('/')
    },[])
  return (
    <div>LogOut</div>
  )
}

export default LogOut;