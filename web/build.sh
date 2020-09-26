./install-butterfly.sh
cd ..
./gradlew butterflyWeb
cd web
rsync --delete -azh --prune-empty-dirs --include="*/" --include="**.html" --exclude="*" "./src/" "./dist/"
rsync --delete -azh --prune-empty-dirs --include="*/" --include="**.css" --exclude="*" "./src/" "./dist/"
rsync --delete -azh --prune-empty-dirs --include="*/" --include="**.png" --exclude="*" "./src/" "./dist/"
rsync --delete -azh --prune-empty-dirs --include="*/" --include="**.svg" --exclude="*" "./src/" "./dist/"
rsync --delete -azh --prune-empty-dirs --include="*/" --include="**.js" --exclude="*" "./src/" "./dist/"
npm run start