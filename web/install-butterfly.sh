mkdir node_modules/butterfly
rsync --delete -azhu ~/IdeaProjects/khrysalis-meta/butterfly-web/dist node_modules/butterfly
rsync --delete -azhu ~/IdeaProjects/khrysalis-meta/butterfly-web/src node_modules/butterfly
rsync --delete -azhu ~/IdeaProjects/khrysalis-meta/butterfly-web/package.json node_modules/butterfly
mkdir node_modules/butterfly-maps-google
rsync --delete -azhu ~/IdeaProjects/khrysalis-meta/butterfly-maps-web-google/dist node_modules/butterfly-maps-google
rsync --delete -azhu ~/IdeaProjects/khrysalis-meta/butterfly-maps-web-google/src node_modules/butterfly-maps-google
rsync --delete -azhu ~/IdeaProjects/khrysalis-meta/butterfly-maps-web-google/package.json node_modules/butterfly-maps-google