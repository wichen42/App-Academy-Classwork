import { NavLink } from "react-router-dom";

function Gallery (props) {

    const link = `/galleries/${props.id}`

    return (
        
        <li>
            <NavLink to={link}>
                {props.name}
            </NavLink>
        </li>
    )
}

export default Gallery;