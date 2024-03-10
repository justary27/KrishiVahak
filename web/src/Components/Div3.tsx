import React, {useState} from "react";
import "./component.css";
import profile from './assets/profile.png';
import Call from './assets/Call.png';
import Message from './assets/Message.png';
function Div3(){
return(
    <div className="Div3">
        <img src={profile} />
        <div className='Div3_c'>
            <p>Client</p>
            <h3>Rahul Sharma</h3>
            <p>Amritsar</p>
        </div>
        <div className="Div3_r">
            <img src={Call} />
            <img src={Message} />
        </div>
    </div>
        
)
}
export default Div3