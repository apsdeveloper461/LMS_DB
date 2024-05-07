import LoginSignupPage from "./Component/LogIn/LogIn";
import {BrowserRouter,Routes,Route} from "react-router-dom";
import './App.css'
import Student from "./Component/Student/Student";
import Course_register from "./Component/Student/Course_register";
import Current_course from "./Component/Student/Current_Course";
import Attendance from "./Component/Student/Attendance";
import Fee from "./Component/Student/Fee";
import Scholarship from "./Component/Student/Scholarship";
import LogOut from "./Component/Student/LogOut";
import Grades from "./Component/Student/Grades";
import Protected from "./Component/Student/Protected";

function App() {

  return (
    <>
    <BrowserRouter>
    <Routes>
      
      <Route path='/' element={<LoginSignupPage/>}></Route>
      <Route path='/student' element={<Protected Component={Student}/>}></Route>
      <Route path='/student/course_register' element={<Protected Component={Course_register}/>}></Route>
      <Route path='/student/current_course' element={<Protected Component={Current_course}/>}></Route>
      <Route path='/student/attendance' element={<Protected Component={Attendance}/>}></Route>
      <Route path='/student/fee' element={<Protected Component={Fee}/>}></Route>
      <Route path='/student/grade' element={<Protected Component={Grades}/>}></Route>
      <Route path='/student/scholarship' element={<Protected Component={Scholarship}/>}></Route>
      <Route path='/logout' element={<LogOut/>}></Route>
    </Routes>
    </BrowserRouter>
    </>
  )
}

export default App
