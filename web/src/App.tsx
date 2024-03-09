import React from 'react';
import logo from './logo.svg';
import './App.css';
import SideNavBar from "./Components/SideNavBar";
import Top_bar from './Components/top_bar';
import S_cards from './Components/S_cards';
import Grid from "./Components/Grid"
function App() {
  return (
    <div className='Page'>
      <header>
    <Top_bar/></header>
    <body>
      <div className="main_body"> 
        <SideNavBar />
        <div className='main_bodyC'>
          <div className='Placdholder1'></div>
          <S_cards/>
          <h1>Active Orders</h1>
          <Grid/>
          
        </div>
        <div className='main_bodyR'>
          <div className='Placeholder2'></div>
          <h1>Money History</h1>

        </div>

      </div>
   </body>
    <S_cards/>
    </div>
    );
 
}

export default App;

