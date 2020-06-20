rm -rf ./compiled
tsc
cd src
find . -name '*.html' | cpio -pdm ../compiled
find . -name '*.css' | cpio -pdm ../compiled
find . -name '*.svg' | cpio -pdm ../compiled
find . -name '*.png' | cpio -pdm ../compiled
cd ..
npm run start
