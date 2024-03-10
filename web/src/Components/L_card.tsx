import React, {useState} from "react";
import "./component.css";
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import Div1 from './Div1';
import Div2 from './Div2';
import Div3 from './Div3';
function L_card(){
return(
 <Card>
<Div1/>
<hr/>
<Div2/>
<Div2/>
<hr/>
<Div3/>
 </Card>
)
}
export default L_card