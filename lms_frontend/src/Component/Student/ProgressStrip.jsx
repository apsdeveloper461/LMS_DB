
    import React from 'react';

    const ProgressStrip = ({ value, maxValue=100, backgroundColor }) => {
      const fillStyle = {
        width: `${(value / maxValue) * 100}%`,
        height:'10px',
        borderRadius:'5px',
        backgroundColor: backgroundColor || '#007bf2', // Default blue
      };
    
      return (
       
        <div style={{width:'70%',background:'grey',borderRadius:'5px',margin:'10px'}} className="progress-strip">
          <div  className="progress-fill" style={fillStyle} />
        </div>
       
      );
    };
    
    export default ProgressStrip;
    