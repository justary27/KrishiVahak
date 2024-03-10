import React, {useState} from "react";
import "../Components/component.css";
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';

function createData(
  Vehicle_Id:string,
  Driver_Name:string,
  Vehicle_Type:string,
  Vehicle_Capacity:number,
  Description:string,
) {
  return {Vehicle_Id, Driver_Name, Vehicle_Type, Vehicle_Capacity, Description};
}

const rows = [
  createData("#V001","Ashok Singh","Truck",1000,"Fresh and Flavorful Fruit Materials\nDiscover a wide range of high-quality fruit materials sourced for their freshness."),
  createData("#V001","Ashok Singh","Truck",1000,"Fresh and Flavorful Fruit Materials\nDiscover a wide range of high-quality fruit materials sourced for their freshness."),
  createData("#V001","Ashok Singh","Truck",1000,"Fresh and Flavorful Fruit Materials\nDiscover a wide range of high-quality fruit materials sourced for their freshness."),
  createData("#V001","Ashok Singh","Truck",1000,"Fresh and Flavorful Fruit Materials\nDiscover a wide range of high-quality fruit materials sourced for their freshness."),
  createData("#V001","Ashok Singh","Truck",1000,"Fresh and Flavorful Fruit Materials\nDiscover a wide range of high-quality fruit materials sourced for their freshness."),
  createData("#V001","Ashok Singh","Truck",1000,"Fresh and Flavorful Fruit Materials\nDiscover a wide range of high-quality fruit materials sourced for their freshness."),
 
];

export default function BasicTable() {
  return (
    <TableContainer component={Paper}>
      <Table sx={{ minWidth: 650 }} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell>Vehicle ID</TableCell>
            <TableCell align="right">Driver Name</TableCell>
            <TableCell align="right">Vehicle Type</TableCell>
            <TableCell align="right">Vehicle Capacity</TableCell>
            <TableCell align="right">Description</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {rows.map((row) => (
            <TableRow
              key={row.Vehicle_Id}
              sx={{ '&:last-child td, &:last-child th': { border: 0 } }}
            >
              <TableCell component="th" scope="row">
                {row.Driver_Name}
              </TableCell>
              <TableCell align="right">{row.Vehicle_Type}</TableCell>
              <TableCell align="right">{row.Vehicle_Capacity}</TableCell>
              <TableCell align="right">{row.Description}</TableCell>
             
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );
}

