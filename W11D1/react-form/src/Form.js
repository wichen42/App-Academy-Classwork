import { useState } from "react";


const Form = () => {
    
    const [name, setName] = useState('');
    const [phone, setPhone] = useState('');
    const [email, setEmail] = useState('');
    const [type, setType] = useState('default');
    const [text, setText] = useState('');
    const [role, setRole] = useState('');

    let error = "";

    const handleSubmit = ((e) => {
        e.preventDefault();
        console.log(name, phone, email, type, text, role);

    })


    return (
            <div>
{/*                 {!validator.isMobilePhone(phone) && <h2>Incorrect Phone</h2>} */}
                <form onSubmit={handleSubmit}>
                    <label>Name:
                        <input 
                        type="text" 
                        placeholder="Name" 
                        required 
                        value={name} 
                        onChange={(e) => setName(e.target.value)}
                        />
                    </label>
                    <br></br>
                    <label>Email:
                        <input 
                        type="email" 
                        placeholder="Email" 
                        required 
                        value={email}
                        onChange={(e) => setEmail(e.target.value)}
                        />
                    </label>
                    <br></br>
                    <label>Phone Number: 
                        <input 
                        type="tel" 
                        placeholder="Phone Number"
                        required
                        value={phone}
                        pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
                        onChange={(e) => setPhone(e.target.value)}
                        />
                    </label>
                    <br></br>
                    <label>
                    <select 
                        name="phone-type"
                        value={type}
                        onChange={(e) => setType(e.target.value)}
                        >
                        <option value="home">Home</option>
                        <option value="work">Work</option>
                        <option value="mobile">Mobile</option>
                    </select>
                        {error && <h2>{error}</h2>}
                    </label>
                    <br></br>
                    <label>Instructor:
                        <input 
                        type="radio" 
                        name="role" 
                        value={role}
                        onChange={(e) => setRole(e.target.value)}
                        />
                    </label>
                    <br></br>
                    <label>Student:
                        <input 
                        type="radio" 
                        name="role" 
                        value={role}
                        onChange={(e) => setRole(e.target.value)}
                        />
                    </label>
                    <br></br>
                    <label>Bio: 
                        <textarea 
                        rows="" 
                        cols="" 
                        value={text}
                        required
                        maxLength="280"
                        onChange={(e) => setText(e.target.value)}
                        >
                        </textarea>
                    </label>
                    <br></br>
                    <label>Sign Up for Notification
                        <input type="checkbox"/>
                    </label>
                    <br></br>
                        <input type="submit" value="Submit" />
                </form>
            </div>
    )
}

export default Form;