import {MainVG} from "./vg/MainVG";
import {listenForDialogs} from "butterfly/dist/views/ViewDependency";
import {setupGoogleMaps } from "butterfly-maps-google/dist/setup"

setupGoogleMaps()

const vg = new MainVG();
const view = vg.generate(window);
document.body.appendChild(view);
listenForDialogs();