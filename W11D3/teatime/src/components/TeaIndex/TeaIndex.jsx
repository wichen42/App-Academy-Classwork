import './TeaIndex.css';
import { getTeas } from '../../store/teas';
import { useSelector } from 'react-redux';

const TeaIndex = props => {

    console.log("From the Tea Index");

    const teas = useSelector(getTeas);

    return (
        <div className="tea-index">
            <h2>Hello From Tea Index</h2>
            {teas.map(tea => (
                <div key={tea.id}>
                    <ul>
                        <li>
                            <h4>Flavor: <p>{tea.flavor}</p></h4>
                        </li>
                        <li>
                            <h4>Price: <p>{tea.price}</p></h4>
                        </li>
                    </ul>  
                </div>
            ))}
        </div>
    )
}

export default TeaIndex;