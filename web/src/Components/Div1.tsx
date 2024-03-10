import React, {useState} from "react";
import "./component.css";
import long_truck from "./assets/long_truck.png";
function Div1(){
return(
  <div className="Div1">
   <div className="Div1_l">
    <p>Shipment number</p>
    <h2>EV-2017002346</h2>
    <h3>Food materials</h3>
   </div>
   <div className="Div1_r">
    <img src={long_truck}/>
    <p>Driver:Ashok Singh</p>
   </div>
  </div>  
)
}
export default Div1