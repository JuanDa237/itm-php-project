<style>
	/* GLOBAL STYLES */
	/* Padding below the footer and lighter body text */

	body {
		min-height: 100vh;
		padding-top: 3rem;
		padding-bottom: 3rem;
		color: #5a5a5a;
	}

	/* CUSTOMIZE THE CAROUSEL */

	/* Carousel base class */
	.carousel {
		margin-bottom: 4rem;
	}

	/* Since positioning the image, we need to help out the caption */
	.carousel-caption {
		bottom: 3rem;
		z-index: 10;
	}

	/* Declare heights because of positioning of img element */
	.carousel-item {
		height: 32rem;
	}

	/* MARKETING CONTENT */

	/* Center align the text within the three columns below the carousel */
	.marketing .col-lg-4 {
		margin-bottom: 1.5rem;
		text-align: center;
	}

	.marketing .col-lg-4 p {
		margin-right: .75rem;
		margin-left: .75rem;
	}

	/* Featurettes */

	.featurette-divider {
		margin: 5rem 0;
		/* Space out the Bootstrap <hr> more */
	}

	/* Thin out the marketing headings */
	.featurette-heading {
		letter-spacing: -.05rem;
	}

	/* RESPONSIVE CSS */

	@media (min-width: 40em) {

		/* Bump up size of carousel content */
		.carousel-caption p {
			margin-bottom: 1.25rem;
			font-size: 1.25rem;
			line-height: 1.4;
		}

		.featurette-heading {
			font-size: 50px;
		}
	}

	@media (min-width: 62em) {
		.featurette-heading {
			margin-top: 7rem;
		}
	}
</style>