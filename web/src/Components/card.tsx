import React, {useState} from "react";
import "./component.css";
import up from './assets/up.png'
import truck1 from "./assets/truck1.png"

function Card() {
    return (
        <div className ="card">
       <img src={truck1}/>
       <div className="details">
      <h3>Total shipment</h3>
     <div className="card_bottom"> <h1>7200</h1>
     <div className="rate">
        <p>+11.02%</p>
        <img src={up}/>
     </div>
     </div>
       </div>
        </div>
    )
}
export default Card