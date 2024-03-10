import React, {useState} from "react";
import "./component.css";
import history1 from "./assets/history1.png"
function History_card(){
return(
<div className="history">
    <img src={history1} className="his_image"/>
    <div className="his_div">
        <p>Deposit from my Card<br/>
        28 January 2024</p>
    </div>
    <div><p>+Rs8,500</p></div>
</div>
)
}
export default History_card