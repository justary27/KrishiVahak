import React from 'react';
import { useDispatch } from 'react-redux';
import { setVehicleRequests } from '../Actions/set_request';
import { fetchRequest } from '../api/fetchRequests';

const YourComponent: React.FC = () => {
    const dispatch = useDispatch();

    const fetchVehicleRequests = async () => {
        // Fetch vehicle requests from the database
        const count = await fetchRequest();
        dispatch(setVehicleRequests(count));
    };

    return (
        <button onClick={fetchVehicleRequests}>Fetch Vehicle Requests</button>
    );
};

export default YourComponent;
