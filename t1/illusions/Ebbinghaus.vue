<template>
  <vue-p5 @setup="setup" @draw="draw"></vue-p5>
</template>

<script>
  import VueP5 from 'vue-p5'

  export default {
    name: 'Ebbinghaus',
    components: {
      VueP5
    },
    methods: {
      setup (s) {
        s.createCanvas(800, 450)
      },
      draw (s) {
        if (s.mouseIsPressed) {
          s.stroke(255, 128, 0)
          s.line(220, 209, 600, 210)
          s.line(220, 270, 600, 270)

        } else {
          s.stroke(255)
          s.line(220, 209, 600, 210)
          s.line(220, 270, 600, 270)
          s.stroke(255, 128, 0)
          s.fill(255, 128, 0)
          s.ellipse(240, 240, 60, 60)
          s.ellipse(580, 240, 60, 60)
          s.stroke(192, 192, 192)
          s.fill(192, 192, 192)
          s.ellipse(240, 180, 30, 30)
          s.ellipse(240, 300, 30, 30)
          s.ellipse(180, 240, 30, 30)
          s.ellipse(300, 240, 30, 30)
          s.ellipse(200, 280, 30, 30)
          s.ellipse(280, 200, 30, 30)
          s.ellipse(200, 200, 30, 30)
          s.ellipse(280, 280, 30, 30)
          s.ellipse(580, 120, 120, 120)
          s.ellipse(470, 200, 120, 120)
          s.ellipse(690, 200, 120, 120)
          s.ellipse(510, 340, 120, 120)
          s.ellipse(650, 340, 120, 120)
        }
      }
    }
  }
</script>

<style scoped>

</style>