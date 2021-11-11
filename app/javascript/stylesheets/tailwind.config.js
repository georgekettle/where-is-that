const colors = require('tailwindcss/colors');

module.exports = {
  darkMode: false, // or 'media' or 'class'
  theme: {
    fontFamily: {
      sans: ['Shape', 'Helvetica', 'sans-serif']
    },
    screens: {
      'xs': '480px',
      // => @media (min-width: 480px) { ... }
      'sm': '640px',
      // => @media (min-width: 640px) { ... }

      'md': '768px',
      // => @media (min-width: 768px) { ... }

      'lg': '1024px',
      // => @media (min-width: 1024px) { ... }

      'xl': '1280px',
      // => @media (min-width: 1280px) { ... }

      '2xl': '1536px',
      // => @media (min-width: 1536px) { ... }
    },
    extend: {},
  },
  variants: {
    extend: {
      scale: ['group-hover'],
      height: ['group-hover'],
      display: ['group-hover'],
    }
  },
  plugins: [
    require('@tailwindcss/line-clamp'),
    require('@tailwindcss/aspect-ratio'),
  ],
}
