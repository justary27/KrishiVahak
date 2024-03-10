import React, {useState} from "react";
import "./component.css";
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';

function createData(
  Vehicle_ID:string,
  Vehicle_Type:string,
  Current_Location:string,
  Status:string,
  Assigned_To:string,
) {
  return {Vehicle_ID, Vehicle_Type, Current_Location, Status, Assigned_To};
}

const rows = [
  createData("#V001", "Truck","Warehouse A", "In service","Ashok Singh"),
  createData("#V001", "Truck","Warehouse A", "In service","Ashok Singh"),
  createData("#V001", "Truck","Warehouse A", "In service","Ashok Singh"),
  createData("#V001", "Truck","Warehouse A", "In service","Ashok Singh"),
  createData("#V001", "Truck","Warehouse A", "In service","Ashok Singh"),
  createData("#V001", "Truck","Warehouse A", "In service","Ashok Singh"),
  createData("#V001", "Truck","Warehouse A", "In service","Ashok Singh"),
  createData("#V001", "Truck","Warehouse A", "In service","Ashok Singh"),
  createData("#V001", "Truck","Warehouse A", "In service","Ashok Singh"),
 
];

export default function BasicTable() {
  return (
    <TableContainer component={Paper}>
      <Table sx={{ minWidth: 650 }} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell>Vehicle ID</TableCell>
            <TableCell align="right">Vehicle Type</TableCell>
            <TableCell align="right">Current Location</TableCell>
            <TableCell align="right">Status</TableCell>
            <TableCell align="right">Assigned To</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {rows.map((row) => (
            <TableRow
              key={row.Vehicle_ID}
              sx={{ '&:last-child td, &:last-child th': { border: 0 } }}
            >
              <TableCell component="th" scope="row">
                {row.Vehicle_ID}
              </TableCell>
              <TableCell align="right">{row.Vehicle_Type}</TableCell>
              <TableCell align="right">{row.Current_Location}</TableCell>
              <TableCell align="right">{row.Status}</TableCell>
              <TableCell align="right">{row.Assigned_To}</TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );
}
