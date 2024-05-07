import React from 'react'
import Navbar from '../Slider/Navbar'
import Slider from '../Slider/Slider'
import parsedToStudentSlider from './menu'

function Scholarship() {
  return (
    <>
      <Navbar logo="Student Panel" />
      <Slider parsedData={parsedToStudentSlider} />
      <div className="content-container">
        <h2>Scholar-Ship Details</h2>
        <div className="form grid">
          <h2> Scholar-ship's Information</h2>
          <div className='input'>
            <label htmlFor="First_name">Scholarship Name</label>
            <input type="text" name="name" value="Name of Scholar ship" readOnly />
          </div>
          <div className='input'>
            <label htmlFor="Last_name">Description of Scholarship:</label>
            <textarea type="text" name="description" rows={15} readOnly>Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugit odio doloremque tempore doloribus aut cumque non facere labore quas, fuga sequi corrupti libero voluptatem nihil pariatur atque ut deserunt ipsa iure soluta. Quia non eos omnis aperiam modi exercitationem nemo deleniti blanditiis atque harum quisquam quas perspiciatis ratione commodi alias cupiditate labore quibusdam sunt est, quaerat vitae doloribus iure itaque adipisci! Eius, sunt dicta totam vel aliquid rem ipsum possimus soluta voluptas illo ad corrupti nihil ducimus illum cumque commodi. Adipisci nulla magni impedit nisi. Sed praesentium a cumque dolores accusantium. Velit perspiciatis corporis incidunt reiciendis id, commodi accusantium voluptatem!</textarea>
          </div>
          <div className='input'>
            <label htmlFor="Address">Address:</label>
            <input type="text" name="address" value="Address of scholar ship provider" readOnly />
          </div>
          
          <div className='input'>
            <label htmlFor="email">Fund Provided:</label>
            <input type="text" name="email" value="40,000" readOnly />
          </div>
        </div>
      </div>
    </>
  )
}

export default Scholarship