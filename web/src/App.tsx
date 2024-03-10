import React from 'react';
import './App.css';
import Form from './Pages/Form';
<<<<<<< Updated upstream
import IVehicleFormData from "./Pages/Form";
import Services from "./Pages/Services";
import L_card from "./Components/L_card";
import Map from "./Components/assets/Map.png";
=======
import Services from "./Pages/Services"
import Top_bar from './Components/top_bar';
import HomePage from './Pages/HomePage';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
// import SideNavBar from './Components/SideNavBar';

>>>>>>> Stashed changes
function App(){
  const handleSubmit = (formData: any) => {
    console.log(formData);
   }
     return (
      <>
      <div className='Page'>
      <header>
      <Top_bar/>
      </header>
        {/* <SideNavBar /> */}
    <body>
<<<<<<< Updated upstream
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
       <div className='Form_h'> 
        <h1>Create a Service</h1> 
       <Form onSubmit={handleSubmit} /></div>
       <div className="Services">
        <div className='Service_Top'>
        <h1>Services</h1>
        <button>Create+</button>
        </div>
       <Services/>
       </div>
      </div>
      <div className='L_card'>
        <div className='LCardL'>
        <h1>Ongoing Delivery</h1>
        <L_card/>
        <L_card/>
        </div>
        <div className='LCardR'>
          <img src={Map}/>
        </div>
        </div>
=======
      <Router>
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/form" element={<Form onSubmit={handleSubmit}/>} />
          <Route path="/services" element={<Services/>} />
        </Routes>
      </Router>
>>>>>>> Stashed changes
   </body>
    </div>
      </>
  );
}


export default App;
