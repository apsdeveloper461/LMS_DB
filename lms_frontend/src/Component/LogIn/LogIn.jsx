import React, { useEffect, useState } from 'react';
import axios from 'axios'
import './LogIn.css'; // Import CSS file
import { useNavigate } from 'react-router-dom';
import Cookies from 'js-cookie';

const LoginSignupPage = () => {
  const [departmentData, setDepartmentData] = useState(null);
  //get all department id and name
  useEffect(() => {
    axios.post('http://localhost:5000/department')
      .then(response => {
        console.log(response.data);
        setDepartmentData(response.data);
      }).catch(error => {
        console.error('Error fetching department data:', error);
        // Handle errors (e.g., display an error message to the user)
      })
  }, [])
  //change option data on click on other 
  const [selectedDepartment, setSelectedDepartment] = useState(''); // State variable to store the selected department
const [selectedGender,setselectedGender]=useState('');


  const [isLogInAdminMode, setisLogInAdminMode] = useState(false);
  const [logInValue, setLogInValue] = useState({
    email: '',
    password: ''
  });
  const [registerNewStudent, setRegisterNewStudent] = useState({
    department_id: '1',
    first_name: '',
    last_name: '',
    address: '',
    email: '',
    gender:'male',
    password: '',
    phone_no:'',
    date_of_birth:''
  })
  const navigate = useNavigate();
  const handleRegisterStudent = (event) => {
    setSelectedDepartment(event.target.value);
    setselectedGender(event.target.value);
    setRegisterNewStudent(prev => ({ ...prev, [event.target.name]: [event.target.value] }));

  }
  const RegisterStudentFormSubmit = (event) => {
    console.log("Submit Reister Form");
    event.preventDefault();
    console.log(registerNewStudent);
    axios.post('http://localhost:5000/register_student', registerNewStudent)
      .then(response => {
        console.log(response.data);
        if (response.data.length == 0) alert("Wrong Email or Password, Try Again");
        else if (response.data) {
          alert('Register Successfully! log In and see your Progress...')
          document.getElementById("registerForm").reset();
          navigate('/');
        } else {
          alert('Something wrong! plz try agqin Later')
        }
      }).catch(error => { 
        // document.getElementById("registerForm").reset();
        alert('Already Add Email or Something Wrong');
      })

  }
  const handleLogIn = (event) => {
    setLogInValue(prev => ({ ...prev, [event.target.name]: [event.target.value] }))

  }
  const LogInFormSubmit = (event) => {
    console.log("Submit LogIn Form");
    event.preventDefault();
    console.log(logInValue);
    axios.post('http://localhost:5000/login', logInValue) //call to login api
      .then(response => {
        console.log(response.data);
        if (response.data.length == 0) alert("Wrong Email or Password, Try Again");
        else if (response.data) {
          const data = response.data[0];
          let name = response.data[0].first_name + "  " + response.data[0].last_name;
          Cookies.set('name', name);
          Cookies.set('student_id', response.data[0].student_id);
          Cookies.set('department_id', response.data[0].department_id);
          Cookies.set('semester', response.data[0].semester);
          navigate('/student');
        } else {
          alert('Something wrong! plz try agqin Later')
        }
      })
      .catch(error => { console.log(error.message); })
  }

  const toggleMode = () => {
    setisLogInAdminMode(!isLogInAdminMode);
  };

  return (
    <div className={`container ${isLogInAdminMode ? 'sign-up-mode' : ''}`}>
      <div className="forms-container">
        <div className="signin-signup">
          <form action="" onSubmit={LogInFormSubmit} className={`sign-in-form ${isLogInAdminMode ? '' : 'hidden'}`}>
            <h2 className="title">Log In</h2>

            <div className="line" style={ {display:'flex',flexDirection:'column',justifyItems:'center'}}>
              <input type="email" name='email' onChange={handleLogIn} placeholder="email" required />
          
              <input type="password"  placeholder="Password" name='password' onChange={handleLogIn} required />
            </div>

            <input type="submit" value="Login" className="btn solid" />
          </form>

          <form action="" onSubmit={RegisterStudentFormSubmit} id='registerForm' className={`sign-up-form ${isLogInAdminMode ? '' : 'hidden'}`}>
            <h2 className="title">Sign Up</h2>
            <div className="line">
                <select className="custom-select" name='department_id' value={selectedDepartment} onChange={handleRegisterStudent} required>
                  {departmentData && departmentData.length > 0 ? (
                    departmentData.map(department => {
                      return <option value={department.department_id}>{department.department_name}</option>
                    })
                  ) : (
                    <option value="0">-- No Deparmtnet Availble--</option>
                  )}
                </select>
                <select className="custom-select" name='gender' value={selectedGender}  onChange={handleRegisterStudent} required>
                  <option value='male'>Male</option>
                  <option value='female'>Female</option>
                  <option value='other'>Other</option>
                </select>
            </div>
            <div className="line">
              <input type="" name='first_name' onChange={handleRegisterStudent} placeholder="First Name" required />
              <input type="" name='last_name' onChange={handleRegisterStudent} placeholder="Last Name" required />            </div>

            <div className="line">

              <input type='' name='phone_no' onChange={handleRegisterStudent} placeholder="Phone Number" required />
             <input type="date" name="date_of_birth"  onChange={handleRegisterStudent} required/>
            </div>
            <div className="line">
              <input type="email" name='email' onChange={handleRegisterStudent} placeholder="Email" required />
              <input type="password" name='password' onChange={handleRegisterStudent} placeholder="Password" required />

            </div>
            <div className="line">
              <input type='' name='address' id='address' onChange={handleRegisterStudent} placeholder="Address" required />
            </div>

            <input type="submit" value="Register" className="btn solid" />
          </form>
        </div>
      </div>

      <div className="panels-container">
        <div className="panel left-panel">
          <div className="content">
            <h3>-- Mehboob Alam --</h3>
            <h3>-- Abdul Rafeh --</h3>
            <p>If you are not a student of LMS,register yourself by clicking the below button.</p>
            <button className="btn transparent" onClick={toggleMode}>Register</button>
          </div>
        </div>
        <div className="panel right-panel">
          <div className="content">
            <h3> -- M. Abdullah Feroz --</h3>
            <h3>-- Irtiza Ali --</h3>
            <p>You have a student of LMS, Click below fo log in.</p>
            <button className="btn transparent" onClick={toggleMode}>Log In</button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default LoginSignupPage;
