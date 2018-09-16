<template>
  <vue-p5 @setup="setup" @draw="draw"></vue-p5>
</template>

<script>
  import VueP5 from 'vue-p5'

  export default {
    name: 'Square',
    components: {
      VueP5
    },
    data () {
      return {
        dx: 100,
        dy: 400,
        flag: 0
      }
    },
    methods: {
      setup (s) {
        s.createCanvas(500, 500)
      },
      draw (s) {
        s.background(0)
        s.rectMode(s.CENTER)
        s.stroke(255)
        s.noFill()
        s.rect(250, 250, 150, 150)
        if (this.dx >= 165) this.flag = 1
        if (this.dx == 100) this.flag = 0
        if (this.flag == 0) {
          this.dx++
          this.dy--
        }
        else {
          this.dx--
          this.dy++
        }
        s.noStroke()
        s.fill(100)
        s.ellipse(this.dx, 250, 100, 100)
        s.ellipse(250, this.dx, 100, 100)
        s.ellipse(this.dy, 250, 100, 100)
        s.ellipse(250, this.dy, 100, 100)
        s.fill(210)
        s.ellipse(this.dx + 190, 250, 20, 20)
        s.ellipse(250, this.dx + 190, 20, 20)
        s.ellipse(this.dy - 190, 250, 20, 20)
        s.ellipse(250, this.dy - 190, 20, 20)
      }
    }
  }
</script>

<style scoped>

</style>