import React, { useEffect, useState } from 'react';
import Navbar from '../Slider/Navbar';
import Slider from '../Slider/Slider';
import parsedToStudentSlider from './menu';
import axios from 'axios';

function Scholarship() {
  const [scholarshipData, setScholarshipData] = useState([]);

  useEffect(() => {
    axios.post('http://localhost:5000/student/scholarship')
      .then(res => {
        console.log(res.data);
        setScholarshipData(res.data);
        scholarshipData.map(item => (
          console.log(item.Scholarship_name)
        ));
      })
      .catch(err => {
        console.log(err);
      });
  }, []);

  return (
    <>
      <Navbar logo="Student Panel" />
      <Slider parsedData={parsedToStudentSlider} />
      <div className="content-container">
        <h2>Scholarship Details</h2>
        {scholarshipData.length > 0 ? (
          scholarshipData.map(item => (
            <div className="form grid" key={item.scholarship_id}>
              <h2>Scholarship Information</h2>
              <div className="input">
                <label htmlFor="scholarship_name">Scholarship Name</label>
                <input type="text" name="name" value={item.scholarship_name} readOnly />
              </div>
              <div className="input">
                <label htmlFor="fund_provider">Fund Provider</label>
                <input type="text" name="text" value={item.fund_provider} readOnly />
              </div>
              <div className="input">
                <label htmlFor="last_date">Applying Last Date</label>
                <input type="text" name="last_date" value={item.last_date} readOnly />
              </div>
              <div className="input" style={{ gridColumn: '1 / -1' }}>
                <label htmlFor="description">Description of Scholarship</label>
                <textarea type="text" name="description" rows={6} readOnly>{item.description}</textarea>
              </div>
            </div>
          ))
        ) : (
          <p>No scholarships found</p>
        )}
      </div>
    </>
  );
}

export default Scholarship;
