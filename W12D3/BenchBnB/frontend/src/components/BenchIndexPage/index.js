import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { fetchBenches } from '../../store/benches';
import BenchList from './BenchList';


const BenchIndexPage = () => {

    const dispatch = useDispatch();
    const benches = useSelector(({benches}) => Object.values(benches))
    console.log(benches);

    useEffect(() => {
        dispatch(fetchBenches());
    }, [])

    return (

        <div>
            <h2>Inside Bench Index Page</h2>
            <BenchList benches={benches}/>
        </div>
    )
}

export default BenchIndexPage;