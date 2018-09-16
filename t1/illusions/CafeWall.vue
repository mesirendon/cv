<template>
  <vue-p5 @setup="setup" @draw="draw"></vue-p5>
</template>

<script>
  import VueP5 from 'vue-p5'

  export default {
    name: 'CafeWall',
    components: {
      VueP5
    },
    methods: {
      setup (s) {
        s.createCanvas(800, 500)
      },
      draw (s) {
        if (s.mouseIsPressed) {
          s.background(255)
          for (let i = 0; i <= 400; i += 40) {
            s.stroke(153)
            s.line(0, 40 + i, 800, 40 + i)
          }
        } else {
          s.background(255)
          s.fill(0, 0, 0, 255)
          let sizex = 0
          let sizey = 0
          for (let i = 0; i <= 10; i++) {
            s.rect(sizex, sizey, 40, 40)
            let x = 20
            let y = 0
            for (var j = 0; j <= 10; j++) {
              sizey += 40
              s.rect(sizex + x, sizey, 40, 40)
              if (x < 50 && y < 2) {
                x += 15
                y++
              } else {
                x -= 15
                if (x < 0) {
                  y = 0
                  x = 20
                }
              }
            }
            sizey = 0
            sizex += 80
          }
          for (let i = 0; i <= 400; i += 40) {
            s.stroke(153)
            s.line(0, 40 + i, 800, 40 + i)
          }
        }
      }
    }
  }
</script>

<style scoped>

</style>