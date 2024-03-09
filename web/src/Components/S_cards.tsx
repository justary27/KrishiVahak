import React, {useState} from "react";
import "./component.css";
import Card from "./card"
// import { Card } from "@mui/material";

function S_cards(){
    return (
        <div className="cards">
            <Card />
            <Card />
            <Card />
        </div>
    )
}
export default S_cards