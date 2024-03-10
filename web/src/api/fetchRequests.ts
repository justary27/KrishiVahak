export const fetchRequest = async (): Promise<number> => {
    try {
        const response = await fetch('/vehicle-requests');
        if (!response.ok) {
            throw new Error('Failed to fetch vehicle requests');
        }
        const data = await response.json();
        return data.vehicleRequests;
    } catch (error) {
        console.error('Error fetching vehicle requests:', error);
        return 0; // Default value or handle the error as needed
    }
};
