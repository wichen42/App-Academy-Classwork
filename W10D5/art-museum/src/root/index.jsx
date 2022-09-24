import App from '../App';
import { BrowserRouter } from 'react-router-dom';
import GalleryNavigation from '../components/GalleryNavigation';

export const Root = () => {
    return (
    <BrowserRouter>
      <App />
    </BrowserRouter>
    )
  }