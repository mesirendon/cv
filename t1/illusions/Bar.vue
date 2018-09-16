<template>
  <vue-p5 @setup="setup" @draw="draw"></vue-p5>
</template>

<script>
  import VueP5 from 'vue-p5'

  export default {
    name: 'Bar',
    components: {
      VueP5
    },
    data () {
      return {
        angle: 0
      }
    },
    methods: {
      setup (s) {
        s.createCanvas(510, 220)
      },
      draw (s) {
        let c = (s.cos(this.angle + s.PI / 2) * s.width / 2) + s.width / 2
        this.angle += 0.02
        for (let i = 0; i < 510; i++) {
          s.stroke(i / 2)
          s.line(i, 0, i, 220)
        }
        s.noStroke()
        s.fill(255)
        s.rectMode(s.CORNER)
        s.rect(0, 0, c, 220)
        s.fill(150)
        s.rectMode(s.CENTER)
        s.rect(s.width / 2, s.height / 2, 300, 40)
      }
    }
  }
</script>

<style scoped>

</style>