const colors = require('tailwindcss/colors');
const defaultTheme = require('tailwindcss/defaultTheme')

// const fontFamily = defaultTheme.fontFamily;
// fontFamily['sans'] = [
//   'Roboto', // <-- Roboto is a default sans font now
//   'system-ui',
//   // <-- you may provide more font fallbacks here
// ];

module.exports = {
  darkMode: false, // or 'media' or 'class'
  theme: {
    // fontFamily: fontFamily,
    // fontFamily: {
    //   sans: "'Circular', sans-serif",
    //   sans: "'Fraunces', serif",
    // },
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
    extend: {
      fontFamily: { sans: ['Roboto', ...defaultTheme.fontFamily.sans] },
    },
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
