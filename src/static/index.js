import './styles/main.scss';
import Elm from '../elm/Main';

const mountNode = document.getElementById('main');
const app = Elm.Main.embed(mountNode);
