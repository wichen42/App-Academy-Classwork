import { useParams } from "react-router-dom";
import harvardArt from "../../data/harvardArt";
import ArtImageTile from "../ArtImageTile";

function GalleryView() {
    let { galleryId } = useParams()
    let gallery;

    for (let i = 0; i < harvardArt.records.length; i++) {
        // console.log(harvardArt.records[i].gallerynumber);
        // console.log(galleryId);
        if (harvardArt.records[i].gallerynumber === `${galleryId}`) {
            gallery = harvardArt.records[i];
            // console.log("Works")
            
        }
    }


    // console.log('galID: ', galleryId)
    return(
        <div>
        <h1>{gallery.name} </h1>    
        <p>{gallery.labeltext}</p>        
        {ArtImageTile(gallery.url)}

        
        </div>
    )
}

export default GalleryView;