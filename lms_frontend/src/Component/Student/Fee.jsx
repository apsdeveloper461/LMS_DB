import React from 'react'
import Navbar from '../Slider/Navbar'
import Slider from '../Slider/Slider'
import parsedToStudentSlider from './menu'
import ProgressStrip from './ProgressStrip'

function Fee() {
  return (
    <>
    <Navbar logo="Student Panel"/>
    <Slider parsedData={parsedToStudentSlider}/>
    <div className="content-container">
    <h1>Invoice Fee</h1>
         
<div class="table-container">
    <table>
        <thead>
            <tr>
                <th><h3>Fee Challan No.</h3></th>
                <th><h3>Smester No.</h3></th>
                <th><h3>Fee Amount</h3></th>
                <th><h3>  Due_Date</h3></th>
                <th><h3> Status</h3></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Data 1</td>
                <td>Data 2</td>
                <td>Data 3</td>
                <td>Data 4</td>
                <td><div className='status_class_fee' style={{border:'2px solid green',color:'green'}}>paid</div></td>
            </tr>
            <tr>
                <td>Data 1</td>
                <td>Data 2</td>
                <td>Data 3</td>
                <td>Data 4</td>
                <td><div className='status_class_fee' style={{border:'2px solid red',color:'red'}}>Unpaid</div></td>
            </tr>
            <tr>
                <td>Data 1</td>
                <td>Data 2</td>
                <td>Data 3</td>
                <td>Data 4</td>
                <td><div className='status_class_fee' style={{border:'2px solid green',color:'green'}}>paid</div></td>
            </tr>
            <tr>
                <td>Data 1</td>
                <td>Data 2</td>
                <td>Data 3</td>
                <td>Data 4</td>
                <td><div className='status_class_fee' style={{border:'2px solid red',color:'red'}}>Unpaid</div></td>
            </tr>
            <tr>
                <td>Data 1</td>
                <td>Data 2</td>
                <td>Data 3</td>
                <td>Data 4</td>
                <td><div className='status_class_fee' style={{border:'2px solid red',color:'red'}}>Unpaid</div></td>
            </tr>
            <tr>
                <td>Data 1</td>
                <td>Data 2</td>
                <td>Data 3</td>
                <td>Data 4</td>
                <td><div className='status_class_fee' style={{border:'2px solid green',color:'green'}}>paid</div></td>
            </tr>
            <tr>
                <td>Data 1</td>
                <td>Data 2</td>
                <td>Data 3</td>
                <td>Data 4</td>
                <td><div className='status_class_fee' style={{border:'2px solid red',color:'red'}}>Unpaid</div></td>
            </tr>
            <tr>
                <td>Data 1</td>
                <td>Data 2</td>
                <td>Data 3</td>
                <td>Data 4</td>
                <td><div className='status_class_fee' style={{border:'2px solid green',color:'green'}}>paid</div></td>
            </tr>
            <tr>
                <td>Data 1</td>
                <td>Data 2</td>
                <td>Data 3</td>
                <td>Data 4</td>
                <td><div className='status_class_fee' style={{border:'2px solid red',color:'red'}}>Unpaid</div></td>
            </tr>
           
        </tbody>
    </table>
</div>
</div>
    </>
  )
}

export default Fee