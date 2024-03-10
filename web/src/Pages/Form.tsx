import React, {useState} from "react";
import "../Components/component.css";

interface IVehicleFormData {
    Vehicle_Id: string;
    Driver_Name: string;
    Vehicle_Type: string;
    Vehicle_Capacity: number;
    Description: string;
}

export interface FormProps {
  onSubmit: (formData: IVehicleFormData) => void;
}
function Form({ onSubmit }: FormProps) {
  const [formData, setFormData] = useState<IVehicleFormData>({
    Vehicle_Id: '',
    Driver_Name: '',
    Vehicle_Type: '',
    Vehicle_Capacity: 0,
    Description: '',
  });

  function handleInputChange(event: React.ChangeEvent<HTMLInputElement>) {
    const { name, value } = event.target;
    const updatedValue = name === "Vehicle_Capacity" ? Number(value) : value;
    setFormData({ ...formData, [name]: updatedValue });
  }

  function handleSubmit(event: React.FormEvent<HTMLFormElement>) {
    event.preventDefault();
    onSubmit(formData);
  }

  return (
    <form onSubmit={handleSubmit}>
      <label>
        Vehicle Id
        <br/>
        <input type="text" name="Vehicle_Id" value={formData.Vehicle_Id} onChange={handleInputChange} className="Field"/>
      </label>
      <br />
      <label>
        Driver Name
         <br/>
        <input type="text" name="Driver_Name" value={formData.Driver_Name} onChange={handleInputChange} className="Field"/>
      </label>
      <br />
      <label>
       Vehicle Type
        <br/>
        <input type="text" name="Vehicle_Type" value={formData.Vehicle_Type} onChange={handleInputChange} className="Field"/>
      </label>
      <br />
      <label>
        Vehicle Capacity
         <br/>
        <input type="number" name="Vehicle_Capacity" value={String(formData.Vehicle_Capacity)} onChange={handleInputChange} className="Field" />
      </label>
      <br />
      <label>
        Description
         <br/>
        <input type="text" name="Description" value={formData.Description} onChange={handleInputChange} className="Field"/>
      </label>
      <br />
      <button type="submit">Create</button>
    </form>
  );
}

export default Form;