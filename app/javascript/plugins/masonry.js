import Masonry from 'masonry-layout'
const imagesloaded = require('imagesloaded')

const initMasonry = () => {
	const masonryContainers = document.querySelectorAll('.masonry-container');
	masonryContainers.forEach((container) => {
		imagesloaded( container, function() {
		  // images have loaded
			const sizer = container.querySelector('.masonry-sizer')
			new Masonry( container, {
			  // options
			  itemSelector: '.masonry-item',
			  columnWidth: sizer,
			  percentPosition: true,
			  transitionDuration: '0.5s'
			});
		});
	})
}

export { initMasonry }