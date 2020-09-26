mkdir node_modules/butterfly
rsync --delete -azhu ~/IdeaProjects/butterfly/web/dist node_modules/butterfly
rsync --delete -azhu ~/IdeaProjects/butterfly/web/src node_modules/butterfly
rsync --delete -azhu ~/IdeaProjects/butterfly/web/package.json node_modules/butterfly
mkdir node_modules/butterfly-maps-google
rsync --delete -azhu ~/IdeaProjects/butterfly/web-maps-google/dist node_modules/butterfly-maps-google
rsync --delete -azhu ~/IdeaProjects/butterfly/web-maps-google/src node_modules/butterfly-maps-google
rsync --delete -azhu ~/IdeaProjects/butterfly/web-maps-google/package.json node_modules/butterfly-maps-google