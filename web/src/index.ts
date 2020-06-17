import {MainVG} from "./vg/MainVG.shared";

const vg = new MainVG();
const view = vg.generate(window);
document.body.appendChild(view);