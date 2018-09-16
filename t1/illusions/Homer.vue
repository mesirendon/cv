<template>
  <vue-p5
          @setup="setup"
          @preload="preload"
  ></vue-p5>
</template>

<script>
  import VueP5 from 'vue-p5'

  export default {
    name: 'Homer',
    components: {
      VueP5
    },
    data () {
      return {
        img1: null,
        img2: null
      }
    },
    methods: {
      preload (s) {
        this.img1 = s.loadImage('http://cdn.shopify.com/s/files/1/1634/8849/products/bb067_grande.jpg')
        this.img2 = s.loadImage('http://cdn.shopify.com/s/files/1/1634/8849/products/bb067_grande.jpg')
      },
      setup (s) {
        s.createCanvas(500, 500)
        s.image(this.img1, 0, 0)
        s.filter(s.INVERT)
        s.stroke(0, 0, 0)
        s.line(0, 250, 500, 250)
        s.line(250, 0, 250, 500)
        s.line(0, 0, 500, 500)
        s.line(0, 500, 500, 0)
        s.strokeWeight(10)
        s.point(250, 250)
        setTimeout(() => {
          s.image(this.img2, 0, 0)
          s.filter(s.GRAY)
        }, 10000)
      }
    }
  }
</script>
