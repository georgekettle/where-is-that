const colors = require('tailwindcss/colors');

module.exports = {
  darkMode: false,
  theme: {
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

    colors: {
      transparent: 'transparent',
      current: 'currentColor',
      black: colors.black,
      white: colors.white,
      gray: colors.trueGray,
      red: colors.rose,
      yellow: colors.amber,
      green: colors.emerald,
      // generate these below at www.tailwindshades.com
      primary: {
        DEFAULT: '#FF8438',
        '50': '#FFEBD9',
        '100': '#FFE1C7',
        '200': '#FFCCA3',
        '300': '#FFB57F',
        '400': '#FF9D5C',
        '500': '#FF8438',
        '600': '#FF6914',
        '700': '#F05200',
        '800': '#CC4200',
        '900': '#A83300'
      },
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
