mkdir node_modules/khrysalis
rsync --delete -azhu ~/IdeaProjects/khrysalis/web/dist node_modules/khrysalis
rsync --delete -azhu ~/IdeaProjects/khrysalis/web/src node_modules/khrysalis
rsync --delete -azhu ~/IdeaProjects/khrysalis/web/package.json node_modules/khrysalis
mkdir node_modules/khrysalis-maps-google
rsync --delete -azhu ~/IdeaProjects/khrysalis/web-maps-google/dist node_modules/khrysalis-maps-google
rsync --delete -azhu ~/IdeaProjects/khrysalis/web-maps-google/src node_modules/khrysalis-maps-google
rsync --delete -azhu ~/IdeaProjects/khrysalis/web-maps-google/package.json node_modules/khrysalis-maps-google