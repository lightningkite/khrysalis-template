import {MainVG} from "./vg/MainVG.shared";
import {listenForDialogs} from "khrysalis/dist/views/ViewDependency.actual";
import {setupGoogleMaps } from "khrysalis-maps-google/dist/setup"

setupGoogleMaps()

const vg = new MainVG();
const view = vg.generate(window);
document.body.appendChild(view);
listenForDialogs();