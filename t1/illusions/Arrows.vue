<template>
  <vue-p5 @setup="setup" @draw="draw"></vue-p5>
</template>

<script>
  import VueP5 from 'vue-p5'

  export default {
    name: 'Arrows',
    components: {
      VueP5
    },
    methods: {
      setup (s) {
        s.createCanvas(800, 500)
      },
      draw (s) {
        if (s.mouseIsPressed) {
          s.stroke(255)
          s.line(200, 300, 250, 350)
          s.line(200, 300, 250, 250)
          s.line(600, 300, 550, 250)
          s.line(600, 300, 550, 350)
          s.line(200, 200, 150, 250)
          s.line(200, 200, 150, 150)
          s.line(600, 200, 650, 150)
          s.line(600, 200, 650, 250)
        } else {
          s.stroke(0)
          s.strokeWeight(4)
          s.line(200, 200, 600, 200)
          s.line(200, 200, 150, 250)
          s.line(200, 200, 150, 150)
          s.line(600, 200, 650, 150)
          s.line(600, 200, 650, 250)
          s.line(200, 300, 600, 300)
          s.line(200, 300, 250, 350)
          s.line(200, 300, 250, 250)
          s.line(600, 300, 550, 250)
          s.line(600, 300, 550, 350)
        }
      }

    }
  }
</script>

<style scoped>

</style>