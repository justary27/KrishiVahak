import React, {useState} from "react";
import "./component.css";
import location from './assets/location.png'
function Div2(){
return(
<div className="div2">
<img src={location}/>
<div className="div2_c">
    <h2>2972 Punjab </h2>
    <p>Rd Amritsar, Punjab 85486 </p>
</div>
<div className="div2_r">
    <h3>Department Time</h3>
    <p>28/02/24 11:18AM</p>
</div>
</div>
)
}
export default Div2