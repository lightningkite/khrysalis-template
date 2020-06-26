import {MainVG} from "./vg/MainVG.shared";
import {listenForDialogs} from "khrysalis/dist/views/ViewDependency.actual";

const vg = new MainVG();
const view = vg.generate(window);
document.body.appendChild(view);
listenForDialogs();