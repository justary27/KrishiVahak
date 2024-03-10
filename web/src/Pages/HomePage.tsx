import React from 'react';
import '../App.css';
import SideNavBar from '../Components/SideNavBar';
import Top_bar from '../Components/top_bar';
import Placeholder1 from '../Components/assets/Placeholder1.png';
import Placeholder2 from '../Components/assets/Placeholder2.png';
import S_cards from '../Components/S_cards';
import His_cards from '../Components/His_cards';
import Grid from '../Components/Grid';
import Form from './Form';
import Services from './Services';


function HomePage(){
   const handleSubmit = (formData: any) => {
    console.log(formData);
   }

  return (
      <div className="main_body"> 
        <SideNavBar />
        <div className='main_bodyC'>
          <div className='Placeholder1'><img src={Placeholder1}/></div>
          <S_cards/>
          <h1 className='Active'>Active Orders</h1>
          <Grid/>
          
        </div>
        <div className='main_bodyR'>
          <div className='Placeholder2'><img src={Placeholder2}/></div>
          <h1 className='Active'>Money History</h1>
          <His_cards/>
          
        </div>
       {/* <div className='Form_h'> 
        <h1>Create a Service</h1> 
       <Form onSubmit={handleSubmit} /></div>

       <div className="Services">
            <div className='Service_Top'>
            <h1>Services</h1>
            <button>Create+</button>
            </div>
       <Services/>
       </div> */}
      </div>
      
    );
 
}

export default HomePage;
