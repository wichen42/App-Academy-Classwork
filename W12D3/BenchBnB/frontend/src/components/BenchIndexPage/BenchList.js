import BenchListItem from "./BenchListItem";

const BenchList = ({benches}) => {

    const benchItem = benches.map( (bench) => {
        return <BenchListItem key={bench.id} bench={bench} />
    })

    return (
        <ul>
            <li>Bench Items</li>
            {benchItem}
        </ul>
    )
}

export default BenchList;