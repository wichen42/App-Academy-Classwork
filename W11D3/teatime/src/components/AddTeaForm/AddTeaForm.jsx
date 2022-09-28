import { useState } from 'react';
import { useDispatch } from 'react-redux';
import { receiveTea } from '../../store/teas';
import './AddTeaForm.css';

const AddTeaForm = props => {
    console.log(`rendering ${props} from AddTeaForm`);

    const dispatch = useDispatch();
    const [flavor, setFlavor] = useState("");
    const [price, setPrice] = useState("");

    const handleSubmit = (e) => {
        e.preventDefault();

        let id = Math.floor(Math.random() * 1000); // create random id for tea objects

        const tea = { // populate tea object with random id and user input
            id: id,
            flavor: flavor,
            price: price
        }

        dispatch(receiveTea(tea)); // save new tea to store

        setPrice(""); // sets price and flavor back to empty strings so that user input field clears
        setFlavor("");

    }

    return (
        <div className="tea-form">
            <h2>Hello from AddTeaForm</h2>
            <form onSubmit={handleSubmit}>
                <label htmlFor="flavor">Flavor:</label>
                <input type="text" 
                id="flavor" 
                value={flavor} 
                onChange={e => setFlavor(e.target.value)}/>

                <label htmlFor="price">Price:</label>
                <input type="text" 
                id="price" 
                value={price} 
                onChange={(e) => setPrice(e.target.value)} />

                <input type="submit" value="Add Tea" />
            </form>
        </div>
    )
}

export default AddTeaForm;
