import React from 'react';
import { useSelector } from 'react-redux';
import { RootState } from '../Store';

const VehicleRequestsContainer: React.FC = () => {
    const vehicleRequests = useSelector((state: RootState) => state.app.vehicleRequests);

    return (
        <div>
            <h2>Vehicle Requests: {vehicleRequests}</h2>
        </div>
    );
};

export default VehicleRequestsContainer;
