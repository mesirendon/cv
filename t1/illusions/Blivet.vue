<template>
  <vue-p5 @setup="setup"></vue-p5>
</template>

<script>
  import VueP5 from 'vue-p5'

  export default {
    name: 'Amb01',
    components: {
      VueP5
    },
    methods: {
      setup (s) {
        s.createCanvas(800, 400)
        s.stroke(0, 0, 0)
        s.strokeWeight(2)
        s.ellipse(50, 240, 35, 45)
        s.ellipse(120, 285, 35, 45)
        s.ellipse(190, 330, 35, 45)
        s.line(50, 218, 600, 120)
        s.line(190, 352, 734, 260)
        s.line(734, 260, 734, 215)
        s.line(190, 308, 734, 215)
        s.line(600, 120, 734, 215)
        s.line(120, 308, 620, 220)
        s.line(50, 262, 556, 170)
        s.line(556, 170, 620, 220)
        s.line(120, 262, 550, 182)
        s.line(550, 182, 556, 170)
        s.line(550, 182, 602, 222)
      }
    }
  }
</script>

<style scoped>

</style>