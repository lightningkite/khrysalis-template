import {MainVG} from "./vg/MainVG";
import {listenForDialogs} from "butterfly-web/dist/views/ViewDependency";
import {setupGoogleMaps } from "butterfly-maps-web-google/dist/setup"

setupGoogleMaps()

const vg = new MainVG();
const view = vg.generate(window);
document.body.appendChild(view);
listenForDialogs();